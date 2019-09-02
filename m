Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D74DA5800
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2019 15:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731109AbfIBNjC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Sep 2019 09:39:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40832 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731089AbfIBNjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2019 09:39:01 -0400
Received: by mail-wm1-f68.google.com with SMTP id t9so14650431wmi.5;
        Mon, 02 Sep 2019 06:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y0H79HNi/wc0sQjufCwpYot026IIQeHKVOcgN05mAO8=;
        b=D2xYXNWL9Lv4YzMDjik8MNwx7cMVICKFthj5IbOmeCyht3Qe2Aukea3jDeVhuAlkBy
         MZVXvymIyDTwMdgmL2lHmaQVah5GaS7N/NXMjXAixABUVkYpHs//NthP5OMvRjoq2Xsj
         MY7KC5E1v72OfI/6NTxglWMcVi5YSeHqpTtcOQJ/hcXydXQPuRlHPaotAXPZZ4vryaCS
         rAWfWGkD0+VRkjwhykyNKBFTONmntu9GyZp7Nh9obn1IWfAETYVQCO4Zgl3H5zWxLLbb
         Bh9u6FjnNWIT/Msu6eJea/UiL5c7Mrr3Akq8hWN12P2vCQ0QzjeTkV/rAsddspCMqtoz
         ivfw==
X-Gm-Message-State: APjAAAXCT4z7uOcby9bYSSOijiNamAGt9B3kPOIGoigPHsV8sSYiHvcz
        O3sVGSta7onmauTZkeJPUg==
X-Google-Smtp-Source: APXvYqyBGnHiCY0mo0WSiPqu5PkSlBC8o+lVeCkDxk539HlJdZM8hzGcwr8SiE6Cjs55KuOXwNUFJA==
X-Received: by 2002:a1c:c00e:: with SMTP id q14mr36396596wmf.142.1567431539134;
        Mon, 02 Sep 2019 06:38:59 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id f75sm21657107wmf.2.2019.09.02.06.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:38:58 -0700 (PDT)
Message-ID: <5d6d1b72.1c69fb81.ee88.efcf@mx.google.com>
Date:   Mon, 02 Sep 2019 14:38:57 +0100
From:   Rob Herring <robh@kernel.org>
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        mkshah@codeaurora.org, linux-gpio@vger.kernel.org,
        rnayak@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 05/14] dt-bindings/interrupt-controller: pdc: add SPI
 config register
References: <20190829181203.2660-1-ilina@codeaurora.org>
 <20190829181203.2660-6-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829181203.2660-6-ilina@codeaurora.org>
X-Mutt-References: <20190829181203.2660-6-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 29, 2019 at 12:11:54PM -0600, Lina Iyer wrote:
> In addition to configuring the PDC, additional registers that interface
> the GIC have to be configured to match the GPIO type. The registers on
> some QCOM SoCs are access restricted, while on other SoCs are not. They
> SoCs with access restriction to these SPI registers need to be written

Took me a minute to figure out this is GIC SPI interrupts, not SPI bus.

> from the firmware using the SCM interface. Add a flag to indicate if the
> register is to be written using SCM interface.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../bindings/interrupt-controller/qcom,pdc.txt           | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> index 8e0797cb1487..852fcba98ea6 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -50,15 +50,22 @@ Properties:
>  		    The second element is the GIC hwirq number for the PDC port.
>  		    The third element is the number of interrupts in sequence.
>  
> +- qcom,scm-spi-cfg:
> +	Usage: optional
> +	Value type: <bool>
> +	Definition: Specifies if the SPI configuration registers have to be
> +		    written from the firmware.
> +
>  Example:
>  
>  	pdc: interrupt-controller@b220000 {
>  		compatible = "qcom,sdm845-pdc";
> -		reg = <0xb220000 0x30000>;
> +		reg = <0xb220000 0x30000>, <0x179900f0 0x60>;

There needs to be a description for reg updated. These aren't GIC 
registers are they? Because those go in the GIC node.

>  		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>  		#interrupt-cells = <2>;
>  		interrupt-parent = <&intc>;
>  		interrupt-controller;
> +		qcom,scm-spi-cfg;
>  	};
>  
>  DT binding of a device that wants to use the GIC SPI 514 as a wakeup
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

