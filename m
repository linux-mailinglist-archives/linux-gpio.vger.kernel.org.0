Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C2A348084
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 19:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbhCXSaM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 14:30:12 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:34432 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237549AbhCXS3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 14:29:39 -0400
Received: by mail-io1-f45.google.com with SMTP id x16so22543217iob.1;
        Wed, 24 Mar 2021 11:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PrMplCAocXwEHiQAv4gdSYs00Y35/4CyAT3Y3sApfhU=;
        b=UtdNh50IkiBcMHbYzzeRUxwcQuISDiFh2ddRz2ExvEIBDa6XeaAtclf/4O4weG2yGf
         2TYZrnboKDks5+HEQXlutU2C+9ZYuDRbZDJ2imdM3BWkF8Bb95UQqu0QVg5wj4r0RRSz
         bX2R7Xp6irWliOLCRPqwiJyrr15IlMxmwtl0ubnYnL8TXw11zeFI+nAclVVCOePk7ico
         bs7K6FVHMDl7of+RR13aoLkboodgOHIYYvTFPzlI2UBq0pKCbFbZVuLuGj6Xv1+bJbYA
         Z3iXCSrCF2A0Lv8nG+9MhA79pUSnBPTxXxkDprQDplPwzJQYGS3EAzHiO11fI7ZEqXNs
         6pYw==
X-Gm-Message-State: AOAM532zcGLVr2BN6pkS6LsRrFEyIXz64Ui3Ig8frQ9Wj2zaGAwfhiIA
        gEhtkgugmmsCQ9zoWiBBVg==
X-Google-Smtp-Source: ABdhPJzGlId8ja8cdJzuvMtYqZogzjtHhRrIu1PgwdklmlwP4vTUQtGNUsMtb+jEpiYjJ4VpBSTEfg==
X-Received: by 2002:a02:7419:: with SMTP id o25mr4035861jac.100.1616610578895;
        Wed, 24 Mar 2021 11:29:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e10sm1485589ile.23.2021.03.24.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:29:38 -0700 (PDT)
Received: (nullmailer pid 3386128 invoked by uid 1000);
        Wed, 24 Mar 2021 18:29:37 -0000
Date:   Wed, 24 Mar 2021 12:29:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        bert@biot.com
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Binding for Realtek Otto GPIO
Message-ID: <20210324182937.GA3378389@robh.at.kernel.org>
References: <20210315082339.9787-1-sander@svanheule.net>
 <20210315190806.66762-1-sander@svanheule.net>
 <20210315190806.66762-2-sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315190806.66762-2-sander@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 08:08:05PM +0100, Sander Vanheule wrote:
> Add a binding description for Realtek's GPIO controller found on several
> of their MIPS-based SoCs (codenamed Otto), such as the RTL838x and
> RTL839x series of switch SoCs.
> 
> A fallback binding 'realtek,otto-gpio' is provided for cases where the
> actual port ordering is not known yet, and enabling the interrupt
> controller may result in uncaught interrupts.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/gpio/gpio-realtek-otto.yaml      | 80 +++++++++++++++++++

Use compatible string: realtek,otto-gpio.yaml

>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml b/Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml
> new file mode 100644
> index 000000000000..3e8151e3a169
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-realtek-otto.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-realtek-otto.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek Otto GPIO controller
> +
> +maintainers:
> +  - Sander Vanheule <sander@svanheule.net>
> +  - Bert Vermeulen <bert@biot.com>
> +
> +description: |
> +  Realtek's GPIO controller on their MIPS switch SoCs (Otto platform) consists
> +  of two banks of 32 GPIOs. These GPIOs can generate edge-triggered interrupts.
> +  Each bank's interrupts are cascased into one interrupt line on the parent
> +  interrupt controller, if provided.
> +  This binding allows defining a single bank in the devicetree. The interrupt
> +  controller is not supported on the fallback compatible name, which only
> +  allows for GPIO port use.
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - realtek,rtl8380-gpio
> +              - realtek,rtl8390-gpio
> +          - const: realtek,otto-gpio
> +      - const: realtek,otto-gpio

This should be dropped. You should always have an SoC specific 
compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 32
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +dependencies:
> +  interrupt-controller: [ interrupts ]
> +
> +examples:
> +  - |
> +      gpio@3500 {
> +        compatible = "realtek,rtl8380-gpio", "realtek,otto-gpio";
> +        reg = <0x3500 0x1c>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <24>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupt-parent = <&rtlintc>;
> +        interrupts = <23>;
> +      };
> +
> +...
> -- 
> 2.30.2
> 
