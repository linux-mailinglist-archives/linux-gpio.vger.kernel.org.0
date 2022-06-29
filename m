Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F0B55FCE1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 12:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbiF2KLA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 06:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiF2KK7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 06:10:59 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F882240B8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:10:58 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so18862638pjl.5
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JJS8divzGSXp+tqXom7wJyDQdNEu8cQ5AtciJvpoC8Y=;
        b=kat6jPFk/LWL93r6JD0XJUMSlQVo1RFVc1INmueCSFUBS2Kn3GutdV1cvx74pVbioX
         mh796oXlCcqgbH8zZjDqDPq6E8YP39q2nVCKwXv9m0J6+tFoavYvh3N1YNRIX7ylZAz+
         waU/HLiqJyWzgLYl6ZN3cMCT2mvn692xn8HeIwgARblqjbQb37lk1P9vAY3Fc8fbPe21
         5eRznz53pf8uhsgbotlU2vkP7dOz+eRorEwFZmstRfU2BNk/H4iIy5z3trIW+4IEd66w
         ht8lzQK3fIQ3ibsXyS8W7K8Q6dbMmhJIjzJgRxPOUVagm+N+76cy3WdUTiWcyYeQTEXA
         oTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JJS8divzGSXp+tqXom7wJyDQdNEu8cQ5AtciJvpoC8Y=;
        b=LyJ9JjOVOXYZYkoqAbs/kS/UKQRV3bXpQfeWBPjTMXn/QgGScw8XE8aq3EcQo3RYwp
         uXAjrTzAHiVQkLVOFi0m459wDxotRYra+LlMyiem7ZHryK/6Hbbz0d9E0zT8wKIoV7qG
         gkkTNCv6s8Xke8MjZ/9Z9zQ+8rcwUNuDXiBtoqFbKZeUQm5zvTr6VsAY1EhG7kkNJX5V
         EOWWnM1KPaOmWDJaP2rUwWfOGuhrYbM5R86Z7+7dvx2bLZu5DM45k/fnqhSNnDwiSDgL
         NVYaFQdsupiyjM+FKnijbH1JpEd1XNc0E0ew4hY9qYyzTxsz5tvJS0MliJQiEXcizJ6N
         1fow==
X-Gm-Message-State: AJIora+jjeNyxyBnswgXPL65joxpWqBd1w2awPJPqmfhL8CgpH41yNuk
        6tn0I/Xa0jlm71u5BQE6F7i12Wh/qxY=
X-Google-Smtp-Source: AGRyM1sbo2boV43NT0tGgl8Idem27z50042PVAOPzlZmCTnqQyds+80Z+C7OVi9Czs/uA+ALBlpyBw==
X-Received: by 2002:a17:90b:1210:b0:1ea:ee10:c823 with SMTP id gl16-20020a17090b121000b001eaee10c823mr4902075pjb.109.1656497457791;
        Wed, 29 Jun 2022 03:10:57 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id r13-20020a63d90d000000b0041166bf9ca8sm2704678pgg.34.2022.06.29.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 03:10:57 -0700 (PDT)
Date:   Wed, 29 Jun 2022 18:10:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod] feature request: output state read and sustain
Message-ID: <20220629101051.GA27271@sol>
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol>
 <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 11:25:57AM +0200, Jiří Prchal wrote:
> 
> 
> On 29. 06. 22 9:23, Kent Gibson wrote:
> > On Tue, Jun 28, 2022 at 03:08:20PM +0200, Jiří Prchal wrote:
> > > Hi,
> > > using new libgpiod / chardev driver, is there any way to get state of
> > > output? I mean one process sets it for example to 1 and another process
> > > reads this output state for example to show that on web page.
> > > I have to say that old sysfs interface was more user friendly...
> > > 
> > 
> > "new" being anything since Linux 4.8 ;-)?
> > And strictly speaking it isn't a driver - libgpiod and the GPIO subsystem
> > provide an interface to the chip driver.  More on that later.
> > 
> > Only the process holding the line has access to the current value.
> > If you need that value elsewhere then it has to be published by that
> > process - it is not available through the GPIO API itself.
> > There is nothing preventing that process publishing the value
> > in whatever way is appropriate to your application.
> > e.g. write it to a file that can be read by your webapp, just as it
> > would from sysfs.
> > 
> > Less restrictive access models are frequently "more user friendly", but
> > have other issues. e.g. some misbehaving process just reset your
> > modem for you.
> > 
> > And sysfs has other great features like being slow and being complete
> > rubbish for events on input lines.
> > 
> > > And at second: it would be better to NOT "the state of a GPIO line
> > > controlled over the character device reverts to default when the last
> > > process referencing the file descriptor representing the device file exits."
> > > "Set and forget" behavior is more natural to what some gpios are used. For
> > > example resetting external modems, need set 1 for short time, then to 0 and
> > > leave it for long long time until next reset is needed. It's non sense to
> > > keep running some process only to keep output at 0.
> > 
> > Agreed, that might be more natural, but that behaviour is not by choice,
> > it is a consequence of the kernel internals.  In short, if the GPIO
> > subsystem does not hold the chip then the driver is free to do what it
> > likes to it.
> > So when you release a line all bets are off.
> > It may stay where you left it, but it may not - it may even switch to an
> > input - it depends on the driver.
> Does it mean that without changing this particular line it could be changed? For example by setting another line in chip?
> 

If you hold a line then it is guaranteed to remain in the state you
request. Changing or releasing other lines will not alter that line.

If you release a line then other processes are free to request it and
alter it.  But if no other process request it, it will generally will
remain in the state you left it.  Generally.
The exception is if you release the last requested line on the chip, in
which case the GPIO subsystem will release the chip to the driver and
what happens to all the lines on the chip after that is up to the driver.

The big problem is you never know if the line you are releasing is the
last requested line.  Unless you explicitly hold at least one line.

> > If it works for you that's great, but without major kernel changes
> > libgpiod has no better option than to provide the caveat as the "set and
> > forget" behaviour is something that it cannot guarantee.
> Than is only way to write my own user space driver simulating sysfs? Or what is the right way of this scenario:
> start proces -> gpioset =1 -> sleep -> gpioset =0 -> do other things
> when the proces dies systemd will start it again
> 

No, you don't have to emulate sysfs, you can do whatever works for you,
that was just an example.

The libgpiod tools are not the only interface libgpiod provides - they
are just the command line/shell interface.
You would not call gpioset repeatedly, you would request the line using
libgpiod (for C), or the appropriate bindings for the language you are
working in, and then set the line as required in your program.

If you are working in shell with libgpiod v1.6.3 then there is no way
to hold a line and subsequently change it.  You would have to repeatedly
call gpioset and hope for the best in between times.
For libgpiod v2 I'm working on an interactive mode for gpioset that
keeps it running and holding the line(s) and you pipe set commands to it
from your script as required.

If you need anything more complicated for scripting then the Python
bindings would be the way to go.

> and another scenario:
> proces checks time, if is the right time -> gpioset =1
> other proces reads output and print out on web
> 

line manager process:
request line (using appropriate binding)
wait until whenever
set=1 (using appropriate binding)
publish line state where web server can see
...

web server process:
webserver asked for state
returns last published value

Cheers,
Kent.
