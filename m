Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A52B2A6EE3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 21:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbgKDUgL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 15:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgKDUgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 15:36:11 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62362C0613D3;
        Wed,  4 Nov 2020 12:36:11 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id z3so2855910pfb.10;
        Wed, 04 Nov 2020 12:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YqBiLs3AHaM7H7/oAu2F5GBFFZxeV1BLgv40I95tuSs=;
        b=LcPXCKqo1FPmvhi9eJ/JMXQQRodwH/VnPUpkTJ0zHPXBHrfO8Qr5QValOMq+gSg+uW
         vW4SieXmzeVbc5dTvNpikjirtadPZoNLG3AqfimhTpbiYweMKEEgbRkU01sJQbcuiVoY
         88em37kCsZa34fKFvmcI7OOgZEb48JL6a0eM/4j1cJu1u4HgcofYGS/EFpedFk8E1l1v
         Bv9Re62YcIZFFgs+sf+8+vIMa76DO/GNmv2Xs/HR0HiD+2GufvoWrF3SR9Inxf188Xoz
         nUvgaOf64n9wHpcRrhyq760zLokxU1stOKuSHG6bJ1edIXlxrnVAnRAfhRgHalAEqcO/
         2gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YqBiLs3AHaM7H7/oAu2F5GBFFZxeV1BLgv40I95tuSs=;
        b=pLFn31dlPiOL2UukmaFkYf2jrf2xhPRsFlOCg7LsoEyt1E9OPG19JJZuZnhpsEhUCO
         cxkVyTc87fwVUuf++fb8+WedomPBgAW3lhkalNAL1Tix2Dnht3epHC6/m2sQwey159Pl
         gjJU5sUQTC2YOWy/n56E5mfilPnKEZ5AdzJ4WrmsDDURqRFQlg8WBfFPd9vbnZxjK9BS
         PNTSX6dCr9361pybv6eQ4cJmrXFwMmuXtDJ6UjBIRCJp7PFLyav001UGDeYedF8C8uew
         LQm3V+lNBUbnk3BXM+xaU+O+hxVgIzykqQtfgOVB7nZTcWevOq4UkxokBILIAh25USUV
         ebPg==
X-Gm-Message-State: AOAM532UXpxCQZZuQeJyN+BwxMH3Ep2WDIbFu+fTLevic8QvvD9OsbRl
        01cZsCygBkbmu8AUQgY0I6lM5KcRO4Lmt4NDrRs=
X-Google-Smtp-Source: ABdhPJxkX0LBAF0P1JZ/ehrPDkHSOGepjlG4pWNqUAgrCoxxTZCIZpLaj9UAnC9VFk1lL7dbAZ3RqsDVUy/nL1IPAbY=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr30847470pfd.7.1604522170922; Wed, 04 Nov
 2020 12:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20201104193051.32236-1-brgl@bgdev.pl>
In-Reply-To: <20201104193051.32236-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 22:36:59 +0200
Message-ID: <CAHp75Ve0vMzK43QCqNxMwT6UpUESkbCvbvE3Ld=RZQd3bmJZpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] gpio: exar: refactor the driver
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        Mark Brown <broonie@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 9:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I just wanted to convert the driver to using simpler IDA API but ended up
> quickly converting it to using regmap. Unfortunately I don't have the HW
> to test it so marking the patches that introduce functional change as RFT
> and Cc'ing the original author.
>
> v1 -> v2:
> - add new regmap helper: regmap_assign_bits()
> - fix lvl vs sel register access
> - set value in direction_output callback
>
> Note: I didn't use the fancy method of offset calculation Andy and David
> suggested because this series broke the driver according to Jan - let's
> get it right before we modify it any more. I found a couple problems that
> could maybe cause the crash. Jan: could you give it another spin?

I would suggest perform two tests:
 a) full set
 b) with last two patches reverted / not being applied

In that case if the series is still broken we may go with cleanups first.

>
> Bartosz Golaszewski (8):
>   regmap: provide regmap_assign_bits()
>   gpio: exar: add a newline after the copyright notice
>   gpio: exar: include idr.h
>   gpio: exar: switch to a simpler IDA interface
>   gpio: exar: use a helper variable for &pdev->dev
>   gpio: exar: unduplicate address and offset computation
>   gpio: exar: switch to using regmap
>   gpio: exar: use devm action for freeing the IDA and drop remove()
>
>  drivers/gpio/Kconfig     |   1 +
>  drivers/gpio/gpio-exar.c | 151 +++++++++++++++++++--------------------
>  include/linux/regmap.h   |  16 +++++
>  3 files changed, 90 insertions(+), 78 deletions(-)
>
> --
> 2.29.1
>


-- 
With Best Regards,
Andy Shevchenko
