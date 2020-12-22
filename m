Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2632E0C46
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 15:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgLVO7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 09:59:40 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:35149 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbgLVO7k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2020 09:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1608649179; x=1640185179;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=sAZWJmx5c/d61ulHI2FfUnXQ6P0/KlO7HU/s+AMVJjI=;
  b=ezX8SI0ODPhMF1Y5kLffk3hQ5tQMR5RPWJpFqEsc3mDdXsJUEdsYj/xH
   1oxJkAnybcQ/NbGUXDCAKSIVGonvpGLQe4Rw7eDzmuuNp1AWd2XpZ+rDA
   7sMTE/HHly0Eiy7FuhV82pRHP+BOa9Ee5QAL6lmRGig40RIBSvwgu4LRs
   7aKd2GZ4XJzlTAV0tA9jcna4/EemZrwmy4YP7lQh/YyiJW7RwTrZkZHcc
   OY2n8g9KNXXZ6yEHQz9c43kapPgjxpxKEfh3ypF6bUosPXhM2QaDN8ZRn
   3NlA0UeOUCpnnbEj2U6RJ5Yh6dmnTYZE9/qNANw/8TR1nj+ayq5xNk2Ft
   g==;
IronPort-SDR: M9+cWPLCegujkM6O1CpBrC8OOAo588IURXNakAPVSpM7UvId8OrFCJ4EkvFbalZ4/DJgFChbZl
 ICPbJaomCz3I/S36cBSIkNOSzuKJf2logYZVh1WdS18RfWRweJPGypPrVzAd/9/fzWzIza9cT6
 +BKsASAbNErOnfT622+PcBAjcEJh+5cc6NyMovXkOeoe5k14xBpt1hgNtJncFAnDmYj/qTw/70
 3VbaWYOuIR6Yb8bTPqqap+bj2bFHihmljmiASbYlvZqAxyjF5Z1slRP1MLpw3qYAQejyxlrDXy
 MAA=
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; 
   d="scan'208";a="97957140"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Dec 2020 07:58:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Dec 2020 07:58:23 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 22 Dec 2020 07:58:21 -0700
References: <20201113145151.68900-1-lars.povlsen@microchip.com> <20201113145151.68900-4-lars.povlsen@microchip.com> <20201220224804.GA3107610@lunn.ch> <87eejip2xm.fsf@microchip.com> <20201222135646.GF3107610@lunn.ch>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Andrew Lunn <andrew@lunn.ch>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <devicetree@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <linux-kernel@vger.kernel.org>,
        "Microchip Linux Driver Support" <UNGLinuxDriver@microchip.com>,
        <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v10 3/3] arm64: dts: sparx5: Add SGPIO devices
In-Reply-To: <20201222135646.GF3107610@lunn.ch>
Date:   Tue, 22 Dec 2020 15:58:14 +0100
Message-ID: <875z4tq455.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Andrew Lunn writes:

> On Tue, Dec 22, 2020 at 11:09:41AM +0100, Lars Povlsen wrote:
>>
>> Andrew Lunn writes:
>>
>> > On Fri, Nov 13, 2020 at 03:51:51PM +0100, Lars Povlsen wrote:
>> >> +             led@8 {
>> >> +                     label = "eth12:green";
>> >> +                     gpios = <&sgpio_out0 12 0 GPIO_ACTIVE_HIGH>;
>> >> +                     default-state = "off";
>> >> +             };
>> >> +             led@9 {
>> >> +                     label = "eth12:yellow";
>> >> +                     gpios = <&sgpio_out0 12 1 GPIO_ACTIVE_HIGH>;
>> >> +                     default-state = "off";
>> >> +             };
>> >
>> > Hi Lars
>> >
>> > I did not see these patches earlier, but i've been looking at the
>> > switch driver patches recently, so went digging.
>> >
>> > Can the Ethernet switch itself control these LEDs for indicating
>> > things like packet receive/transmit, link state, and link speed? Or
>> > are they purely software controlled?
>> >
>> >     Thanks
>> >         Andrew
>>
>> Hi Andrew!
>>
>> No, the SGPIO device is separate from the switch device as such. I was
>> planning to couple the two by means of "led events" in a later patch.
>
> O.K, good.
>
> In the LED subsystem terminology, such an event would be a
> trigger. Link state, and copper speed should already be mostly covered
> by phylib triggers. What is missing is link activity.  Does the switch
> easily provide you with this information, or do you need to poll the
> switch statistics counters every 10ms to blink the LEDs?
>
>      Andrew

Hi Andrew!

I am so thrilled with your interest and level of scrutiny! Thank you!

And yes, I meant "LED trigger". The SGPIO's actually have a "blink" mode
on their own, which I was planning to enable at a later time. But yes,
you would still need some polling, but a somewhat lower rate, f.ex. 1
second. At that time, you could change between steady and blink mode.

Again, that your for the level of effort you contribute to the switch
driver, it is highly appreciated.

Cheers,

---Lars

--
Lars Povlsen,
Microchip
