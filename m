Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09D73ACD8A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 16:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234542AbhFROeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 10:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbhFROeK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 10:34:10 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BB1C061574;
        Fri, 18 Jun 2021 07:31:59 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id 69so4764025plc.5;
        Fri, 18 Jun 2021 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UhsKKQf1Bn8x2XYapwaIUYSszikWCPheXCCZWgVxbyE=;
        b=KilJ9mcISeyHVoaY3VaDryF//xzWjbHxRgypCLBrMp4n7ZM/oGg6PvjTstYtiiB/zM
         Mp8iaRw30Qf6BsVuXz0QaLv4h4RrjPU7PYwX+2PYGple3ly4oxIy1MVFuqIUNWWD+M4B
         d/uwuKaMZqLu4iassplEb6eXo+jBs5bO+b5fuqE/mslWN0wUnoLhukcpCrh7dfCDm8e3
         RmmBjFu9w2yb1KiTa9XkQiVR1841Unch0LxM2O8P6lvNAqOtkscWbY6CDBaKtzOSSKYt
         T5Iowon3NIe6Hap8BclIS+OSOnPdbIBtEVfOHESKppKH4Lvuu0VaaUqgmBGNVhiBJvPC
         N9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UhsKKQf1Bn8x2XYapwaIUYSszikWCPheXCCZWgVxbyE=;
        b=JJYYZ54++OMW/mKBankJ5QMVkHZUn+PnoctCHDcHykH2XxiwfuDscBsdTp5agIKkfs
         VvPzGlLX8mMgONMxUcNMtOe5xJOChDH96+T/8AyQm2o5l+djvxfyCkucsCLXVQWoDZvY
         Vt70Sfva9Dp2RYTSu1Q5Kcxv0y+WxQv5Z6iK8+uGt3jMyFkSoVwg6P6GydQGQ0OfBO1E
         MAf2uA5er73WcHRFu4zqDhY/mr8R1V5O1mBepUQVcSRtMycyaeNEvqZ7PRyMlJp36Jp9
         1uaHkeWzy4C7ngZTjTyoKjZVzg8zc18pkYMmYetS8gyNtaVzH7gasqBBsCRY//bbbnr3
         OeDg==
X-Gm-Message-State: AOAM530ORGvJrMaqeWlTtLP1QnbrKrLlpv4n4DwEtovwWVaJSArKywgX
        zXsKsH87uI/jtM7WfuY6xSR5PZPe2jOFRP1OOGY=
X-Google-Smtp-Source: ABdhPJxRKOnL9RBTOa4bWcaV+zuH9g8v2LOetd5cesZ+rDkwoaFahZzfNMLhxRSTP6grYtX8QX6VhHDQ3f8WJZOGOSo=
X-Received: by 2002:a17:90a:bc89:: with SMTP id x9mr11380786pjr.228.1624026719494;
 Fri, 18 Jun 2021 07:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VdBQUv+yri453KGGBz5ynd0pETxdOngCgPe3mbG22sLXQ@mail.gmail.com>
 <1624023587-7344-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1624023587-7344-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Jun 2021 17:31:23 +0300
Message-ID: <CAHp75Vf+8t78NbYeCh+VLEAzcYJxDP9Pz7DPW_MC9D-K_Ff8uA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 18, 2021 at 4:39 PM Akhil R <akhilrajeev@nvidia.com> wrote:

Thanks for update, my comments below.

> From: Akhil Rajeev <akhilrajeev@nvidia.com>

You need to fix your Git configuration so you won't have this header
inside the commit message.

> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.

...

> +#include <linux/acpi.h>

property.h ? (see below)

...

> -       gpio->soc = of_device_get_match_data(&pdev->dev);
> +       gpio->soc = device_get_match_data(&pdev->dev);
>
>         gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
> -       if (IS_ERR(gpio->secure))
> -               return PTR_ERR(gpio->secure);
> -
>         gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
> -       if (IS_ERR(gpio->base))
> -               return PTR_ERR(gpio->base);

> +       if (IS_ERR(gpio->secure) || IS_ERR(gpio->base)) {
> +               gpio->secure = devm_platform_ioremap_resource(pdev, 0);
> +               gpio->base = devm_platform_ioremap_resource(pdev, 1);
> +
> +               if (IS_ERR(gpio->secure))
> +                       return PTR_ERR(gpio->secure);
> +
> +               if (IS_ERR(gpio->base))
> +                       return PTR_ERR(gpio->base);
> +       }


What about doing like

      gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
      if (IS_ERR(gpio->secure))
              gpio->secure = devm_platform_ioremap_resource(pdev, 0);
      if (IS_ERR(gpio->secure))
              return PTR_ERR(gpio->secure);

and similar for gpio->base?

...

> -       gpio->gpio.of_node = pdev->dev.of_node;
> -       gpio->gpio.of_gpio_n_cells = 2;
> -       gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
>
> -       gpio->intc.name = pdev->dev.of_node->name;

> +       if (!has_acpi_companion(&pdev->dev)) {
> +               gpio->gpio.of_node = pdev->dev.of_node;
> +               gpio->gpio.of_gpio_n_cells = 2;
> +               gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
> +               gpio->intc.name = pdev->dev.of_node->name;
> +       } else {
> +               gpio->intc.name = gpio->soc->name;
> +       }

Wouldn't the following be enough?

-       gpio->intc.name = pdev->dev.of_node->name;
+       gpio->intc.name = devm_kasprintf(&pdev->dev, "%pfw",
dev_fwnode(&pdev->dev));
+       if (!gpio->intc.name)
+               return -ENOMEM;

Note, all above are questions and you know better which direction to
take. In either way, please test and look at the result.

-- 
With Best Regards,
Andy Shevchenko
