Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F260247773
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 21:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732774AbgHQTtC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 15:49:02 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46751 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732759AbgHQTsg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 15:48:36 -0400
Received: by mail-io1-f68.google.com with SMTP id a5so18755497ioa.13;
        Mon, 17 Aug 2020 12:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bdm5/ZmcCtO4pQ4ZrSWguZmoYjiaeTCpZkVV8TL8LsU=;
        b=r9kMy8Jfaqh2V4YRr4qoR5M5tj+uCxZyDooppGYZcyNDmu3xiOSUAYfI4ewLj2+3C0
         Pem0qGE0aNULEWzzgpLsM2mxhK4vMvTLwVbAawL8WFScMB87pPf1ZgI0SxBilfWm7Ju4
         OP8UbNRCwOU2BwAtT6iZBxsoJpW2fFOw83EM9oRQlWQ5Sd2vkDUgtBvp5LiJwKkiF+ey
         1+KUB1WjD58jtFq4IKqXmzumHmr4RTAymfFIcTr0aUPL04xJaoWvjUubq8KNzvWE8UiZ
         fzYnwqQg8uYNIGOj0Sx9JiEDDc9MjvsTz23X1XKy03VOqENCyScJW/bsVEcCBEGu1doj
         w6/g==
X-Gm-Message-State: AOAM533nNdgI3XGdImyeU3ixllPFR7JpA1jH04Dwg1fXISqjOled0mnM
        mFE1xAz/KNjNKhEVblcerQ==
X-Google-Smtp-Source: ABdhPJyfyXruHPGjAki+7394r3/dxKBEyv7eITP/FN8HsZFdQA7aixl1V94o+l9vMJ12nEnSRnNQ8g==
X-Received: by 2002:a5e:d514:: with SMTP id e20mr13501658iom.183.1597693714832;
        Mon, 17 Aug 2020 12:48:34 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id d12sm5500906ilq.34.2020.08.17.12.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 12:48:34 -0700 (PDT)
Received: (nullmailer pid 1435985 invoked by uid 1000);
        Mon, 17 Aug 2020 19:48:33 -0000
Date:   Mon, 17 Aug 2020 13:48:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: Add bindings for Toshiba
 Visconti TMPV7700 SoC
Message-ID: <20200817194833.GB1432385@bogus>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817014632.595898-2-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817014632.595898-2-nobuhiro1.iwamatsu@toshiba.co.jp>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 10:46:25AM +0900, Nobuhiro Iwamatsu wrote:
> Add pinctrl bindings for Toshiba Visconti TMPV7700 SoC series.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  .../pinctrl/toshiba,visconti-pinctrl.yaml     | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
> new file mode 100644
> index 000000000000..4009902cd396
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti TMPV770x pin mux/config controller
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +description:
> +  Toshiba's Visconti ARM SoC a pin mux/config controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - toshiba,tmpv7708-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  '^.*$':

For new bindings, please define something like '-pins$' for the pin 
nodes.

> +    if:
> +      type: object
> +    then:

Then we don't have to do this if/then.

This also needs a $ref to the common pinctrl schemas.

> +      properties:
> +        function:
> +          description:
> +            Function to mux.
> +          $ref: "/schemas/types.yaml#/definitions/string"
> +          enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
> +            spi0, spi1, spi2, spi3, spi4, spi5, spi6,
> +            uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]
> +
> +        groups:
> +          description:
> +            Name of the pin group to use for the functions.
> +          $ref: "/schemas/types.yaml#/definitions/string"
> +          enum: [i2c0_grp, i2c1_grp, i2c2_grp, i2c3_grp, i2c4_grp,
> +            i2c5_grp, i2c6_grp, i2c7_grp, i2c8_grp,
> +            spi0_grp, spi0_cs0_grp, spi0_cs1_grp, spi0_cs2_grp,
> +            spi1_grp, spi2_grp, spi3_grp, spi4_grp, spi5_grp, spi6_grp,
> +            uart0_grp, uart1_grp, uart2_grp, uart3_grp,
> +            pwm0_gpio4_grp, pwm0_gpio8_grp, pwm0_gpio12_grp,
> +            pwm0_gpio16_grp, pwm1_gpio5_grp, pwm1_gpio9_grp,
> +            pwm1_gpio13_grp, pwm1_gpio17_grp, pwm2_gpio6_grp,
> +            pwm2_gpio10_grp, pwm2_gpio14_grp, pwm2_gpio18_grp,
> +            pwm3_gpio7_grp, pwm3_gpio11_grp, pwm3_gpio15_grp,
> +            pwm3_gpio19_grp, pcmif_out_grp, pcmif_in_grp]
> +
> +        drive-strength:
> +          enum: [2, 4, 6, 8, 16, 24, 32]
> +          default: 2
> +          description:
> +            Selects the drive strength for the specified pins, in mA.
> +
> +        bias-pull-up: true
> +
> +        bias-pull-down: true
> +
> +        bias-disable: true
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    pmux: pmux@24190000 {
> +        compatible = "toshiba,tmpv7708-pinctrl";
> +        reg = <0 0x24190000 0 0x10000>;
> +
> +        spi_0: spi_0 {
> +                function = "spi0";
> +                groups = "spi0_grp";
> +        };
> +    };
> -- 
> 2.27.0
> 
