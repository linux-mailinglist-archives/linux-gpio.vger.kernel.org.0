Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594C062B5AE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 09:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbiKPIyd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 03:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiKPIyc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 03:54:32 -0500
Received: from naboo.endor.pl (naboo.endor.pl [91.194.229.150])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B0CF30
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 00:54:30 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by naboo.endor.pl (Postfix) with ESMTP id A197CAE57AB;
        Wed, 16 Nov 2022 09:54:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at 
Received: from naboo.endor.pl ([91.194.229.15])
        by localhost (naboo.endor.pl [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 68qJaS6Vc3Bo; Wed, 16 Nov 2022 09:54:24 +0100 (CET)
Received: from [192.168.18.35] (unknown [157.25.148.26])
        (Authenticated sender: leszek@dubiel.pl)
        by naboo.endor.pl (Postfix) with ESMTPSA id 49849AE48A2;
        Wed, 16 Nov 2022 09:54:24 +0100 (CET)
Message-ID: <1608e9ad-d9c4-8856-569f-cd894ffc2836@dubiel.pl>
Date:   Wed, 16 Nov 2022 09:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Elegant way to kill previous gpioset?
Content-Language: pl-PL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
References: <fc3da423-1107-83a1-1c94-afb2ac5fa7c9@dubielvitrum.pl>
 <57c25430-284b-36dc-7a68-70847bc1bdcb@dubiel.pl> <Y3R6hbBF5vKuwvFe@sol>
From:   Leszek Dubiel <leszek@dubiel.pl>
In-Reply-To: <Y3R6hbBF5vKuwvFe@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



 > The best way is not to have to kill it.
 > If you kill the gpioset then the state of the line becomes indeterminate
 > so you are open to glitches as well as some other process grabbing the
 > line.

Yes, that's true.



 > To address this the gpioset for v2[1] has an interactive mode that allows
 > you to pipe commands to it.  The tests for v2[2] (gpio-tools-tests.bats)
 > demonstrate that by launching the gpioset from bash using coproc and then
 > driving the gpioset via the pipe to the co-process.
 > For a more long lived solution you can setup a named pipe and then write
 > commands to that to update the line:
 >
 > mkfifo setpipe
 > gpioset --interactive -c gpiochip2 7=0 < setpipe &
 > echo "set 7=1" > setpipe
 > or
 > echo "toggle" > setpipe
 >
 > You can even kill it with:
 >
 > echo "exit" > setpipe

I have tried pipe even in current gpioset tools, because if I
hit Enter then it gpioset exits. Similar as last line above.

Thanks to your explanation I know what's the
intention behind "--interactive" option.





 > Would that work for you?

I was wondering if there is some "one-liner" that
recofigures pin, something like:

                 gpioset -b -msignal --autokill /dev/gpiochip2 7=0

or
                 gpioset -b -msignal --force /dev/gpiochip2 7=0

that does these two commands at once:

               pkill -ef "^gpioset .* /dev/gpiochip2 7=[01]$"
               gpioset -b -msignal /dev/gpiochip2 7=0



New tools with "setpipe" and "--interactive" would
do the job too. :) :)






 > Personally, for situations like this I don't use the tools, I use one of
 > the bindings to write a daemon that controls the line and receives its
 > commands from some other source.
 >
 > There are plans for a generic daemon that would allow you to access lines
 > via dbus, but that hasn't got past the planning stages AFAIAA.
 >
 > Wrt identifying and killing processes holding particular lines,
 > the ability to identify the GPIO lines held by processes via the /proc
 > filesystem has recently been added to the 6.1 kernel[3].  There are
 > plans for a tool that will use that to return the PID holding a line,
 > but again that is still in the planning stages.


Thank you for detailed explanation.



