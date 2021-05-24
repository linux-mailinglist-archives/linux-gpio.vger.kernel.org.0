Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E7638F619
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 01:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbhEXXLM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 19:11:12 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:39492 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhEXXLL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 19:11:11 -0400
Received: by mail-ot1-f41.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so26820435otc.6;
        Mon, 24 May 2021 16:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zy+xaGSzgXVDvfoIrRWXUApvnE1J95ineuQvimdMgw0=;
        b=JFS8CPcaViPUOccaienivGjEYSm9u7hzF3Wt7VKBL+va3GlQMxgbmAHZ47+vDBNY2N
         vOJaOrNxE/yrNzZ8eNwWjTRxQqevWjqquBk6kzKAWihj5soBfpmFd4z7Af2pc6k8wzqp
         9tGYBT8ALYJPyapSVmIKYKPp4lBUb/tQ5YGz3i8n8NqpGr+5o4lvmB4UYpu0H4NqoUAO
         MruiYmkLyf52l8+MqfjFow4BeUcoKYhDFHcPeyIC3gU0RsEXVgAfLhNGrDUkuLkXniK5
         LXVQM3+Xq41Xw1+/8W6n0FajoJTVFfku0ZC16jEHYUxYraXljh1FMnDwhKluizjjCb+e
         LpCA==
X-Gm-Message-State: AOAM530cCPO3B9BiRvKVICvuGZ1eoICD6WeyfVyVMQoYgeK4ics1dtvM
        qDuePfT3CAU0iOB6wbxqhw==
X-Google-Smtp-Source: ABdhPJzOlGkAXDJe63egp6V+xFh14iajGmyJWMV13rKdTzwI/UEFBiu4JxN7PM65T3lm2E+6upodyQ==
X-Received: by 2002:a05:6830:114f:: with SMTP id x15mr8146521otq.14.1621897781717;
        Mon, 24 May 2021 16:09:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t23sm2879066oij.21.2021.05.24.16.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 16:09:41 -0700 (PDT)
Received: (nullmailer pid 1357930 invoked by uid 1000);
        Mon, 24 May 2021 23:09:40 -0000
Date:   Mon, 24 May 2021 18:09:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        lee.jones@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <20210524230940.GA1350504@robh.at.kernel.org>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524120539.3267145-3-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> Add binding documents for the Delta TN48M CPLD drivers.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Implement MFD as a simple I2C MFD
> * Add GPIO bindings as separate

I don't understand why this changed. This doesn't look like an MFD to 
me. Make your binding complete if there are missing functions. 
Otherwise, stick with what I already ok'ed.

> 
>  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 ++++++++++
>  .../bindings/mfd/delta,tn48m-cpld.yaml        | 81 +++++++++++++++++++
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> new file mode 100644
> index 000000000000..aca646aecb12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> @@ -0,0 +1,42 @@
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
> +  GPIO controller module provides GPIO-s for the SFP slots.
> +  It is split into 3 controllers, one output only for the SFP TX disable
> +  pins, one input only for the SFP present pins and one input only for
> +  the SFP LOS pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - delta,tn48m-gpio-sfp-tx-disable
> +      - delta,tn48m-gpio-sfp-present
> +      - delta,tn48m-gpio-sfp-los

The function of the 'general purpose' IO should not be encoded into the 
compatible name. Is each instance.

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
> index 000000000000..055e09129f86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> @@ -0,0 +1,81 @@
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
> +  It is also being used as a GPIO expander for the SFP slots.
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
> +                compatible = "delta,tn48m-gpio-sfp-tx-disable";
> +                reg = <0x31>;

Encode the register address into the gpio cells.

> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            gpio@3a {
> +                compatible = "delta,tn48m-gpio-sfp-present";
> +                reg = <0x3a>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +
> +            gpio@40 {
> +                compatible = "delta,tn48m-gpio-sfp-los";
> +                reg = <0x40>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +            };
> +        };
> +    };
> -- 
> 2.31.1
> 
