Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751B03CB458
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 10:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237433AbhGPIep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 04:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237069AbhGPIeo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 04:34:44 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA09C061762
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 01:31:49 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id x192so13582490ybe.6
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HGtdpt91do0UAzKVjzqqDE3AvD/lqY8Xht/fEpMQnq0=;
        b=P16oRGarQytiFqfhZJBl+ZUQro/UDrWvRJMIJRxWNLceCagZTA596fayFSMH/AnHGj
         QTlAYO4VpCZMbgfGKnEwFHjpTZAVt+Xmp1kCh4ViFplkfDuIsrS1mZtuIz4bCJMufi1H
         nA5HcY2XlZU4IZn/GXXQ6r19L0OFWRmf4/jvnbHMBVM+mItS1AXlb5NI3mckzFpSWs88
         Ny3/J22+ib9UC4j5kLZNJvK/1M65jsTU+sm600K4LfhmJY2GQcU8MObLT2ZDg/ry2c+D
         uLUTtLHogxXDhFn44cs9MsQAZ9G3d9mZ61UTsFnXP8JOIJRUwbyphx6Q67iaOFKMzrkc
         7UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HGtdpt91do0UAzKVjzqqDE3AvD/lqY8Xht/fEpMQnq0=;
        b=BlBteh0IXPXdCQmqUXnLlOvRQlFB4VNPh0iIMJZEVA7nxnvPVMpqRhK9lvwTUhYXgw
         hFxuU2zhaCKwClwK5ILGxkdIhhUDSzWP9Py17h5WUtvza6RY1tS9Evga+3QHFoHgVAp2
         nS88QeVNDVHVUppPiFOSwr0pxP8wwrI9iI+QkS/3XJVeHapVb7rAtXfsSt3U9j+yR+hc
         YC0xYVuXRhi6dMLNPOnIIA6JTKwpDlRbY46PkFeIZ4qWNyEP7cpRKmeE59+QXj/snd9s
         y7HHoT0PIuO9/+wFG+p9feQ5GknJxyDkuW+cG8IzIVXZdsMI/remVSh6gx8zQtlaJvyd
         XeKA==
X-Gm-Message-State: AOAM531bZXohcsg3YFmNJnyAPONLsnJpd5W8x+8z2llvGJVkMo8rRZ02
        wPIitrpPE/oe9EfuSZf4EzT1ytfC2Phr8EmXPBlzGg==
X-Google-Smtp-Source: ABdhPJzkTD6LkoXc/pFhqTkKNykHf2PVZO0AP5IDnDLnq5zEgkGOvdFHuwv0PEs9Ri9z730K1Gh6OWBhrBE68LPcXMk=
X-Received: by 2002:a25:487:: with SMTP id 129mr11566148ybe.0.1626424309121;
 Fri, 16 Jul 2021 01:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <2a8eb285-3b71-199c-1bf4-39fb47fac77e@nvidia.com> <1625130054-22947-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1625130054-22947-1-git-send-email-akhilrajeev@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 16 Jul 2021 10:31:38 +0200
Message-ID: <CAMpxmJWZm_N3yPKa2+32PNOyCUuSbjqWiDBSO3WHjKekZj8Fzg@mail.gmail.com>
Subject: Re: [PATCH v5] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        kyarlagadda@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, mperttunen@nvidia.com,
        smangipudi@nvidia.com, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 1, 2021 at 11:01 AM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> v5 changes:
>         * Updated ioremap_resource check as per Jon's comments.
>
>  drivers/gpio/gpio-tegra186.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 1bd9e44..8a64dcb 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -620,15 +620,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>         if (!gpio)
>                 return -ENOMEM;
>
> -       gpio->soc = of_device_get_match_data(&pdev->dev);
> +       gpio->soc = device_get_match_data(&pdev->dev);
>
>         gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
> -       if (IS_ERR(gpio->secure))
> -               return PTR_ERR(gpio->secure);
> +       if (IS_ERR(gpio->secure)) {
> +               gpio->secure = devm_platform_ioremap_resource(pdev, 0);
> +               if (IS_ERR(gpio->secure))
> +                       return PTR_ERR(gpio->secure);
> +       }
>
>         gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
> -       if (IS_ERR(gpio->base))
> -               return PTR_ERR(gpio->base);
> +       if (IS_ERR(gpio->base)) {
> +               gpio->base = devm_platform_ioremap_resource(pdev, 1);
> +               if (IS_ERR(gpio->base))
> +                       return PTR_ERR(gpio->base);
> +       }
>
>         err = platform_irq_count(pdev);
>         if (err < 0)
> @@ -690,11 +696,13 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>
>         gpio->gpio.names = (const char * const *)names;
>
> +#if defined(CONFIG_OF_GPIO)
>         gpio->gpio.of_node = pdev->dev.of_node;
>         gpio->gpio.of_gpio_n_cells = 2;
>         gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
> +#endif /* CONFIG_OF_GPIO */
>
> -       gpio->intc.name = pdev->dev.of_node->name;
> +       gpio->intc.name = dev_name(&pdev->dev);
>         gpio->intc.irq_ack = tegra186_irq_ack;
>         gpio->intc.irq_mask = tegra186_irq_mask;
>         gpio->intc.irq_unmask = tegra186_irq_unmask;
> @@ -918,10 +926,20 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, tegra186_gpio_of_match);
>
> +static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
> +       { .id = "NVDA0108", .driver_data = (kernel_ulong_t)&tegra186_main_soc },
> +       { .id = "NVDA0208", .driver_data = (kernel_ulong_t)&tegra186_aon_soc },
> +       { .id = "NVDA0308", .driver_data = (kernel_ulong_t)&tegra194_main_soc },
> +       { .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
> +
>  static struct platform_driver tegra186_gpio_driver = {
>         .driver = {
>                 .name = "tegra186-gpio",
>                 .of_match_table = tegra186_gpio_of_match,
> +               .acpi_match_table = tegra186_gpio_acpi_match,
>         },
>         .probe = tegra186_gpio_probe,
>         .remove = tegra186_gpio_remove,
> --
> 2.7.4
>

Can you rebase it on top of v5.14-rc1 and resend?

Bart
