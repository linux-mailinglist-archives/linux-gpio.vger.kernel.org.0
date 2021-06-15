Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C3E3A8A84
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jun 2021 23:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhFOVCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 17:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbhFOVCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 17:02:55 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DDEC061767
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 14:00:50 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id l15-20020a05683016cfb02903fca0eacd15so268136otr.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jun 2021 14:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OYGGlIWb3kY9x1lzGQMOd6l6sb+pbsVrXGcDRj4yGrI=;
        b=avqdtNpys1Iz7VcQCRWIokQpzmS0yyjycXWQPgSd55uELE9XymduvF0gJfsFBds00W
         15DzQcWjEdyp2+LLCTwKAUw3qNL0ytmeRgaO3J1JL90fny/SP4pfcVbElvzXSaaR6SfP
         oEq+EWRTjwIV3N8+ewzGJo2SC6GfRvj1J3Xufvl8LmtrOAnP6+lXQir4Es8YuEo7ReSB
         waANpofTS6NETS8sVr2GGB5O0Ta62qOC1yquzxjW76RrUX/X8YCqi41TkMpwN9CLwMPf
         gf2Lum4EmuJkA0x6yXj3ZvbA046Z/G7ld1HwXhcwHqZMMsy3Z9aa3rhc9SQRwrSDNuLK
         TkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OYGGlIWb3kY9x1lzGQMOd6l6sb+pbsVrXGcDRj4yGrI=;
        b=P3es80U9WrNZ9CpKB2H9vKESAIQnxReWknKVu2UL6M2oUkQR2FETMSnQW6gUFPs96p
         UNm0Lf6JKqjbbfkVc0Oj/wzo3/e6q8WJsepVXp6LUwniJQcdnluowD+TVxTVqyX7E9vA
         OQftW1BVeRyWfa/+w2AuNBNxdMfrFgNtGLPzAVl5E8bCmX8larYcwrq70YK6jc4zzoly
         /t8AoJJXkDKmzpOJ8bZnj4nPCaD0k09yyNRz3uFXzJ5WEm7h26xWLDDc/7kk12nAEIC2
         ncyl+Owx5I7hfQK4zhPtqOlWWbVW+cl0raQ5r73aqNhmjZTr3zXBSoyzcbqzaXRX29VV
         5qrg==
X-Gm-Message-State: AOAM531/zg6LaRJA9eGxY6Vj+Oo+GXEMGe5hrHAKpHo+XdFZE6XyHKaH
        mMmo9DCg00Qo0+aVUGC+hcH23Q==
X-Google-Smtp-Source: ABdhPJxchkcrrFycThcnHsitDoyfWfzwZ8r3Ur3gKBhQZM8fNHBQpFUomJAOuZa5Iimo2IF88rQjlQ==
X-Received: by 2002:a9d:7f0f:: with SMTP id j15mr985202otq.14.1623790849436;
        Tue, 15 Jun 2021 14:00:49 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w4sm23734otm.31.2021.06.15.14.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:00:49 -0700 (PDT)
Date:   Tue, 15 Jun 2021 16:00:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 compatible for SA8155p-adp
Message-ID: <YMkU/on5e92vgIll@yoga>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615074543.26700-3-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 15 Jun 02:45 CDT 2021, Bhupesh Sharma wrote:

> Add pmic-gpio compatible string for pmm8155au pmic
> found on the SA8155p-adp board.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>

I still don't think these Cc tags should be merged. The patch looks good
now though.

> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index f6a9760558a6..80b8a66e29d8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -27,6 +27,7 @@ PMIC's from Qualcomm.
>  		    "qcom,pm660l-gpio"
>  		    "qcom,pm8150-gpio"
>  		    "qcom,pm8150b-gpio"
> +		    "qcom,pmm8155au-gpio"

Please keep these sorted alphabetically.

Regards,
Bjorn

>  		    "qcom,pm8350-gpio"
>  		    "qcom,pm8350b-gpio"
>  		    "qcom,pm8350c-gpio"
> @@ -116,6 +117,7 @@ to specify in a pin configuration subnode:
>  					     and gpio8)
>  		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
>  		    gpio1-gpio12 for pm8150l (hole on gpio7)
> +		    gpio1-gpio10 for pmm8155au
>  		    gpio1-gpio10 for pm8350
>  		    gpio1-gpio8 for pm8350b
>  		    gpio1-gpio9 for pm8350c
> -- 
> 2.31.1
> 
