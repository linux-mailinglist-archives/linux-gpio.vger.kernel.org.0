Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E99465863
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 22:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244109AbhLAVgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 16:36:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243088AbhLAVgu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 16:36:50 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF71CC061748
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 13:33:29 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id z26so32738705iod.10
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Qp270mTJJmheLxOpx+/bI49+tvfHTmm4oUd49RduB0=;
        b=KgShW3yutE/e+kc9vCrnJ2375IXfRY+efDNYHGi9nPwASBMvodn/e6i85LHztWqG1K
         4GvRhny6OyeeYAIRQAjH9E82D5SA56VDRdVjhcb2RxkwMRg19pakXXCxj/F6sccro2CW
         q/lKfC3ThWviSQu2AgLmYqY8Rq0PAmAlJ5HHz74omoTv0GcWPUVaZGUlQXMRHSrFPH4o
         FVIGndhiV01ER8T6VQSHSKkPtctWjo/B343pLhr8jzjfpn26er8Rd6sisEwifc7kXoEc
         KiG0cwCpzOA3Cw65mt490tL7sqcTJvw68/yLLT4wj3DnwhjEw6mYKsVNXcC5MbzUobNv
         dl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Qp270mTJJmheLxOpx+/bI49+tvfHTmm4oUd49RduB0=;
        b=bbhq+QkIsoELxOQGyqvFzgvAgjDZUXS/08xw22czTU+g47/z7SD+kDYpHo3w1i/t0i
         TN66HdUAFXuDlnEmj0DFfxmxRdxVBZFqtxH2ib+wygNqQz2y5tg3S1jeWeE0Kp1ZaIXU
         KyfKpdEWD9b2Nipk780QpiiUEXncWto/ooTTOl6ht2AHy2QSh0PHRviQA+p047lcolSm
         Csk/VjOvV3Bi/H6Lb2pbfS+2lZRioflpvx/Ruqfo8dP64f7J7d3eZWuHMj5zmmygkktp
         p3zCe8+OowxWxP9dQJB4DBvwCAXADttRhwilTbcVSVS5Is2k6b1Eru0e9uVeqIYRZH2I
         L02Q==
X-Gm-Message-State: AOAM532YpuL9h0DcZBRp4UJb1JSKTUL/OiaStq5aHyko7vXeGwHSxvNd
        ttvdc/gyjMav1+dKokIcCIn69kGnSAbQ+36YoapRyQ==
X-Google-Smtp-Source: ABdhPJzaF/aKzWWLXooCG2LmHB5GbYAsO2NrBFMvag+s90HrFcD0l92L5rJS6x4O/JAfNY9D+tEDatN3dJF89ZXBj2k=
X-Received: by 2002:a05:6638:1506:: with SMTP id b6mr13774165jat.31.1638394409022;
 Wed, 01 Dec 2021 13:33:29 -0800 (PST)
MIME-Version: 1.0
References: <20211109113239.93493-1-robert.marko@sartura.hr> <20211109113239.93493-5-robert.marko@sartura.hr>
In-Reply-To: <20211109113239.93493-5-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 1 Dec 2021 22:33:18 +0100
Message-ID: <CA+HBbNEZ4Vu5UkE6F251LiY-LRa1YVemV71vHj=H6Rt2XEWuOA@mail.gmail.com>
Subject: Re: [PATCH v9 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>
Cc:     Luka Perkov <luka.perkov@sartura.hr>,
        Bruno Banelli <bruno.banelli@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 12:32 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Add binding documents for the Delta TN48M CPLD drivers.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v7:
> * Update bindings to reflect driver updates
>
> Changes in v3:
> * Include bindings for reset driver
>
> Changes in v2:
> * Implement MFD as a simple I2C MFD
> * Add GPIO bindings as separate
> ---
>  .../bindings/gpio/delta,tn48m-gpio.yaml       | 39 ++++++++
>  .../bindings/mfd/delta,tn48m-cpld.yaml        | 90 +++++++++++++++++++
>  .../bindings/reset/delta,tn48m-reset.yaml     | 35 ++++++++
>  3 files changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
>  create mode 100644 Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> new file mode 100644
> index 000000000000..e3e668a12091
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/delta,tn48m-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Delta Networks TN48M CPLD GPIO controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |
> +  This module is part of the Delta TN48M multi-function device. For more
> +  details see ../mfd/delta,tn48m-cpld.yaml.
> +
> +  Delta TN48M has an onboard Lattice CPLD that is used as an GPIO expander.
> +  It provides 12 pins in total, they are input-only or ouput-only type.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - delta,tn48m-gpo
> +      - delta,tn48m-gpi
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> new file mode 100644
> index 000000000000..f6967c1f6235
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/delta,tn48m-cpld.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Delta Networks TN48M CPLD controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |
> +  Lattice CPLD onboard the TN48M switches is used for system
> +  management.
> +
> +  It provides information about the hardware model, revision,
> +  PSU status etc.
> +
> +  It is also being used as a GPIO expander and reset controller
> +  for the switch MAC-s and other peripherals.
> +
> +properties:
> +  compatible:
> +    const: delta,tn48m-cpld
> +
> +  reg:
> +    description:
> +      I2C device address.
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +patternProperties:
> +  "^gpio(@[0-9a-f]+)?$":
> +    $ref: ../gpio/delta,tn48m-gpio.yaml
> +
> +  "^reset-controller?$":
> +    $ref: ../reset/delta,tn48m-reset.yaml
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cpld@41 {
> +            compatible = "delta,tn48m-cpld";
> +            reg = <0x41>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            gpio@31 {
> +                compatible = "delta,tn48m-gpo";
> +                reg = <0x31>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            gpio@3a {
> +                compatible = "delta,tn48m-gpi";
> +                reg = <0x3a>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            gpio@40 {
> +                compatible = "delta,tn48m-gpi";
> +                reg = <0x40>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            reset-controller {
> +              compatible = "delta,tn48m-reset";
> +              #reset-cells = <1>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
> new file mode 100644
> index 000000000000..0e5ee8decc0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/delta,tn48m-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Delta Networks TN48M CPLD reset controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +description: |
> +  This module is part of the Delta TN48M multi-function device. For more
> +  details see ../mfd/delta,tn48m-cpld.yaml.
> +
> +  Reset controller modules provides resets for the following:
> +  * 88F7040 SoC
> +  * 88F6820 SoC
> +  * 98DX3265 switch MAC-s
> +  * 88E1680 PHY-s
> +  * 88E1512 PHY
> +  * PoE PSE controller
> +
> +properties:
> +  compatible:
> +    const: delta,tn48m-reset
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - "#reset-cells"
> +
> +additionalProperties: false
> --
> 2.33.1
>

Rob, do you have any comments?
The rest of the series has been reviewed, so I would like to move forward.

Regards,
Robert
-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
