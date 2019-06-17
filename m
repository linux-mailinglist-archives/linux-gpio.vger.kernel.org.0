Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1CE847F63
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 12:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbfFQKOh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 06:14:37 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41827 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbfFQKOh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 06:14:37 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so9284931wrm.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2019 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0h7IM4lrz+H9Hm55K4LDe4S6XuzNxvQo2AKIRNvmLBw=;
        b=Pr7pW/pDVfmnr1f95jMU1cjpSQB6d5bTyGiKUHuQmECYAAmlvQ2YmHiXyDHzGHWt6+
         cXEDSmKaSOEcy4gxQX8e4uqO0XleQxrbMWtM/p2M7wbrleb/gJxdcfVA4QzH1AS7ljHo
         dlXnrwUvlTmmn5PUk2gfTHyqFb55p4K/J/MTA99zw/pXDWZ2Vm5R8MIqQLdu+FsEJYHM
         c9XX7Hny7i4JQgqqvxwpkMXV8Hlr8hYhuYuyGxSdco6PT/Szg/fVWye6R/EOZJsm8b21
         5pkz82OGwz0MSywdlg8AnAe1OnItyssC/hAWvgcYqic959IYI2obFsLxC/PBOANecqjJ
         JHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0h7IM4lrz+H9Hm55K4LDe4S6XuzNxvQo2AKIRNvmLBw=;
        b=mCpJ+z5H/rMe2PkVTaSoz6h3xcAZV1bWkbrMf4tTGbAVcnwfKtaJMFyJLmsVomlQJt
         X12SYPSu87yQQ3Q6wrA3rEgxtOeKdSox+wzx8eqXDI4QAkQbUof+917WyPOSKkXSXpO2
         XQpYXdU6z3r4XWat/Hh/t6FLXsv1IjlIaItoohhBx7bGDyYqG5tHiKN7bzHv5zeu9Mnn
         MBZz+AdP/FLd8/DEMqNRE3UNUv2osLtCu+k2f3rju3Qw737Md4DEL1mluAh29CcwCnH+
         sFbNzHkf5vjUvJ2k+DGC2dsT2McE7E8FOGWw2cg8ldLgdfiPLKaagseNNWcEPpXcGOPh
         6kEw==
X-Gm-Message-State: APjAAAX5yr7uZu4AoznrLchIPABIBKMaDJb0ObrEbNQaeh6FjDVS8eL2
        s7a4FFRblZvItNF2w8czsA2iGg==
X-Google-Smtp-Source: APXvYqxM183T4T8pUHIJPMxjfA6ieRjPgyyNwqF9AptFukBr31lpl3EdpNm5vAtxOqsCKbTl9IykQw==
X-Received: by 2002:a5d:6449:: with SMTP id d9mr19355586wrw.192.1560766475722;
        Mon, 17 Jun 2019 03:14:35 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id b6sm10592370wrx.85.2019.06.17.03.14.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 03:14:35 -0700 (PDT)
Date:   Mon, 17 Jun 2019 11:14:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or
Subject: Re: [PATCH v4 3/6] soc: qcom: geni: Add support for ACPI
Message-ID: <20190617101433.GF16364@dell>
References: <20190612142654.9639-1-lee.jones@linaro.org>
 <20190612142654.9639-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612142654.9639-4-lee.jones@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

David, Andy,

Since there does not appear to be any other Maintainers for this
file/subsystem, one of you guys are going to have to at least
review/ack it.

Which route do changes to this file usually take?

At worst I can take them, but I need maintainer Acks to do so.

===========================

> When booting with ACPI as the active set of configuration tables,
> all; clocks, regulators, pin functions ect are expected to be at
> their ideal values/levels/rates, thus the associated frameworks
> are unavailable.  Ensure calls to these APIs are shielded when
> ACPI is enabled.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
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
>  	int ret;
>  
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>  	ret = pinctrl_pm_select_sleep_state(se->dev);
>  	if (ret)
>  		return ret;
> @@ -487,6 +491,9 @@ int geni_se_resources_on(struct geni_se *se)
>  {
>  	int ret;
>  
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>  	ret = geni_se_clks_on(se);
>  	if (ret)
>  		return ret;
> @@ -724,12 +731,14 @@ static int geni_se_probe(struct platform_device *pdev)
>  	if (IS_ERR(wrapper->base))
>  		return PTR_ERR(wrapper->base);
>  
> -	wrapper->ahb_clks[0].id = "m-ahb";
> -	wrapper->ahb_clks[1].id = "s-ahb";
> -	ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> -	if (ret) {
> -		dev_err(dev, "Err getting AHB clks %d\n", ret);
> -		return ret;
> +	if (!has_acpi_companion(&pdev->dev)) {
> +		wrapper->ahb_clks[0].id = "m-ahb";
> +		wrapper->ahb_clks[1].id = "s-ahb";
> +		ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
> +		if (ret) {
> +			dev_err(dev, "Err getting AHB clks %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	dev_set_drvdata(dev, wrapper);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
