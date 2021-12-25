Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9B747F370
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Dec 2021 15:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhLYOmg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 09:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhLYOmg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Dec 2021 09:42:36 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC3EC061401;
        Sat, 25 Dec 2021 06:42:36 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id j21so43546276edt.9;
        Sat, 25 Dec 2021 06:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n1JZkuj2EmK0BOrYOm5MNpVMafmSyFZA0KBR5FWRTtE=;
        b=Y5raFEV1L6umPiUZdJGJuz8EAMA4IzSovK4q1gktMkRQF2LlFT20l4Uv52nTz97UJz
         zrASIAz1jSNNxaAuazcNdIv47GfNzGKHKdkrXykKhi1GOjRsAXed4uCsimYF4fkXSqcb
         ENJIWBPS8LlVaoFxKOq6YNLtlllWdxy4hUGnMVH6Eff1VlD/7O1VG6ooKWBUu7cc3NWZ
         VRPz62q76vbmRL+BEYlnOxy4Jwj78VDhxzphVDXkIJKEXdJ5EfAzmgXYZ1WOFY2wuSZG
         ej5UwL8PhReLFeKgrJ6sE8QgKr2ogP230RLs1/AvF7r8Y6qm7FW2iLOn21tFZVvOoXFY
         7+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n1JZkuj2EmK0BOrYOm5MNpVMafmSyFZA0KBR5FWRTtE=;
        b=ABsfIbssj7ZGMTArNvaPFqTEgP3g3KJB1Qic7UoIHheJ2jyzyDS95lQ5SA0LEaxqA1
         71ZieS7EKa7/goB+ZEVholKsGwNP7ocGjhBWMPb2IEnW/u2UHdJLez8Zx+cwchWqeztO
         9xoBIz3itLrZLOV6+/9Z/0zcZGUTI+9e60VoBtQfFZUfe/axm6SyIl2PWei8sxW/pTAj
         t+YMnTz2NGe2QftG75T1YFAr7TgTUbA1Ch4OwM5FYw4zz7f0689AY6wJOaH6jKjDOxnS
         gsauJX0GHFCTo5XwcfNUr0RrFS6CB3KbpQoda4poSs5yzyVKZo1J9qHCgRFlbiq5WL/Q
         Pygg==
X-Gm-Message-State: AOAM533hgo5TROIKfIm6agzhcXG2tI4tRLNbXfo1aUWgBKFFwTrrtG6g
        pCBw9rmhk008ZcAv++zqogcZQ1B78pel0RfcGcZewowqBsvEkA==
X-Google-Smtp-Source: ABdhPJygmOWHajagWZbOFtURP5znbwE8Z3QlYImzALjmYB1/pLgLHtd56uZguSGQdIl8hCEITbXFex4X9rmxmPMMjEs=
X-Received: by 2002:a17:906:a3c6:: with SMTP id ca6mr8204733ejb.639.1640443354737;
 Sat, 25 Dec 2021 06:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20211225120026.95268-1-hdegoede@redhat.com>
In-Reply-To: <20211225120026.95268-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 25 Dec 2021 16:41:58 +0200
Message-ID: <CAHp75Vdz1zxE5V_ff+jSp6VUo34aRinLj-gK_HOi5-2Zgw3E8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: tps68470: Allow building as module
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 25, 2021 at 2:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
> itself gets instantiated by a special MFD driver from
> drivers/platform/x86/intel/int3472/tps68470.c
>
> This MFD driver itself can be build as a module, so it makes no sense to

built

> force the gpio-tps68470 driver to always be builtin.

built-in

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(see one minor comment below)

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpio/Kconfig         | 6 +-----
>  drivers/gpio/gpio-tps68470.c | 6 +++++-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 60d9374c72c0..3ac5860e0aeb 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1393,7 +1393,7 @@ config GPIO_TPS65912
>           This driver supports TPS65912 GPIO chip.
>
>  config GPIO_TPS68470
> -       bool "TPS68470 GPIO"
> +       tristate "TPS68470 GPIO"
>         depends on INTEL_SKL_INT3472
>         help
>           Select this option to enable GPIO driver for the TPS68470
> @@ -1403,10 +1403,6 @@ config GPIO_TPS68470
>           input or output as appropriate, the sensor related GPIOs
>           are "output only" GPIOs.
>
> -         This driver config is bool, as the GPIO functionality
> -         of the TPS68470 must be available before dependent
> -         drivers are loaded.
> -
>  config GPIO_TQMX86
>         tristate "TQ-Systems QTMX86 GPIO"
>         depends on MFD_TQMX86 || COMPILE_TEST
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index 423b7bc30ae8..ce12c5a54fd4 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -155,4 +155,8 @@ static struct platform_driver tps68470_gpio_driver = {
>         .probe = tps68470_gpio_probe,
>  };

>

You may remove this blank line.

> -builtin_platform_driver(tps68470_gpio_driver)
> +module_platform_driver(tps68470_gpio_driver);
> +
> +MODULE_ALIAS("platform:tps68470-gpio");
> +MODULE_DESCRIPTION("GPIO driver for TPS68470 PMIC");
> +MODULE_LICENSE("GPL v2");
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko
