Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459972F41EA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jan 2021 03:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbhAMCmB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 21:42:01 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:43648 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728328AbhAMCmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2021 21:42:00 -0500
Received: by mail-oi1-f176.google.com with SMTP id q25so569667oij.10;
        Tue, 12 Jan 2021 18:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hm5zdwouo29G812phIv+p/u0LvlyEheiQlN2xaaTb+I=;
        b=K820PCQKW1AQEtY3Euw62lfKeY/wZ3mcdf2gO0Mc9SYOmvp1zzaHLzMnVTMNLdqlEC
         pCY7ws3WhsREkQkxJW8PfsVkrAlfvDJ3nXNWRfqAeSi8Nr+0bcdkKAGW0MMUISRmYH88
         l3xkTnISuoALs5JwnQvtk7GpkvD7EC7hjLLU+OqNme+GS0PZsNP/NJ+caBWiMbUIHZ3F
         FwrP8t4hpBpl36rfCbp+eFODiJ8YyqaNAUVoRUDI8KitL0gLadrUW+84xLJgRkYYVZiz
         VPCy9rFnlMOMdbEHVcRtE4Y0zdm5RbRhfGGAaDYOxXShUp0U19JJQdInfVLZZALXXx4M
         XuTg==
X-Gm-Message-State: AOAM530QefoyeQYos29RR4/7j7FajYoG24Efm56xxkrEE+wCWFaVCKBN
        pVbd+ZP2fRxKFW/RSnAY5GIVFYlSfg==
X-Google-Smtp-Source: ABdhPJxtIjPuPlElpwO215C+9GYc9Rh+SLI5NSvS2BUkZ8JNGAriWaeANEkU+wPcNeokAkwQ658XRQ==
X-Received: by 2002:a05:6808:91a:: with SMTP id w26mr38353oih.159.1610505679688;
        Tue, 12 Jan 2021 18:41:19 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m15sm146058otl.11.2021.01.12.18.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 18:41:18 -0800 (PST)
Received: (nullmailer pid 1408342 invoked by uid 1000);
        Wed, 13 Jan 2021 02:41:18 -0000
Date:   Tue, 12 Jan 2021 20:41:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: pinctrl: Add bindings for Awinic
 AW9523/AW9523B
Message-ID: <20210113024118.GA1404906@robh.at.kernel.org>
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
 <20210111182928.587285-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111182928.587285-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 07:29:28PM +0100, AngeloGioacchino Del Regno wrote:
> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../pinctrl/awinic,aw9523-pinctrl.yaml        | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> new file mode 100644
> index 000000000000..a705c05bb5a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/awinic,aw9523-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW9523/AW9523B I2C GPIO Expander
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> +
> +description: |
> +  The Awinic AW9523/AW9523B I2C GPIO Expander featuring 16 multi-function
> +  I/O, 256 steps PWM mode and interrupt support.
> +
> +properties:
> +  compatible:
> +    const: awinic,aw9523-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    description: |
> +      Specifying the pin number and flags, as defined in
> +      include/dt-bindings/gpio/gpio.h
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Specifies the INTN pin IRQ.
> +
> +  '#interrupt-cells':
> +    description:
> +      Specifies the PIN numbers and Flags, as defined in defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '^.*$':
> +    if:
> +      type: object
> +      $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +    then:

I wish people would stop copying this if/then hack...

For new bindings, just name your nodes something sensible you can match 
on like '-pins$'.

> +      properties:
> +        pins:
> +          description:
> +            List of gpio pins affected by the properties specified in
> +            this subnode.
> +          items:
> +            pattern: "^gpio([0-9]|1[0-5])$"
> +          minItems: 1
> +          maxItems: 16
> +
> +        function:
> +          description:
> +            Specify the alternative function to be configured for the
> +            specified pins.
> +
> +          enum: [ gpio, pwm ]
> +
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        drive-open-drain: true
> +        drive-push-pull: true
> +        input-enable: true
> +        output-high: true
> +        output-low: true
> +
> +      required:
> +        - pins
> +        - function
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c_node {
> +        gpio-expander@58 {
> +                compatible = "awinic,aw9523-pinctrl";
> +                reg = <0x58>;
> +                interrupt-parent = <&tlmm>;
> +                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 16>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> -- 
> 2.29.2
> 
