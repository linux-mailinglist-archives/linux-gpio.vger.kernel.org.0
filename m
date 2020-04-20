Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0050D1B15C7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2020 21:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgDTTTp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Apr 2020 15:19:45 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40286 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgDTTTo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Apr 2020 15:19:44 -0400
Received: by mail-oi1-f193.google.com with SMTP id t199so9853125oif.7;
        Mon, 20 Apr 2020 12:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m49dvApWhU3KhcyzujKNwqVJs/SgDVOiHkBTX8p3UsA=;
        b=fPr6IxNqM++7gizqUYJNavGAop2Xhxm7D74CJDy4ths/lj9475tSr1c+CMHzHpf/VR
         iCAMOpW1i9qKzdYlgAP6qqoO3eGmskpBhwvkOuu8EPmtEcjyUsnKAf8iUOFEVbxt1gxr
         ZwVS5Qv8NIoxfG3qL+QCd8VZgbLpn0Zq7wI8X4FUtSzW16FXLPPwqsp1jn3auygwCrmv
         YPf/Riua4A8h4OrZFmVu4zWfEBWo2nxLO+9mFMp1VlGT8P4FcCdz+nsFRPrPQCiHi4vb
         uqIY4u9NIuC/4z2nBO5if37qop7nJOLhAEPSiL+enQOxcQX1sTgrrO3MxfBOqkn10lAb
         RDXQ==
X-Gm-Message-State: AGi0PuazhoZvW1bXBPqFDkE2VKL1VPy+UGGb7RW0qh3t9yC9ajwIJkTm
        0uvL8V6PyXlcz3EijVySOw==
X-Google-Smtp-Source: APiQypI1tu9WWN3GJQtf/Egn/TvM3KKQj1/YfMtUGLJE64jxb1gypfLgp3KOVUkdTuGeoCxmSDcrIw==
X-Received: by 2002:aca:4d47:: with SMTP id a68mr739207oib.60.1587410383533;
        Mon, 20 Apr 2020 12:19:43 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k26sm143306ots.3.2020.04.20.12.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 12:19:42 -0700 (PDT)
Received: (nullmailer pid 9370 invoked by uid 1000);
        Mon, 20 Apr 2020 19:19:41 -0000
Date:   Mon, 20 Apr 2020 14:19:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] dt-bindings: gpio: Convert i.MX to json-schema
Message-ID: <20200420191941.GA6101@bogus>
References: <1586770849-15693-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586770849-15693-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 13, 2020 at 05:40:49PM +0800, Anson Huang wrote:
> Convert the i.MX GPIO binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/fsl-imx-gpio.txt      | 35 -----------
>  .../devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 72 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
> deleted file mode 100644
> index b4cd9f90..0000000
> --- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -* Freescale i.MX/MXC GPIO controller
> -
> -Required properties:
> -- compatible : Should be "fsl,<soc>-gpio"
> -- reg : Address and length of the register set for the device
> -- interrupts : Should be the port interrupt shared by all 32 pins, if
> -  one number.  If two numbers, the first one is the interrupt shared
> -  by low 16 pins and the second one is for high 16 pins.
> -- gpio-controller : Marks the device node as a gpio controller.
> -- #gpio-cells : Should be two.  The first cell is the pin number and
> -  the second cell is used to specify the gpio polarity:
> -      0 = active high
> -      1 = active low
> -- interrupt-controller: Marks the device node as an interrupt controller.
> -- #interrupt-cells : Should be 2.  The first cell is the GPIO number.
> -  The second cell bits[3:0] is used to specify trigger type and level flags:
> -      1 = low-to-high edge triggered.
> -      2 = high-to-low edge triggered.
> -      4 = active high level-sensitive.
> -      8 = active low level-sensitive.
> -
> -Optional properties:
> -- clocks: the clock for clocking the GPIO silicon
> -
> -Example:
> -
> -gpio0: gpio@73f84000 {
> -	compatible = "fsl,imx51-gpio", "fsl,imx35-gpio";
> -	reg = <0x73f84000 0x4000>;
> -	interrupts = <50 51>;
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	interrupt-controller;
> -	#interrupt-cells = <2>;
> -};
> diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> new file mode 100644
> index 0000000..465104c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX/MXC GPIO controller
> +
> +maintainers:
> +  - Anson Huang <Anson.Huang@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx1-gpio
> +              - fsl,imx21-gpio
> +              - fsl,imx31-gpio
> +              - fsl,imx35-gpio
> +              - fsl,imx7d-gpio

compatible:
  enum:
    - fsl,imx1-gpio
    - fsl,imx21-gpio
    - fsl,imx31-gpio
    - fsl,imx35-gpio
    - fsl,imx7d-gpio

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      Should be the port interrupt shared by all 32 pins, if one number.
> +      If two numbers, the first one is the interrupt shared by low 16 pins
> +      and the second one is for high 16 pins.
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  clocks:
> +    description: |
> +      The clock for clocking the GPIO silicon.

Can drop.

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
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio0: gpio@73f84000 {
> +        compatible = "fsl,imx35-gpio";
> +        reg = <0x73f84000 0x4000>;
> +        interrupts = <50 51>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +    };
> +
> +...
> -- 
> 2.7.4
> 
