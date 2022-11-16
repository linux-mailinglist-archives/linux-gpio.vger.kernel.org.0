Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B08362B2FE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 06:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbiKPFwP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 00:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbiKPFwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 00:52:14 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E37024F19
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 21:52:10 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id p21so15470766plr.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 21:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vl2lMOnv9oIQ5HaIF9r7Aqubw+AlknQ8u6ccwj68OyU=;
        b=qzqL2KnFbl4wPNWyw/klDjoARuF0l8czmi9qlHvROylJc2oSgACx7gn7nP943ebATf
         EOJ6KIzjEBiS2d53UxuQLdfNgdIO9PnjI6Q3z+SR/iaW4W4Omt32Sv/6dkOxFl92tBHy
         kJ1g1NHEPp10VBE5y06D77d13ZYsntdUUxVEdtjE2np0Y6qSg3vnt47bE2RFPmiueCbE
         Ld+gJ0LpLXiYOkqeFTiZDBVWOTQZMECDjch8+sY7HSB+ILeOjZDIGy4jMpozjlUQiKis
         lzHw8UO1yB5qGznlpXyexC+OZgbmT91SQpjrJLV22w795TpJd7ivAihDgt8ItxKqglWO
         nrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vl2lMOnv9oIQ5HaIF9r7Aqubw+AlknQ8u6ccwj68OyU=;
        b=zbcSxebe8SGdGojwd3VMw/buEtMIkW04B2o+bDc2X758qAWN47dVAV5TtyLW02IUeY
         Fs5ZMzheKIiYfTKEzwIvVBTqkWJ0IejPY9402jv6XTfeu1PrZXGUkMHsUI1CeI6uOIUG
         DaapditI8GJOs9p4H0+k6BdghNWIKs6+qGZKsHkysMGr5L1973AQLGKyj/9Y8sxU+nhJ
         S52mi90bxehSd9OSPhKdIXSOSvUHlZvCnPMMKjivniDjyjkgNnVH17Zz+jdg3FRbENDX
         YrI5UcFYrnpiJihWm+2DpfCyvL51VVVx5OVOH/fdoeEowJawr7tgK2iAFDW2SZ3QtU1X
         Ddjg==
X-Gm-Message-State: ANoB5plfH/uIyrpHztfFzjWFGoCjkFD83Zj0oLbQ4e5XwtateFW2T2zp
        87a4N3D0Xx78kc2M3uiRu/Z3tBdDIh0=
X-Google-Smtp-Source: AA0mqf4SLA7oIvmLRLcXXE0utMZ1plHAiJW6neZeYvmOce9/BBXy32gMX7no4sgMT3OqiHEmlQKO3A==
X-Received: by 2002:a17:90b:d13:b0:217:ecbd:5ae with SMTP id n19-20020a17090b0d1300b00217ecbd05aemr2066855pjz.17.1668577929912;
        Tue, 15 Nov 2022 21:52:09 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b001822121c45asm10985931pld.28.2022.11.15.21.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 21:52:09 -0800 (PST)
Date:   Wed, 16 Nov 2022 13:52:05 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Leszek Dubiel <leszek@dubiel.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: Elegant way to kill previous gpioset?
Message-ID: <Y3R6hbBF5vKuwvFe@sol>
References: <fc3da423-1107-83a1-1c94-afb2ac5fa7c9@dubielvitrum.pl>
 <57c25430-284b-36dc-7a68-70847bc1bdcb@dubiel.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57c25430-284b-36dc-7a68-70847bc1bdcb@dubiel.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 09:36:59PM +0100, Leszek Dubiel wrote:
> 
> 
> 
> Different bash scripts from different servers
> ssh to Raspberry and set GPIO line:
> 
>         /dev/gpiochip2, pin number 7.
> 
> with such command:
> 
>         gpioset -b -msignal /dev/gpiochip2 7=1
> 
> 
> 
> If another script tries:
> 
>       gpioset -b -msignal /dev/gpiochip2 7=0
> 
> then it gets:
> 
>       gpioset: error setting the GPIO line values: Device or resource busy
> 
> 
> 
> So every bash script kills previous instance
> before setting gpio line:
> 
>      pkill -ef "^gpioset .* /dev/gpiochip2 7=[01]$"
>      gpioset -b -msignal /dev/gpiochip2 7=0
> 
> 
> 
> Pkill is bad solution:
> 
> 1. it is very slow, because it has to grep full command lines.
> 
> 2. it doesn't work if one of bash scripts
> used little bit different command, for example:
> 
>      gpioset -b -msignal /dev/gpiochip2 7=0 5=2
>      gpiomon             /dev/gpiochip2 7
> 
> 
> 
> Is there a better way to kill o replace
> previous instance of running gpioset?
> 

The best way is not to have to kill it.
If you kill the gpioset then the state of the line becomes indeterminate
so you are open to glitches as well as some other process grabbing the
line.

To address this the gpioset for v2[1] has an interactive mode that allows
you to pipe commands to it.  The tests for v2[2] (gpio-tools-tests.bats)
demonstrate that by launching the gpioset from bash using coproc and then
driving the gpioset via the pipe to the co-process.
For a more long lived solution you can setup a named pipe and then write
commands to that to update the line:

mkfifo setpipe
gpioset --interactive -c gpiochip2 7=0 < setpipe &
echo "set 7=1" > setpipe
or
echo "toggle" > setpipe

You can even kill it with:

echo "exit" > setpipe

Would that work for you?

Personally, for situations like this I don't use the tools, I use one of
the bindings to write a daemon that controls the line and receives its
commands from some other source.

There are plans for a generic daemon that would allow you to access lines
via dbus, but that hasn't got past the planning stages AFAIAA.

Wrt identifying and killing processes holding particular lines,
the ability to identify the GPIO lines held by processes via the /proc
filesystem has recently been added to the 6.1 kernel[3].  There are
plans for a tool that will use that to return the PID holding a line,
but again that is still in the planning stages.

Cheers,
Kent.

[1] https://lore.kernel.org/linux-gpio/20221114040102.66031-3-warthog618@gmail.com/
[2] https://lore.kernel.org/linux-gpio/20221114040102.66031-4-warthog618@gmail.com/
[3] https://lore.kernel.org/linux-gpio/Yyw5mivLAgWZIx0W@sol/T/

