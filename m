Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358D61447CF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2020 23:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgAUWiK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jan 2020 17:38:10 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37864 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgAUWiK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jan 2020 17:38:10 -0500
Received: by mail-ot1-f66.google.com with SMTP id k14so4529103otn.4;
        Tue, 21 Jan 2020 14:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rCPpFo01LA0ufFxgslJygDyMKU7n29hE5cPSJPV/Tis=;
        b=OxUKNe9V7GuLMJ0jqODlCKNtsA1gBvm4xIaDzrrDODo3yfg/ATfFb4PDr973Isi+XZ
         1LWH5kbzYdjN3mHicl433V/TWgoM9+ywFjrLvQ3+9dyF81D8e4iKeWWBL/TrL6mj+3w/
         35EmkOGwVJG/LAdeJpnxl1WI8HIngXsF2Iv/EQRegFw/mCZXGE6w8uHXFq3GKXghR9JK
         agiUkFanhMzQMJc1cRm8f+kedvL4OrhdPJ1fXfCgnbE3Gu1HUMtBBlpbZBek/JmmlCLT
         Lz/Wh6Nqfqp8RXX/TaKy3V46dp+qUNJa7EtD6c37IuEgJvJN/nbT+QALhrFA+ZAY0jfP
         uXxg==
X-Gm-Message-State: APjAAAVxkno8VKFSimet1VUoQ8Z2MzhKiKeym3GjORch6mZy7yoDSkoL
        q105lOZMgDjWat7P9V1bPw==
X-Google-Smtp-Source: APXvYqxaMwA5tZhskkLIJL7NCltuCFOMNVxEM744Gs29VLJijpUh//35TuSNy4uUL26HFT1N/gjOsw==
X-Received: by 2002:a05:6830:1481:: with SMTP id s1mr5259732otq.66.1579646288799;
        Tue, 21 Jan 2020 14:38:08 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v14sm13967733oto.16.2020.01.21.14.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 14:38:08 -0800 (PST)
Received: (nullmailer pid 1428 invoked by uid 1000);
        Tue, 21 Jan 2020 22:38:07 -0000
Date:   Tue, 21 Jan 2020 16:38:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V3 1/3] dt-bindings: pinctrl: Convert i.MX8MQ to
 json-schema
Message-ID: <20200121223807.GA24850@bogus>
References: <1579051845-30378-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579051845-30378-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 15, 2020 at 09:30:43AM +0800, Anson Huang wrote:
> Convert the i.MX8MQ pinctrl binding to DT schema format using json-schema
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V2:
> 	- the lisence should be GPL-2.0.
> ---
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.txt        | 36 -----------
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml       | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> deleted file mode 100644
> index 66de750..0000000
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -* Freescale IMX8MQ IOMUX Controller
> -
> -Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> -for common binding part and usage.
> -
> -Required properties:
> -- compatible: "fsl,imx8mq-iomuxc"
> -- reg: should contain the base physical address and size of the iomuxc
> -  registers.
> -
> -Required properties in sub-nodes:
> -- fsl,pins: each entry consists of 6 integers and represents the mux and config
> -  setting for one pin.  The first 5 integers <mux_reg conf_reg input_reg mux_val
> -  input_val> are specified using a PIN_FUNC_ID macro, which can be found in
> -  imx8mq-pinfunc.h under device tree source folder.  The last integer CONFIG is
> -  the pad setting value like pull-up on this pin.  Please refer to i.MX8M Quad
> -  Reference Manual for detailed CONFIG settings.
> -
> -Examples:
> -
> -&uart1 {
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_uart1>;
> -};
> -
> -iomuxc: pinctrl@30330000 {
> -        compatible = "fsl,imx8mq-iomuxc";
> -        reg = <0x0 0x30330000 0x0 0x10000>;
> -
> -        pinctrl_uart1: uart1grp {
> -                fsl,pins = <
> -                        MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX             0x49
> -                        MX8MQ_IOMUXC_UART1_TXD_UART1_DCE_TX             0x49
> -                >;
> -        };
> -};
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> new file mode 100644
> index 0000000..e010808
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mq-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale IMX8MQ IOMUX Controller
> +
> +maintainers:
> +  - Anson Huang <Anson.Huang@nxp.com>
> +
> +description:
> +  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
> +  for common binding part and usage.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mq-iomuxc
> +
> +  reg:
> +    maxItems: 1
> +
> +# Client device subnode's properties
> +patternProperties:
> +  'grp$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      fsl,pins:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          each entry consists of 6 integers and represents the mux and config
> +          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
> +          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
> +          be found in <arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h>. The last
> +          integer CONFIG is the pad setting value like pull-up on this pin. Please
> +          refer to i.MX8M Quad Reference Manual for detailed CONFIG settings.

Based on the description, I think this should be an uint32-matrix type 
instead with a schema like this:

items:
  items:
    - description: mux_reg
    - description: conf_reg
    - description: input_reg
    - description: mux_val
    - description: input_val
    - description: pad setting

(With better descriptions preferrably)

The dts files should then be bracketed accordingly.
   
> +
> +    required:
> +      - fsl,pins
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    iomuxc: pinctrl@30330000 {
> +        compatible = "fsl,imx8mq-iomuxc";
> +        reg = <0x30330000 0x10000>;
> +
> +        pinctrl_uart1: uart1grp {
> +            fsl,pins = <
> +                0x234 0x49C 0x4F4 0x0 0x0	0x49
> +                0x238 0x4A0 0x4F4 0x0 0x0	0x49
> +            >;
> +        };
> +    };
> +
> +...
> -- 
> 2.7.4
> 
