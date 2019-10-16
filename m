Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F45ED8AA3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 10:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfJPIPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 04:15:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbfJPIPg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Oct 2019 04:15:36 -0400
Received: from localhost (unknown [171.76.123.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93AA22064B;
        Wed, 16 Oct 2019 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571213735;
        bh=wQkEVazklDAJ7dSbF0KdWXdU8XFXLrPC9CuTZDXFcM4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mVi5NeVe2NO8zlPTQNPzHooei1ARBh0FfAAGoui8k9aCAWBlp7R/7/Q+qbztaMc+s
         t/TfDbgo7dNWOojAuVV6TsOXkFRXz4iC+c3afqIfg809gyhTaNYWAQYEdTThBEgad/
         EtpmBefX2VJwMZ8LsvVcDfzoB5cRAWZXb0N+URnk=
Date:   Wed, 16 Oct 2019 13:45:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1] dt-bindings: pinctrl: qcom-pmic-gpio: Add support for
 pm6150/pm6150l
Message-ID: <20191016081530.GJ2654@vkoul-mobl>
References: <1570188039-22122-1-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570188039-22122-1-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04-10-19, 16:50, Kiran Gunda wrote:
> Add support for the PM6150 and PM6150L GPIO support to the
> Qualcomm PMIC GPIO binding.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index c32bf32..2f48cca 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -23,6 +23,8 @@ PMIC's from Qualcomm.
>  		    "qcom,pms405-gpio"
>  		    "qcom,pm8150-gpio"
>  		    "qcom,pm8150b-gpio"
> +		    "qcom,pm6150-gpio"
> +		    "qcom,pm6150l-gpio"
>  
>  		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
>  		    if the device is on an spmi bus or an ssbi bus respectively
> @@ -100,6 +102,8 @@ to specify in a pin configuration subnode:
>  					     and gpio8)
>  		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
>  		    gpio1-gpio12 for pm8150l (hole on gpio7)
> +		    gpio1-gpio10 for pm6150
> +		    gpio1-gpio12 for pm6150l

No holes on these?

Other than this:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

>  
>  - function:
>  	Usage: required
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index f1fece5..387917c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1121,6 +1121,8 @@ static int pmic_gpio_remove(struct platform_device *pdev)
>  	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
>  	/* pm8150l has 12 GPIOs with holes on 7 */
>  	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
> +	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
>  	{ },
>  };
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>  a Linux Foundation Collaborative Project

-- 
~Vinod
