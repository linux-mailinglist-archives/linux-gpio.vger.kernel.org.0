Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1846E70EFFA
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 09:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjEXHzS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 03:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239812AbjEXHzL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 03:55:11 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE34CA3
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 00:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:
        References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=d/6kvP01ReGWgW+WVIsNQbkabI9yQMU956/z8XVUILY=; b=GDsWvDRIlEP8EOvMjuOFowM0tD
        YWeTdUCV6I5LQ/CYuHp2nMgX2nRcJGFFHanZEORFKOFz/RAmKteRip4fBRxo3M+QPvRAOw8B55Cqz
        sSFVcRUukTu8RxRur+sQpPrZClH95vafdG2mP+Vmadmy84KeYp5dAhZNNOp4bmbYZfWbNSkTAcG95
        Rm/Lmx8f7+AMpdzX6xuFIgWDo00QCWGyjN7BLNgl+oUEGjVqKXEfmUz1HVA+oQRzgDuCf6leMAhhP
        zaYWsGTB/tJJBxbBL7jdvfBTyTCe5qkdMl8Qj+En6TzR2petGKcbopdOaeLIwJHQcCm1cxeYwJ2U3
        59FMciAQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <esben@geanix.com>)
        id 1q1jKt-000ECi-Rp; Wed, 24 May 2023 09:55:07 +0200
Received: from [80.62.117.0] (helo=localhost)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <esben@geanix.com>)
        id 1q1jKt-000WSt-Kh; Wed, 24 May 2023 09:55:07 +0200
From:   esben@geanix.com
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH] gpioset: only print prompt when stdout is tty
References: <3dcc614b9d28f04e42f78afdd18518c7251b52ae.1684849980.git.esben@geanix.com>
        <ZGzdaJ/wBSUDsJdU@sol> <87pm6q9r7a.fsf@geanix.com>
        <ZG29npyOJVyJPsLM@sol>
Date:   Wed, 24 May 2023 09:53:39 +0200
In-Reply-To: <ZG29npyOJVyJPsLM@sol> (Kent Gibson's message of "Wed, 24 May
        2023 15:32:46 +0800")
Message-ID: <87lehe9ncs.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26916/Tue May 23 09:22:39 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kent Gibson <warthog618@gmail.com> writes:

> On Wed, May 24, 2023 at 08:30:33AM +0200, esben@geanix.com wrote:
>> Kent Gibson <warthog618@gmail.com> writes:
>> 
>> > On Tue, May 23, 2023 at 03:54:41PM +0200, Esben Haabendal wrote:
>> >> When gpioset interactive mode is used as intended, as a human controlled
>> >> interface, stdout should be a tty.
>> >> 
>> >
>> > Yeah, no, the interactive mode is also intended to be script driven -
>> > checkout the test suite, gpio-tools-tests.bat, as an example of it being
>> > driven using a coproc from bash.
>> > 
>> > Removing the prompt would break the handshaking with the controlling
>> > script - that is how it determines the slave process is up.
>> 
>> I see.  I use a process supervisor, which should ensure that the gpioset
>> process stays alive.  And if a client writes to the fifo while the
>> process is shortly down, it will pick up the request when it starts up.
>> 
>> A proper gpio daemon would of-course need a request-reply mechanism, so
>> the requester can know if the request succeeded.  But that obviously is
>> something slightly more involved than removing a single printf() call.
>> 
>
> It isn't intended to be a "proper daemon".  It is a cheap and cheerful
> option to give something close to the sysfs "echo 1 > /some/sysfs/line",
> which doesn't give feedback either.
>
> As you said in your patch:
> "a really simple deamon for controlling GPIOs by connecting it to a FIFO"
>
>> > I'll try running your patch through the test suite tommorrow, but I'm
>> > pretty sure it will break it - IIRC the code you removed was put there
>> > precisely to get the test suite to run.
>> >
>> > Have you tried running the test suite?
>> 
>> Yes, I have now.  And I see that they fail with my RFC PATCH.  The use
>> of coproc is obviously not compatible with it.
>> 
>> But I cannot help feeling that the use of coproc to drive a
>> command-prompt interface, while well suited for writing a test for such
>> an prompt based interactive interface, it is not how you would want to
>> talk with a daemon.
>> 
>
> Yeah, it isn't a whole load of fun, but it isn't intended as a full on
> daemon.  It is an option that was added in v2 so you CAN now write a
> shell script that can request lines and change them as necessary - without
> releasing them.  It might not be pleasant but now it is possible.
>
> If that doesn't suit you then look for another solution as you are now
> beyond the scope that gpioset was intended for.

I guess I will have to do that. Although I don't agree that I am out of
scope. I just want to do exactly what you have described is in scope for
gpioset. I just don't want the prompt when not using a tty, and the
reason for the prompt being there is to make the test work, not for a
real-world use-case.  Anyway, I can do my own thing.  No problem.

>> > This works for me as a simple daemon script:
>> >
>> > #!/bin/bash
>> >
>> > pipe=/tmp/gpiosetd
>> >
>> > mkfifo $pipe
>> >
>> > trap "rm -f $pipe" EXIT
>> >
>> > # as bash will block until something is written to the pipe...
>> > echo "" > $pipe &
>> 
>> I believe this is not just needed because of bash.  If you don't have a
>> writer on the fifo, the gpioset will end up in a busy loop in readline
>> until a writer appear, spamming a prompt out on output while eating up
>> 100% cpu.
>
> I don't see that.
>
> What I see is that bash blocks until something writes to the fifo - not
> even launching gpioset until that happens.

Ok.

What I am saying is if you actually do manage to run gpioset with stdin
connected to a fifo, and the fifo not having any writers, you will end
up eating up the cpu in a small busy loop.

Because of the problem you describe, you just haven't gotten to that
point though.

> That is typically not what you want - you want the line requested and
> set NOW, and you can update it later through the fifo.
> The echo is just there to get bash over the hump.
> (btw, if there is a better way I would love to know it)

I haven't really investigated that.  I just made the process running
gpioset hold a dummy writer open to the fifo.

> With the named fifo, as used here, gpioset will start, request and set
> the line, and then will block until something writes to the fifo.
>
>> > gpioset -i GPIO23=0 < $pipe > /dev/null
>> >
>> > Does that not work for you?
>> 
>> That is basically what I do.  Just output directed to a log file
>> (actually, a pipe to a process writing to rotated log files) instead of
>> /dev/null, and then no prompt noise in the log files.
>
> So redirect stdout through a filter to remove the prompt?

Yes, I could do that.  But having an extra process running, and managing
to keep that alive...  If I need to carry a tiny out-of-tree patch to
avoid that, I will do that.

>> Anyway, what about adding a new CLI option. Either something like '-I'
>> for no-prompt interactive mode, or '-n' to be used with '-i' for the
>> same?
>
> I'm not keen on adding options to gpioset to massage the output for
> different use cases - there are already better tools for that.

Ok.

That I guess leaves me with no options than working around gpioset,
using filters and what else is needed to do what I need.
Or out-of-tree patching.

/Esben
