Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A28F131B19
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 23:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgAFWMx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 17:12:53 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39253 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbgAFWMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 17:12:53 -0500
Received: by mail-oi1-f196.google.com with SMTP id a67so16986816oib.6
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2020 14:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CLp8AWOq/ppcpPg4zoNMmXmjnqf4+B8gtYz+J6bqL0A=;
        b=mlZwpUJucSxcNUf7rcgx0wAj2Akory1to4X4fXT3CYHttWYGB9T6U4O4mLlowEIhXc
         FF6NDhSBzhlAMDNNYUQCpbnTg2ZRBbu5kvc6BCw7NSoX272wqZLh9Swo95zxalF+zs+E
         dsO3HEqdgjeK9/b9PQCFxQS/o90Crv+QkcWJymkjVA5oakNxlk4VBSSqKy0/0TxKF0KK
         urnWvOi/RkWWOotlpMwX+/gMTDrJQv4auHuSYFe9g6VlFLh96YaT5/XspXwxzdTsyDNo
         lDZSaFj/DBD0A1X8SZn7jf+/9t8B0o5ea7wa9t5NwDwq4FevVsMlq6yJbdHScqbURuqE
         vMrA==
X-Gm-Message-State: APjAAAXKbVcGVrq/COBejgpUrVzcwkrXPfanSdLNYl24jSIfsN4h385k
        JRKNFbCzH1E/BV1n2bKXcdWX0/0=
X-Google-Smtp-Source: APXvYqzGpyekbkhCK33Y65qGjBZHE5wANGyTKjLmgZpFuVrEicsm/jAdfD38bY/BN3kSsxxqHvQScA==
X-Received: by 2002:aca:503:: with SMTP id 3mr6700878oif.106.1578348772013;
        Mon, 06 Jan 2020 14:12:52 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id q13sm3290428otc.5.2020.01.06.14.12.49
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 14:12:50 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 16:12:46 -0600
Date:   Mon, 6 Jan 2020 16:12:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        mark.rutland@arm.com, s.hauer@pengutronix.de,
        catalin.marinas@arm.com, will@kernel.org, abel.vesa@nxp.com,
        bjorn.andersson@linaro.org, olof@lixom.net, maxime@cerno.tech,
        leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V3 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MP
Message-ID: <20200106221246.GA17055@bogus>
References: <1578302992-5723-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578302992-5723-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 06, 2020 at 05:29:50PM +0800, Anson Huang wrote:
> Add binding doc for i.MX8MP pinctrl driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> ---
> Changes since V2:
> 	- use DT schema instead of txt for binding doc.
> ---
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml       |  65 ++
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     | 931 +++++++++++++++++++++
>  2 files changed, 996 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> new file mode 100644
> index 0000000..cdb6c21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/fsl,imx8mp-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale IMX8MP IOMUX Controller
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
> +    const: fsl,imx8mp-iomuxc
> +
> +# Client device subnode's properties
> +patternProperties:
> +  '-grp$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +
> +    properties:
> +      fsl,pins:
> +        $ref: /schemas/types.yaml#/definitions/string

string or...

> +        description:
> +          each entry consists of 6 integers and represents the mux and config

integers?

> +          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
> +          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
> +          be found in <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>. The last
> +          integer CONFIG is the pad setting value like pull-up on this pin. Please
> +          refer to i.MX8M Plus Reference Manual for detailed CONFIG settings.
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
> +        compatible = "fsl,imx8mp-iomuxc";
> +        reg = <0x30330000 0x10000>;
> +
> +        pinctrl_uart2: uart2grp {
> +            fsl,pins = <
> +                MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x49
> +                MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x49

Run 'make dt_binding_check'. Doesn't build:

Error: Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.example.dts:23.21-22 syntax error
FATAL ERROR: Unable to parse input tree

> +            >;
> +        };
> +    };
> +
> +...
