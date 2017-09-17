<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Http\request;
use App\user;
class SendMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build(Request $req)
    {
      
        return $this->view('emails.mail',
            ['msg'=>$req->message, 
              'name'=>$req->name,
              'email'=>$req->email,
              'subject'=>$req->subject
            ])
        ->to('ricarnguyen1507@gmail.com');
    }
}
