Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBE226E649
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 22:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIQUKK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 16:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIQUKK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 16:10:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC040C06174A;
        Thu, 17 Sep 2020 13:10:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 361D6E42;
        Thu, 17 Sep 2020 22:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600373406;
        bh=4DMjAbU38sRZa4Hb+7uteuEdS1wnI9GFHiIgCUgEZ/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q0VtsHkhoUVlzTu7tNMMcMsFAPfpXoYMh4cRGn6MmDxvumEgpl8HoPhsaS9P5RQ0Y
         NVTFOFHBfusC0IIVq9IenTWY3skD0ldFuVOF8UWv0RFNF3NZ/lN8K6JSoJROzof6o8
         kv65KBP9KWCuIrAttiiUNKk2jIgT65ueP7LagMtc=
Date:   Thu, 17 Sep 2020 23:09:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
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
        Paul Cercueil <paul@crapouillou.net>,
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
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Message-ID: <20200917200936.GF3969@pendragon.ideasonboard.com>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200917165301.23100-2-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

Thank you for the patch.

On Thu, Sep 17, 2020 at 06:52:49PM +0200, Krzysztof Kozlowski wrote:
> Convert parts of gpio.txt bindings into common dtschema file for GPIO
> controllers.

How about deleting the part that has been converted from gpio.txt ?

> The schema enforces proper naming of GPIO controller nodes and GPIO
> hogs.
> 
> The schema should be included by specific GPIO controllers bindings.

Instead of including it manually, could we use a conditional select: to
apply the schema automatically when a gpio-controller property is
present ?

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Do not require compatible (some child nodes are gpio-controllers
>    without the compatible).
> ---
>  .../devicetree/bindings/gpio/gpio-common.yaml | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-common.yaml b/Documentation/devicetree/bindings/gpio/gpio-common.yaml
> new file mode 100644
> index 000000000000..af9f6c7feeec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-common.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common GPIO controller properties
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  nodename:
> +    pattern: "^(gpio-controller|gpio)(@[0-9a-f]+|-[0-9a-f]+)?$"
> +
> +  '#gpio-cells': true
> +  gpio-controller: true
> +  gpio-ranges: true
> +
> +  gpio-line-names:
> +    description: |
> +      Optionally, a GPIO controller may have a "gpio-line-names" property. This
> +      is an array of strings defining the names of the GPIO lines going out of
> +      the GPIO controller. This name should be the most meaningful producer
> +      name for the system, such as a rail name indicating the usage. Package
> +      names such as pin name are discouraged: such lines have opaque names
> +      (since they are by definition generic purpose) and such names are usually
> +      not very helpful.
> +
> +      For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are reasonable
> +      line names as they describe what the line is used for. "GPIO0" is not a
> +      good name to give to a GPIO line.
> +
> +      Placeholders are discouraged: rather use the "" (blank string) if the use
> +      of the GPIO line is undefined in your design. The names are assigned
> +      starting from line offset 0 from left to right from the passed array. An
> +      incomplete array (where the number of passed named are less than ngpios)
> +      will still be used up until the last provided valid line index.
> +
> +  gpio-reserved-ranges:
> +    description:
> +      Indicates the start and size of the GPIOs that can't be used.
> +
> +  ngpios:
> +    description: |
> +      Optionally, a GPIO controller may have a "ngpios" property. This property
> +      indicates the number of in-use slots of available slots for GPIOs. The
> +      typical example is something like this: the hardware register is 32 bits
> +      wide, but only 18 of the bits have a physical counterpart. The driver is
> +      generally written so that all 32 bits can be used, but the IP block is
> +      reused in a lot of designs, some using all 32 bits, some using 18 and
> +      some using 12. In this case, setting "ngpios = <18>;" informs the driver
> +      that only the first 18 GPIOs, at local offset 0 .. 17, are in use.
> +
> +      If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1,
> +      an additional set of tuples is needed to specify which GPIOs are
> +      unusable, with the gpio-reserved-ranges binding.
> +
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    description:
> +      The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> +      providing automatic GPIO request and configuration as part of the
> +      gpio-controller's driver probe function.
> +      Each GPIO hog definition is represented as a child node of the GPIO controller.
> +
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name:
> +        description:
> +          The GPIO label name. If not present the node name is used.
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +
> +    oneOf:
> +      - required:
> +          - input
> +      - required:
> +          - output-high
> +      - required:
> +          - output-low
> +
> +    additionalProperties: false
> +
> +required:
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +examples:
> +  - |
> +    gpio-controller@15000000 {
> +        compatible = "foo";
> +        reg = <0x15000000 0x1000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <18>;
> +        gpio-reserved-ranges = <0 4>, <12 2>;
> +        gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
> +                          "LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
> +                          "Row A", "Row B", "Row C", "Row D", "NMI button",
> +                          "poweroff", "reset";
> +    };
> +
> +  - |
> +    gpio-controller@1400 {
> +        compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        line-b-hog {
> +            gpio-hog;
> +            gpios = <6 0>;
> +            input;
> +            line-name = "foo-bar-gpio";
> +        };
> +    };

-- 
Regards,

Laurent Pinchart
