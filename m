Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C35BE68043
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jul 2019 18:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbfGNQlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Jul 2019 12:41:37 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33742 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbfGNQlg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Jul 2019 12:41:36 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so7081369plo.0;
        Sun, 14 Jul 2019 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3tsgI+YnFBKPFTQcdJwOqGeZBvFRLcOBoUybbZFi6xE=;
        b=sIk6+R6AqIL9yxIMC9QTUhR4s8lNAczsIDjB+X5Mw0QyAmIRs2oQBlGGKjYwslUtl7
         YHP+wR55Ilh2IXFfpCJLHhd99xDrVjP1GuSDfXqQTUonlNf+Ho82VbfS+P1szVqR0nVq
         iVHy5pS9J2Nu8DCdEwWBW1IJ57oCcu0sLliq0MuO36fja5z5a5dTixoAQT+3bEJWkSoY
         lnSc8NIHLm1xda2MWt7KCcwBNJRbq9ml+7mRmT85JsnfA4a+YGoAxmEQqFa20S59TBMc
         CywQL6UosZvWfUwIn/IIGEwBmsvoBGYpkS0YRlg2q8CJClTmkZpzpoHNbNVWVrVlbR+e
         Xgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tsgI+YnFBKPFTQcdJwOqGeZBvFRLcOBoUybbZFi6xE=;
        b=Q8k2PchNiJY36wYiyOLvpkg5WjAiHlre+Xn05zTrRnZzzCKnQaOeU9NiUzTtpXOpGh
         o88qFOJCsJjUk0OP7QijHw32pcrq1TiXLBfsJpT4vaKGnZ2sAJ3EdPXgCxnSfHZIxGs8
         /6wuQl5bXqIJ3xpm62Rev5zujyjNdeOSavVsQi579cGRX8aepVbrlJbbz3vCPSa4ywVS
         8SyzXlZk42kU8KhwSsw4O7AO/xqmPtP7a5Y6JeGFmWaYFBSVCweEJOSN1h25by+9Euew
         Z1inStfUl7j5FmKmTIMmKNTbjPGzxHpz1mvT52LcvEBekKPnfbWv/kdKE10CextkTXs5
         Ku/g==
X-Gm-Message-State: APjAAAULhsaTTMpsgSypVXDAMdTtlh+Otwv3ZrQtSdahnOnJiZTa7Ikl
        BxF8QqwxIXDp8FMMg4MAIxLJsUzeYq8JpCiO+FU=
X-Google-Smtp-Source: APXvYqx02xvUcnfyIvid7VBxGy85lExJKLWKmAhi3Cyh9/8zlXcpy0UrEUyGDqNsCITVR6cT+uSNJP8aXpGGsN6T9Gw=
X-Received: by 2002:a17:902:934a:: with SMTP id g10mr24051874plp.18.1563122495946;
 Sun, 14 Jul 2019 09:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190712085437.4007720-1-arnd@arndb.de>
In-Reply-To: <20190712085437.4007720-1-arnd@arndb.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Jul 2019 19:41:25 +0300
Message-ID: <CAHp75VfGs9v_YoAfFcsQphqfR3-i+vb_2aS5GijJ8PgG5W0CWg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: pcengines-apu2 needs gpiolib
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 12, 2019 at 11:54 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> I ran into another build issue in randconfig testing for this driver,
> when CONFIG_GPIOLIB is not set:
>
> WARNING: unmet direct dependencies detected for GPIO_AMD_FCH
>   Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
>
> WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
>   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]
>
> Make the 'select' statements conditional on that so we don't have to
> introduce another 'select'.
>

Thanks, I have applied the fix from YueHaibing, the idea is to depened
on GPIOLIB.


> Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
> Fixes: a422bf11bdb4 ("platform/x86: fix PCENGINES_APU2 Kconfig warning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e869a5c760b6..cf48b9068843 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1324,8 +1324,8 @@ config PCENGINES_APU2
>         tristate "PC Engines APUv2/3 front button and LEDs driver"
>         depends on INPUT && INPUT_KEYBOARD
>         depends on LEDS_CLASS
> -       select GPIO_AMD_FCH
> -       select KEYBOARD_GPIO_POLLED
> +       select GPIO_AMD_FCH if GPIOLIB
> +       select KEYBOARD_GPIO_POLLED if GPIOLIB
>         select LEDS_GPIO
>         help
>           This driver provides support for the front button and LEDs on
> --
> 2.20.0
>


-- 
With Best Regards,
Andy Shevchenko
