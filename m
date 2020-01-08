Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2DD1343DC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 14:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgAHNcW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 08:32:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:60866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbgAHNcW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 08:32:22 -0500
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41CB12075D;
        Wed,  8 Jan 2020 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578490341;
        bh=VcONW9GbuCF27LwlMLUJpVLQ8pUaOf/yKfcR06idb6s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cMUCzkHH8l69mwaD/nGw6sTeAPM/t7+SZ0DWD9HEhadZWciK8PWrPMnOBJ/YG07rM
         4Qi5s3ehGDQ5g0pmvTff+LLB7gzxmnWMfgl2/HAFc0Fu8EZCjWDb0IT+PY0ISi1PUl
         dH7Be++a9SXd9KyBbptOcqVjAmZuu/9QpsYKVtns=
Received: by mail-qk1-f172.google.com with SMTP id x129so2564556qke.8;
        Wed, 08 Jan 2020 05:32:21 -0800 (PST)
X-Gm-Message-State: APjAAAVlvECZlEMHStffgvcUr3u2FcPXXyANvnINck2O5eFcT9emw5Qf
        MwHUVnYjJ4lQq4YGTKx/2SfgcaFZSXzODPwZUA==
X-Google-Smtp-Source: APXvYqz/X1U8NMj3Iv076A9wnrKOXCNBeZWJV5pvd1/KUv6bNiJ2ND6vyZmndtFtfAcLrrZTlGQcEo1+jY2bafbAvCs=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr4263840qke.393.1578490340276;
 Wed, 08 Jan 2020 05:32:20 -0800 (PST)
MIME-Version: 1.0
References: <1578302992-5723-1-git-send-email-Anson.Huang@nxp.com>
 <20200106221246.GA17055@bogus> <DB3PR0402MB39161890A510346EBA8EF881F53F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB39161890A510346EBA8EF881F53F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 8 Jan 2020 07:32:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLn8F2aoYgnTpd+k0JEbpC_Aq-AVpj=niM4w591qjRhfg@mail.gmail.com>
Message-ID: <CAL_JsqLn8F2aoYgnTpd+k0JEbpC_Aq-AVpj=niM4w591qjRhfg@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MP
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "maxime@cerno.tech" <maxime@cerno.tech>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 12:01 AM Anson Huang <anson.huang@nxp.com> wrote:
>
> Hi, Rob
>
> > Subject: Re: [PATCH V3 1/3] dt-bindings: imx: Add pinctrl binding doc for
> > i.MX8MP
> >
> > On Mon, Jan 06, 2020 at 05:29:50PM +0800, Anson Huang wrote:
> > > Add binding doc for i.MX8MP pinctrl driver.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> > > ---
> > > Changes since V2:
> > >     - use DT schema instead of txt for binding doc.
> > > ---
> > >  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml       |  65 ++
> > >  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     | 931
> > +++++++++++++++++++++
> > >  2 files changed, 996 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
> > > new file mode 100644
> > > index 0000000..cdb6c21
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yam
> > > +++ l
> > > @@ -0,0 +1,65 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later %YAML 1.2
> > > +---
> > > +$id:
> > > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > > +cetree.org%2Fschemas%2Fpinctrl%2Ffsl%2Cimx8mp-
> > pinctrl.yaml%23&amp;dat
> > >
> > +a=02%7C01%7Canson.huang%40nxp.com%7Cfacd4426e6e54bc5416b08d79
> > 2f59319%
> > >
> > +7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63713945576195750
> > 5&amp;s
> > >
> > +data=0O3w1U6vs9xVq6B%2BhyT4Nz5HdKuk6XDymPUg7wQy0lM%3D&amp;
> > reserved=0
> > > +$schema:
> > > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > > +cetree.org%2Fmeta-
> > schemas%2Fcore.yaml%23&amp;data=02%7C01%7Canson.hua
> > >
> > +ng%40nxp.com%7Cfacd4426e6e54bc5416b08d792f59319%7C686ea1d3bc2b
> > 4c6fa92
> > >
> > +cd99c5c301635%7C0%7C0%7C637139455761957505&amp;sdata=XUN%2BG
> > zMOqpVNRj
> > > +UM1CO6CXPOMT72DtdefLs%2Bs%2BGPaGI%3D&amp;reserved=0
> > > +
> > > +title: Freescale IMX8MP IOMUX Controller
> > > +
> > > +maintainers:
> > > +  - Anson Huang <Anson.Huang@nxp.com>
> > > +
> > > +description:
> > > +  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in
> > > +this directory
> > > +  for common binding part and usage.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: fsl,imx8mp-iomuxc
> > > +
> > > +# Client device subnode's properties
> > > +patternProperties:
> > > +  '-grp$':
> > > +    type: object
> > > +    description:
> > > +      Pinctrl node's client devices use subnodes for desired pin configuration.
> > > +      Client device subnodes use below standard properties.
> > > +
> > > +    properties:
> > > +      fsl,pins:
> > > +        $ref: /schemas/types.yaml#/definitions/string
> >
> > string or...
> >
> > > +        description:
> > > +          each entry consists of 6 integers and represents the mux
> > > + and config
> >
> > integers?
>
> I think it should be uint32-array
>
> >
> > > +          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
> > > +          mux_val input_val> are specified using a PIN_FUNC_ID macro, which
> > can
> > > +          be found in <arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h>.
> > The last
> > > +          integer CONFIG is the pad setting value like pull-up on this pin.
> > Please
> > > +          refer to i.MX8M Plus Reference Manual for detailed CONFIG settings.
> > > +
> > > +    required:
> > > +      - fsl,pins
> > > +
> > > +    additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  # Pinmux controller node
> > > +  - |
> > > +    iomuxc: pinctrl@30330000 {
> > > +        compatible = "fsl,imx8mp-iomuxc";
> > > +        reg = <0x30330000 0x10000>;
> > > +
> > > +        pinctrl_uart2: uart2grp {
> > > +            fsl,pins = <
> > > +                MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX       0x49
> > > +                MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX       0x49
> >
> > Run 'make dt_binding_check'. Doesn't build:
> >
> > Error: Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-
> > pinctrl.example.dts:23.21-22 syntax error FATAL ERROR: Unable to parse
> > input tree
>
> I fix it by NOT using Macro Definition as below, but still have some build error which looks like
> my environment issue, please help review V4, thanks.
>
>              fsl,pins = <
>                  0x228 0x488 0x5F0 0x0 0x6       0x49
>                  0x228 0x488 0x000 0x0 0x0       0x49
>              >;
>
>
>   CHKDT   Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
>   DTC     Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.example.dt.yaml
> FATAL ERROR: Unknown output format "yaml"

You need dtc built with yaml enabled. Make sure you have libyaml,
libyaml-dev and pkg-config.

Rob
