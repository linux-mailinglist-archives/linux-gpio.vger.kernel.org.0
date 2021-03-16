Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD8633DFAA
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 22:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhCPU7m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 16:59:42 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:42106 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbhCPU7J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Mar 2021 16:59:09 -0400
Received: by mail-il1-f175.google.com with SMTP id p10so14041573ils.9;
        Tue, 16 Mar 2021 13:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xsVrLqfFpXKxNuoRZpVin2JaTCzQFHIEf5rAhS0t1jc=;
        b=uetsiHxGzCvdaYcDnNwM426E+oETstT4wGVG20uUbnkIe7D8irE99guviaBuzu1qop
         8VpdYFyqyE+Rox4QFeyTisTf3wUMzme2dwJU53jlgYxXyEatzQ6554aNds4vrOvj/VXF
         Zp86DkyXGxYwbXJMJksq3zhm1oEhEYGUm9Z/PSHuUNnczMOgzy7wYQ68Wb2HhgVTATCl
         Hkwtb0ofmsCWhod3pMIeR6+qScT41Q6PT67to19Fujpjfegv7kcsSqibKzQ49Y8FaKbJ
         gcx9WXAcy+q64HGqrGbF8PH4kROMfX97eRuccDBRhi3Qs5rJb+KrnBA3dc3ns24ISwR3
         RC4A==
X-Gm-Message-State: AOAM530bLg52EzN9igKJdpwmaEhMF3mumtvywyL1FOHBQgUlUcGE2T8h
        32tWGiVIurdovJqahW7rfYPZjPkLtA==
X-Google-Smtp-Source: ABdhPJwrwf44s8a491QtBFCu7iMS7CHmGjuCHAa3ym10vpMY+nI/W/uVCU+NEjLTT1bOCf9Kk7E25w==
X-Received: by 2002:a92:4a0e:: with SMTP id m14mr5359432ilf.117.1615928349009;
        Tue, 16 Mar 2021 13:59:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id t9sm6303046ils.76.2021.03.16.13.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 13:59:08 -0700 (PDT)
Received: (nullmailer pid 3653740 invoked by uid 1000);
        Tue, 16 Mar 2021 20:59:05 -0000
Date:   Tue, 16 Mar 2021 14:59:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 05/22] dt-bindings: add BCM6328 pincontroller binding
 documentation
Message-ID: <20210316205905.GB3629500@robh.at.kernel.org>
References: <20210315114214.3096-1-noltari@gmail.com>
 <20210315114214.3096-6-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210315114214.3096-6-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 12:41:57PM +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in BCM6328 SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v7: add changes suggested by Rob Herring
>  v6: add changes suggested by Rob Herring
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
> 
>  .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
> new file mode 100644
> index 000000000000..e1ecdc578f32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
> @@ -0,0 +1,132 @@
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
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '^.*-pins$':

'-pins$' is equivalent.

> +    if:
> +      type: object
> +    then:

You don't need this if/then. This should be:

'-pins$':
  type: object
  $ref: pinmux-node.yaml#

  additionalProperties: false
  properties:
    ...

> +      properties:
> +        function:
> +          $ref: "pinmux-node.yaml#/properties/function"

Drop this as you need the $ref up a level.

> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie_clkreq,
> +                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
> +                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_host_port ]
> +
> +        pins:
> +          $ref: "pinmux-node.yaml#/properties/pins"
> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio19,
> +                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
> +                  usb_port1 ]
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@18 {
> +      compatible = "brcm,bcm6328-pinctrl";
> +      reg = <0x18 0x10>;
> +
> +      pinctrl_serial_led: serial_led-pins {
> +        pinctrl_serial_led_data: serial_led_data-pins {
> +          function = "serial_led_data";
> +          pins = "gpio6";
> +        };
> +
> +        pinctrl_serial_led_clk: serial_led_clk-pins {
> +          function = "serial_led_clk";
> +          pins = "gpio7";
> +        };
> +      };
> +
> +      pinctrl_inet_act_led: inet_act_led-pins {
> +        function = "inet_act_led";
> +        pins = "gpio11";
> +      };
> +
> +      pinctrl_pcie_clkreq: pcie_clkreq-pins {
> +        function = "pcie_clkreq";
> +        pins = "gpio16";
> +      };
> +
> +      pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
> +        function = "led";
> +        pins = "gpio17";
> +      };
> +
> +      pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
> +        function = "led";
> +        pins = "gpio18";
> +      };
> +
> +      pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
> +        function = "led";
> +        pins = "gpio19";
> +      };
> +
> +      pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
> +        function = "led";
> +        pins = "gpio20";
> +      };
> +
> +      pinctrl_ephy0_act_led: ephy0_act_led-pins {
> +        function = "ephy0_act_led";
> +        pins = "gpio25";
> +      };
> +
> +      pinctrl_ephy1_act_led: ephy1_act_led-pins {
> +        function = "ephy1_act_led";
> +        pins = "gpio26";
> +      };
> +
> +      pinctrl_ephy2_act_led: ephy2_act_led-pins {
> +        function = "ephy2_act_led";
> +        pins = "gpio27";
> +      };
> +
> +      pinctrl_ephy3_act_led: ephy3_act_led-pins {
> +        function = "ephy3_act_led";
> +        pins = "gpio28";
> +      };
> +
> +      pinctrl_hsspi_cs1: hsspi_cs1-pins {
> +        function = "hsspi_cs1";
> +        pins = "hsspi_cs1";
> +      };
> +
> +      pinctrl_usb_port1_device: usb_port1_device-pins {
> +        function = "usb_device_port";
> +        pins = "usb_port1";
> +      };
> +
> +      pinctrl_usb_port1_host: usb_port1_host-pins {
> +        function = "usb_host_port";
> +        pins = "usb_port1";
> +      };
> +    };
> -- 
> 2.20.1
> 
