Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0118270EF75
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 09:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239458AbjEXHcw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 03:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbjEXHcv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 03:32:51 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C0E8F
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 00:32:51 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64d4e45971bso423226b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 May 2023 00:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684913571; x=1687505571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n1HXYCpVXbqyz2tyAabqkRBq+1ARNzw4WJvMuKuUJfE=;
        b=FoM+Hp9YQmB217cBbO6YYqh1FdI4Hc5hrJ+qglOzVe0gNYKGBSei4f8waEHrQVHvoV
         DJt0yQNXrY53auW4losCZKXggELrnaWHEkKCDFaF8YmR5YC71yp5XjaUiQTMs4k97WPs
         0fLuwgEPytXaLIoH9KAzBMBuhUd373exL7n3G/+N55kCWN/kgnxf6aDn4WZABqc1iuu9
         i1qv6aXOcY6RPL8iE7yIxEgeyfDsc8gUPMm4sf5AQr36j7Lazo9Ttbi2wxbEmtbzKmro
         D87ZsINjy/b+WS/gGJBRW4qqFNhZkmqw5IhVq6DZUvuY92t25E8WASl4TRLTjSJAUIt9
         KL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684913571; x=1687505571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1HXYCpVXbqyz2tyAabqkRBq+1ARNzw4WJvMuKuUJfE=;
        b=SB4xnhBF6yHNXtM3qxneZJlajP5lWaAC1YetEtsIMxrKX9yPSEH47qHMtqSbTXvwmK
         m/PRDhI9vtc89Xlqa6M+d7wUQMhBL70mdXINF+a6H84XfvofWjFB6aws4qVvYaOsf94X
         N4S3HIKajhkF9ACVBVoNvGRaq9lzWoA7Fz6MqxA0CF8DvjWqtnm684ODMCTuTmDOdwVe
         EbS9SestCDPXahHz2UjgnkISE8m4wTokdU93A+RUapoqn/GgJV2yh/gnyfms62ovnT9q
         ysBfLMgr/CMSGSJZw0fLEJDNqm2AM0gOwx6c9624lZpzieH9LcLLuMB7zyA09Vvvxwcf
         3fhg==
X-Gm-Message-State: AC+VfDzaVGKx5LD7fX0JuOawWTDccBRA5j++mRM95ATGGB87KtiTaLu/
        fdkf44VAzxrlRKKMCtK3P+6e4KhHssQ=
X-Google-Smtp-Source: ACHHUZ5p/nRq2dZTyFd+A4/hplXwHWP90UOvteH6/vejfgmHDK86Ka1weONnabLNYHqcnVyUTWbweg==
X-Received: by 2002:a05:6a21:6d87:b0:106:ff3c:a60d with SMTP id wl7-20020a056a216d8700b00106ff3ca60dmr19611603pzb.38.1684913570591;
        Wed, 24 May 2023 00:32:50 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902724900b001acae093442sm8029355pll.82.2023.05.24.00.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:32:50 -0700 (PDT)
Date:   Wed, 24 May 2023 15:32:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     esben@geanix.com
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH] gpioset: only print prompt when stdout is tty
Message-ID: <ZG29npyOJVyJPsLM@sol>
References: <3dcc614b9d28f04e42f78afdd18518c7251b52ae.1684849980.git.esben@geanix.com>
 <ZGzdaJ/wBSUDsJdU@sol>
 <87pm6q9r7a.fsf@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm6q9r7a.fsf@geanix.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 24, 2023 at 08:30:33AM +0200, esben@geanix.com wrote:
> Kent Gibson <warthog618@gmail.com> writes:
> 
> > On Tue, May 23, 2023 at 03:54:41PM +0200, Esben Haabendal wrote:
> >> When gpioset interactive mode is used as intended, as a human controlled
> >> interface, stdout should be a tty.
> >> 
> >
> > Yeah, no, the interactive mode is also intended to be script driven -
> > checkout the test suite, gpio-tools-tests.bat, as an example of it being
> > driven using a coproc from bash.
> > 
> > Removing the prompt would break the handshaking with the controlling
> > script - that is how it determines the slave process is up.
> 
> I see.  I use a process supervisor, which should ensure that the gpioset
> process stays alive.  And if a client writes to the fifo while the
> process is shortly down, it will pick up the request when it starts up.
> 
> A proper gpio daemon would of-course need a request-reply mechanism, so
> the requester can know if the request succeeded.  But that obviously is
> something slightly more involved than removing a single printf() call.
> 

It isn't intended to be a "proper daemon".  It is a cheap and cheerful
option to give something close to the sysfs "echo 1 > /some/sysfs/line",
which doesn't give feedback either.

As you said in your patch:
"a really simple deamon for controlling GPIOs by connecting it to a FIFO"

> > I'll try running your patch through the test suite tommorrow, but I'm
> > pretty sure it will break it - IIRC the code you removed was put there
> > precisely to get the test suite to run.
> >
> > Have you tried running the test suite?
> 
> Yes, I have now.  And I see that they fail with my RFC PATCH.  The use
> of coproc is obviously not compatible with it.
> 
> But I cannot help feeling that the use of coproc to drive a
> command-prompt interface, while well suited for writing a test for such
> an prompt based interactive interface, it is not how you would want to
> talk with a daemon.
> 

Yeah, it isn't a whole load of fun, but it isn't intended as a full on
daemon.  It is an option that was added in v2 so you CAN now write a
shell script that can request lines and change them as necessary - without
releasing them.  It might not be pleasant but now it is possible.

If that doesn't suit you then look for another solution as you are now
beyond the scope that gpioset was intended for.

> > This works for me as a simple daemon script:
> >
> > #!/bin/bash
> >
> > pipe=/tmp/gpiosetd
> >
> > mkfifo $pipe
> >
> > trap "rm -f $pipe" EXIT
> >
> > # as bash will block until something is written to the pipe...
> > echo "" > $pipe &
> 
> I believe this is not just needed because of bash.  If you don't have a
> writer on the fifo, the gpioset will end up in a busy loop in readline
> until a writer appear, spamming a prompt out on output while eating up
> 100% cpu.
> 

I don't see that.

What I see is that bash blocks until something writes to the fifo - not
even launching gpioset until that happens.
That is typically not what you want - you want the line requested and
set NOW, and you can update it later through the fifo.
The echo is just there to get bash over the hump.
(btw, if there is a better way I would love to know it)

With the named fifo, as used here, gpioset will start, request and set
the line, and then will block until something writes to the fifo.

> > gpioset -i GPIO23=0 < $pipe > /dev/null
> >
> > Does that not work for you?
> 
> That is basically what I do.  Just output directed to a log file
> (actually, a pipe to a process writing to rotated log files) instead of
> /dev/null, and then no prompt noise in the log files.
> 

So redirect stdout through a filter to remove the prompt?

> Anyway, what about adding a new CLI option. Either something like '-I'
> for no-prompt interactive mode, or '-n' to be used with '-i' for the
> same?
> 

I'm not keen on adding options to gpioset to massage the output for
different use cases - there are already better tools for that.

Cheers,
Kent.
