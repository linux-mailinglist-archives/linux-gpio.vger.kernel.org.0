Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7279D430AE7
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Oct 2021 18:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344282AbhJQQzK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 12:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344273AbhJQQzJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 12:55:09 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11716C061765
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:53:00 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t4so21099720oie.5
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BCRRRgh750mYqMV1NloRsMgiHGVQ8cIyieVAZnPnZr0=;
        b=nQhIDjefY9neOb4AKbfK6pjiLSADl7FCGespC3wNcVaw6OsmECoNOYFCf0zpsiHOYw
         1OeCbWcgCvd8UB2G5yDs+gEwz+FfIsUykz3PXo7WunIRgFACDnaO4B25hKXKvQC5yaJT
         VmZIe8uU8QPunA/Q4yrUi7m5D0sJFp91aCMlN0QDCY5L3Ti87gxqU1hi/6EDbGCWWeet
         sLE11rTUrSiGYYWfSXVWrvuYS0sV9f1+IAa8c5sOqgUvN7uv/wposLDVaI7EXespYNo2
         Rpruba8nt8o1xnIg2AqG/O5q5ds452hrzqGkr+QQw53uqPJVxOLlaTjhTodr8K5xvWSm
         AReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BCRRRgh750mYqMV1NloRsMgiHGVQ8cIyieVAZnPnZr0=;
        b=5JSC84ynk8HP8Wf895w0cHfz4VfnFbJaAE2rp2aYwUvukE3d6/Oa9c0mldRX6rs++1
         WMFSDUXcbBeoiwZF8tslr9xSjCsvmeDplCeyO8z3xCReVoz6N3NdoKAw0bFsyWHtcC+h
         8gd1EnULwhbAC3owLt8VdAzs1CmpoRg0Kl4Q6/RTUX2sFXFixKq3xQ4ujQc957lf1ZFa
         lOpmOmJO/3Do89z9ns2GSGuyzZfA/PRwj5WlayauWrhNFRXzMI9iivqymUqiwS7ftXw6
         i3LxUJVIXk2Y3olL+va4JFRw0VTadFZ/5v3ci3LDipYROeDm4J3ehHKQBX1HPItRRrom
         RFIw==
X-Gm-Message-State: AOAM533PxcbXFuN/VBGttgHA2Nhm8lKfQ2pEzc7oZ956TqPpuw3g8QKM
        JhQBa09Gf7a+GW6/mMTVV5YAdA==
X-Google-Smtp-Source: ABdhPJxAy4s0tO4Ev9t3wc1zEhu1fbfqDhbnYLcQ9j27Ed7HX+1n1ZSpf0rtHr1NOFLbcoZPvlIslA==
X-Received: by 2002:a05:6808:57:: with SMTP id v23mr16629909oic.172.1634489579423;
        Sun, 17 Oct 2021 09:52:59 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c9sm2495575otn.77.2021.10.17.09.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:52:58 -0700 (PDT)
Date:   Sun, 17 Oct 2021 11:52:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 13/25] pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
Message-ID: <YWxU6SKYcPzXyaDI@builder.lan>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
 <20211008012524.481877-14-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008012524.481877-14-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 07 Oct 20:25 CDT 2021, Dmitry Baryshkov wrote:

> The probing of this driver calls platform_irq_count, which will
> setup all of the IRQs that are configured in device tree. In
> preparation for converting this driver to be a hierarchical IRQ
> chip, hardcode the IRQ count based on the hardware type so that all
> the IRQs are not configured immediately and are configured on an
> as-needed basis later in the boot process.
> 
> This change will also allow for the removal of the interrupts property
> later in this patch series once the hierarchical IRQ chip support is in.
> 
> This patch also removes the generic qcom,ssbi-mpp OF match since we
> don't know the number of pins. All of the existing upstream bindings
> already include the more-specific binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> index 92e7f2602847..a90cada1d657 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
> @@ -733,13 +733,12 @@ static int pm8xxx_pin_populate(struct pm8xxx_mpp *pctrl,
>  }
>  
>  static const struct of_device_id pm8xxx_mpp_of_match[] = {
> -	{ .compatible = "qcom,pm8018-mpp" },
> -	{ .compatible = "qcom,pm8038-mpp" },
> -	{ .compatible = "qcom,pm8058-mpp" },
> -	{ .compatible = "qcom,pm8917-mpp" },
> -	{ .compatible = "qcom,pm8821-mpp" },
> -	{ .compatible = "qcom,pm8921-mpp" },
> -	{ .compatible = "qcom,ssbi-mpp" },
> +	{ .compatible = "qcom,pm8018-mpp", .data = (void *) 6 },
> +	{ .compatible = "qcom,pm8038-mpp", .data = (void *) 6 },
> +	{ .compatible = "qcom,pm8058-mpp", .data = (void *) 12 },
> +	{ .compatible = "qcom,pm8821-mpp", .data = (void *) 4 },
> +	{ .compatible = "qcom,pm8917-mpp", .data = (void *) 10 },
> +	{ .compatible = "qcom,pm8921-mpp", .data = (void *) 12 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, pm8xxx_mpp_of_match);
> @@ -750,19 +749,14 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
>  	struct pinctrl_pin_desc *pins;
>  	struct pm8xxx_mpp *pctrl;
>  	int ret;
> -	int i, npins;
> +	int i;
>  
>  	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
>  	if (!pctrl)
>  		return -ENOMEM;
>  
>  	pctrl->dev = &pdev->dev;
> -	npins = platform_irq_count(pdev);
> -	if (!npins)
> -		return -EINVAL;
> -	if (npins < 0)
> -		return npins;
> -	pctrl->npins = npins;
> +	pctrl->npins = (uintptr_t) device_get_match_data(&pdev->dev);
>  
>  	pctrl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>  	if (!pctrl->regmap) {
> -- 
> 2.30.2
> 
