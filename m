Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69A8F55D643
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbiF1ExA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 00:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbiF1Ew7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 00:52:59 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0209218340
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 21:52:59 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so11485055pjb.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 21:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BYCLfn6gUddeVnN3VQ7RRSdQecZWyAUrP0cTjuXAXw0=;
        b=fQKRFnQNZV9peyxXbnklifLGtDzYhNQuny8Fb8rLVXLfCS/Kd88KRhphgsRBJbb+kX
         uNlAa67yhbknDTRlgHpybzkESHJIaTvfcH525acVVQmz7ViDEalK2XVPj95Xj/5fX1BA
         RSt6Q0udIYeQqpR5wlecFp0uMlCHT3ZX1kBs+OOHCwRueTMybP3ryzvkmUNhwW78SYEh
         QkK9l1mNc4GzujSr5yfrChIOm1Sk1kA7xcuaqgIJShsMaG7VDTJb+0aRQFHl3ijnz4AW
         XE7+ZGa/TSe/siGNFSjXIBxAUmNUGDNOGwLyOcvVjSQGTRfD5Eys5NHdOlmqJUyo/+QA
         ZwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BYCLfn6gUddeVnN3VQ7RRSdQecZWyAUrP0cTjuXAXw0=;
        b=16r6ypwVEoSxmOyjKlkl8U4m/tOTLzd+V52HvJ1BHRD+2RfivlEH862WRRa/jaTHfg
         F6iVxAnr9/iHzzXROYJAk2WP6sHHLIuFM3C2E7YluYC1iw9EXJiiwLSxWrZbRxk2wsKa
         O8pM4U/587SANkgKQFCxhasAlDxieeewiguTO4MZoihWf376eB3EwXU7uNimPrLOiOcg
         M5zF5V4yHMbOf1a2QcfYvPy1uAv5sUIUvOGzthD/y/1MQ4Wvtl2EJT+Dx7t0U701Px7S
         JEkxAtY5CORHzjFFUC1rChS29W1QC1XwL5Hq8oPS9zVp1C6jUOO96LdQHS9edppIZype
         UWgw==
X-Gm-Message-State: AJIora81sNP5+fvgH/J3TROtiyCJg6biWekZJS6Td0c7MtAXFBDTofyu
        lq0BzVL0FFPVhEce2pVRwAbrZ9fbg5Q=
X-Google-Smtp-Source: AGRyM1vg4PjmXRy4TzKEbniRywjLfwqbl8Ja8nM7x30N/R3MTfaEl9UruQ1IcSUWoBTgPRK3DHqmMQ==
X-Received: by 2002:a17:902:f7d3:b0:16a:208e:b2c4 with SMTP id h19-20020a170902f7d300b0016a208eb2c4mr3103202plw.64.1656391978423;
        Mon, 27 Jun 2022 21:52:58 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id l15-20020a63da4f000000b0040d0a57be02sm7846328pgj.31.2022.06.27.21.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 21:52:57 -0700 (PDT)
Date:   Tue, 28 Jun 2022 12:52:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Linux GPIO List <linux-gpio@vger.kernel.org>, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
Subject: Re: Reading current output value
Message-ID: <20220628045253.GA18105@sol>
References: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
 <20220622102632.GA37027@sol>
 <CAGm1_kvf1RC7fHBy65PkRcS=a5eUgpVYyHM+6NmOvWv6YusTEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kvf1RC7fHBy65PkRcS=a5eUgpVYyHM+6NmOvWv6YusTEA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 27, 2022 at 12:37:46PM +0200, Yegor Yefremov wrote:
> Hi Kent,
> 
> On Wed, Jun 22, 2022 at 12:26 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jun 22, 2022 at 09:54:41AM +0200, Yegor Yefremov wrote:
> > > On a am335x based board I have a GPIO pin that enables/disables power
> > > of an external device (the bootloader sets this pin to output and 1,
> > > and the kernel is instructed to not change it). Using kernel
> > > 5.19.0-rc2 and sysfs interface, I can read the current status as
> > > follows:
> > >
> > > echo 68 > /sys/class/gpio/export
> > > cat /sys/class/gpio/gpio68/value
> > >
> > > As a result, I read 1.
> > >
> > > Using gpioget (libgpiod) v1.6.3, the line will be configured to
> > > "input" and the value is set to 0:
> > >
> > > # gpioget 2 4
> > > 0
> > >
> > > So, how can I read the state without changing it? I am mostly
> > > interested in using the kernel userspace API directly.
> > >
> >
> > The API itself supports it, but it isn't exposed in gpioget v1.6.3.
> > The gpioget in libgpiod master has a --dir-as-is option for exactly
> > this case, but that hasn't made its way into a libgpiod release yet.
> > (commit 3a912fbc1e2 tools: gpioget: add new --dir-as-is option for GPO read-back)
> > Can you try master?
> 
> # gpioget -v
> gpioget (libgpiod) v2.0-devel
> Copyright (C) 2017-2018 Bartosz Golaszewski
> License: LGPLv2.1
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> 
> Now, I get my "1", but as soon as gpioget exits, the pin goes at "0".
> 

Is that line the only line used (i.e. exported) on that chip?
If that is the case, can you request another unused line first (e.g.
using gpiomon in the background, or, and only since you've already
mentioned sysfs, exporting using sysfs), then try the gpioget?


But fundamentally what you are trying to do is use the GPIO line as a
persistent store, which it is not.  The state of a GPIO line is
uncontrolled, and considered undefined, unless the line is requested
(exported to use the sysfs terminology).
The gpio tools have no option but to release the line when they exit,
and so can't be guaranteed to do what you want here.
It may work or, as you have found, it might not.

What you need is a userspace entity to request and hold the line and
be the ultimate arbiter of the state of the line.  The initial state of
the line could still be read from the line itself, though that should be
a last resort.  You mention your bootloader is configured to
initialise the line to 1, so you could take that as a given and have
the arbiter set it to 1 on startup.
I'm currently working on an update of gpioset for libgpiod v2 [1] that
has an interactive mode, so you can set the line and then control the
value later.
 e.g. gpioset --interactive --chip 2 4=1

Would that work for you?

Cheers,
Kent.

[1] https://lore.kernel.org/linux-gpio/20220627134447.81927-1-warthog618@gmail.com/
