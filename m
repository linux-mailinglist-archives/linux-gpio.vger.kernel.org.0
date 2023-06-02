Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC71C720339
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 15:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbjFBN0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 09:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236050AbjFBN0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 09:26:44 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B94D1B3
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 06:26:40 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b18474cbb6so12136045ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685712399; x=1688304399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BOshxCXtWxAXQ4AJD3KwGbEPmv406D+jIj5wicWg7R0=;
        b=M+XMtagAnHMnOOiHBy1VAh33t/Y/et3q9XXzL+toUQwh/FFZMEBFCXpmW83cnktQ/I
         kPA0qO+SO8RggHNIr8+ZpNohueQJ6kEu+qB5t4Yk7UAZ0+0ZDYcGR3QwW7SQEGVNldcy
         rkOweI5vfy23RUBSeLJtZT5qXVsSuYzo+LvHPFD8zpMppSEXsVkrjS0phg1hDlEHk2Jt
         qsuEwDT94JfVF7NAdg4NJ6arlhbmiYTlNiqT9X+Tj3X0/Ub1FHWvoEOKkjG8jSwrWrg4
         3Ek6LMAW3Jty9C16GyLypG1n10MHY7gA5fcvJ9vFR78/bz/rTq+AdABMZawQl2gNhLaW
         x9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712399; x=1688304399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOshxCXtWxAXQ4AJD3KwGbEPmv406D+jIj5wicWg7R0=;
        b=Bk/lNgDgPSb24OHI0+7XfUURVhB5oLU9lv0DPwexpMZY+fuMRNAxGQZFYZhx/6vPab
         jI/v4noQFEoDBkqcUl2B3E/0RHWyUpz4qBxXbtCrW1Kyysz9HYebrBMH4dCNW0T3rBoL
         TA/9rt9RZUDZrz+K2nhMfVCc30+9mxqH9bQLmCK3z5j6yMDxMpLPD/V4MTw33yw9mT/g
         kdFcUuP3Tvdmb9Qn6r0qHBHvofbu0bybmJgPheAiOHHba/vI7HdACrv8QpOamYb7xx1A
         IyLzkU4QidDe21ENgG4Y8aGBpfeZfixvTYqAZvqamTfcqi3VVxXphToKwPKTswWg5nVd
         d+9g==
X-Gm-Message-State: AC+VfDxF1xoJeFiObOUJkg3/MdBXnmpUksJ0FAUnr/Tywglf//IYCj2u
        YxjV7gBEmasdYF2X4HNdRfEZ2Kw2ShA=
X-Google-Smtp-Source: ACHHUZ5W1ryYQCbHKpoklWjmgtQG4/K0RRsn5rZQM53ykbKih66VFBkoxQsDN9hfysw8kLba2M5bLg==
X-Received: by 2002:a17:902:8301:b0:1ae:4bbb:e958 with SMTP id bd1-20020a170902830100b001ae4bbbe958mr1447992plb.14.1685712399451;
        Fri, 02 Jun 2023 06:26:39 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902bd9000b001a64011899asm1357975pls.25.2023.06.02.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:26:39 -0700 (PDT)
Date:   Fri, 2 Jun 2023 21:26:34 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
Message-ID: <ZHnuCjd5gDPDoDjq@sol>
References: <20230601140950.779453-1-brgl@bgdev.pl>
 <ZHirBqDkd99qWGX8@sol>
 <ZHjONQW0qVMseySZ@smile.fi.intel.com>
 <ZHlQT5KeU+7GkYba@sol>
 <ZHnFxdcZJEd1ta0R@sol>
 <CAMRc=MeC=H+Qvew3jrwPR6MMa=rO1Ds_5dN_tZZGS_C1zMz+FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeC=H+Qvew3jrwPR6MMa=rO1Ds_5dN_tZZGS_C1zMz+FQ@mail.gmail.com>
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

On Fri, Jun 02, 2023 at 03:10:18PM +0200, Bartosz Golaszewski wrote:
> On Fri, Jun 2, 2023 at 12:34 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jun 02, 2023 at 10:13:35AM +0800, Kent Gibson wrote:
> > >
> > > On a related(??) note, I'm occasionally seeing Oopses when testing this
> > > - when creating a basic sim with a shell script, not when deleting it.
> > > In one case after a fresh reboot and on creating the first sim, so it
> > > looks to be purely the construction.  Yay :-(.
> > >
> >
> > I had thought it would be difficult to reproduce this and so difficult
> > to bisect.  Fortunately(??) not.  If I run my setup and cleanup scripts[1]
> > in a tight loop it occurs very readily.  Haven't bisected it yet, but did
> > test it on 6.1-rc1 and it Oopsed there too, so I would need to go back
> > further.  What was the initial release containing gpio-sim?
> >
> > The sim setp is pretty simple - a couple of banks each with a few lines
> > and hogs.
> >
> > Could you confirm that you can repeat the problem?
> > Otherwise I might start thinking there is something broken in my test
> > environment.
> >
> > Btw, the loop script is:
> >
> > #!/bin/env bash
> > for (( ; ; ))
> > do
> >         echo "create sim..."
> >         ./basic_sim.sh
> >         echo "destroy sim..."
> >         ./clean_sims.sh
> > done
> >
> > Cheers,
> > Kent.
> > [1] https://github.com/warthog618/gpiosim-rs
> >
> 
> With this script I've been able to trigger an issue but it looks
> different from yours: https://pastebin.com/cbsgT2ae
> 

Looks similar to me.
I would assume that is the same issue - even if the  particulars of the
crash differ.  If you can fix that and my problem remains then we can be
sure they are distinct.

I've been doing a coarse bisect to see how far back this goes -
basically looking for a known good.
5.18 crashes, but it crashed hard, so no syslog.  It did run considerably
longer before crashing, so that could be different issue masked by the
other (later?) one.

Moving on to subsequent releases...

Cheers,
Kent.
