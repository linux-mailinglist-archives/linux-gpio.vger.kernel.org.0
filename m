Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C763383F1
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 03:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhCLCsN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 21:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhCLCsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 21:48:04 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A046BC061761
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 18:48:04 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id b8so2856965oti.7
        for <linux-gpio@vger.kernel.org>; Thu, 11 Mar 2021 18:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+hasAsq2McuBGR+S/4KBE3gzEFOfYImR8i7ea2b9vwM=;
        b=VU52bNHMOKp6UlfsCiXEnHxYVMdn5m5p9E2W+6zSKZPe+LF/bh5Jk/DMfeYcd+l21D
         vkKjBCizyrXkkUfGZ/qdQh3p/oKINVMEl6y0FWkhYkAuV8gSKCJBloWjlusO1ahI4KfT
         XUWiZmqH8v56W95M5LtWa6d/ex+rzFg9n+miCPJxt+WOQEHD1DCdu+ddcVjL1CBkFEPn
         UPpx0hCqOCura2/7DE8/xNxwUa6+s+EpliLFSIWwrv91kDof/QhJG92z+RIXVq7i5agS
         7OcuopM0BeIlHfrYCmEQSUiZNzHulT3bjByTSyZgS7fz8AhQoNgyXB15p6IJw43IuLNO
         94tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+hasAsq2McuBGR+S/4KBE3gzEFOfYImR8i7ea2b9vwM=;
        b=Xpc+iE4YH8HeWYNAJGRm9rcC3c2lC+Dp9G4PHJxfxbaO2UjdX5dRj1punwrk7h+/oW
         KrtQuZejPfdBIu6FwP5qxzRN5jnyMlBS0cOlnzmYm8iRSdhvpAyIBnJzUqLwAV6/axPz
         s3zLMCIvbmoXly+JAfbXKXvJtyIlDxts6JZY3ZJqYNPqrXQLlNSglwOxcsoPIc6Ar33Y
         f3WXSBAz31vtzGeY0idXlyLmSRVpZzvvOBN/aA70YNGmAxWrKmRf279aP4RzUUPvGmZk
         MxU5GQ5+frvRQtqs0+7IaiwS+BJmzHyox956uY7EvOZU7FFcAIeIUqgC62+goZBvTrau
         gQhg==
X-Gm-Message-State: AOAM532+lW1PAxFmuMWMfExEbynEQjP3NiN4tYvK2alCuYskvv2qrdBC
        DZr+/d5bOkncdlbRtApcoIWiXg==
X-Google-Smtp-Source: ABdhPJzrC9vi8sKWHQ9oS7g93RVXspHSbUC71BZ52M9WtYziEHutB14dV1zErtoeEmORUy/Ay2jijg==
X-Received: by 2002:a9d:12b3:: with SMTP id g48mr1632858otg.277.1615517284010;
        Thu, 11 Mar 2021 18:48:04 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k24sm1003569oic.51.2021.03.11.18.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:48:03 -0800 (PST)
Date:   Thu, 11 Mar 2021 20:48:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] pinctrl: qcom: spmi-gpio: Add support for four
 variants
Message-ID: <YErWYQaT75MneNhf@builder.lan>
References: <1614925799-3172-1-git-send-email-skakit@codeaurora.org>
 <1614925799-3172-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614925799-3172-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 05 Mar 00:29 CST 2021, satya priya wrote:

> Add PM7325, PM8350c, PMK8350 and PMR735A compatibles for GPIO
> support.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 9801c71..90f4f78 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1131,6 +1131,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
>  	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
>  	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
> +	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> +	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
>  	{ },
>  };
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
