<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Child;
use Illuminate\Http\Request;
use Session;

class ChildsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        $keyword = $request->get('search');
        $perPage = 25;

        if (!empty($keyword)) {
            $childs = Child::where('aadhar_id', 'LIKE', "%$keyword%")
				->orWhere('hospital_name', 'LIKE', "%$keyword%")
				->orWhere('case_no', 'LIKE', "%$keyword%")
				->orWhere('illness', 'LIKE', "%$keyword%")
				->orWhere('status', 'LIKE', "%$keyword%")
				->paginate($perPage);
        } else {
            $childs = Child::paginate($perPage);
        }

        return view('childs.index', compact('childs'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('childs.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function store(Request $request)
    {
        
        $requestData = $request->all();
        
        Child::create($requestData);

        Session::flash('flash_message', 'Child added!');

        return redirect('frontend/childs');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        $child = Child::findOrFail($id);

        return view('childs.show', compact('child'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function edit($id)
    {
        $child = Child::findOrFail($id);

        return view('childs.edit', compact('child'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function update($id, Request $request)
    {
        
        $requestData = $request->all();
        
        $child = Child::findOrFail($id);
        $child->update($requestData);

        Session::flash('flash_message', 'Child updated!');

        return redirect('frontend/childs');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function destroy($id)
    {
        Child::destroy($id);

        Session::flash('flash_message', 'Child deleted!');

        return redirect('frontend/childs');
    }
}
