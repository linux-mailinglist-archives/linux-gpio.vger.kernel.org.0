Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941A03B8858
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 20:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhF3S0l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 14:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhF3S0i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 14:26:38 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3544C061756;
        Wed, 30 Jun 2021 11:24:08 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id h6so836391plf.11;
        Wed, 30 Jun 2021 11:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1iFQK7L8q2hmxsjwhX/82JFmJsDjXfMWUFK5XtDFsp4=;
        b=M5zKdYsoJKPTj4GnRB8GogwcMg6lYQlCwo3iln947/o0M3yqOlL2ft4BgpQ+h6nh3e
         4w3ovk+R3vEE/v5/vBMTFH8psgCQ+bYWc/dsXEwmKuTgZo9mMpKH2AxzoHJFIkB5IIr/
         v/RVOs1fg+Gs/puiRM8C0ykuwclOKLvwlNaPA2Haj1vFVnjCli+xd5BGWiu4JStwfFKI
         1/4muXVAA/A5b9V4JNHUBfZ9iGld0Ir4ZxFD+yDEhrgyIFVgy8P1bv0R6hZj4NEvrepW
         /ZAj8H0uruRlFvV9WJN1j/PGxAZrDsfWal/s+JHBgLmZoeCWbkycoGsnpJH3sDbDUIeT
         L0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1iFQK7L8q2hmxsjwhX/82JFmJsDjXfMWUFK5XtDFsp4=;
        b=ezrNiQXa1bJ3Od6U9vqcT+zs+V0ayu0xR6XG1deEEEfy/br5DbbaDtOjtlYARvSpPN
         cmz8Q1snxL0aJLwRJcLuz/T7DPXR57VRh+ES37BZuUs06KWsc9TAGEnklCOlIQ29aj0G
         +706akXdlJ+W58aRzsMw2nFl51SRcynSH5yFLkU/8P1eo8ATK/3pRs7QJf4TL+EUmy+P
         IbuHxHH/BFh8Ya7v6cXiJ+L2SrgsLVKOkPBIMIzjGh9HGbtcBcYfJOLPQEXYWBzkNFKJ
         DSgHvAJSzcdp275xCuOCsw+1M8Mp30DGKRnCLNgN1ihD+uG3MXnSz7sycEos4DPu1TT9
         cI+w==
X-Gm-Message-State: AOAM531uNJDF3lfEwjdsQorEAKbT15u054zj/B1Gpf/pgPWkavvgK27/
        7s/yB655TYr1V00aDcJqj3oMG5OIJLU/8Ah6/Ys=
X-Google-Smtp-Source: ABdhPJw+0cW8yMy3eqCVH8XvrUKQR6KmP/EP0Z8heuZTchmBIbMMrJMmw5ImtWoTkPyfbq7Pu4sYKv/7JrQOkvzJPPE=
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr5726843pjq.129.1625077448237;
 Wed, 30 Jun 2021 11:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <1625075239-19120-1-git-send-email-akhilrajeev@nvidia.com> <1625077055-20363-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1625077055-20363-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Jun 2021 21:23:30 +0300
Message-ID: <CAHp75VfB8varyi5j=j8YaysdgofxFU1-xCKLFPrxiYz7KadGfA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 30, 2021 at 9:17 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.

Thanks for an update, my comments below.
After addressing, feel free to add
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Change-Id: Id8e892f989e4ccc935b87aa0d84b10a3d1efd8f9

This is not for upstream.

> Signed-off-by: Akhil Rajeev <akhilrajeev@nvidia.com>

...

> +static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
> +       { .id = "NVDA0108", .driver_data = (kernel_ulong_t)&tegra186_main_soc },
> +       { .id = "NVDA0208", .driver_data = (kernel_ulong_t)&tegra186_aon_soc },
> +       { .id = "NVDA0308", .driver_data = (kernel_ulong_t)&tegra194_main_soc },
> +       { .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },

> +       {},

Comma is not needed for terminator lines.

> +};
> +MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);

-- 
With Best Regards,
Andy Shevchenko
