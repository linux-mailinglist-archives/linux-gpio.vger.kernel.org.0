Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24502C5ABB
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 18:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404444AbgKZRgw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Nov 2020 12:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404442AbgKZRgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2020 12:36:52 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1054EC061A04
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2020 09:36:52 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id 11so2458372oty.9
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2020 09:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RzscB+HPvNo5OLPGyWcEVasjH1OgEnw1N/daccQTcjw=;
        b=TiNa/CZ9bt4dyGcJGi3+DSceDoxSyy6UZUER3AOqg4GE5ZhCj46vPHN8d+7IdS4lxe
         v7KAYYWF0mQYxM3vIupYxJiWjiPrLJgwqKYbti5ro/2THxTbi5Smq/4+McxMh8ONbC/x
         JLwyY1PNPjP5QzP6Vj++4xyfKhb2WAL2GJnEagvBrDwHBkDT7AynKdTv15PA4r1MC7AI
         m6cIy3iRQqIQiJT4w5fXg/VrcsZEFilfUNCztm9T7L7SJ2M8oUPjVubmq42/rE5WgpW/
         Onwz3JLHrggbpVh+WKRSp5BbbVbaLH7+2nk0ENJLIPgrV3aeUCizFxhz9STQmvc+hooj
         mvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RzscB+HPvNo5OLPGyWcEVasjH1OgEnw1N/daccQTcjw=;
        b=ehGOF2ZH7765g0IYWZgTTQCXx2DvGvWDkI7Bf7EL3agg0UgEE8I0OvUYBo/A14TgrE
         2c2IVpjOYq0YT/tMGzm/5GcPYLvZknlqrgVd2sG4VkoXVhu8foOI34XY2PxfLRBCk3TC
         hH0z1QJkkBF/Zb6DGPmTQYWvfxsNJG1VFc5hd6pZivMNz7ItEgh60hCvgjzIcZQJ8M2H
         HnFYogXBghHvLr4zoMHr4559u7nhmjr2y2/h6WhwWAnvbYvgABlCdzNV6nIOChXayivg
         TYAbzsmQ3d91P5V/ixIFih50Plo0drFJWoabNGvBhq8HDI8VDoCuCHZZ/pInpC+IshPu
         jy9g==
X-Gm-Message-State: AOAM532eOYmCsxJmUN7Tqpf6ExQMUrU7ciKhJKjYDuoC/yldH5F++Li4
        41fwor0CeHYEwOM9Tz4mwtSpyg==
X-Google-Smtp-Source: ABdhPJyHVTzDKx1lcHaJkXpFi2a3H0kvz7t8PZQ1lWl7nZ712Y81nbkxBYUgt5qmGLhKwxRh/Dltvw==
X-Received: by 2002:a05:6830:8f:: with SMTP id a15mr2952856oto.362.1606412211389;
        Thu, 26 Nov 2020 09:36:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j8sm3499723oif.55.2020.11.26.09.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:36:50 -0800 (PST)
Date:   Thu, 26 Nov 2020 11:36:49 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom-pmic-gpio: Add support for pmx55
Message-ID: <X7/nsdVsQZdrRlPn@builder.lan>
References: <20201126092151.1082697-1-vkoul@kernel.org>
 <20201126092151.1082697-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126092151.1082697-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 26 Nov 03:21 CST 2020, Vinod Koul wrote:

> PM55 pmic support gpio controller so add compatible and comment for gpio
> holes
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 17441388ce8f..9801c717e311 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1129,6 +1129,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
>  	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
> +	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
> +	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
>  	{ },
>  };
>  
> -- 
> 2.26.2
> 
