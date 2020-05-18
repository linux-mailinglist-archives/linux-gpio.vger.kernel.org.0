Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6301D8992
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 22:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgERUuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 16:50:01 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:21974 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgERUuB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 16:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589835000; x=1621371000;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=p0UV94Wfg4Hsk7gV7KfpL3Af6oDCzE1nvORnnmrZVjQ=;
  b=dgaHF1YOhiuxFtp8aNO8V0tLzFVD3tfJoFsX/ZPZON0YmmT2bBhqw1In
   z8OthfF4UnMRh2fIh2FmMU9Pm0UE/fDIja/Vc5lvaDRnTIlPtL1KDYR3Y
   YnE8jMgB/u5iWdPoij1WT5ugIZvoZ+gX+xEdWECVeaxizEc0wun1pKpgm
   vwytFw/aF9EaoLC3Zql9LyQC47nO44sMNidQjUA6gqmw8S/m9qBMsFOHC
   0gBcOX95B9igx3HVFk3IefyU5Dr/VA52AYH2Rh4Z9+A+NNgmLvb9UmuQ2
   N930LuiESJUsht4JaUZyW5z9wOfOS75Gnh4jgjPc/mWC0NflDLM3XlQwS
   g==;
IronPort-SDR: XK4Y3Cpypu+/lG6igc25WaLSMNHfNiJU8wcvIUd22VrAzGtyAbepys2YnUOt7tXVe9MRiUBOcN
 10TdXQlx0YZLYcDxmvF2U+wORsVU6HdcRsRjH4/aLQ0v72QTa1xldQ8H72kTJhbjWh03hvN+76
 2Hx89f/nIXp5W+0PeeA2W3KznJjcXS/uhVEEqLSnSuGkS8qYj6Kc1RaeeUsjWzyMxLiGukFEbf
 IJ9ZAyEVbUHLyccLNsdjhz4vexVk6o8gXIFG1gQumVu+bogcb8869N3ULiUlBXuaaT4qAn4okY
 /fM=
X-IronPort-AV: E=Sophos;i="5.73,407,1583218800"; 
   d="scan'208";a="77082876"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2020 13:50:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 May 2020 13:49:59 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 18 May 2020 13:49:57 -0700
References: <20200513141134.25819-1-lars.povlsen@microchip.com> <20200513141134.25819-2-lars.povlsen@microchip.com> <CACRpkdZa7OM3bqB+zRprEQ3M4m9hG3uPCoYxrdH_O=oxD8zi8Q@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        SoC Team <soc@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for mscc,ocelot-sgpio
In-Reply-To: <CACRpkdZa7OM3bqB+zRprEQ3M4m9hG3uPCoYxrdH_O=oxD8zi8Q@mail.gmail.com>
Date:   Mon, 18 May 2020 22:49:56 +0200
Message-ID: <87pnb1nf2j.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> On Wed, May 13, 2020 at 4:11 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> This adds DT bindings for the Microsemi SGPIO controller, bindings
>> mscc,ocelot-sgpio and mscc,luton-sgpio.
>>
>> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>
>> +  microchip,sgpio-ports:
>> +    description: This is a 32-bit bitmask, configuring whether a
>> +      particular port in the controller is enabled or not. This allows
>> +      unused ports to be removed from the bitstream and reduce latency.
>> +    $ref: "/schemas/types.yaml#/definitions/uint32"
>
> I don't know about this.
>
> You are saying this pin controller can have up to 32 GPIO "ports"
> (also known as banks).
>
> Why can't you just represent each such port as a separate GPIO
> node:
>
> pinctrl@nnn {
>     gpio@0 {
>         ....
>     };
>     gpio@1 {
>         ....
>     };
>     ....
>     gpio@31 {
>         ....
>     };
> };
>
> Then if some of them are unused just set it to status = "disabled";
>
> This also makes your Linux driver simpler because each GPIO port
> just becomes a set of 32bit registers and you can use
> select GPIO_GENERIC and bgpio_init() and save a whole
> slew of standard stock code.
>

Linus, thank you for your input.

The controller handles an array of 32*n signals, where n >= 1 && n <=
4.

The problem with the above approach is that the ports are disabled
*port*-wise - so they remove all (upto) 4 bits. That would be across the
banks.

You could of course have the "implied" semantics that a disabled port at
any bit position disabled all (bit positions for the same port).

But I don't know if this would be easier to understand, DT-wise.

What do you think...?

> Yours,
> Linus Walleij

-- 
Lars Povlsen,
Microchip
