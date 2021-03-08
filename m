Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C86331A5E
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 23:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHWpP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 17:45:15 -0500
Received: from mail-io1-f51.google.com ([209.85.166.51]:42901 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCHWpB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 17:45:01 -0500
Received: by mail-io1-f51.google.com with SMTP id u20so11784431iot.9;
        Mon, 08 Mar 2021 14:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lZgUQhRzAvx6dVNDN3Ys+ZgzhnR1xJquKzCwU/hFfN0=;
        b=Fb6NeClYaSZHkIGb6ULN/IMqyqOal6WhwsPRERpSPNoC9ulkfBF9ZcHnnzUjUz0AdU
         02HaRDtysTmWoGR4tHeL/NX9x/7nLvnHpvmGHHmzm1eJ7Qa1hd94TBzMIZinU10G0DLn
         EYE9YMzQCZbrMgEFOpFhzJZeShtVFilegfxas6ddbU8u2Aq+h+2pCw1vuamJ5VFy+snd
         aDi7lLrserJX0rppcPPuppXBzQMQ3g1uoDTn8OeerTiRx24Inbv46TpsUHMgRjdFkajo
         aEMalp6RVwc6G5OoGfJQBTP9k1XrFa2QD5x/8+OlQ+JFc6/NfzY8trQj6Y5RE2g8rmU3
         LvSg==
X-Gm-Message-State: AOAM532Ye79wgzA8cl+jQr2t131/r8tCYkjxSMZ9drAnEJJGn0lZVg8B
        9bX03HGsOdFD6v9ElDUpOg==
X-Google-Smtp-Source: ABdhPJwRkqUd1yGkV2KUlGFAmf+n59+RV3xMlmplsOHk7Xl4QS05wuAsSd7P1wxH+AEn2sCekgF1DA==
X-Received: by 2002:a05:6602:280f:: with SMTP id d15mr19614939ioe.127.1615243500936;
        Mon, 08 Mar 2021 14:45:00 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k12sm6778557ios.2.2021.03.08.14.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:45:00 -0800 (PST)
Received: (nullmailer pid 3087734 invoked by uid 1000);
        Mon, 08 Mar 2021 22:44:58 -0000
Date:   Mon, 8 Mar 2021 15:44:58 -0700
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 04/15] dt-bindings: add BCM6328 pincontroller binding
 documentation
Message-ID: <20210308224458.GA3077562@robh.at.kernel.org>
References: <20210306155712.4298-1-noltari@gmail.com>
 <20210306155712.4298-5-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210306155712.4298-5-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 06, 2021 at 04:57:01PM +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in BCM6328 SoCs.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
> 
>  .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 171 ++++++++++++++++++
>  1 file changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
> new file mode 100644
> index 000000000000..d4e3c7897f19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
> @@ -0,0 +1,171 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6328 pin controller
> +
> +maintainers:
> +  - Álvaro Fernández Rojas <noltari@gmail.com>
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +description: |+
> +  The pin controller node should be the child of a syscon node.
> +
> +  Refer to the the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm6328-pinctrl
> +
> +patternProperties:
> +  '^gpio$':

Not a pattern, move to 'properties'

> +    type: object
> +    properties:
> +      compatible:
> +        const: brcm,bcm6328-gpio
> +
> +      data:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Offset in the register map for the data register (in bytes).
> +
> +      dirout:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Offset in the register map for the dirout register (in bytes).
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +    required:
> +      - gpio-controller
> +      - gpio-ranges
> +      - '#gpio-cells'
> +
> +  '^.*$':
> +    if:
> +      type: object
> +    then:

Instead of this hack (which shouldn't work because 'gpio' is also a 
node), use some defined node name pattern (e.g. '-pins$')

You need an 'additionalProperties: false' at this level.

> +      properties:
> +        function:
> +          $ref: "/schemas/types.yaml#/definitions/string"

Reference the pinctrl schemas which define these properties.

> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie_clkreq,
> +                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
> +                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_host_port ]
> +
> +        pins:
> +          $ref: "/schemas/types.yaml#/definitions/string"
> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio19,
> +                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
> +                  usb_port1 ]
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio_cntl@10000080 {
> +      compatible = "syscon", "simple-mfd";

syscon needs a specific compatible for the SoC block.

What else is in this block besides pinctrl?

> +      reg = <0x10000080 0x80>;
> +
> +      pinctrl: pinctrl {
> +        compatible = "brcm,bcm6328-pinctrl";

Is there a register range of just pinctrl registers? If so, add 'reg' 
and define the sub-range.


> +
> +        gpio {
> +          compatible = "brcm,bcm6328-gpio";
> +          data = <0xc>;
> +          dirout = <0x4>;
> +
> +          gpio-controller;
> +          gpio-ranges = <&pinctrl 0 0 32>;
> +          #gpio-cells = <2>;
> +        };
> +
> +        pinctrl_serial_led: serial_led {
> +          pinctrl_serial_led_data: serial_led_data {
> +            function = "serial_led_data";
> +            pins = "gpio6";
> +          };
> +
> +          pinctrl_serial_led_clk: serial_led_clk {
> +            function = "serial_led_clk";
> +            pins = "gpio7";
> +          };
> +        };
> +
> +        pinctrl_inet_act_led: inet_act_led {
> +          function = "inet_act_led";
> +          pins = "gpio11";
> +        };
> +
> +        pinctrl_pcie_clkreq: pcie_clkreq {
> +          function = "pcie_clkreq";
> +          pins = "gpio16";
> +        };
> +
> +        pinctrl_ephy0_spd_led: ephy0_spd_led {
> +          function = "led";
> +          pins = "gpio17";
> +        };
> +
> +        pinctrl_ephy1_spd_led: ephy1_spd_led {
> +          function = "led";
> +          pins = "gpio18";
> +        };
> +
> +        pinctrl_ephy2_spd_led: ephy2_spd_led {
> +          function = "led";
> +          pins = "gpio19";
> +        };
> +
> +        pinctrl_ephy3_spd_led: ephy3_spd_led {
> +          function = "led";
> +          pins = "gpio20";
> +        };
> +
> +        pinctrl_ephy0_act_led: ephy0_act_led {
> +          function = "ephy0_act_led";
> +          pins = "gpio25";
> +        };
> +
> +        pinctrl_ephy1_act_led: ephy1_act_led {
> +          function = "ephy1_act_led";
> +          pins = "gpio26";
> +        };
> +
> +        pinctrl_ephy2_act_led: ephy2_act_led {
> +          function = "ephy2_act_led";
> +          pins = "gpio27";
> +        };
> +
> +        pinctrl_ephy3_act_led: ephy3_act_led {
> +          function = "ephy3_act_led";
> +          pins = "gpio28";
> +        };
> +
> +        pinctrl_hsspi_cs1: hsspi_cs1 {
> +          function = "hsspi_cs1";
> +          pins = "hsspi_cs1";
> +        };
> +
> +        pinctrl_usb_port1_device: usb_port1_device {
> +          function = "usb_device_port";
> +          pins = "usb_port1";
> +        };
> +
> +        pinctrl_usb_port1_host: usb_port1_host {
> +          function = "usb_host_port";
> +          pins = "usb_port1";
> +        };
> +      };
> +    };
> -- 
> 2.20.1
> 
