Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097B626E530
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 21:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgIQTOm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 15:14:42 -0400
Received: from crapouillou.net ([89.234.176.41]:36240 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbgIQTNU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 15:13:20 -0400
X-Greylist: delayed 495 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 15:12:47 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1600369440; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L3OBK4G1Rvv8T0Xnqj3/8Lbig0kqsWBBjd0US1g/rPo=;
        b=dyOMV3sQSIuXwuaky8QYur2ywbBqBFDkh4I8lC8CviZwJ4xXUpL4z0HKUxmZFgT1wCRV+i
        lmglasQwXio0xAlmn9AwPeNsR0gejQ1N0ipvwaxZk7O7qZVgtm6UVhMbStHccEmV266mP4
        NNt/TuV+D6L8z9EtegHwMbZvBfl1a4o=
Date:   Thu, 17 Sep 2020 21:03:36 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 09/13] dt-bindings: pinctrl: include common schema in
 GPIO controllers
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        - <patches@opensource.cirrus.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Andy Teng <andy.teng@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sricharan R <sricharan@codeaurora.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Message-Id: <0YGTGQ.TCQDDTXFCWNX2@crapouillou.net>
In-Reply-To: <20200917165301.23100-10-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
        <20200917165301.23100-10-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,


Le jeu. 17 sept. 2020 =E0 18:52, Krzysztof Kozlowski <krzk@kernel.org> a=20
=E9crit :
> Include the common GPIO schema in GPIO controllers to be sure all=20
> common
> properties are properly validated.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>=20
> ---
>=20
> Changes since v1:
> 1. New patch
> ---
>  .../devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml      | 3=20
> +++
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml          | 1 +
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml          | 3=20
> +++
>  Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 3=20
> +++
>  .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml   | 3=20
> +++
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml  | 3=20
> +++
>  .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml      | 3=20
> +++
>  .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml      | 3=20
> +++
>  .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml       | 3=20
> +++
>  .../devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml      | 3=20
> +++
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3=20
> +++
>  11 files changed, 31 insertions(+)
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> index 33391d30c00c..51bfc214bba6 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> @@ -15,6 +15,9 @@ description: |
>    GPIO function selection & GPIO attributes configuration. Please=20
> refer to
>    pinctrl-bindings.txt in this directory for common binding part and=20
> usage.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: actions,s500-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml=20
> b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> index 7556be6e2754..55662f8d1f94 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> @@ -143,6 +143,7 @@ allOf:
>    # boards are defining it at the moment so it would generate a lot=20
> of
>    # warnings.
>=20
> +  - $ref: /schemas/gpio/gpio-common.yaml#
>    - if:
>        properties:
>          compatible:
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> index 420d74856032..ed478b0ed4cc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> @@ -31,6 +31,9 @@ description: |
>    This binding must be part of the Lochnagar MFD binding:
>      [4] ../mfd/cirrus,lochnagar.yaml
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      enum:
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> index 44c04d11ae4c..ffa64832b4f9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -59,6 +59,9 @@ properties:
>  patternProperties:
>    "^gpio@[0-9]$":
>      type: object
> +    allOf:
> +      - $ref: /schemas/gpio/gpio-common.yaml#
> +
>      properties:
>        compatible:
>          enum:
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index 152c151c27ad..7d0a4cb96f39 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -14,6 +14,9 @@ description: |+
>    required property:
>    - compatible: "syscon"
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: mediatek,mt6779-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> index 5556def6b99b..bc8bc0ac1926 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -12,6 +12,9 @@ maintainers:
>  description: |
>    The Mediatek's Pin controller is used to control SoC pins.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: mediatek,mt8192-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> index c64c93206817..22a6b80b4c0e 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found=20
> in the
>    IPQ6018 platform.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,ipq6018-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> index 1f0f5757f9e1..9855d859fe61 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found=20
> in the
>    MSM8226 platform.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,msm8226-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> index 8508c57522fd..e5757b6ced40 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found=20
> in the
>    SM8250 platform.
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,sm8250-pinctrl
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> index b7911a994f3a..4d7bf4340262 100644
> ---=20
> a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> +++=20
> b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> @@ -10,6 +10,9 @@ maintainers:
>    - Chris Brandt <chris.brandt@renesas.com>
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  description:
>    The Renesas SoCs of the RZ/A2 series feature a combined Pin and=20
> GPIO
>    controller.
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml=20
> b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 72877544ca78..28b861362ba0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -56,6 +56,9 @@ properties:
>  patternProperties:
>    '^gpio@[0-9a-f]*$':
>      type: object
> +    allOf:
> +      - $ref: /schemas/gpio/gpio-common.yaml#
> +
>      properties:
>        gpio-controller: true
>        '#gpio-cells':
> --
> 2.17.1
>=20


