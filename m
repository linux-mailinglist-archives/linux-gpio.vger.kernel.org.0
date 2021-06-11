Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DDB3A39E8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 04:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhFKCx5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 22:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhFKCx5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 22:53:57 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B6EC061574
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 19:51:44 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id v22so4388181oic.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Jun 2021 19:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/wD+DhD2AsBgrlw92wrbe1Sc350ImLQPRBTFALVfZ3g=;
        b=SgX18G0EUgTBy38Hvh6rOI0T9lwsRNa/tNLeyRQapOXcIBf2jiXWwcokxEaxUSrmiL
         sYmw47S3hIrhk716YU7SWbzp8jXwS5pUAgUL6rysI0wO6FHlEzWhM6ma/0AXwHYgklJx
         NyQm+0NbBO0QPEHE+hoMJ0mItlWcveEnozpthdZ02mIixpbGDJvOGBAphqJVapb+1+7l
         cyUu8Ldb4uUGcBoyG5x52wLPLLNWl48Hr4N/gxr3KWsIkiyZSPcVQAVsB60tblypSWeY
         WV/GCe4cZvhiQc/BRrkSSNFLcX9qbJ8Pihl/GQ2FpFzLkW76lE+S+sB8jjy69wVEJstF
         pLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/wD+DhD2AsBgrlw92wrbe1Sc350ImLQPRBTFALVfZ3g=;
        b=Vh7GbN1DOm6ehBufteotvxt6zU4ZZQf+stnVKsOn9CzGYG17f0MaEcfpE0rQEGZIEO
         ay985Goglfwaezi+EpqpzEpKiyf+tYEA9yXXSn+Ae2Ux45yA887VQGNf0IalrUrkhif3
         Jwi7ouHIQ3c7MZ1n3Dgd516aXvjPfSWuRhmMEiqV3reXqS4eSdGIGXbRpRyNvV1+Wzlv
         C/0uxX1Z/1xZy0zVzQLwbTQyd0weLgVmIfBgpQ55jjVL5Kd/JHIlQ4jKGLVKD4YeH3cK
         pJS6jH++Mv2ywEAV13skfag70NQYDQEstBJNXv1tDkN4FW8uJW5WU8z3zJVbF1zH4hsZ
         xfpw==
X-Gm-Message-State: AOAM533/XXhIBRRy84v40YvDfwe/BWsGRM+vd6WIu0yqpfR9Cn7I4cmC
        GAs38AlTIv1Zq3LOAOh/QZL7YA==
X-Google-Smtp-Source: ABdhPJxD3oS+iTE7u2HL+xZQR3ZeqyLgSdwSa9Kkl2xSSu+O0WxUCOsYT1kRj0xKj66E+l6B5HEbxA==
X-Received: by 2002:aca:b509:: with SMTP id e9mr12129192oif.66.1623379904224;
        Thu, 10 Jun 2021 19:51:44 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x2sm890433oog.10.2021.06.10.19.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 19:51:43 -0700 (PDT)
Date:   Thu, 10 Jun 2021 21:51:42 -0500
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
Subject: Re: [PATCH 2/8] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible
 for SA8155p-adp
Message-ID: <YMLPvrVVdx0MZJlO@builder.lan>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-3-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:

> Add pmic-gpio compatible strings for pmm8155au_1 and pmm8155au_2 pmics
> found on SA8155p-adp board.
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
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index f6a9760558a6..ee4721f1c477 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -27,6 +27,8 @@ PMIC's from Qualcomm.
>  		    "qcom,pm660l-gpio"
>  		    "qcom,pm8150-gpio"
>  		    "qcom,pm8150b-gpio"
> +		    "qcom,pmm8155au-1-gpio"
> +		    "qcom,pmm8155au-2-gpio"

As with the regulator this seems to be a single component.

>  		    "qcom,pm8350-gpio"
>  		    "qcom,pm8350b-gpio"
>  		    "qcom,pm8350c-gpio"
> @@ -116,6 +118,9 @@ to specify in a pin configuration subnode:
>  					     and gpio8)
>  		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
>  		    gpio1-gpio12 for pm8150l (hole on gpio7)
> +		    gpio1-gpio10 for pmm8155au-1 (holes on gpio2, gpio5, gpio7
> +					          and gpio8)
> +		    gpio1-gpio10 for pmm8155au-2 (holes on gpio2, gpio5, gpio7)

In the schematics all 10 pins are wired on both of these PMICs, so I
don't think there are holes. Please omit the comment.

Thanks,
Bjorn

>  		    gpio1-gpio10 for pm8350
>  		    gpio1-gpio8 for pm8350b
>  		    gpio1-gpio9 for pm8350c
> -- 
> 2.31.1
> 
