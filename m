Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA19A2D5138
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbgLJDQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:16:30 -0500
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:44522 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728657AbgLJDQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:16:29 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 0BA3EOED004470; Thu, 10 Dec 2020 12:14:24 +0900
X-Iguazu-Qid: 34tr90iprcJs0CvEWH
X-Iguazu-QSIG: v=2; s=0; t=1607570064; q=34tr90iprcJs0CvEWH; m=MGTkGpPCR33awQ5e9q1fuXNGZmOlO+ll14kQslt2LHE=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1511) id 0BA3ENHo028729;
        Thu, 10 Dec 2020 12:14:23 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0BA3ENt1005878;
        Thu, 10 Dec 2020 12:14:23 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0BA3ENYq008224;
        Thu, 10 Dec 2020 12:14:23 +0900
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
Date:   Thu, 10 Dec 2020 12:14:22 +0900
In-Reply-To: <20201201181406.2371881-2-nobuhiro1.iwamatsu@toshiba.co.jp>
        (Nobuhiro Iwamatsu's message of "Wed, 2 Dec 2020 03:14:03 +0900")
X-TSB-HOP: ON
Message-ID: <87mtym2vzl.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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

FWIW,

Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Thanks,
Punit
