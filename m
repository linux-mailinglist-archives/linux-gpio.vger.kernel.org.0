Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F642074BF
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390113AbgFXNlY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388453AbgFXNlT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:41:19 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8493FC061573;
        Wed, 24 Jun 2020 06:41:18 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k1so1084581pls.2;
        Wed, 24 Jun 2020 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YjaRnLW/TeYDKRVMhHoc45hQDjzb3Lxd9P36OWV9xUg=;
        b=RQJP9IMnZpBzbnT/jh+2pJW2cGqgsGVYUg+jHmUFrFaiyByppGTLqtmTHID5c5IeM8
         2n9vlkn+Lp0Ig1u5TF0mXhg82+LHraV3/WjEnJABoyKbCCbvwgQBWqb/dBUglS5aJhGk
         RmnqImfrEqOZp2e46uO50u9GLGltFwksP9MqT8BoNY6HcuucvCFr99VhSrFxHFXfgxFq
         xCB85l5FVyZy9bl3eqgGsh0j3SHmWiI7WrflyVMbOQz6fcPcBgDu63sUxsBAAiWrwRkT
         BB7KGloNr+drMlgjuAKVpP31HqM/PwSEMQtyIvD3CYeZsC5M2LrFR+asVVpZLsP3F/l2
         BIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YjaRnLW/TeYDKRVMhHoc45hQDjzb3Lxd9P36OWV9xUg=;
        b=GqVXt/aAAStKo2pRaEnnaI/US9MV/wChnBYLITLsRFaJl3A6APmf90pEpBgrcUNoH9
         FkFmFzoWa3Q+LsUFhWhZq7JJ379GTc5Nn0XtdIf6MNl9vlitQtDNcMRwtmAy/JZrGlJB
         uYSSUEI7Nf4ysbUx8dVzGITm7a8yrqgz7/aA+AVPSzbRqAZaUMkDrWZjbaoFzcBWmjC6
         h4KSMMAqZuh1BONkYv8ijvbr9iNpUMMxdzICMRDuLCa7vCbGo9r/LOGLnb0alq1vuicF
         P4sA329IpzL+77N8MyNG33CMEgjfvFiS/B637rKK01+H+AAb4K2pMvfqkKvWluULbGRQ
         cTfg==
X-Gm-Message-State: AOAM530qn1AnQeYHeNnKkPVAWowqXaP6fJkD6Oa93+SQ1zs/04i45avo
        sf84xzsKp7WKyZ81edLZ3CYE1rABlBFOwTuI/J0=
X-Google-Smtp-Source: ABdhPJxnOauBhHEdzF48+9LTCaK/Sq2VJQShwYVd5y7GHlmvjT3U3dmQ5AMnvw3J4EVR2S4nOo0HAMSLMzT2olab7p8=
X-Received: by 2002:a17:90a:b30d:: with SMTP id d13mr28213586pjr.181.1593006078101;
 Wed, 24 Jun 2020 06:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200623145748.28877-1-geert+renesas@glider.be>
 <20200623145748.28877-3-geert+renesas@glider.be> <CAMpxmJWGckzicz6FddXybcJh-hb+-hoGbV29Z3BA61RVQ1nQDQ@mail.gmail.com>
In-Reply-To: <CAMpxmJWGckzicz6FddXybcJh-hb+-hoGbV29Z3BA61RVQ1nQDQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Jun 2020 16:41:05 +0300
Message-ID: <CAHp75VenuB=up5wHm+BtkQPy_N6GuE7xvHJWq-e4Fricg1M7Vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: aggregator: Use bitmap_parselist() for parsing
 GPIO offsets
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 3:16 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> wt., 23 cze 2020 o 16:57 Geert Uytterhoeven <geert+renesas@glider.be>
> napisa=C5=82(a):
> >
> > Replace the custom code to parse GPIO offsets and/or GPIO offset ranges
> > by a call to bitmap_parselist(), and an iteration over the returned bit
> > mask.
> >
> > This should have no impact on the format of the configuration parameter=
s
> > written to the "new_device" virtual file in sysfs.
> >
> > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > I'm not super happy with the mask[] array, which is on the stack.
> > But there is no real limit on the number of GPIO lines provided by a
> > single gpiochip, except for the global ARCH_NR_GPIOS.
>
> Why not allocate it with bitmap_zalloc() then?

I haven't got the original messages yet, so my thought is to actually
extract a helper from
gpiod_get_array_value_complex() or gpiod_set_array_value_complex() for
bitmap allocation.
But I didn't check if it's suitable here. So, bitmap_zalloc() would be help=
ful.

--=20
With Best Regards,
Andy Shevchenko
