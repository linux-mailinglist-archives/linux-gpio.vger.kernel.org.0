Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02BC03B132
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 10:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388508AbfFJIrS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 04:47:18 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:38952 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387753AbfFJIrS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 04:47:18 -0400
Received: by mail-it1-f193.google.com with SMTP id j204so11930688ite.4
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2019 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmMgFC6x9c/PorZ5L1nntqs3jUWepuR6IOl/Io6t8sA=;
        b=sr8LqP500iKG1pr5zd1qhsvzDTNmX/T7ykQZZsyxgglCuxvXsuoG2h2rzKF1mareen
         K5i73RDXA9cNqJMjk4i7hxv/kSfuQqnj+jH5Ap1EihoQIxgAMPoB9lTd8HITSyHf0KNL
         0Q1vQ8j8bvqoz3mcV5cEqFzhPOabZZ7eNVRF944TG7eiZ+7qHZ8IYqCcsJrOSgavffCU
         t+MwCweWLy+1yPOrDWbg7Ob/+p5s+niwe6dh9AyMCMBqKnZ9S/KKQ1kGnf1iB463WxUl
         sIDeELFr0jraRh2oL+VHH+gFD3/1J2XrIZtVvdu6ak6ZMzc3fabZsLNkuqLNXOM/y6UY
         bofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmMgFC6x9c/PorZ5L1nntqs3jUWepuR6IOl/Io6t8sA=;
        b=DF1xjEAUOTigMf1NhTSWE9r+wytcuEsTpGSHKedlud7GRTqfptkV5OZ8GNtZDFCgGC
         EETY8oMNbrz6dgprfNihFPd+OEk02eRDpBsFArefWRGYgy3YqACzuZ5m8WaIgB4OO2I4
         VDfcRmpS9ukjlRQLpKLMsGaiKpK5Z+nesJG7a+ji7oFg98FszF7cg119WOA+HWUhGcgn
         osXjPduS22uHp3r/lBKeefeEX5hh+COyk2EY7LvH2gY+ltMY0sEnLLZLMz9BJf4eQ77f
         b/rFV7SJ7YXkQv/z2cNg1RALxU99Rgl6EqYTldcss+J37B/p/RiymOVfda2x42PHW5LN
         ZB5A==
X-Gm-Message-State: APjAAAUpURJQP1pU18KZjKHwgVDU0GdfE650Cza9blU1zCxoeph0YJNy
        GZGcivyvyOqOGlu3IaBhFb/YngdhQ4oztAthCp1HLw==
X-Google-Smtp-Source: APXvYqwYB5U4OOSNSqzBUVwcdMd5AxTJod5Bfub6eHYJFeIO+izmDcMKGFZM5Fn9MIcLTMjawmgYjhbtGhG/6pzPbWM=
X-Received: by 2002:a24:5f87:: with SMTP id r129mr813080itb.104.1560156437323;
 Mon, 10 Jun 2019 01:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190610084213.1052-1-lee.jones@linaro.org> <20190610084213.1052-5-lee.jones@linaro.org>
In-Reply-To: <20190610084213.1052-5-lee.jones@linaro.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Mon, 10 Jun 2019 10:47:05 +0200
Message-ID: <CAKv+Gu_b5NCnkaenX16_ChkPiH4ztTz=SiAehQoHcHJOb3kmNQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] soc: qcom: geni: Add support for ACPI
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        wsa+renesas@sang-engineering.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 10 Jun 2019 at 10:42, Lee Jones <lee.jones@linaro.org> wrote:
>
> When booting with ACPI as the active set of configuration tables,
> all; clocks, regulators, pin functions ect are expected to be at
> their ideal values/levels/rates, thus the associated frameworks
> are unavailable.  Ensure calls to these APIs are shielded when
> ACPI is enabled.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  drivers/soc/qcom/qcom-geni-se.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 6b8ef01472e9..d5cf953b4337 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>
> +#include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/slab.h>
>  #include <linux/dma-mapping.h>
> @@ -450,6 +451,9 @@ int geni_se_resources_off(struct geni_se *se)
>  {
>         int ret;
>
> +       if (has_acpi_companion(se->dev))
> +               return 0;
> +
>         ret = pinctrl_pm_select_sleep_state(se->dev);
>         if (ret)
>                 return ret;
> @@ -487,6 +491,9 @@ int geni_se_resources_on(struct geni_se *se)
>  {
>         int ret;
>
> +       if (has_acpi_companion(se->dev))
> +               return 0;
> +
>         ret = geni_se_clks_on(se);
>         if (ret)
>                 return ret;
> @@ -724,12 +731,14 @@ static int geni_se_probe(struct platform_device *pdev)
>         if (IS_ERR(wrapper->base))
>                 return PTR_ERR(wrapper->base);
>
> -       wrapper->ahb_clks[0].id = "m-ahb";
> -       wrapper->ahb_clks[1].id = "s-ahb";
> -       ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> -       if (ret) {
> -               dev_err(dev, "Err getting AHB clks %d\n", ret);
> -               return ret;
> +       if (!has_acpi_companion(&pdev->dev)) {
> +               wrapper->ahb_clks[0].id = "m-ahb";
> +               wrapper->ahb_clks[1].id = "s-ahb";
> +               ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> +               if (ret) {
> +                       dev_err(dev, "Err getting AHB clks %d\n", ret);
> +                       return ret;
> +               }
>         }
>
>         dev_set_drvdata(dev, wrapper);
> --
> 2.17.1
>
