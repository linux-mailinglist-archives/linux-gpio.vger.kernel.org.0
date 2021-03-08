Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48643315BA
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 19:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhCHSSL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 13:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhCHSRq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 13:17:46 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB348C061760
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 10:17:45 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id w195so5311171oif.11
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 10:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=567Yd9iZRl/05ebxK019utNlRYrzlBGGKPlWcHiUGk4=;
        b=J+iLAObCQE/9V+eooKYEbOeVyp1Fd1qnXaRt31xUbdrOMzdC8zPdT/mDChdfuSkIcl
         RkROzh78hOZLLqie49r7dVdnC8YDnSVmJMCZvMiOEFS4LgFJ5i+9w7BzYK5uaOerKzTj
         WN9cn0JxaCYkYTRaKsiC2FDvuUB8KCgSpRofWWTvfXXd8o93pyQOd7nZ4pAplA8de6cC
         eT+emoNL3FRLo1ISBNeLc5d8a8NUP7WrRnmZp0l5MC6Ev60sIUk0S+tNXnoRQlbfeoue
         6p4PpJGxrAAYnkXpk3UJFH14EGtq7cgh3coqW1l4Qky1Yt4mmiduhH9x0mzJrZeyF2mf
         lHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=567Yd9iZRl/05ebxK019utNlRYrzlBGGKPlWcHiUGk4=;
        b=l4xu14exsPdANSQ4aqSttyUB/D1OBjItU7t7P7oCaEEDIjt/1dmsn4NEKtwEdTKMoK
         wpq1YgbPRsqhN4Ys33FpBtCz+zJ9T37kv7+FppU1kmRe8czvSEDOMsjY81Jd2SW5TY2L
         L7tdTfve1wnYnDrcDQmuAtFOqHs/E9xJpQ4V1DMk+ZvI7vREMFAou77yYe6lkHQXU/0T
         ddVCphLggxEac5reC1wkWvMFI7NFdYPGeyVXEiVq3U3tE5Xp6pFzlIKr6sBq73cjhN9k
         adgX4qg95gkDHb2jbp6cxdvIEPCVn0zOs8MPG/Z+llVgqzFdSW5si9GiXzvb3qcT/4pV
         cFHA==
X-Gm-Message-State: AOAM530whcuZIx7dl/1wqHyyPcLClaFXzAauX8n43MxYY267VeUI5BCp
        4tS6ZlUUvMebQDeAuxjkcwLcvK7hswuNIg==
X-Google-Smtp-Source: ABdhPJxYo2DJA/oNGpeigk2YCWZo6lfcHT+TkrPEn8OqnnqqQoRyFAlSvdnlq8qSFcq7zcylk921Rw==
X-Received: by 2002:a54:4010:: with SMTP id x16mr53818oie.151.1615227465375;
        Mon, 08 Mar 2021 10:17:45 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k24sm436773oic.51.2021.03.08.10.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:17:44 -0800 (PST)
Date:   Mon, 8 Mar 2021 12:17:43 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8350 and
 friends
Message-ID: <YEZqRxx1VQeCPun4@builder.lan>
References: <20210308164845.3210393-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308164845.3210393-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 08 Mar 10:48 CST 2021, Vinod Koul wrote:

> Add support for the PM8350, PM8350B, PM8350C, PMK8350, PMR735A and
> PMR735B GPIO support to the Qualcomm PMIC GPIO binding.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index 7648ab00f4e2..70e119b39c48 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -27,6 +27,12 @@ PMIC's from Qualcomm.
>  		    "qcom,pm660l-gpio"
>  		    "qcom,pm8150-gpio"
>  		    "qcom,pm8150b-gpio"
> +		    "qcom,pm8350-gpio"
> +		    "qcom,pm8350b-gpio"
> +		    "qcom,pm8350c-gpio"
> +		    "qcom,pmk8350-gpio"
> +		    "qcom,pmr735a-gpio"
> +		    "qcom,pmr735b-gpio"
>  		    "qcom,pm6150-gpio"
>  		    "qcom,pm6150l-gpio"
>  		    "qcom,pmx55-gpio"
> @@ -109,6 +115,12 @@ to specify in a pin configuration subnode:
>  					     and gpio8)
>  		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
>  		    gpio1-gpio12 for pm8150l (hole on gpio7)
> +		    gpio1-gpio10 for pm8350
> +		    gpio1-gpio8 for pm8350b
> +		    gpio1-gpio9 for pm8350c
> +		    gpio1-gpio4 for pmk8350
> +		    gpio1-gpio4 for pmr735a
> +		    gpio1-gpio4 for pmr735b
>  		    gpio1-gpio10 for pm6150
>  		    gpio1-gpio12 for pm6150l
>  		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
> -- 
> 2.26.2
> 
