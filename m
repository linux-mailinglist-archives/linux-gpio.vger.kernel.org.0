Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF0350E879
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 20:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244504AbiDYSpw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 14:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244501AbiDYSpv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 14:45:51 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1C857173
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:42:46 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z99so19529911ede.5
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ke+YNf1pchMgK731/k/UxN2oLRoms9lLtsIe4Zduws=;
        b=pbptWFvrYGvctxTyn9iqBLTCrBmhrqo6gLQcSIiE7V9twwBFNRre8sFrl+fzX8GoS3
         EWd4T3+IQjuEOTs7u6/QwgL2vEYjCZNGBqGQG7l0QWPG6FYVqH0D4hAmM2BonInrV+Sl
         pkHXzml8A9fCDLLIPBTlW9J3MB/c9p98aS4nXScIl9hJk9A+1QCVMswwUl4vdk2VFBfv
         L4CTvSgDUV6Sf8bA/ZoOXmVFVhA6vnRBD7GblTSDsR9DWkYxydjvH+KmvE1ZLu/N1+9b
         wiG6L3SE6y9j59NpwNa3eBfwYye17zJ1m5AegKrFPVi2ClNnL0qwO8z7PUSy5l2/4JZi
         LnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ke+YNf1pchMgK731/k/UxN2oLRoms9lLtsIe4Zduws=;
        b=otOJj0V8JmoN3M+NrwCxLt/OebQgVQgESR88Ytf+gkae/DdI7/rQ075fiju6Cte+Ch
         gl0kUS2ICfHsNBYXDQXwV3m59bX7u47XVzyIfmID19uYl6SLvaG24Q6sOt/z7krMK9Bg
         xxuSrvuf4BeclAydkCGWBJhhhj1+d546i0UPVKi+OO+yoDpwR1BP+zx3WGx6l3+eBiSU
         IZByxLByiMA3rHioThB8KXxIE3bgjJqMlA9fGJ2zwTUWzsyV3m0waucsjLxUsL+om3lu
         WsOiYj6eQ8sgqN8RoINO5rFhNfgB1c66u7L98gjJXPrzltzeLWoBgzcOy9m1SLTRhF6h
         38+g==
X-Gm-Message-State: AOAM532rL9lBdaQ3HKrFbFhwjOTHgUU5ryJxxlbnnFNoMXLOd6Lp7AWl
        hEPdLqpqEUQiKHndqyVqUJ4yC6OmptJdGZPCdqHAoA==
X-Google-Smtp-Source: ABdhPJykAX2wPBfU7CbB79UyqZ9HfxgSNxtqi1AwxVWpGwKSnrq/0NggT1EOMDmscsWrviEDaJA063v6m9emOqMDPVg=
X-Received: by 2002:a05:6402:5286:b0:425:f0fb:5d23 with SMTP id
 en6-20020a056402528600b00425f0fb5d23mr4170247edb.243.1650912165172; Mon, 25
 Apr 2022 11:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220422131452.20757-1-mario.limonciello@amd.com> <CAMRc=Mf7FVN4QeAEdap_JzKmTy6i0A=BbcCZtCCQhzocg4PDfg@mail.gmail.com>
In-Reply-To: <CAMRc=Mf7FVN4QeAEdap_JzKmTy6i0A=BbcCZtCCQhzocg4PDfg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Apr 2022 20:42:34 +0200
Message-ID: <CAMRc=MeOvvBVVsAwscq2tsmoS5ze87kneaeuHOXci7k32sDt8g@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Fix regression in 5.18 for GPIO
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Natikar Basavaraj <Basavaraj.Natikar@amd.com>,
        Gong Richard <Richard.Gong@amd.com>,
        regressions@lists.linux.dev,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>,
        stable <stable@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shreeya Patel <shreeya.patel@collabora.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 25, 2022 at 8:41 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Apr 22, 2022 at 3:15 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> >
> > Linus,
> >
> > This patch is being sent directly to you because there has been
> > a regression in 5.18 that I identified and sent a fix up that has been
> > reviewed/tested/acked for nearly a week but the current subsystem
> > maintainer (Bartosz) hasn't picked it up to send to you.
> >
>
> Hi Mario!
>
> I don't have any previous submission in my inbox. Are you sure to have
> used my current address (brgl@bgdev.pl)?
>

Nevermind, found it in spam. Sorry, this sometimes happens in gmail.

Anyway - it's only  been 3 days and I've been travelling. Sometimes
reviews take a couple days.

Bart

> Bart
>
> > It's a severe problem; anyone who hits it:
> > 1) Power button doesn't work anymore
> > 2) Can't resume their laptop from S3 or s2idle
> >
> > Because the original patch was cc stable@, it landed in stable releases
> > and has been breaking people left and right as distros track the stable
> > channels.  The patch is well tested. Would you please consider to pick
> > this up directly to fix that regression?
> >
> > Thanks,
> >
> > Mario Limonciello (1):
> >   gpio: Request interrupts after IRQ is initialized
> >
> >  drivers/gpio/gpiolib.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > --
> > 2.34.1
> >
