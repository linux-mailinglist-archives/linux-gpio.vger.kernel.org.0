Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F707206D8
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 18:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbjFBQHt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 12:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236410AbjFBQHs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 12:07:48 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF60AE2
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 09:07:46 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-651f2f38634so1691997b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685722066; x=1688314066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E05ObG8/CvMsGx4LyksTD/nwZp8Bh/yR5IybtuayS0Y=;
        b=axpFvwE34IZAi2LSYF0YrjZcCHPo5SW8621xPjgy0LLgGltTcF9wStcIrkcOLgcojt
         nzvXxHYbZiJl946zV9b16efoZILDrkxkUj7H7VDiCxIEJ5fbtVBKKxPesGkOOkVeUgSQ
         foFZKZCEIokDlAsUdRzYPgPwHjT1efcgLhV7nyEtVqX4MLmXEk/JuissKVQDTX9Y9650
         xoQZ1fS432IhFmGixtbCNVvm3m30HKeRymizBkPgeKYFRJZfQpxJPfgn9U89eNXKTyTL
         1Nwjpy+2X2oH0P4pxiWm9jjd+cDI41UhHT/qm/pldAq3nQLhKhpmWvRmui+wPZNneU3T
         kJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722066; x=1688314066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E05ObG8/CvMsGx4LyksTD/nwZp8Bh/yR5IybtuayS0Y=;
        b=NdsMbX9yx1rpjEV2PFH3KUbYijVUC+hgZ3EaH0u6mz8zgJDtxmhB+klmcC0yKp35XB
         iIKa2xUQHqUHcixe8C2Y3lZxG0e9qOjMuvearM52PX+FMKuw/oYJ+Gmxohg7yGJ+JFDW
         X9vZoql2leXY6AtOrDBXtybgk7XjRApuofbVjQKatGSMLun8FyPr8eC/LXBca+FR7X1O
         BjhKlsvDPma07LTzWtNtz9oH4rEdhx8S+QSxG62JrX0IOPGFgCg2cTc86G8hX6PEqzDi
         D7I/6Iq0XwtYKkMzUyarZcxsplTNFFvr9kkyGAcIeOAJGUf6UoGntOcTwL8Yr2qUVbcL
         6z4g==
X-Gm-Message-State: AC+VfDwkJ9xxgJ9REKRGke0/WFlDWc/I3FFdqqMSNtdVDyGPjhDeaPlj
        pRU992PfGCTh39tqo1cBbzg=
X-Google-Smtp-Source: ACHHUZ5dL9y5w9HW2k+wzx2wp+WcRpH2dA2KJl1u6O478qshVPw4ZU2tgtPZKtTIiJiOzHNAmCp/xA==
X-Received: by 2002:a05:6a20:c90b:b0:111:997d:d216 with SMTP id gx11-20020a056a20c90b00b00111997dd216mr12369458pzb.31.1685722066287;
        Fri, 02 Jun 2023 09:07:46 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id t136-20020a635f8e000000b0052863112065sm1381185pgb.35.2023.06.02.09.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 09:07:45 -0700 (PDT)
Date:   Sat, 3 Jun 2023 00:07:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
Message-ID: <ZHoTzKbuCykRREbS@sol>
References: <20230601140950.779453-1-brgl@bgdev.pl>
 <ZHirBqDkd99qWGX8@sol>
 <ZHjONQW0qVMseySZ@smile.fi.intel.com>
 <ZHlQT5KeU+7GkYba@sol>
 <ZHnFxdcZJEd1ta0R@sol>
 <CAMRc=MeC=H+Qvew3jrwPR6MMa=rO1Ds_5dN_tZZGS_C1zMz+FQ@mail.gmail.com>
 <ZHnuCjd5gDPDoDjq@sol>
 <CAMRc=MdRiJUURRZxqwm87b7H=DEFuyW5OOqKrqXjrveVNw7BPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdRiJUURRZxqwm87b7H=DEFuyW5OOqKrqXjrveVNw7BPw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 02, 2023 at 05:33:08PM +0200, Bartosz Golaszewski wrote:
