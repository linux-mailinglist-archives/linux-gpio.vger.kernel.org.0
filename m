Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E772F3A3A08
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 05:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFKDCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 23:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhFKDCy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 23:02:54 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1FCC0617AD
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:00:43 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so1774737oth.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 20:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CMqzFHpL/T/3Mu7pEcAjimpE29cdfMEPiGJnXB3dZDc=;
        b=xhQjKJNC5QUacmFM0L5+he2v67mA+MyCRbRQb5hMJPhkXWUFJ2q+Aetkcuz9I8lkqM
         CjYP3omEYdZTQbyRdqY17ZHgQ+KcD4Z1iVvUTahlp81bwIoc5GXCTqT3c69Cs0zDfye2
         Vtpdk+ymJNY4WaJ4tk+7xRbTWNRHBH9hUwmVL3j/t5dX9ILtFpiAJZvNhPcct4JrxoGO
         Bh5O2V6JPi7MRKgQfr1XNVCrqBqd1KkvbPYmnfB40ycx97NGLIVDA8g9sSb6WvhQn+55
         Dy1aUSNyTyiEzPT4eC+rYLKx3uk1pgeZ6uBGK/bufNeGVS4p5OxoyhG+FZgnnc+7FNZW
         gx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CMqzFHpL/T/3Mu7pEcAjimpE29cdfMEPiGJnXB3dZDc=;
        b=HtgGlIStr3tnzRh33SZ08lfMIa0R8+5M4/1VOADLFZ3LstrO4U/dQLJzf1XO6FNurk
         JS3DBCbguwUA0akuwNuXYsBWlHZQEGpxafu5Zn6MmtYrMUPNUZISvPL46Pbydqn7WyT8
         qxytmd+WLqlvU9NQC/wtiBt1vf++Lgi/SlVJbiZwoe/8xy1I9Lm/f/DwUSnVGi+6Dl8q
         vTYzus6ulJCbcXnSjvtYAHAG9AOj0ChzpFApGpAQO2YBLEC0Cw4IqIzjRSCdTpfn2ryn
         rEpgLcyDuQ39teu5S5aimWqV5ymL8SMjMQgiboBuKxXvuU2QV7kmRLwmU03OwTtG13OY
         Kp1g==
X-Gm-Message-State: AOAM530yaveCYPWMXBKoYFesSgKeCe4So06T4WA7oU1M75uXSdWpv7SY
        4wyr7L66e+vDlZHrsC46XTMjbE8yX5BweQ==
X-Google-Smtp-Source: ABdhPJypjD1Lk3iNtELqDAcPXKCtM+oT3ko2EQNtyx0WUHMSXGYLlrUd6fnidHS8/EAyhn0NlqptwA==
X-Received: by 2002:a05:6830:1d0:: with SMTP id r16mr1157644ota.116.1623380441709;
        Thu, 10 Jun 2021 20:00:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q15sm921677oon.28.2021.06.10.20.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:00:41 -0700 (PDT)
Date:   Thu, 10 Jun 2021 22:00:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 5/8] pinctrl: qcom/pinctrl-spmi-gpio: Add compatibles for
 pmic-gpios on SA8155p-adp
Message-ID: <YMLR11+6A/6klgqJ@builder.lan>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-6-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-6-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:

> SA8155p-adp PMICs (PMM8155AU_1 and PMM8155AU_2) expose
> the following PMIC GPIO blocks:
> 
> - PMM8155AU_1: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7 and gpio8)
> - PMM8155AU_2: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7)
> 
> Add support for the same in the pinctrl driver.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: bhupesh.linux@gmail.com
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 00870da0c94e..890c44b6e198 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1127,6 +1127,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
>  	/* pm8150l has 12 GPIOs with holes on 7 */
>  	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
> +	/* pmm8155au-1 has 10 GPIOs with holes on 2, 5, 7 and 8 */
> +	{ .compatible = "qcom,pmm8155au-1-gpio", .data = (void *) 10 },

As noted in the binding, I think this should be "qcom,pmm8155au-gpio"
and please skip the comment about the holes.

Thanks,
Bjorn

> +	/* pmm8155au-2 has 10 GPIOs with holes on 2, 5 and 7 */
> +	{ .compatible = "qcom,pmm8155au-2-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
>  	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> -- 
> 2.31.1
> 
