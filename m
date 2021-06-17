Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D5A3AB751
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 17:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbhFQPYD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 11:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbhFQPYD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 11:24:03 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3C6C061574;
        Thu, 17 Jun 2021 08:21:55 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so6301116pjs.2;
        Thu, 17 Jun 2021 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Y5GMN6FiWT3RZ9stwoM18lhVvKOaYLrtUlnA5+xu5w=;
        b=ZK+bQixDW3Kz04tAtjGbJiPTg4/iZEM5+2CWDBAXtcTFRddlfa1cfEIwzpPh5Y5xMf
         rKHQ3gFlHo2FK+l2zUApOOylNi631kiz+nmAh0Vm5rg/WcwlQwlo9cvP1KqZnbyZLgiD
         fIYUoEt8vQE3GiNa3OTULSRI/XEPbczQ2yR/VTRj5J8DUHxqDfGB5VrDZVDwEpo3TvRT
         G27/7Nz/HWkIwrAKA7dCO0ff5S1I+OjhGLTY4qvbIZVSbqaLiA0S7EPXYTywFQsxmGK/
         XznjtVioNy3ReC+vB/reHgIXM8lkp+peDbD4y6BGUObwv0w51UKq+jTQD/o5ld/n01W9
         tjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Y5GMN6FiWT3RZ9stwoM18lhVvKOaYLrtUlnA5+xu5w=;
        b=CLPkJk91DIKCdEgAFAt7zALCG2eVs1bG1aTnHBFcOqSaM89aFTRkLzBwvpcmE/fnsW
         B3nQwrjrWI7wp2K/hSHoU19yvmKvC3ya8Wko2wCIjc0YHtS1M7CzP2+3qFFdNpsT25tL
         DSVL4iqTaqzeYDJeG0Jrh2vjpsSg91LJdWHT9MUULcN9EnUn4SfCREegyEUNUkc/TWzS
         8Pfh5paiVvoAdOX+k+7L2AE7SYJCjWaP4NolrMQV7skjRbPuM713Ddz3/Q9yvH7Ci0uJ
         qbKSDQrDXJu2DbCEY3TQTJXqxHJFaTTxjeWLA4KlekDMnqJ8jM2+HSDOGg0QaBwBnNOP
         8aZg==
X-Gm-Message-State: AOAM530yWDgVub9EnVerwpo2/uipu0gyTzj/GRfEtU7dDFfa7bnqowR6
        TdyM6M0VSCKPAffYVACu1I4iyDQZ6mFpcoaDrPw=
X-Google-Smtp-Source: ABdhPJwmoy5v2TRjlHnD6igB0E65N/FFyREMflvaeLcr9NvBLLK8YAI/KGpYVvh0m44yzwP9Mswq85QctQtnlkI5+Nc=
X-Received: by 2002:a17:902:3:b029:11f:e733:408f with SMTP id
 3-20020a1709020003b029011fe733408fmr545961pla.21.1623943315210; Thu, 17 Jun
 2021 08:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <1623924351-22489-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1623924351-22489-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Jun 2021 18:21:38 +0300
Message-ID: <CAHp75VdBQUv+yri453KGGBz5ynd0pETxdOngCgPe3mbG22sLXQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 17, 2021 at 1:18 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> From: Akhil Rajeev <akhilrajeev@nvidia.com>
>
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.

...

> +#include <linux/acpi.h>

It probably should be property.h, see below.

...

> +       if (has_acpi_companion(&pdev->dev)) {
> +               gpio->secure = devm_platform_ioremap_resource(pdev, 0);
> +               gpio->base = devm_platform_ioremap_resource(pdev, 1);
> +       } else {
> +               gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
> +               gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
> +       }

General comment here.
Can't we rather try named resources first and fallback to indexed
ones? (Or other way around)

In this case you don't need to check for ACPI at all.

...

> +               .acpi_match_table = ACPI_PTR(tegra186_gpio_acpi_match),

You can drop ACPI_PTR() along with ugly ifdeffery.

-- 
With Best Regards,
Andy Shevchenko