> On Fri, Jun 2, 2023 at 3:26 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jun 02, 2023 at 03:10:18PM +0200, Bartosz Golaszewski wrote:
> > > On Fri, Jun 2, 2023 at 12:34 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Fri, Jun 02, 2023 at 10:13:35AM +0800, Kent Gibson wrote:
> > > > >
> > > > > On a related(??) note, I'm occasionally seeing Oopses when testing this
> > > > > - when creating a basic sim with a shell script, not when deleting it.
> > > > > In one case after a fresh reboot and on creating the first sim, so it
> > > > > looks to be purely the construction.  Yay :-(.
> > > > >
> > > >
> > > > I had thought it would be difficult to reproduce this and so difficult
> > > > to bisect.  Fortunately(??) not.  If I run my setup and cleanup scripts[1]
> > > > in a tight loop it occurs very readily.  Haven't bisected it yet, but did
> > > > test it on 6.1-rc1 and it Oopsed there too, so I would need to go back
> > > > further.  What was the initial release containing gpio-sim?
> > > >
> > > > The sim setp is pretty simple - a couple of banks each with a few lines
> > > > and hogs.
> > > >
> > > > Could you confirm that you can repeat the problem?
> > > > Otherwise I might start thinking there is something broken in my test
> > > > environment.
> > > >
> > > > Btw, the loop script is:
> > > >
> > > > #!/bin/env bash
> > > > for (( ; ; ))
> > > > do
> > > >         echo "create sim..."
> > > >         ./basic_sim.sh
> > > >         echo "destroy sim..."
> > > >         ./clean_sims.sh
> > > > done
> > > >
> > > > Cheers,
> > > > Kent.
> > > > [1] https://github.com/warthog618/gpiosim-rs
> > > >
> > >
> > > With this script I've been able to trigger an issue but it looks
> > > different from yours: https://pastebin.com/cbsgT2ae
> > >
> >
> > Looks similar to me.
> > I would assume that is the same issue - even if the  particulars of the
> > crash differ.  If you can fix that and my problem remains then we can be
> > sure they are distinct.
> >
> > I've been doing a coarse bisect to see how far back this goes -
> > basically looking for a known good.
> > 5.18 crashes, but it crashed hard, so no syslog.  It did run considerably
> > longer before crashing, so that could be different issue masked by the
> > other (later?) one.
> >
> > Moving on to subsequent releases...
> >
> > Cheers,
> > Kent.
> 
> I managed to trigger a different crash: https://pastebin.com/6Gx29vHB
> 
> This one happened in gpio-sim:
> 
> $ ./scripts/faddr2line drivers/gpio/gpio-sim.o
> gpio_sim_make_bank_swnode+0x12f/0x220
> gpio_sim_make_bank_swnode+0x12f/0x220:
> gpio_sim_make_line_names at
> /home/brgl/workspace/yocto-gpio-sim-crash/build/linux/drivers/gpio/gpio-sim.c:725
> (inlined by) gpio_sim_make_bank_swnode at
> /home/brgl/workspace/yocto-gpio-sim-crash/build/linux/drivers/gpio/gpio-sim.c:837
> 
> But to me it looks like some memory corruption if the stack traces are
> so random... Where is Rust when you need it? :)
> 

Makes sense.  I'm seeing different behaviour from differnet releases,
so there may be multiple issues here, and some may've been fixed or
introduced at different points.
Or, as you suggest, it could be a corruption that just exhibits
differently depending on what ends up getting corrupted.
Either way, bisecting this is problematic.

e.g.
5.18 crashed hard after a while.
5.19 ran for quite a while - but then crashed when I killed the script.
6.0 behaved similar to 5.19.
6.1 looks to be where the current issue was introduced - that fails
almost immediately.
6.2 crashed hard.
6.3 failed fast like 6.1.

TBH, haven't been paying much attention to the crash details - for the
most part the backtraces are a pretty generic syscall fell in a heap as
a pointer somewhere was null.

Not sure I'm being much help with this one.
Anything specific you want me to try?
Otherwise I'll leave you to it until you do.

One other thing - is it necessary for gpio-sim to log hogs?

Jun  2 23:45:13 firefly kernel: [   39.539144] gpio-522 (hog2): hogged as input
Jun  2 23:45:13 firefly kernel: [   39.539152] gpio-528 (hog3): hogged as output/low
Jun  2 23:45:13 firefly kernel: [   39.600144] gpio-513 (hog1): hogged as output/high
Jun  2 23:45:13 firefly kernel: [   39.600365] gpio-522 (hog2): hogged as input
Jun  2 23:45:13 firefly kernel: [   39.600372] gpio-528 (hog3): hogged as output/low
Jun  2 23:45:13 firefly kernel: [   39.649662] gpio-513 (hog1): hogged as output/high
Jun  2 23:45:13 firefly kernel: [   39.650558] gpio-522 (hog2): hogged as input

For the long running cases this results in a lot of logging, which could
be causing issues in itself, and further muddying the waters.

Cheers,
Kent.

