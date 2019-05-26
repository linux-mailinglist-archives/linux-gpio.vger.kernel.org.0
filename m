Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8716A2A88D
	for <lists+linux-gpio@lfdr.de>; Sun, 26 May 2019 07:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfEZFoi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 May 2019 01:44:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33214 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfEZFoi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 May 2019 01:44:38 -0400
Received: by mail-pf1-f193.google.com with SMTP id z28so7693099pfk.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 May 2019 22:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cGG8hm4JITH3d45CXrq+jmFB4VDR5sa+87gOYxGAPAI=;
        b=qFn12MPzpE3AUlRHmme3uj0a2Lca0nuN97hCxkIyWQmWIxWSTLclLqs6Pd1u7c4VQo
         y+k68VueKxJd7Kfikanm84/irnBvPnYKtCRMtrK40ZRkHSJX4TvTnyyFQOS6zB/7/F2s
         uCfIl+u1Dp2gcoKTXkl/DHvMl5d0zbfNPHhHF4ebQY6I0fevTZHc1cMiZ/u9OaxwLS+0
         vG/dpQYn58ccSzvGweE5oA4NcmizN7oDhaaDjpj08T3xKktQWrBKEhEvgZduOkDEbewC
         K5ENp783w4LE4g1/OAKZpf6UY8eEiG5apURfTxG9EPWcd5bTOst5F8n1sQftNS+CXxRB
         bQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cGG8hm4JITH3d45CXrq+jmFB4VDR5sa+87gOYxGAPAI=;
        b=KV9w3La3yWSrDV1bV3AXjEY/1Fh0pdFtxigyynQWdoyhC5FkBBXg6L8KLXhUeZvRwo
         rPMnwF5PXayg5JtAW8wdEubK5Dwr/+NcTCDXtfIoA3CrX695bOpSGiep9KPjL6/AZAQg
         lX4P0djKT9HbIW5/gGAiDJtvvz9EpqQzc4zjujjaUAg6noh2TYZvpOz9XCAnyCEhTJ6z
         JKYkne2ufAPXRBhpiImTzybazzshNcWt9/eBBtzhbQX7sHothJ8RV5L7/j0yG8cuNKo0
         9BoKtWuXtOkKYhfCSu+McYcLDF14BFF6hiivT0qcjj9pNjjLSNU/70a4dZCTXgj+96lL
         082Q==
X-Gm-Message-State: APjAAAXhQTgMHlRPae+61A4CMtstnfiyoG36Of3ulPEfLQ4Ryf7NxvPO
        +1P/Xhk7XZw0JzwskpoXqo/ScQ==
X-Google-Smtp-Source: APXvYqx4zW6HVHahrgBAj/rBrC8D0nb5D+t2hMkxGBFnusvz3gcRYCOEgpWDzH8eYgUaMm4pmLJ9yw==
X-Received: by 2002:a65:56c5:: with SMTP id w5mr116833991pgs.434.1558849477130;
        Sat, 25 May 2019 22:44:37 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c15sm7327493pfi.172.2019.05.25.22.44.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 May 2019 22:44:35 -0700 (PDT)
Date:   Sat, 25 May 2019 22:45:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: fix spelling mistakes in pinctl
 documentation
Message-ID: <20190526054503.GJ2085@tuxbook-pro>
References: <20190525204228.8546-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525204228.8546-1-colin.king@canonical.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat 25 May 13:42 PDT 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The spelling of configured is incorrect in the documentation. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> ---
>  .../devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt    | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt    | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt    | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt    | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt    | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt    | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt    | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt    | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt     | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt     | 6 +++---
>  .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt     | 6 +++---
>  11 files changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
> index 68e93d5b7ede..c9782397ff14 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
> @@ -122,17 +122,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
> index 6dd72f8599e9..7b151894f5a0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
> @@ -118,17 +118,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt
> index 86ecdcfc4fb8..d46973968873 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9615-pinctrl.txt
> @@ -97,17 +97,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
> index 195a7a0ef0cc..3354a63296d9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
> @@ -130,17 +130,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
> index 5034eb6653c7..a7dd213c77c6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
> @@ -124,17 +124,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
> index f15443f6e78e..da52df6273bc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8994-pinctrl.txt
> @@ -128,17 +128,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
> index fa97f609fe45..a56cb882830c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
> @@ -149,17 +149,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> index e70c79bbbc5b..00174f08ba1d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
> @@ -135,17 +135,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
> index 2b8f77762edc..a50e74684195 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
> @@ -150,17 +150,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
> index 769ca83bb40d..be034d329e10 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
> @@ -142,17 +142,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> index 665aadb5ea28..321bdb9be0d2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> @@ -118,17 +118,17 @@ to specify in a pin configuration subnode:
>  - bias-disable:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as no pull.
> +	Definition: The specified pins should be configured as no pull.
>  
>  - bias-pull-down:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull down.
> +	Definition: The specified pins should be configured as pull down.
>  
>  - bias-pull-up:
>  	Usage: optional
>  	Value type: <none>
> -	Definition: The specified pins should be configued as pull up.
> +	Definition: The specified pins should be configured as pull up.
>  
>  - output-high:
>  	Usage: optional
> -- 
> 2.20.1
> 
