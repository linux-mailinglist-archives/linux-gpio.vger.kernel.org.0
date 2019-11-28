Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6156A10C305
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 04:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfK1Dpp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 22:45:45 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:34474 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfK1Dpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 22:45:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574912740;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ovvWqqCqtCKN+01XuykkLwFdsy5R9BqiNVQImuwx8zI=;
        b=ffk/i1nHKYX8ytIw6OjhQTaqzVXLFHAHrerwH8kuoBmQmJN9x/+QVQtrNKP5vooEpX
        8NDUblQH/wvmKMV25Q88fCgTIhFOVABAIkTuJREo8ezRLctzJrgEFA4s/KjCpkbE4a5H
        v4iEErdMdtweOtIL3S/GROJ67c3Q7nLJ6WEi3W44TICT1ri9yJG8bGIUNafmMRNzX/lp
        q9VS5C4VWg2iDxwIechkbGwDXzwUSq56Wm4y8KXsLqOIFxUJS2dXqhdYGL5TwfeXMVKY
        4IwJE/1+LPwzIzkrUFdLWOBte7tNPZlBrIdPZSG5y29z5Fq4RevMNievwRk7Q9+DfjOA
        ACiA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.0.0 AUTH)
        with ESMTPSA id 604beevAS3db2Iu
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 04:39:37 +0100 (CET)
Date:   Thu, 28 Nov 2019 04:39:37 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Message-ID: <1708272897.1467701.1574912377195@webmail.strato.com>
In-Reply-To: <20191127084253.16356-5-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-5-geert+renesas@glider.be>
Subject: Re: [PATCH v3 4/7] dt-bindings: gpio: Add gpio-repeater bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev22
X-Originating-IP: 112.198.74.215
X-Originating-Client: open-xchange-appsuite
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> On November 27, 2019 at 9:42 AM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
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
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
