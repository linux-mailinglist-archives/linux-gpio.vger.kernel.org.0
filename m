Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA092FB98A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 15:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405514AbhASOcy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 09:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389693AbhASNFa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 08:05:30 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CC4C061795
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 04:52:27 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a10so11689338ejg.10
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jan 2021 04:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WV7L1kLG3PoCgk5eDaz8gy8bMq/uXgxIVF8+lUQIh+E=;
        b=Fbr4JousLcIgupU6L4I4sRgEF2ysF3165R5itAIgMgql588a8GffAZ00hqTa+ijhfR
         0rVRhi2n+rJcr05S2hx8nJ9vMMV8IAzJxE+sT0If4SdOzNi0CMeT4et9miUzGv58J6OF
         yA6TSQ7kt/+966V1m+kr3FbErQa2sXvQrAFoaFiNHyS1exMJbXOwDxFRZvlZo9Kzm/w5
         2VrQtIjsyQyap84garcGuTLtDHrmjDNh2rAPdmAQZ5E0vbf3Dr2ryBOSB+YaNO4RopzN
         Ep18nnaGA+EH+SbRLGNNyMvnU4Byr0SD3gR4yNS5OSRiIXH1LhOqNThnVm/tmSX8OIGf
         +JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WV7L1kLG3PoCgk5eDaz8gy8bMq/uXgxIVF8+lUQIh+E=;
        b=YxUuSqDn2A5r7GYl16onHSBUP+z3yDlOyXyZqdk4lU1Epe9x6SkN7AKiBJk5zNrKbZ
         7W/z+JMRtz/MYMBq9YTcY9/oTiz35+0F5HAgNommQUaWaSGXreFj/NrchC2r8612Ltqt
         n8sr45OdXXM+JeO8ZrzWho7KahbnSrB5tyB0JQ1NOkc21Set6S7/+wW3cgiwUUDyviYp
         4GUY6zkKBOhwDHYbxJwAXI1xxXVl3605sg5oHgD8mE4KiAnbhKVzHmG0yfbks2KYw5EZ
         KPVGwywoa1OTv4ELJljOFkj2WOjHVLTt4/2WVZOsv9QLFXTWcE4ZB3507AFrthfMJkyq
         HxMQ==
X-Gm-Message-State: AOAM533Gnj+APKmiCrn+BxY7NNIbx5oWz8gn9PfAzEH2hYxoafmQJCXj
        vSoxxTNI/9DawPYZt//9E6hR+ChhLs7YStUNuiAwjA==
X-Google-Smtp-Source: ABdhPJxj94GeoRvmRcNkG4fxqmwo3FAvPSVL//ar3j3bj5XUxEOe5nuWJPJXxe26I/H+MUK2msEH5GdPZDqYavFd7H8=
X-Received: by 2002:a17:906:1c4b:: with SMTP id l11mr2933957ejg.155.1611060746123;
 Tue, 19 Jan 2021 04:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20210112133010.21397-1-digetx@gmail.com> <20210112133010.21397-2-digetx@gmail.com>
In-Reply-To: <20210112133010.21397-2-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 19 Jan 2021 13:52:15 +0100
Message-ID: <CAMpxmJWo4Qd1b7rxW_BLax7X=_NGrWY=-Ec9zphV3rngG=J=xQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: tegra: Add dependency on GPIOLIB_IRQCHIP
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 12, 2021 at 2:30 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add dependency on GPIOLIB_IRQCHIP in order to fix driver compilation.
>
> Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
> Reported-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 75f6c37620ea..0cd1f91e4a19 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -597,6 +597,7 @@ config GPIO_TEGRA
>         default ARCH_TEGRA
>         depends on ARCH_TEGRA || COMPILE_TEST
>         depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP
>         help
>           Say yes here to support GPIO pins on NVIDIA Tegra SoCs.
>
> --
> 2.29.2
>

Applied, thanks!

Bartosz
