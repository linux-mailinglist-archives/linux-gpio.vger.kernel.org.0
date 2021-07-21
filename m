Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7D73D1A23
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 01:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhGUWVp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 18:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhGUWVo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 18:21:44 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B81C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 16:02:19 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id h9so4638234oih.4
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 16:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N06ng52JS7qg8uo3w1ksPWxe7Wr34Eu2lk2OlkrZI6o=;
        b=BRfaxn1P6i+9wKL1KjJbKKut19JdgwMAYWbgbHG76PMdVUGczVUxqjnXP0UaUnlBSZ
         Rqh6yQ5K5XNUSAaN8l5gf1jwd8xcFCJmzbPBkqfQRKBq7iEhKN4XeJa50OYur6unatdx
         UtJbIxACTJwfemEdoZKcsBX/LcbauDUo7XfufXxB3AlDwJ3rorXo2ZKA96TogVxfqPAc
         sM3t0VOTLORMNB5OR+GvzNYBA62Jym2EagE/GTkmeAwvwM94OGEcOYIbbEoMC/1INjmj
         eQCB8OVJion9/ozshkedqRqgMOURtEq87DfCY+d1gYdHnoqXcFQYHKB7eOgcU2CG+Zu0
         k1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N06ng52JS7qg8uo3w1ksPWxe7Wr34Eu2lk2OlkrZI6o=;
        b=HJLDTREeZoA7/VIUcWddLpY7qMFnje/ll+WCGS6asyFzwJFRydQX1bdRKcH9mF/5GO
         GnS52PuTbCE1QPpUJ4On+4uNIFwnKfh1pj7K7jkxrZsSq7YMjnwh7iSrxoN4DlHIQOu8
         /Bwl/MqwLY7ARVF2IBlzNHKPEkSX1dodCgJ8YMzOXWDvqhzgtFH+ZeOIRF50pRF4CSQy
         UrKWlvr4FF6Mk9tFvg3V+xSbbMjjWoQw29NnKstQHK4jOWqJJGUcUjg2BuQiCBTS9Rgt
         FaSj7o4ZzxMSYTOIhfP6G1JZ6JNX9lSRU0fh1eE9IUzdAfzJMSMkZWvmUaWBAU441G++
         JcgA==
X-Gm-Message-State: AOAM531ZC4L7mSFFdsAWEWeQwLudXrnCn7JH0wGRhxLjhROZ+tbzVGmm
        R5yZMKHN9G/gPkKgmmjEirO+IA==
X-Google-Smtp-Source: ABdhPJyqmfkQjbeEB3X9JBwnpNHhZPhQk4KR9IoY7ddHsh/+817ru8556wQUfjtJ15m7q7jFyZb/FA==
X-Received: by 2002:aca:5889:: with SMTP id m131mr4056505oib.140.1626908538867;
        Wed, 21 Jul 2021 16:02:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b11sm4879541oti.30.2021.07.21.16.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 16:02:18 -0700 (PDT)
Date:   Wed, 21 Jul 2021 18:02:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Add pmc8180 & pmc8180c
Message-ID: <YPineKnke+zd42gC@yoga>
References: <20210629003851.1787673-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629003851.1787673-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 28 Jun 19:38 CDT 2021, Bjorn Andersson wrote:

> The SC8180x platform comes with PMC8180 and PMC8180c, add support for
> the GPIO controller in these PMICs.
> 

Linus, would you be willing to pick this up? Got some dts patches that
uses these compatibles.

Regards,
Bjorn

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 161216daf463..412613c80e9e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -30,6 +30,8 @@ PMIC's from Qualcomm.
>  		    "qcom,pm8350-gpio"
>  		    "qcom,pm8350b-gpio"
>  		    "qcom,pm8350c-gpio"
> +		    "qcom,pmc8180-gpio"
> +		    "qcom,pmc8180c-gpio"
>  		    "qcom,pmk8350-gpio"
>  		    "qcom,pm7325-gpio"
>  		    "qcom,pmr735a-gpio"
> @@ -120,6 +122,8 @@ to specify in a pin configuration subnode:
>  		    gpio1-gpio10 for pm8350
>  		    gpio1-gpio8 for pm8350b
>  		    gpio1-gpio9 for pm8350c
> +		    gpio1-gpio10 for pmc8180
> +		    gpio1-gpio12 for pmc8180c
>  		    gpio1-gpio4 for pmk8350
>  		    gpio1-gpio10 for pm7325
>  		    gpio1-gpio4 for pmr735a
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index a89d24a040af..9251fb5153e7 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1123,10 +1123,12 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
>  	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
>  	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pmc8180-gpio", .data = (void *) 10 },
>  	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
>  	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
>  	/* pm8150l has 12 GPIOs with holes on 7 */
>  	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
> +	{ .compatible = "qcom,pmc8180c-gpio", .data = (void *) 12 },
>  	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
>  	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> -- 
> 2.29.2
> 
