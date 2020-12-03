Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80A52CE32F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 00:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbgLCXzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 18:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731261AbgLCXzf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 18:55:35 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6314C061A54
        for <linux-gpio@vger.kernel.org>; Thu,  3 Dec 2020 15:54:48 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id b62so3562567otc.5
        for <linux-gpio@vger.kernel.org>; Thu, 03 Dec 2020 15:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O0t18+kPcHS+KN1VyVdHDaXf4t7nULQ3xrxZwQbCCzw=;
        b=kQ4vnpRQO4qOyQ5wpOc+IfiCZYJS58VHt9zAK7ukLD6MmJ0l2d9eVcVuAbnzgYEeez
         BpGxRkZAD0XXo6ZdlSJ8vQgqJIrztyFW3HDfe2FY2xuDnDBpgJ0KeUl2u855Bkc/5xKF
         tAmbaJVscN+USftunMuHx5T0Qqa7r2nCmEx1Gwy6Z7ws4Bei/Fp7Na5d/d0jAQ5Fv28X
         o0bpD2W4OcC1Rs/i7zAQfoFsLbb08HNAHnloTgvMKm3aE95VThpVxHHavWKROk+VeFyR
         OlagAMOCSsFDNsQQz4FLFZtfY+Oj5z3cYkX6Qa5qVfBImmgbfOQ7U/rMJyXAUwN1TEPk
         yVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O0t18+kPcHS+KN1VyVdHDaXf4t7nULQ3xrxZwQbCCzw=;
        b=pZM7HZ0JnuALWFaS+tBTCyqOk+jJZLNTeP6w4NAskjY18ln5K6EsnzXLw7PPgHZj6k
         DVKbqhDBPxWPt0mi3fcDxFEwn3yRGOUNlLs+S0NkEXn+aWQUZmScKevjyKrJL2k5QJcA
         yqpLzIcq5phEDENGyL20mdBaM66r5Kd8WKZm/9FFE82Ek4//OBsQpzsM0yUKMykxj5qK
         yHpQUV8o9oKiutwWnrglkTDudjbbh5LzFuRk4lYrPTk3an84a8le67DYsv0NjDswZkje
         zstXZYPmKR7s/iCCERVZOi2Mqyuem9+XmocTvAXCqTNo6BCz/Xk93zXNfpAFoMMp4D57
         mlpw==
X-Gm-Message-State: AOAM531HQ8si4lJg8EnW5D/JJaC0wcAmsyIVcNkha6APqd4DODwzsv2B
        aEADSagdSzwzNLWUc42Z5h32ZA==
X-Google-Smtp-Source: ABdhPJwtqaM1Z35yqMak8X3fUccNxSyftaVhs/xTEEveV1TfKz8NGOGTNdfb7tHwRqfEjYrirmYx3w==
X-Received: by 2002:a05:6830:2093:: with SMTP id y19mr1430276otq.219.1607039688168;
        Thu, 03 Dec 2020 15:54:48 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e19sm258810oou.42.2020.12.03.15.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:54:47 -0800 (PST)
Date:   Thu, 3 Dec 2020 17:54:45 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Raghavendra Rao Ananta <rananta@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add SM8350 pinctrl driver
Message-ID: <X8l6xU+sVJa/+5r1@builder.lan>
References: <20201203070900.2651127-1-vkoul@kernel.org>
 <20201203070900.2651127-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203070900.2651127-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 03 Dec 01:09 CST 2020, Vinod Koul wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
[..]
> +static const int sm8350_reserved_gpios[] = {
> +	52, 53, 54, 55, 56, 57, 58, 59, -1
> +};

Reserving these gpios here instead of in the DT means that there can
never be a platform configuration using these. Is there a good reason
for this? Or should we just mark them reserved in DT?

Regards,
Bjorn

> +
> +static const struct msm_pinctrl_soc_data sm8350_pinctrl = {
> +	.pins = sm8350_pins,
> +	.npins = ARRAY_SIZE(sm8350_pins),
> +	.functions = sm8350_functions,
> +	.nfunctions = ARRAY_SIZE(sm8350_functions),
> +	.groups = sm8350_groups,
> +	.ngroups = ARRAY_SIZE(sm8350_groups),
> +	.reserved_gpios = sm8350_reserved_gpios,
> +	.ngpios = 204,
> +};
> +
> +static int sm8350_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return msm_pinctrl_probe(pdev, &sm8350_pinctrl);
> +}
> +
> +static const struct of_device_id sm8350_pinctrl_of_match[] = {
> +	{ .compatible = "qcom,sm8350-pinctrl", },
> +	{ },
> +};
> +
> +static struct platform_driver sm8350_pinctrl_driver = {
> +	.driver = {
> +		.name = "sm8350-pinctrl",
> +		.of_match_table = sm8350_pinctrl_of_match,
> +	},
> +	.probe = sm8350_pinctrl_probe,
> +	.remove = msm_pinctrl_remove,
> +};
> +
> +static int __init sm8350_pinctrl_init(void)
> +{
> +	return platform_driver_register(&sm8350_pinctrl_driver);
> +}
> +arch_initcall(sm8350_pinctrl_init);
> +
> +static void __exit sm8350_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&sm8350_pinctrl_driver);
> +}
> +module_exit(sm8350_pinctrl_exit);
> +
> +MODULE_DESCRIPTION("QTI sm8350 pinctrl driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DEVICE_TABLE(of, sm8350_pinctrl_of_match);
> -- 
> 2.26.2
> 
