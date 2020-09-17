Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAA226D463
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 09:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgIQHPA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 03:15:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37198 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgIQHO7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 03:14:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id a9so924115wmm.2;
        Thu, 17 Sep 2020 00:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uaz9kepgEXq9uBdXqyYSIYC/gVUhci+I1g61k9mFWnQ=;
        b=mZBMk5UeweX0q+du3MNn+k65e1Tlsy+++1i7IVGQya9+avXR872473DvD2MWmN92BW
         xuu4EuYruFXemP5zk127LMCqqEaeGUiVVm9jK34ZJTTlCn4mYs/VOCZQb0KC/JNnB36J
         iprUD3fXBkDy6laua1+UyJsTBoMfZ4tPxwbX8wcLpYpW49IsGS2dbF38t8WwzVz17860
         Y3T5E2K0yZAS7I7QfORVqOFmkdQ728/2MmAj2wqM/1V25drBehSDZxzTJueB7zfrHC4h
         grttuFGv2+aXpCOgo4dBDtUDDIhAUpd46a2EtFdiRVp5J7G9R8+3BIKRXloSkuAFXnE9
         ZZog==
X-Gm-Message-State: AOAM5317lmn84Dzsbv4n0pXcatZ6EM3vvAih7q+aGnaXxuD8WT86QyIx
        pJcksSkpP0lUMiRgFcXnWbI=
X-Google-Smtp-Source: ABdhPJwJoXbRCDZ7Y0+x+9aKWBixTbcBqY473DlXztmst9+kEcc+7QCYPQ3dhqjJGZomFsfeIuz1bg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr8250390wmj.166.1600326896325;
        Thu, 17 Sep 2020 00:14:56 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id x16sm36483228wrq.62.2020.09.17.00.14.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 00:14:55 -0700 (PDT)
Date:   Thu, 17 Sep 2020 09:14:51 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/8] dt-bindings: gpio: include common schema in GPIO
 controllers
Message-ID: <20200917071451.GA30367@kozik-lap>
References: <20200916162250.16098-1-krzk@kernel.org>
 <20200916162250.16098-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200916162250.16098-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 16, 2020 at 06:22:44PM +0200, Krzysztof Kozlowski wrote:
> Include the common GPIO schema in GPIO controllers to be sure all common
> properties are properly validated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml          | 3 +++
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml           | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml       | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-rda.yaml           | 3 +++
>  Documentation/devicetree/bindings/gpio/gpio-vf610.yaml         | 3 +++
>  Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml          | 1 +
>  Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml  | 3 +++
>  Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml     | 3 +++
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml  | 3 +++
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml        | 3 +++
>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml      | 3 +++
>  Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml | 3 +++
>  13 files changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
> index c213cb9ddb9f..1ac69b9c03f9 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
> @@ -13,6 +13,9 @@ description: |
>    This controller is the Chip Common A GPIO present on a number of Broadcom
>    switch ASICs with integrated SoCs.
>  
> +allOf:
> +  - $ref: gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: brcm,iproc-gpio-cca
> diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> index de0b9b5f6a70..737756e081fb 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> @@ -9,6 +9,9 @@ title: Freescale i.MX/MXC GPIO controller
>  maintainers:
>    - Anson Huang <Anson.Huang@nxp.com>
>  
> +allOf:
> +  - $ref: gpio-common.yaml#
> +
>  properties:
>    compatible:
>      oneOf:
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> index dfa1133f8c5e..7fc04ab35044 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> @@ -17,6 +17,9 @@ description: |
>    GPIO ports share the same IO space with PIN controller, the GPIO node
>    will be represented as sub-nodes of MXS pinctrl node.
>  
> +allOf:
> +  - $ref: gpio-common.yaml#
> +

I found something to fix - this one should go under patternProperties,
not here.

Best regards,
Krzysztof
