Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4506F46749A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 11:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351165AbhLCKTX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 05:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344816AbhLCKTW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 05:19:22 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DC6C06173E
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 02:15:59 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id y13so9249987edd.13
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 02:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=46DLVxFI8N9mwu2AB1rjVQJZeSXcwzhTwVUPFhWUT0U=;
        b=Yu2i/qKo0KMvyVWkZnKbdLxEmH+MCFKkcr1kD/+YucH4lqMtRFnx5sYuM96JeD3EeA
         T4SbCwPakG+e4CqjsS0TbVC74xGlCHJUGzoJs3Cw3x1xgpLqchcirOq6bP+A0UWcmyPh
         7WAYADVa9/h5mjILAgQes1Cy+G1/UJe/7pomhtQnGACdVpN6UTMfIPIGmsJb5Noqdrq7
         TgTFp2Ghm8dMQG1bltRR0OOWsKNxGj/piRSOuf3uQGZn06rh0VSfddf0hkqgRVanIqte
         d9/mVbEs4ea1Mwtv/p4Z7JgZNHYB1+rK6+lIMh3oiPHHvELE8ekV56NmLDKBtF8/7T6s
         qlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=46DLVxFI8N9mwu2AB1rjVQJZeSXcwzhTwVUPFhWUT0U=;
        b=1gyEvTgyoFE2ajWSLUcJkYUBeknlJtDcgPQs0irEvavKEUGJtyls5PDt5oRxtt11ie
         4N5r8G82rT6Xhmo1EYEw3yBAL+/fIhP7XWbfb9/AGw++0XIxzChRWrXaN9E9YxTs2+xG
         JeSm8BPIuLyaJJvh/vDJvV6VHbvy8sKrlqab4524Vlz4DaHWsSHpv94h2K4mhqIhrn4J
         D75J78qRxSMuSSqIOYTMlH/9XsGthntHlBmBG6e2j66sUdb8Hy5TySiHL68fHuP8FbkP
         F7SFIG9o3d15g6y/j0mY3DJDBk3QZM/vzV4zIol3M/k4zCWqXMgQSvJAK911b4pSRZmX
         v30A==
X-Gm-Message-State: AOAM533WK7S6F92TBfi8Lh6N5qCxNgBVPEvGH1tU4Tm9XC0TnYga/G6k
        2ixHIzJIylH6XTX5uHATZMadEP0y4Q5TiSuZe798PdinM3o8jg==
X-Google-Smtp-Source: ABdhPJwdWvxo7DdiQnxEVRk77vCihtyReFZe2IR4QhbtlJxQYsIyfl+t7hTfNF2zuxjnRWuKJw3HYvx7BLCZtVPflCc=
X-Received: by 2002:a17:907:7f9e:: with SMTP id qk30mr22572663ejc.313.1638526557292;
 Fri, 03 Dec 2021 02:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20211203092609.8502-1-Richard_Hsu@asmedia.com.tw>
In-Reply-To: <20211203092609.8502-1-Richard_Hsu@asmedia.com.tw>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 11:15:46 +0100
Message-ID: <CAMRc=McwkKNUt4JZWcUVyd9uiAwJBk7SPw1C3X_F0RH_Qa=row@mail.gmail.com>
Subject: Re: [PATCH] gpio Add my driver new id
To:     Richard Hsu <saraon640529@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Richard_Hsu@asmedia.com.tw,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yd_Tseng@asmedia.com.tw, Cindy1_Hsu@asmedia.com.tw,
        Andrew_Su@asmedia.com.tw,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 3, 2021 at 10:26 AM Richard Hsu <saraon640529@gmail.com> wrote:
>
>  drivers/gpio/gpio-amdpt.c | 12 ++++++++++--
>  1 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
> index bbf53e289141..4d01d4341a67 100644
> --- a/drivers/gpio/gpio-amdpt.c
> +++ b/drivers/gpio/gpio-amdpt.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>
>  #define PT_TOTAL_GPIO 8
> +#define PT_TOTAL_GPIO_EX 24
>
>  /* PCI-E MMIO register offsets */
>  #define PT_DIRECTION_REG   0x00
> @@ -72,10 +73,12 @@ static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
>  static int pt_gpio_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> +       struct acpi_device *acpi_dev;
> +       acpi_handle handle = ACPI_HANDLE(dev);
>         struct pt_gpio_chip *pt_gpio;
>         int ret = 0;
>
> -       if (!ACPI_COMPANION(dev)) {
> +       if (acpi_bus_get_device(handle, &acpi_dev)) {
>                 dev_err(dev, "PT GPIO device node not found\n");
>                 return -ENODEV;
>         }
> @@ -100,10 +103,14 @@ static int pt_gpio_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       if (!strncmp(acpi_dev_name(acpi_dev), "AMDIF031", 8))
> +               pt_gpio->gc.ngpio = PT_TOTAL_GPIO_EX;
> +       else
> +               pt_gpio->gc.ngpio = PT_TOTAL_GPIO;
> +
>         pt_gpio->gc.owner            = THIS_MODULE;
>         pt_gpio->gc.request          = pt_gpio_request;
>         pt_gpio->gc.free             = pt_gpio_free;
> -       pt_gpio->gc.ngpio            = PT_TOTAL_GPIO;
>  #if defined(CONFIG_OF_GPIO)
>         pt_gpio->gc.of_node          = dev->of_node;
>  #endif
> @@ -135,6 +142,7 @@ static int pt_gpio_remove(struct platform_device *pdev)
>  static const struct acpi_device_id pt_gpio_acpi_match[] = {
>         { "AMDF030", 0 },
>         { "AMDIF030", 0 },
> +       { "AMDIF031", 0 },
>         { },
>  };
>  MODULE_DEVICE_TABLE(acpi, pt_gpio_acpi_match);
> --
> 2.30.2
>

Hi Richard,

Please Cc Andy next time on any GPIO stuff related to ACPI. I'll let
him comment on the code. Your commit message must be more descriptive
- the title should say "gpio: <driver name>: <do this and that>".
Please also add a commit message explaining what the code does in
detail.

Bart
