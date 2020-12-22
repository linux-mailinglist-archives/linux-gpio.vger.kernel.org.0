Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885462E0883
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 11:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgLVKLC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 05:11:02 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:37645 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLVKLB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2020 05:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1608631860; x=1640167860;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=mLxK7pdCxepvYeT16S70cUii2HXJKQUHNnyxW4YH+H8=;
  b=BL9IsZM+4PcG4SBMu5wWjBX9K1+/tjMjZMf6LkdQN3emAm0cLODditEA
   oYrylwGQXhYb9BlK75GMv4BowtvHB+3UBkJf1Yg3ssrzsvU0ldErrOzif
   T+W05wQ3MOIWic8X1dV9MsfCC8HNeHZ17tvcR1UocOSKftVGZ/tRAlSsm
   2uECJwFr/BDaeGTY+sUPWIpjzohg+iEPUgcAEPybgTpf7fNJo53vjsa+E
   WIXm9h3W2MlzQd7SwKirj+o+wxv0LL+rClfnAaTbfg0QQVDxr/cS+Ps7g
   CAiGoClFG4pxe8S8A6njUa4eKgaamaswWwnPYqNjP4iDcOMpM3p0TYr+V
   g==;
IronPort-SDR: 13GE3ImmUEBO77AzGj+1urChOLJ2YI/cgB+Z6/z8JGLyDHBvdFbWOsBhbKt2HqP9iqfYMIhRz8
 bFYcr7rM9c98Np9AqYm3LUyl3KVN9kbmkVgNiCuNdKYDoi7V4fmqdlUQ6cfdRYtPfsuEIbm7Y8
 CUATxCVHuCDG6pNaJYAZ8Rf+/eeEgMkQkbNpSJQZz6MF4L0AAyZUWyaSVzPVQnx+ySxaHw+WWe
 pnmKkrA0W+R7jeyYJRxk4PGLgRDFnYzPyuDPoD0jH/6rcB16qxBFpNzSoCjBMyZ0cceFKFthU7
 ncM=
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
   d="scan'208";a="38261332"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Dec 2020 03:09:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Dec 2020 03:09:44 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 22 Dec 2020 03:09:42 -0700
References: <20201113145151.68900-1-lars.povlsen@microchip.com> <20201113145151.68900-4-lars.povlsen@microchip.com> <20201220224804.GA3107610@lunn.ch>
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
In-Reply-To: <20201220224804.GA3107610@lunn.ch>
Date:   Tue, 22 Dec 2020 11:09:41 +0100
Message-ID: <87eejip2xm.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Andrew Lunn writes:

> On Fri, Nov 13, 2020 at 03:51:51PM +0100, Lars Povlsen wrote:
>> +             led@8 {
>> +                     label = "eth12:green";
>> +                     gpios = <&sgpio_out0 12 0 GPIO_ACTIVE_HIGH>;
>> +                     default-state = "off";
>> +             };
>> +             led@9 {
>> +                     label = "eth12:yellow";
>> +                     gpios = <&sgpio_out0 12 1 GPIO_ACTIVE_HIGH>;
>> +                     default-state = "off";
>> +             };
>
> Hi Lars
>
> I did not see these patches earlier, but i've been looking at the
> switch driver patches recently, so went digging.
>
> Can the Ethernet switch itself control these LEDs for indicating
> things like packet receive/transmit, link state, and link speed? Or
> are they purely software controlled?
>
>     Thanks
>         Andrew

Hi Andrew!

No, the SGPIO device is separate from the switch device as such. I was
planning to couple the two by means of "led events" in a later patch.

---Lars

--
Lars Povlsen,
Microchip
