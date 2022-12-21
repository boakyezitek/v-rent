<?php

namespace App\DataTables;

use App\Models\User;
use App\Models\Withdrawal;
use App\Models\PayoutSettings;
use Yajra\DataTables\Services\DataTable;
use Auth, Session;

class PayoutListDataTable extends DataTable
{
    public function ajax()
    {
        $payout = $this->query();

        return datatables()
            ->of($payout)

            ->addColumn('user_name', function ($payout) {
                $userName = $payout->f_name.' '.$payout->l_name;
                return $userName;
            })
            ->addColumn('p_method', function ($payout) {

                return $payout->p_method;
            })
            ->addColumn('amount', function ($payout) {
                    
                return Session::get('symbol') . currency_fix($payout->amount, $payout->code) ;    
            })
            ->addColumn('status', function ($payout) {
                return $payout->status;
            })
            ->addColumn('date', function ($payout) {
                $dateFormat = dateFormat($payout->date);
                return $dateFormat;
            })

            ->rawColumns(['status','amount'])
            ->make(true);

    }

    public function query()
    {
        $from     = isset(request()->from) ? setDateForDb(request()->from) : null;
        $to       = isset(request()->to) ? setDateForDb(request()->to) : null;
        $user_id = Auth::id();
        $query    =  Withdrawal::join('currency', function ($join) {
                     $join->on('withdrawals.currency_id', '=', 'currency.id');
                        })->join('payment_methods', function ($join) {
                            $join->on('withdrawals.payment_method_id', '=', 'payment_methods.id');
                                })->join('users',function($join){
                                    $join->on('withdrawals.user_id', '=', 'users.id');
                                        })->select(['withdrawals.id as id','users.first_name as f_name', 'users.last_name as l_name', 'withdrawals.status as status','withdrawals.amount as amount', 'withdrawals.currency_id AS c_id', 'currency.symbol AS symbol', 'currency.code AS code', 'payment_methods.name AS p_method', 'withdrawals.created_at AS date', ])->where('withdrawals.user_id', '=', $user_id)->where('withdrawals.status', '=', 'Success');

        if (!empty($from)) {
            $query->whereDate('withdrawals.created_at', '>=', $from);
        }

        if (!empty($to)) {
            $query->whereDate('withdrawals.created_at', '<=', $to);
        }

        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'id', 'name' => 'withdrawals.id', 'title' => 'ID', 'visible' => false])
             ->addColumn(['data' => 'user_name', 'name' => 'users.first_name', 'title' => trans('messages.utility.account')])
             ->addColumn(['data' => 'p_method', 'name' => 'payment_methods.name', 'title' => trans('messages.utility.payment_method')])
             ->addColumn(['data' => 'amount', 'name' => 'withdrawals.amount', 'title' => trans('messages.account_transaction.amount')])
             ->addColumn(['data' => 'status', 'name' => 'withdrawals.status', 'title' => trans('messages.account_transaction.status')])
             ->addColumn(['data' => 'date', 'name' => 'created_at', 'title' => trans('messages.account_transaction.date')])
             ->parameters(dataTableOptions());
    }


    protected function filename()
    {
        return 'payoutsettingsdatatables_' . time();
    }
}
