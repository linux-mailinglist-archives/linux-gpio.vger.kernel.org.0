Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9DC28D059
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 16:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgJMOja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 10:39:30 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:62061 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730080AbgJMOj2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 10:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602599968; x=1634135968;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=ZunV55K/zJ9fuNQ1b2ozfALdC7xF+pzn13zPhCsnF+E=;
  b=RtsoTLC62sTKC2FPOBi89wkvxhNnw5E8F6Wtc+3+nmW3aKiz2B5lG1DT
   l0NygMj1fR5SlmlqnRfS9+FM9YFlq5mWVawXGEQxZ6fTEAvTsLoCZyVcm
   u0VtSPAHlt32gY4Ax7fmytuH3irTBvpGURx+2XfLqed/2G1VipNZa+TLa
   DXeM7waARixeHGPUkUH8h4oIAIlSVEpyNOUJOksBm4ejRynY2NepCRVwm
   iMzpRNOeI2Y2DGSij/RckDnxCzx0+UJKqcUQqXxatgNJl3mhb0Ra95EjT
   aBxKldKC7t8MuGGI4Nf/ucvlyyBZiySS7X/8iELvgLo3BMVAP7CSh+6on
   w==;
IronPort-SDR: zx2UunMdyIEFUMMI4Ku5+haOGurduL+VYwGSWUaXkhzX+umGjOEjNJEyAe0jX7akTlxLrxt9WK
 R75V1cunU8f5TXAjcx0SX5R4rNKtXcnLGTyrNyQFD4yvJe6D8rw/5ZEdBxOmJvklRTX3ZhBhYu
 IRX/kGfhHHtMVCqNk9SR8fo8232xlDUPcXM+76bmnGXMIt7kpcL/wYKzbIJF91TgqlITU9CVAD
 +hu7BUUa2TjVksILXNSLpLZ4v6suzh+51w89EkJxAC9VRdXqiDkawHcIuYIxnjuw6qGX8izK+2
 Ep4=
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="90038135"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2020 07:39:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 13 Oct 2020 07:39:27 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 13 Oct 2020 07:39:25 -0700
References: <20201008130515.2385825-1-lars.povlsen@microchip.com> <20201008130515.2385825-2-lars.povlsen@microchip.com> <CACRpkdaFYoXFUuWow5s9TitrRDhMW=wiaxgfMcY6sQkYYgC-Lw@mail.gmail.com> <87d01ryb04.fsf@soft-dev15.microsemi.net> <CACRpkdZbxohoxg3bN-XpLXwBUgTDByoP9sNEocUt10R6t9FgXQ@mail.gmail.com>
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
In-Reply-To: <CACRpkdZbxohoxg3bN-XpLXwBUgTDByoP9sNEocUt10R6t9FgXQ@mail.gmail.com>
Date:   Tue, 13 Oct 2020 16:39:23 +0200
Message-ID: <877druxk9w.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> On Fri, Oct 9, 2020 at 12:00 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> > So here reg = 0 and the out port has reg 1. Isn't that what you also put
>> > in the second cell of the GPIO phandle? Then why? The driver
>> > can very well just parse its own reg property and fill that in.
>>
>> NO! The second cell is the second dimension - NOT the direction. As I
>> wrote previously, the direction is now inherent from the handle, ie. the
>> "reg" value of the handle.
>
> OK I get it ... I think :)

Great!

>
>> The hardware describe a "port" and a "bit index" addressing, where the
>> second cell in
>>
>>   gpios = <&sgpio_in2 11 0 GPIO_OUT_LOW>;
>>
>> is the "bit index" - not the "reg" from the phandle.
>
> As long as the bindings specify exactly what is meant by bit index
> and the tupe (port, bit_index) is what uniquely addresses a certain
> GPIO line then it is fine I suppose.
>

Yes, that is confirmed.


>> In the example above, note
>>
>>   ngpios = <96>;
>>
>> As the "port" is [0; 31], this defines "bit index" to be [0; 2], so the
>> (input) GPIO cells will be:
>>
>> p0b0, p0b1, p0b2
>> ...
>> p31b0, p31b1, p31b2
>>
>> being identical to
>>
>> <&sgpio_inX 0 0 GPIO_OUT_LOW>
>> <&sgpio_inX 0 1 GPIO_OUT_LOW>
>> <&sgpio_inX 0 2 GPIO_OUT_LOW>
>> ...
>> <&sgpio_inX 31 0 GPIO_OUT_LOW>
>> <&sgpio_inX 31 1 GPIO_OUT_LOW>
>> <&sgpio_inX 31 2 GPIO_OUT_LOW>
>>
>> ('X' being the SGPIO controller instance).
>
> So 32 possible ports with 3 possible bit indexes on each?
> This constraint should go into the bindings as well so it becomes
> impossible to put in illegal port numbers or bit indices.
>
> (Use the YAML min/max constraints, I suppose?)
>

Yes, I will to see if constraints in the GPIO args is possible.

>> So no, there *really* is a need for a 3-cell GPIO specifier (or whatever
>> its called).
>
> If that is the natural way to address the hardware lines
> and what is used in the documentation then it's fine, it's just so
> unorthodox that I have to push back on it a bit you know.
>

Yes, this piece of hw is certainly not a stock GPIO controller, so that
was kinda expected. But I think we ended up with an abstraction that
fits as good as possible.

I will send a new (last?) revision that includes the suggestions from
Rob tomorrow.

Thank you for your time and comments (also Rob!)

---Lars

-- 
Lars Povlsen,
Microchip
