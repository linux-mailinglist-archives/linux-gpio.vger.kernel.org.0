Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56CFECC7E8
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 06:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfJEEij (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 00:38:39 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40147 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfJEEij (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 00:38:39 -0400
Received: by mail-pg1-f193.google.com with SMTP id d26so4889154pgl.7
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 21:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gojjLX+lTwGZmg+qENDnRVGuBFOraGHa2B2vpf7iVZU=;
        b=aoJD5LqfjCMzYKl2Xwu3Wklmzvu7Hh9AhSF/aixsCOh0sn3oS4pK3FjHL/0jBgFAqU
         UQ5M799eRDsX9N3DOgF89P6R8Pt9oHIg9YqJ+u22TNw15lvNiMYLxneCH39xxlCkookY
         E6b9yZ9zR+j8gRX5pq7hv1c5ST9WyOm7pn/Tc8agfncncn9s/5O6d1EohcNBYMSTECtG
         G2XqTK5nejhi/RHWpIa9Z6yjy7Q2U11yrCrnU2Y0iCOtGhQryHhfmlDctxdCueziuQE+
         NY13ZbDKQ+Pk3RIT/g4g2KBOYVDSsQm/LHsKj+9MvSP5JCyPS66DWRYHAJMXVqKMuHzf
         Jg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gojjLX+lTwGZmg+qENDnRVGuBFOraGHa2B2vpf7iVZU=;
        b=uJ7OpOKLPNng4zXXi6zSpjUU/yGVe+nc4DGJi5nlqYCr5n7AnasGEjuZdqUH4v4L4y
         ZBDYBuKEhXMT3+pXC8GLZ2hp9oTWTBSr5zk0qlY2b4e+nRRXpOCwBDD9FjpjhR4CEf0l
         mZErQuFHU8R4Wfi64KybpHWFv5habWmlkV6d/wo8XRg92vrbzLWUlvndaq57GePHyWt8
         tPjTN8QKooed12cwAaTT4S/WfiQR1l4z1/ZJpFSzdxlOT0MWVh7Gss75QHkewuydVMgg
         AkSRlCEw7V3Wt2cDpgF5gKST9lFjxi2WKIUKBQjY2zQdoye2tMT3yKrmfDW8klbW5Q2y
         ZD7g==
X-Gm-Message-State: APjAAAUNDYKXtWshHL7OTmfMZg5kEn8O4Xdm9B2hK00lPLMe9FGWWBzF
        XzedFrlj/Dgt6HatHpb0HeNsgA==
X-Google-Smtp-Source: APXvYqybrYaoAQQO0OhNSmIB0UUOdfqyJ4Qu//EasKPhAapNYmiKSK5FOIodqcUwgnxNhBbXOE/eTQ==
X-Received: by 2002:a65:5546:: with SMTP id t6mr18868858pgr.441.1570250318244;
        Fri, 04 Oct 2019 21:38:38 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 1sm8310336pff.39.2019.10.04.21.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 21:38:37 -0700 (PDT)
Date:   Fri, 4 Oct 2019 21:38:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1] dt-bindings: pinctrl: qcom-pmic-gpio: Add support for
 pm6150/pm6150l
Message-ID: <20191005043835.GD6390@tuxbook-pro>
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

On Fri 04 Oct 04:20 PDT 2019, Kiran Gunda wrote:

> Add support for the PM6150 and PM6150L GPIO support to the
> Qualcomm PMIC GPIO binding.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
> 
