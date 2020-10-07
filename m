Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFC7285DD5
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 13:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgJGLHy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 07:07:54 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:2331 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgJGLHu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 07:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602068870; x=1633604870;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=OHJkMunRX9yuGQkkQINgytJNNoat78VMgh5LSqd5Fas=;
  b=PoBxjvnNMEIEMNunwQEeHDL5zzwdm1pcubmcZSzE9s7SIn7rAltWn/gm
   0MCsnaJwaUr8MSjxTOAn6nvZQpVrss+HSn5Sev+bx1VC90+hmwDaa7HhY
   1LVi1Nx/3mHqWo5M6eRjgYGIV83bcu3Xh0NAETFZSQf2i+bAF58zqfAsQ
   2IfxoKYX+1aIMR6WevUj537vzAuwjnJeOMIEPRA3Hs7BXUL6tj+FFWL+0
   nNKSy22jA7s+TuW0IsOwxSvE4h8yNf+xYfi6/N/R+w/oEReABHfYNqV8M
   rpXxqHGsjCkTrrIoLbz14qpACi1ikAmR1Tm1oMic3FhfgvPV+0WXS8SxB
   g==;
IronPort-SDR: /OtwhM7MxUzWHjBjkHcKq762qLsJPwtoJyjWUO5p5ghFZAijyBiGfJrpWA/eoKUtY1CyYaodlG
 B1347MS9duBSSS5C+VRB6WMAJp7jSpHiU58OeWfFPty8MmuwGNEqBSR9SKBETY/GDUfUJbSCzK
 zCnJxR+bYbsr33MA5fMeCHbnyhwggHBsgfJhezdiTKpgELaj1aRq4RFWyTDHfmwZ1boBgnayqq
 DSAg5xNA66uN1y4CQuyoBYQ+cNWAbbFIBcsUEvu0XBL7zodf6Yd77jH4rHEwGR4icgF2QonBH2
 E3o=
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="89404498"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2020 04:07:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 7 Oct 2020 04:07:48 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 7 Oct 2020 04:07:47 -0700
References: <20201006142532.2247515-1-lars.povlsen@microchip.com> <20201006142532.2247515-2-lars.povlsen@microchip.com> <20201006223756.GA2976904@bogus>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Rob Herring <robh@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RESEND PATCH v3 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-mchp-sgpio driver
In-Reply-To: <20201006223756.GA2976904@bogus>
Date:   Wed, 7 Oct 2020 13:07:45 +0200
Message-ID: <87k0w2xpj2.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Rob!

Rob Herring writes:

> On Tue, Oct 06, 2020 at 04:25:30PM +0200, Lars Povlsen wrote:
>> This adds DT bindings for the Microsemi/Microchip SGPIO controller,
>> bindings microchip,sparx5-sgpio, mscc,ocelot-sgpio and
>> mscc,luton-sgpio.
>>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>> ---
>>  .../pinctrl/microchip,sparx5-sgpio.yaml       | 127 ++++++++++++++++++
>>  1 file changed, 127 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
>> new file mode 100644
>> index 000000000000..e3618ed28165
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
>> @@ -0,0 +1,127 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/microchip,sparx5-sgpio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microsemi/Microchip Serial GPIO controller
>> +
>> +maintainers:
>> +  - Lars Povlsen <lars.povlsen@microchip.com>
>> +
>> +description: |
>> +  By using a serial interface, the SIO controller significantly extend
>> +  the number of available GPIOs with a minimum number of additional
>> +  pins on the device. The primary purpose of the SIO controllers is to
>> +  connect control signals from SFP modules and to act as an LED
>> +  controller.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^gpio@[0-9a-f]+$"
>> +
>> +  compatible:
>> +    enum:
>> +      - microchip,sparx5-sgpio
>> +      - mscc,ocelot-sgpio
>> +      - mscc,luton-sgpio
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  microchip,sgpio-port-ranges:
>> +    description: This is a sequence of tuples, defining intervals of
>> +      enabled ports in the serial input stream. The enabled ports must
>> +      match the hardware configuration in order for signals to be
>> +      properly written/read to/from the controller holding
>> +      registers. Being tuples, then number of arguments must be
>> +      even. The tuples mast be ordered (low, high) and are
>> +      inclusive. Arguments must be between 0 and 31.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 64
>> +
>> +  microchip,sgpio-frequency:
>> +    description: The sgpio controller frequency (Hz). This dictates
>> +      the serial bitstream speed, which again affects the latency in
>> +      getting control signals back and forth between external shift
>> +      registers. The speed must be no larger than half the system
>> +      clock, and larger than zero.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 1
>> +    default: 12500000
>> +
>> +patternProperties:
>> +  "^gpio-(port|controller)@[01]$":
>
> gpio@... is correct here as the node is a gpio-controller (no, we're
> not consistent).

OK, fine by me.

>
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: microchip,sparx5-sgpio-bank
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      gpio-controller: true
>> +
>> +      '#gpio-cells':
>> +        const: 3
>> +
>> +      ngpios:
>> +        minimum: 1
>> +        maximum: 128
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - gpio-controller
>> +      - '#gpio-cells'
>> +      - ngpios
>> +
>> +    additionalProperties: false
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - microchip,sgpio-port-ranges
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +
>> +examples:
>> +  - |
>> +    sgpio2: gpio@1101059c {
>> +     #address-cells = <1>;
>> +     #size-cells = <0>;
>> +     compatible = "microchip,sparx5-sgpio";
>> +     clocks = <&sys_clk>;
>> +     pinctrl-0 = <&sgpio2_pins>;
>> +     pinctrl-names = "default";
>> +     reg = <0x1101059c 0x100>;
>> +        microchip,sgpio-port-ranges = <0 0 16 18 28 31>;
>
> Since it's tuples, do:
>
> <0 0>, <16 18>, <28 31>

Yes, that will add clarity.

>
>> +        microchip,sgpio-frequency = <25000000>;
>
> Some whitespace issues here.
>

Will fix that.

>
>> +     sgpio_in2: gpio-controller@0 {
>> +            reg = <0>;
>> +            compatible = "microchip,sparx5-sgpio-bank";
>> +            gpio-controller;
>> +            #gpio-cells = <3>;
>> +            ngpios = <96>;
>> +     };
>> +     sgpio_out2: gpio-controller@1 {
>> +            compatible = "microchip,sparx5-sgpio-bank";
>> +            reg = <1>;
>> +            gpio-controller;
>> +            #gpio-cells = <3>;
>> +            ngpios = <96>;
>> +     };
>> +    };
>> --
>> 2.25.1

Thank you for your comments, I will refresh the series shortly.

---Lars

-- 
Lars Povlsen,
Microchip
