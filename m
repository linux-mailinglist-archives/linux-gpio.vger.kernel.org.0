Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67C43A8CD8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 01:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhFOXsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Jun 2021 19:48:08 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:36549 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhFOXsI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Jun 2021 19:48:08 -0400
Received: by mail-il1-f176.google.com with SMTP id i13so716595ilk.3;
        Tue, 15 Jun 2021 16:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IxoqOsNJ75k0GQHgGLPCm6Z9fqv9YPGeM9uGjBR2SB4=;
        b=WN3jxWZU+oyLqxOTydXfDY4BRbxCN2tbaVighxC7fGuPJjNP6cI/m0i0BTLEH5zRLQ
         GKCQcXsD4JvbwV3p3s7kIIGy4iXPM0RIxEXb2ptZ+M1+66VWQwRvA2W876EidqofBv9N
         xht2mQrUk8AnI7FSVqv9u5X85n1Wy8vNVS/B0A6LC03f/vcsq+0N3vlboCaNak1NahTh
         vkTZM8/pTa8A3xbWdnNfyQ2MMcJ+V8q2ZzQng0PSm0eSca0ZDrlfgK/17umjZvw3jMs7
         yE3cYcLEl+M/GfTzZbLuXquhvQzAR8M47LGpis0W9ZHy3xk5O/qd+6ZEck4LFygZAVlM
         A1Wg==
X-Gm-Message-State: AOAM533Nh//yU6xpEo71LSYg/zsYHs+LFB6bPGKJasgnDzkPJxwS3BLb
        CNoRGDZtQe6O/qpzv/oz8g==
X-Google-Smtp-Source: ABdhPJwuLO4eZtDNH6Y/srXAR52sBRbuH205MCodrCXRe0YEbNTnncPBeANZ6HBMpV1t3jMhr2/EAQ==
X-Received: by 2002:a05:6e02:1207:: with SMTP id a7mr1439702ilq.91.1623800762073;
        Tue, 15 Jun 2021 16:46:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b23sm298811ior.4.2021.06.15.16.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:46:01 -0700 (PDT)
Received: (nullmailer pid 1687930 invoked by uid 1000);
        Tue, 15 Jun 2021 23:45:58 -0000
Date:   Tue, 15 Jun 2021 17:45:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
Message-ID: <20210615234558.GA1684841@robh.at.kernel.org>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-5-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602120329.2444672-5-j.neuschaefer@gmx.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 02, 2021 at 02:03:25PM +0200, Jonathan Neusch�fer wrote:
> This binding is heavily based on the one for NPCM7xx, because the
> hardware is similar. One notable difference is that there are no
> sub-nodes for GPIO banks, because the GPIO registers are arranged
> differently.
> 
> Certain pins support blink patterns in hardware. This is currently not
> modelled in the DT binding.
> 
> Signed-off-by: Jonathan Neusch�fer <j.neuschaefer@gmx.net>
> ---
>  .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> new file mode 100644
> index 0000000000000..0664fe2b90db6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nuvoton,wpcm450-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton WPCM450 pin control and GPIO
> +
> +maintainers:
> +  - Jonathan Neusch�fer <j.neuschaefer@gmx.net>
> +
> +properties:
> +  compatible:
> +    const: "nuvoton,wpcm450-pinctrl"

Don't need quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupts: true
> +
> +patternProperties:
> +  # There are two kinds of subnodes:
> +  # 1. a pinmux node configures pin muxing for a group of pins (e.g. rmii2)
> +  # 2. a pinctrl node configures properties of a single pin
> +  "^.*$":
> +    if:
> +      type: object
> +    then:

Don't do this hack for new bindings. Pick a node name pattern you can 
match on.

> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +      properties:
> +        groups:
> +          description:
> +            One or more groups of pins to mux to a certain function
> +          minItems: 1
> +          items:
> +            enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, bsp,
> +                    hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo,
> +                    clko, smi, uinc, gspi, mben, xcs2, xcs1, sdio, sspi, fi0,
> +                    fi1, fi2, fi3, fi4, fi5, fi6, fi7, fi8, fi9, fi10, fi11,
> +                    fi12, fi13, fi14, fi15, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5,
> +                    pwm6, pwm7, hg0, hg1, hg2, hg3, hg4, hg5, hg6, hg7 ]
> +        function:
> +          description:
> +            The function that a group of pins is muxed to
> +          enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, bsp,
> +                  hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo0,
> +                  dvo1, dvo2, dvo3, dvo4, dvo5, dvo6, dvo7, clko, smi, uinc,
> +                  gspi, mben, xcs2, xcs1, sdio, sspi, fi0, fi1, fi2, fi3, fi4,
> +                  fi5, fi6, fi7, fi8, fi9, fi10, fi11, fi12, fi13, fi14, fi15,
> +                  pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, pwm6, pwm7, hg0, hg1,
> +                  hg2, hg3, hg4, hg5, hg6, hg7 ]
> +
> +        pins:
> +          description:
> +            A list of pins to configure in certain ways, such as enabling
> +            debouncing
> +          minItems: 1
> +          items:
> +            enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
> +                    gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
> +                    gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
> +                    gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gpio28,
> +                    gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> +                    gpio36, gpio37, gpio38, gpio39, gpio40, gpio41, gpio42,
> +                    gpio43, gpio44, gpio45, gpio46, gpio47, gpio48, gpio49,
> +                    gpio50, gpio51, gpio52, gpio53, gpio54, gpio55, gpio56,
> +                    gpio57, gpio58, gpio59, gpio60, gpio61, gpio62, gpio63,
> +                    gpio64, gpio65, gpio66, gpio67, gpio68, gpio69, gpio70,
> +                    gpio71, gpio72, gpio73, gpio74, gpio75, gpio76, gpio77,
> +                    gpio78, gpio79, gpio80, gpio81, gpio82, gpio83, gpio84,
> +                    gpio85, gpio86, gpio87, gpio88, gpio89, gpio90, gpio91,
> +                    gpio92, gpio93, gpio94, gpio95, gpio96, gpio97, gpio98,
> +                    gpio99, gpio100, gpio101, gpio102, gpio103, gpio104,
> +                    gpio105, gpio106, gpio107, gpio108, gpio109, gpio110,
> +                    gpio111, gpio112, gpio113, gpio114, gpio115, gpio116,
> +                    gpio117, gpio118, gpio119, gpio120, gpio121, gpio122,
> +                    gpio123, gpio124, gpio125, gpio126, gpio127 ]
> +
> +        input-debounce: true
> +        phandle: true

Needing this should be fixed now.

> +
> +      dependencies:
> +        groups: [ function ]
> +        function: [ groups ]
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    pinctrl: pinctrl@b8003000 {
> +      compatible = "nuvoton,wpcm450-pinctrl";
> +      reg = <0xb8003000 0x1000>;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      interrupts = <2 IRQ_TYPE_LEVEL_HIGH
> +                    3 IRQ_TYPE_LEVEL_HIGH
> +                    4 IRQ_TYPE_LEVEL_HIGH
> +                    5 IRQ_TYPE_LEVEL_HIGH>;
> +      rmii2 {
> +        groups = "rmii2";
> +        function = "rmii2";
> +      };
> +
> +      pinctrl_uid: uid {
> +        pins = "gpio14";
> +        input-debounce = <1>;
> +      };
> +    };
> +
> +    gpio-keys {
> +      compatible = "gpio-keys";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_uid>;
> +
> +      uid {
> +        label = "UID";
> +        linux,code = <102>;
> +        gpios = <&pinctrl 14 GPIO_ACTIVE_HIGH>;
> +      };
> +    };
> --
> 2.30.2
