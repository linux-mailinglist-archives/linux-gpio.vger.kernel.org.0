Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2D0570DC9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jul 2022 01:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbiGKXDL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jul 2022 19:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbiGKXDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2022 19:03:09 -0400
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7235959273;
        Mon, 11 Jul 2022 16:03:08 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id y2so6320304ior.12;
        Mon, 11 Jul 2022 16:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AIqEbbvwO4CR2t0MNfvjagbJDIqVUXDz31pVBlugkUc=;
        b=X6pfxSvw3KhAyORQrd5B/+gtIZhemYQT54bR186pTXU6aBU0VipIMlxjlAWxTnmGJg
         PapovgE/+Fs12ZRPB+HU/PaeGgzbUmsBWxbS0nlYUxWjnzXdW1s4e04hDqELBDdri1Yo
         nCURt02VrkjPjypwRGwQQEZmC5vbK1NTwrKsBl14fJ+VpNCTf0xaTALb4lebvSYbTz+B
         jY0pkbFNLvyZ005yGnPoB/JkBqZnMLQrcgtyTefuQ5THG5IxAk4c+wrWnVS+eSSU9Jl1
         mBnFj2CrqKD5OEp9YC2tvWjnKNYSChqgLop9h/uUqeNADm5pk8GgcNWkx4VdU4BNsU6d
         5wZA==
X-Gm-Message-State: AJIora/7bu1RPLjp1bLJUK3+a264pncgynKPTPzOmaYs5ch1KbkhI6nA
        irichSRzZyNU1QpLpTzW2w==
X-Google-Smtp-Source: AGRyM1thfIXkf2ZjHF3Mr51rbeqVQcp/Tkq3ms6EWtElQZSbZRztqZROzqbUZU8C2v0qBHJz9Hg9Zw==
X-Received: by 2002:a05:6638:344d:b0:33f:1ce0:a87d with SMTP id q13-20020a056638344d00b0033f1ce0a87dmr11485772jav.21.1657580587726;
        Mon, 11 Jul 2022 16:03:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i10-20020a6bb80a000000b0067b75781af9sm4042328iof.37.2022.07.11.16.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 16:03:07 -0700 (PDT)
Received: (nullmailer pid 432983 invoked by uid 1000);
        Mon, 11 Jul 2022 23:03:05 -0000
Date:   Mon, 11 Jul 2022 17:03:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/10] dt-bindings: input: adp5588-keys: add bindings
Message-ID: <20220711230305.GA424857-robh@kernel.org>
References: <20220708093448.42617-1-nuno.sa@analog.com>
 <20220708093448.42617-6-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708093448.42617-6-nuno.sa@analog.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 11:34:43AM +0200, Nuno Sá wrote:
> Add device tree bindings for the adp5588-keys driver.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  .../bindings/input/adi,adp5588-keys.yaml      | 110 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml b/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
> new file mode 100644
> index 000000000000..c079af8a063d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/adi,adp5588-keys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADP5588 Keypad Controller
> +
> +maintainers:
> +  - Nuno Sá <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices Mobile I/O Expander and QWERTY Keypad Controller
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ADP5588.pdf
> +
> +allOf:
> +  - $ref: "/schemas/input/matrix-keymap.yaml#"
> +  - $ref: input.yaml#

Be consistent with paths and quotes. Don't need quotes. Use either full 
path or no path.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adp5588-keys
> +      - adi,adp5587-keys

'-keys' is redundant. The device doesn't do anything else. IOW, it's not 
sub-block of an SoC.

> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    description: Supply Voltage Input
> +
> +  reset-gpios:
> +    description:
> +      If specified, it will be asserted during driver probe. As the line is
> +      active low, it should be marked GPIO_ACTIVE_LOW.
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller:
> +    description:
> +      This property applies if either keypad,num-rows lower than 8 or
> +      keypad,num-columns lower than 10.
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupt-controller:
> +    description:
> +      This property applies if either keypad,num-rows lower than 8 or
> +      keypad,num-columns lower than 10.
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  adi,unlock-keys:
> +    description:
> +      Specifies a maximum of 2 keys that can be used to unlock the keypad.
> +      If this property is set, the keyboard will be locked and only unlocked
> +      after these keys are pressed. If only one key is set, a double click is
> +      needed to unlock the keypad.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - keypad,num-rows
> +  - keypad,num-columns
> +  - linux,keymap
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          adp5588@34 {
> +                  compatible = "adi,adp5588-keys";
> +                  reg = <0x34>;
> +
> +                  vcc-supply = <&vcc>;
> +                  interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
> +                  interrupt-parent = <&gpio>;
> +                  reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
> +
> +                  keypad,num-rows = <1>;
> +                  keypad,num-columns = <9>;
> +                  linux,keymap = <
> +                        MATRIX_KEY(0x00, 0x00, KEY_1)
> +                        MATRIX_KEY(0x00, 0x01, KEY_2)
> +                        MATRIX_KEY(0x00, 0x02, KEY_3)
> +                        MATRIX_KEY(0x00, 0x03, KEY_4)
> +                        MATRIX_KEY(0x00, 0x04, KEY_5)
> +                        MATRIX_KEY(0x00, 0x05, KEY_6)
> +                        MATRIX_KEY(0x00, 0x06, KEY_7)
> +                        MATRIX_KEY(0x00, 0x07, KEY_8)
> +                        MATRIX_KEY(0x00, 0x08, KEY_9)
> +                 >;
> +          };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41037cfd75fe..f9c09f0ed0d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -548,6 +548,7 @@ M:	Michael Hennerich <michael.hennerich@analog.com>
>  S:	Supported
>  W:	http://wiki.analog.com/ADP5588
>  W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
>  F:	drivers/input/keyboard/adp5588-keys.c
>  
>  ADP8860 BACKLIGHT DRIVER (ADP8860/ADP8861/ADP8863)
> -- 
> 2.37.0
> 
> 
