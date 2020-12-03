Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445242CD13F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 09:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388221AbgLCIZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 03:25:44 -0500
Received: from mo-csw-fb1116.securemx.jp ([210.130.202.175]:41170 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387620AbgLCIZn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 03:25:43 -0500
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Dec 2020 03:25:41 EST
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 0B38J5Uf031051; Thu, 3 Dec 2020 17:19:05 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 0B38GtsC030349; Thu, 3 Dec 2020 17:16:55 +0900
X-Iguazu-Qid: 2wHHO7WlUUsYyHhPnC
X-Iguazu-QSIG: v=2; s=0; t=1606983414; q=2wHHO7WlUUsYyHhPnC; m=esrYAEcl8iFwxarpR4rmTqyCBxWwvF3ZB9Rezqxt6L4=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1110) id 0B38GrpO000301;
        Thu, 3 Dec 2020 17:16:54 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0B38GrWo002495;
        Thu, 3 Dec 2020 17:16:53 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0B38Grch028118;
        Thu, 3 Dec 2020 17:16:53 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
        <20201201181406.2371881-2-nobuhiro1.iwamatsu@toshiba.co.jp>
Date:   Thu, 03 Dec 2020 17:16:51 +0900
In-Reply-To: <20201201181406.2371881-2-nobuhiro1.iwamatsu@toshiba.co.jp>
        (Nobuhiro Iwamatsu's message of "Wed, 2 Dec 2020 03:14:03 +0900")
X-TSB-HOP: ON
Message-ID: <87sg8n483w.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Iwamatsu-san,

Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:

> Add bindings for the Toshiba Visconti GPIO Controller.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  .../bindings/gpio/toshiba,gpio-visconti.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> new file mode 100644
> index 000000000000..5168a15b90e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/toshiba,gpio-visconti.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti ARM SoCs GPIO controller
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: toshiba,gpio-tmpv7708
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges: true

I am not sure I have a good handle on the yaml schema definitions but
"gpio-ranges" feels like it should be a list of ranges not a boolean.

Something like -

    gpio-ranges:
      maxItems: 1

feels more appropriate.

I see both the usages in gpio bindings and for other range properties so
maybe it's OK. I hope Rob or somebody more knowledgeable on this can
clarify the usage.

Otherwise, the patch looks good.

Thanks,
Punit

> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupts:
> +    description:
> +      interrupt mapping one per GPIO.
> +    minItems: 16
> +    maxItems: 16
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - gpio-controller
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/interrupt-controller/irq.h>
> +      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +      soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        gpio: gpio@28020000 {
> +          compatible = "toshiba,gpio-tmpv7708";
> +          reg = <0 0x28020000 0 0x1000>;
> +          #gpio-cells = <0x2>;
> +          gpio-ranges = <&pmux 0 0 32>;
> +          gpio-controller;
> +          interrupt-controller;
> +          #interrupt-cells = <2>;
> +          interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +      };
> +...
