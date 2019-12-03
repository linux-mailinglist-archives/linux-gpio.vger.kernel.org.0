Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECA910F787
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 06:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfLCFvk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 00:51:40 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:6594 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfLCFvj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 00:51:39 -0500
IronPort-SDR: o/j+Ri+xO4fWTIVCdgPBUzjtzOJlOQ4wmggRu6QZca0TCBOkHqE4ZMckMY0XgpgEFCwVAkOZdJ
 zH0Di0t2eFwTMoCX5+Dmbv/B30Kz8UeQbcwSlJRrRyvBRAArhUElLv2NMKH+zppw4ZC7dOxlWK
 AOMf3uRfAIM2u7Wk4Qq86K3+6lV5vqjvPpzQSFfW8sP63eqIdEg5mIdaN5zTAybmjTxgYgnNgL
 KxJgiYocZbKXHSbByjv5bF9N1WRypaYrkWAm9RhI0RIYJkMYks64vQIn8f/LUTdW04Df3YiDyu
 xKI=
X-IronPort-AV: E=Sophos;i="5.69,272,1571731200"; 
   d="scan'208";a="45589731"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 02 Dec 2019 21:51:38 -0800
IronPort-SDR: i8krjONcTTsnPkHY7SRiGdPmITr+0xNAXFXEgjkJWTG1D1tRaDcT2sdw0OnXTIXhUqEDFgzvAR
 dttKo+ORd63AvM4to/DyzDuJF57oI5Vi7/iYpzrQEkc3xIqj3eJT457bxirU8BrDkuqz8apUvw
 JxXTyf13gnmnt2Ln1nepE0IY1Dr7ZC1/mxI+i6nWcNIcJmX2GgkCgi2Uo1v6wmGd1b+yqVAN9T
 0VLnn5Y5apijUzN7Hq0gIyZaQmf5LOaoYKcT6i2bJwuZAsOGE6Kp5TQMK0MgNeNdOFviPXHdfV
 l0k=
Subject: Re: [PATCH v3 4/7] dt-bindings: gpio: Add gpio-repeater bindings
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
CC:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-5-geert+renesas@glider.be>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <11ae473f-cee1-241b-174c-915dc46209b1@mentor.com>
Date:   Tue, 3 Dec 2019 11:21:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127084253.16356-5-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 27/11/19 2:12 PM, Geert Uytterhoeven wrote:
> Add Device Tree bindings for a GPIO repeater, with optional translation
> of physical signal properties.  This is useful for describing explicitly
> the presence of e.g. an inverter on a GPIO line, and was inspired by the
> non-YAML gpio-inverter bindings by Harish Jenny K N
> <harish_kandiga@mentor.com>[1].
>
> Note that this is different from a GPIO Nexus Node[2], which cannot do
> physical signal property translation.
>
> While an inverter can be described implicitly by exchanging the
> GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags, this has its limitations.
> Each GPIO line has only a single GPIO_ACTIVE_* flag, but applies to both
> th provider and consumer sides:
>   1. The GPIO provider (controller) looks at the flags to know the
>      polarity, so it can translate between logical (active/not active)
>      and physical (high/low) signal levels.
>   2. While the signal polarity is usually fixed on the GPIO consumer
>      side (e.g. an LED is tied to either the supply voltage or GND),
>      it may be configurable on some devices, and both sides need to
>      agree.  Hence the GPIO_ACTIVE_* flag as seen by the consumer must
>      match the actual polarity.
>      There exists a similar issue with interrupt flags, where both the
>      interrupt controller and the device generating the interrupt need
>      to agree, which breaks in the presence of a physical inverter not
>      described in DT (see e.g. [3]).
>
> [1] "[PATCH V4 2/2] gpio: inverter: document the inverter bindings"
>     https://lore.kernel.org/linux-gpio/1561699236-18620-3-git-send-email-harish_kandiga@mentor.com/
>
> [2] Devicetree Specification v0.3-rc2, Section 2.5
>     https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3-rc2
>
> [3] "[PATCH] wlcore/wl18xx: Add invert-irq OF property for physically
>     inverted IRQ"
>     https://lore.kernel.org/linux-renesas-soc/20190607172958.20745-1-erosca@de.adit-jv.com/
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  .../bindings/gpio/gpio-repeater.yaml          | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-repeater.yaml b/Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
> new file mode 100644
> index 0000000000000000..efdee0c3be43f731
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-repeater.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO Repeater
> +
> +maintainers:
> +  - Harish Jenny K N <harish_kandiga@mentor.com>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  This represents a repeater for one or more GPIOs, possibly including physical
> +  signal property translation (e.g. polarity inversion).
> +
> +properties:
> +  compatible:
> +    const: gpio-repeater
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  gpios:
> +    description:
> +      Phandle and specifier, one for each repeated GPIO.
> +
> +  gpio-line-names:
> +    description:
> +      Strings defining the names of the GPIO lines going out of the GPIO
> +      controller.
> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  # Device node describing a polarity inverter for a single GPIO
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    inverter: gpio-repeater {
> +        compatible = "gpio-repeater";
> +        #gpio-cells = <2>;
> +        gpio-controller;
> +        gpios = <&gpio 95 GPIO_ACTIVE_LOW>;
> +    };


just a suggestion: giving a gpio-line-names in the example would look useful.

