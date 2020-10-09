Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5014288679
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 12:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387428AbgJIKAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 06:00:47 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:22548 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgJIKAr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 06:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602237647; x=1633773647;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=r2koRF/+FoeVCXIcl1Bvk7ziipf1D2XLPT0qU0KHzDg=;
  b=2DwIlA0r8iUFKi4mLfbIi6QaGcQU1l3ouWSbnan0dWqEZgoGgJtpRJCJ
   4fzmt4fl2Y2z6BNz8/MYpu1eBzV7+U/trPXUWT2izMt03hqUD6JO2qUQA
   gR0+wI+b0P1KnaMMjMEFBx1kLX5pO4hijeie4zI8qtNkmlz3BjHXPjA10
   hZyd8WbjzhT0OSDoG0+OkwAGDMqUlN0m1eM+CGrwrQeu8GSzRiU93sCSN
   jJ4q7c0FoRsHWdePPmxiCg67rAf6500qXpVDnHmXejeOFwnGP9x2KT14+
   Qu+fyEw2fZJaa8zHuCAMHwJocpWPJKMR9RFI2A36hvJDWeq5DEQVFdxD0
   w==;
IronPort-SDR: ghWz0aIj1uzQaobiv50hrQZfGc7IJ/f3PL3i5LQhDEys5XsFRlnrIi+7kZiLbnd5AXjfDmE9rd
 YP6MzHCBmQmwy34XgxJyQ3Cp7nVWPiWIq+UFYwMLkuS6PF+XxEeoQa55iAMKRibOlYdeEXoj+E
 0LbBvOhIqnHAGP424wZyndTw4SIFxAEUnZQZ/LdIBnHu7RuwL048bURNrCP+xXNmq+LGGgiWf0
 ssgBmBPG2Sb1rTegMzMayw69szmZd2+W70iXF7OSDVlYpOy/h13L11Y1bM/Meq0PLl1xB09gj5
 FSY=
X-IronPort-AV: E=Sophos;i="5.77,354,1596524400"; 
   d="scan'208";a="94773622"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Oct 2020 03:00:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 9 Oct 2020 03:00:46 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 9 Oct 2020 03:00:12 -0700
References: <20201008130515.2385825-1-lars.povlsen@microchip.com> <20201008130515.2385825-2-lars.povlsen@microchip.com> <CACRpkdaFYoXFUuWow5s9TitrRDhMW=wiaxgfMcY6sQkYYgC-Lw@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-microchip-sgpio driver
In-Reply-To: <CACRpkdaFYoXFUuWow5s9TitrRDhMW=wiaxgfMcY6sQkYYgC-Lw@mail.gmail.com>
Date:   Fri, 9 Oct 2020 12:00:43 +0200
Message-ID: <87d01ryb04.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> Hi Lars!
>
> This is overall looking fine. Except for the 3 cell business. I just can't
> wrap my head around why that is needed.
>
> On Thu, Oct 8, 2020 at 3:05 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> +      '#gpio-cells':
>> +        const: 3
>
> So at the very least needs a description making it crystal clear why each
> cell is needed, and used for since the standard bindings are not used.
>
> +      sgpio_in2: gpio@0 {
> +        reg = <0>;
> +        compatible = "microchip,sparx5-sgpio-bank";
> +        gpio-controller;
> +        #gpio-cells = <3>;
> +        ngpios = <96>;
> +      };
>
> So here reg = 0 and the out port has reg 1. Isn't that what you also put
> in the second cell of the GPIO phandle? Then why? The driver
> can very well just parse its own reg property and fill that in.

Linus,

NO! The second cell is the second dimension - NOT the direction. As I
wrote previously, the direction is now inherent from the handle, ie. the
"reg" value of the handle.

The hardware describe a "port" and a "bit index" addressing, where the
second cell in

  gpios = <&sgpio_in2 11 0 GPIO_OUT_LOW>;

is the "bit index" - not the "reg" from the phandle.

In the example above, note

  ngpios = <96>;

As the "port" is [0; 31], this defines "bit index" to be [0; 2], so the
(input) GPIO cells will be:

p0b0, p0b1, p0b2
...
p31b0, p31b1, p31b2 

being identical to 

<&sgpio_inX 0 0 GPIO_OUT_LOW>
<&sgpio_inX 0 1 GPIO_OUT_LOW>
<&sgpio_inX 0 2 GPIO_OUT_LOW>
...
<&sgpio_inX 31 0 GPIO_OUT_LOW>
<&sgpio_inX 31 1 GPIO_OUT_LOW>
<&sgpio_inX 31 2 GPIO_OUT_LOW>

('X' being the SGPIO controller instance).

So no, there *really* is a need for a 3-cell GPIO specifier (or whatever
its called).

Hope this is clearer now...

---Lars

>
> When you obtain a phandle like that:
>
> gpios = <&sgpio_in2 11 0 GPIO_OUT_LOW>;
>
> Isn't that 0 just duplicating the "reg"? Just parse reg when you set up
> your driver state and put it as variable in the state container for your
> driver state for this particular gpio_chip. No need to get it from
> the phandle.
>
> Yours,
> Linus Walleij

-- 
Lars Povlsen,
Microchip
