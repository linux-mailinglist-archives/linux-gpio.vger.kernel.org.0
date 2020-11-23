Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1212C091D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387604AbgKWNEU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 08:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732349AbgKWMvS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 07:51:18 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C047EC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 04:51:16 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id i18so17994153ioa.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 04:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ChGGp6ozLF8Hqqacc/T6RB3u8BJrScH/8AVJQ+SJlqc=;
        b=GQmvg0K83WBAgSVzaF5VAtfXr7EQ+BDfUtj6SK+fUpCnpwbNNHQUYIsmOVKpmvYRzq
         V8jgwfAcwElh6TmMc5cXC3anZmJ/tmxGBxCi4OyFTzN1Fvj6vhodrqFnC31G6TG7aWyU
         hoCnwnNzFdcmk9JoLcfDlUdNLwNrM/7emgYFB4F4iXjq7xdnzW6Ex444dC+SNs2k0tRE
         de5kjD/LMtm/LiJjWkJr3o0PAFcPTOZx+G51ZOu1aDAv0u2XC36NFBoBBshUrC1aaIa2
         mH8VZiF3i5CBF1WeoLIX2z9FFuLcvuYcTYSE0KSCTveQ50TkXaRrUKqWUSSfmq/D7uAt
         lGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ChGGp6ozLF8Hqqacc/T6RB3u8BJrScH/8AVJQ+SJlqc=;
        b=ArovIQ3nMro8k+EHz2UGztEcHVyzUifauvcOJBYr2heek9dt8CAfB3XJP7bu0aUkbG
         y5rH0Mlp8BV7mPreylsKBtwM50sMX7FEGt/Yjc6xTc6YuI9acw5+wygSrpR46F/AzQbQ
         nEC8dV+eGln2QL9lePQ1JYihnLIGTSsy4mYm5RQxTmZMZuPeqfDCZeVCeQvJdCj63+yy
         pjLrdGSVgmfJWWLY/KqMHcrFd178JwCk9SNE/naKDbPm050cF0emR+pGbabOcl8DWuNE
         5XfmK5dxuY/amyro/LMNPD1vyPvptftaboDCd3pWM5qsha/kwSLvF8zuzHKbbK9jAxG+
         i8Ng==
X-Gm-Message-State: AOAM530ykipSHgGJAV/Y1p6s+3T3m6uqeShN4djR5DryipWg2b3uHjkH
        xMTYzrlSSNwtiis/pzcTbSt0dAj/LjWxhTPIbQZVQw==
X-Google-Smtp-Source: ABdhPJwjSDw9+c6uweVEjlqzf4HyZgrTBKpCxM706Ia1w1xFow0qSWfpDisGwGemBzV99rInzODBnf02oD9HTEO1vyk=
X-Received: by 2002:a05:6638:15a:: with SMTP id y26mr28570709jao.57.1606135876154;
 Mon, 23 Nov 2020 04:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20201116104242.19907-1-brgl@bgdev.pl> <CAMRc=Mdkr+65Nu7ddjtMHTbedpNf22w1bE97vipKSdXBYm8=fw@mail.gmail.com>
 <86bf5fda-eeb5-5cb2-901f-a887af7584f6@siemens.com> <4cf1dcf9-93b7-910c-005f-3bf316e0fb64@siemens.com>
In-Reply-To: <4cf1dcf9-93b7-910c-005f-3bf316e0fb64@siemens.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Nov 2020 13:51:05 +0100
Message-ID: <CAMRc=Me49Aoz1zVT-raQ8WyS5xhUTLC72J8+j+mTWJSFairU4Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] gpio: exar: refactor the driver
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 23, 2020 at 1:12 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 23.11.20 12:58, Jan Kiszka wrote:
> > On 23.11.20 12:38, Bartosz Golaszewski wrote:
> >> On Mon, Nov 16, 2020 at 11:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >>>
> >>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>
> >>> I just wanted to convert the driver to using simpler IDA API but ended up
> >>> quickly converting it to using regmap. Unfortunately I don't have the HW
> >>> to test it so marking the patches that introduce functional change as RFT
> >>> and Cc'ing the original author.
> >>>
> >>
> >> Hi Jan!
> >>
> >> Could you give this last version a final spin before I merge it?
> >>
> >
> > [   14.250117] exar_serial 0000:02:00.0: enabling device (0000 -> 0002)
> > [   14.336622] 0000:02:00.0: ttyS2 at MMIO 0x90000000 (irq = 44, base_baud = 7812500) is a XR17V35X
> > [   14.391588] 0000:02:00.0: ttyS3 at MMIO 0x90000400 (irq = 44, base_baud = 7812500) is a XR17V35X
> > [   19.250510] gpio_exar: probe of gpio_exar.1.auto failed with error -22
> >
> > That's "new"...
> >
>
> Bisected to "gpio: exar: switch to using regmap" again.
>

I'm not sure if you saw my email which I sent at the same time as you
- but does reverting reg_bits to 16 help?

Bart
