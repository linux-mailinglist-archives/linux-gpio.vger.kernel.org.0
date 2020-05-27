Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA92B1E3B36
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 10:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729323AbgE0IF1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 04:05:27 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:7398 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729292AbgE0IF0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 04:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590566725; x=1622102725;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=PVXzxMF9Vqjr2PV3qWdmGql8cs4THQnOC1D9NN8NFjI=;
  b=d51hFciozFX3EFMx7R42XBJJdXmhf8VcH/Ay7Jpubckv/b1tWutdNQtP
   1I9INmswMsBa0LSvTn+6hBTswi8IeMzJDCRhYgl1TACqkE/bMOP9ykD/W
   /1jg8HggMN1UsMlFFWg15clmaMJ+VoypmqC9/iuAVFs221gHkBdLwF6EG
   JCcg49LT8dsctZQfyaczj1gfQd5tA5kXOa9mHAPW6H1ALe3mLmXFysPD2
   JW74w9yJepkz+SJqePqk40hmDhR4ZGZOsnDxj0PDXoSm8xJCV+M3IqgrF
   rScU1jH0fJ+hfONA8/8Pt9T7ulnna2nVneqWcnTuWYsJXnKIUC6DcccZs
   w==;
IronPort-SDR: wg7qi6vKQlAMeUaLNnYr/pgQElF/mppTRVRdDs9j6PL/VdSfGQovFxd2A5lvqEM0HL/Ak6SWnd
 ajiqm0f2b17I3CEQkkBX2KqN9Qqxg5p/Q8wLzRN0jfPwJMHJFvYjz7hs5Ur4MGRcXojOH/HKbs
 qwbkThrcDH62qSlTpCfcrRcwCppPObutq2XoZRMqMTvY2iTGXWTgRnBE6QwtZZ3MvtvBHfLiMz
 B0KEQqOfwbBq7msr+yB8KK/1kjFe07ov25eqns6rasTXxFBJrGetBF5DDmXjml6pxyGrC+gVJb
 ccM=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="13635860"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 01:05:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 01:05:24 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 27 May 2020 01:05:22 -0700
References: <20200513141134.25819-1-lars.povlsen@microchip.com> <20200513141134.25819-2-lars.povlsen@microchip.com> <CACRpkdZa7OM3bqB+zRprEQ3M4m9hG3uPCoYxrdH_O=oxD8zi8Q@mail.gmail.com> <87pnb1nf2j.fsf@soft-dev15.microsemi.net> <CACRpkdYesD9sRQZXQNEaBY2Ouu3bjKKGWpRtU-Lpa4AcjyPwXw@mail.gmail.com> <87r1v8oz9f.fsf@soft-dev15.microsemi.net> <CACRpkdaJvaqPptPD-A1DriVgBOZGZ4Qf0UsbsjG39ptx6bSJKg@mail.gmail.com>
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
In-Reply-To: <CACRpkdaJvaqPptPD-A1DriVgBOZGZ4Qf0UsbsjG39ptx6bSJKg@mail.gmail.com>
Date:   Wed, 27 May 2020 10:05:20 +0200
Message-ID: <87pnappzun.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> On Mon, May 25, 2020 at 4:38 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> Yes, the problem is they're not in sequence. F.ex. you could have ports
>> 0,1 enabled, skip 2,3,4 and have 5,6,7 enabled.
>
> Just use disabled nodes.
>
> That would look like this in my idea of a device tree:
>
> pinctrl@nnn {
>     gpio0: gpio@0 {
>         compatible = "foo";
>         status = "ok";
>         ....
>     };
>     gpio1: gpio@1 {
>         compatible = "foo";
>         status = "ok";
>         ....
>     };
>     gpio2: gpio@2 {
>         compatible = "foo";
>         status = "disabled";
>         ....
>     };
>     gpio3: gpio@3 {
>         compatible = "foo";
>         status = "disabled";
>         ....
>     };
>     gpio4: gpio@4 {
>         compatible = "foo";
>         status = "disabled";
>         ....
>     };
>     gpio5: gpio@5 {
>         compatible = "foo";
>         status = "ok";
>         ....
>     };
>     gpio6: gpio@6 {
>         compatible = "foo";
>         status = "ok";
>         ....
>     };
>     gpio7: gpio@7 {
>         compatible = "foo";
>         status = "ok";
>         ....
>     };
> };
>
> It is common to use the status to enable/disable nodes like this.
>
> In the Linux kernel is is possible to iterate over these subnodes and
> check which ones are enabled and disabled while keeping the
> index by using something like:
>
> i = 0;
> struct device_node *np, *child;
> for_each_child_of_node(np, child) {
>     if (of_device_is_available(child)) {
>         pr_info("populating device %d\n", i);
>     }
>     i++;
> }
>
> Certainly you can use i in the above loop to populate your registers
> etc from an indexed array.
>
> This way the consumers can pick their GPIO from the right port
> and everything just using e.g.
> my-gpios = <&gpio6 4 GPIO_OUT_LOW>;
>

Linux, thank you for your input, it is much appreciated. I will use the
pattern in the driver in the next revision.

The only issue is that the gpios on the same "port" have restrictions on
their status - they can only be enabled "all" or "none" for gpios that
map to the same port. F.ex. gpio0, gpio32, gpio64 and gpio96 must all be
enabled or disabled because at the hardware level you control the
_port_. But as I noted earlier, that could just be the driver enforcing
this.

Thanks again.

---Lars

> Yours,
> Linus Walleij

-- 
Lars Povlsen,
Microchip
