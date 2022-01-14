Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEC648EE61
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jan 2022 17:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236249AbiANQj1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Jan 2022 11:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239330AbiANQjZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jan 2022 11:39:25 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71050C06173E
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jan 2022 08:39:25 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id i5so17806673uaq.10
        for <linux-gpio@vger.kernel.org>; Fri, 14 Jan 2022 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TB9rYYWA3RApYigUmdeDs7Nca9Nz3elgch2NBvZeOg0=;
        b=j5kYZtWic5x9+6IfULEPREXK9iQOEZYgqqSp7rnA+0/szMDEk1papPfzOyMRUM/gsI
         Xllf07dgl7ZXTQPAoEcIN8l+DfX/W8W7DYHHjaxIUAkrgQIRdFdeGV5awXOD7kODdh31
         cnVsTZ8AfcWbnOyXO27A6BOUriLw9nXYpUrf5anxD2NDnvz8PumlTe0iXaiX3CsTTN7v
         923umi1sTD5OaPdkOis+mJ1urd6AYUMuFK5+GhsMUXECPkpPBbYceX28FYuKle+oDpEe
         IzsK3ZzkB3Y9ZmE5yZT1oEOqtJ1u6G3rEYSb7EsdHKSpLnB3/6B1/Ksj7ZzXdvm1IkhL
         uf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TB9rYYWA3RApYigUmdeDs7Nca9Nz3elgch2NBvZeOg0=;
        b=G7AEjQInGFF6n+hozkaYTcyuO2Zs0kuPrKIJSWi0z6/gPEYrfhJoK289ctltrT8w+n
         LFdp/TbnmYL70IzLgis7YgsST8Z2YxDmtPUJkjxm/UgpdparNnUTzjmQvXbhM1aNyvUR
         lFdDuGnbke6maGES8U+CPs+sA5YYnJwDE+0sOL4BHgOaaQynsT18jSwaZGWjDFg6ZemL
         fVaAU3LFzO5WGFsWjUUuu7nfTCtlYEbRZmMZZ+PoCcGEhx/Ig9pu1NcQg4Plw1wH5ZpB
         H80+vaQDOR9nsgrW/Ycu9ax+d8RF0T3LD0U93XzRsZCzs8gZTZ7oeR4tif4FGWlnKC4r
         7jWw==
X-Gm-Message-State: AOAM530cF6EXOcQK+Y9IibkTwXWRbOMnyi7XHLiIsyaNucvB50iTwJs1
        pvK0vcVhy/d8sVgTYHrQ4R6kT71nqT6LjSQWgfdSbg==
X-Google-Smtp-Source: ABdhPJxbgJnPkI9Tq2dgW1Q5XbXJ8e/r8vZnzrtBuMqFg0KMsO4wZ60iX5gYpy2VvwwP+v1QEaq/YykPn3ntOjBBxh8=
X-Received: by 2002:a05:6102:94c:: with SMTP id a12mr4531319vsi.86.1642178364582;
 Fri, 14 Jan 2022 08:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com> <20220111201722.327219-20-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111201722.327219-20-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 14 Jan 2022 18:39:13 +0200
Message-ID: <CAPLW+4k3Pypn6t-hHVtxg216oj=LMtchdRtsJmKBANN639oRgQ@mail.gmail.com>
Subject: Re: [PATCH v2 26/28] pinctrl: samsung: add support for Exynos850 and
 ExynosAutov9 wake-ups
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 11 Jan 2022 at 22:18, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> It seems that newer ARMv8 Exynos SoC like Exynos850 and
> ExynosAutov9 have differences of their pin controller node capable of
> external wake-up interrupts:
> 1. No multiplexed external wake-up interrupt, only direct,
> 2. More than one pin controller capable of external wake-up interrupts.
>
> Add support for dedicated Exynos850 and ExynosAutov9 compatibles.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/pinctrl/samsung/pinctrl-exynos.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index 0489c899b401..a158d587814e 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -465,6 +465,10 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
>                         .data = &exynos4210_wkup_irq_chip },
>         { .compatible = "samsung,exynos7-wakeup-eint",
>                         .data = &exynos7_wkup_irq_chip },
> +       { .compatible = "samsung,exynos850-wakeup-eint",
> +                       .data = &exynos7_wkup_irq_chip },
> +       { .compatible = "samsung,exynosautov9-wakeup-eint",
> +                       .data = &exynos7_wkup_irq_chip },
>         { }
>  };
>
> --
> 2.32.0
>
