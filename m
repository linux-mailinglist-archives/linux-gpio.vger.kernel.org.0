Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88D21F6BE5
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2020 18:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgFKQMK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jun 2020 12:12:10 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:37538 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgFKQMK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jun 2020 12:12:10 -0400
Received: from localhost (ip-78-45-211-110.net.upcbroadband.cz [78.45.211.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 3409E40006A;
        Thu, 11 Jun 2020 18:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1591891928;
        bh=suLD3L6pCPH7uCSYsqrd7uIK9Ms1KqalL5xuJahbt5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CltjXyYwZ7DLTV2ss9ffQeYbsgBv1Mpg2Lsw3EssLfS+2crWykbiLsHNwrgI4YmsR
         3+bCm0FigCgmcpGzNMI5TfBy0N4uvPoascLmgo8nlfDuDVugiBR8CoSmm2jSpKNVWr
         1L8RCe9c48NvoUrDX8vvin4LEVfg13yCv323y+FSDVnN+97BlpXcKidnAps0xeiRQD
         qxKJ6yvnlLyAXZP3cWsYhrD6qL2pFzQCXo07EzqTSwZ5KAHpqyJNyDhz/9sQg+4TNM
         J0SQl2VCp6nfAtKYteYJFsJLUyadbnFzRJBut42S9IdlSB2PCKpr9yyCpuB44HgWfY
         sfJp49ez2jKrQ==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Thierry Reding <treding@nvidia.com>, <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: Re: GPIO regression on mvebu and/or max310x since 2ab73c6d8323
Date:   Thu, 11 Jun 2020 18:12:07 +0200
MIME-Version: 1.0
Message-ID: <7e4a427c-a6bb-4036-ba8d-0f290a17852c@cesnet.cz>
In-Reply-To: <20200610080327.GA1805015@ulmo>
References: <8cffce08-ed84-4242-8dcd-72de693f0f71@cesnet.cz>
 <20200610080327.GA1805015@ulmo>
Organization: CESNET
User-Agent: Trojita/v0.7-412-g2869c385e; Qt/5.13.0; xcb; Linux; Gentoo Base System release 2.4.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> All of the above seems to indicate that there are no GPIO ranges
> associated with the pinmux controller, because that's the only reason
> why gpiochip_generic_request() wouldn't call into pinctrl to request
> the pin for GPIO.

I think it's the other way round: there are no pin_ranges associated with=20
the mvebu's gpiochip, but there definitely are GPIOs registered for the=20
pinctrl. I went looking further, and indeed: nothing calls=20
gpiochip_add_pingroup_range() or gpiochip_add_pin_range().

From the docs it seems that this is supposed to be called by the GPIO (or=20
pinctrl? or pinmux?) core upon the "gpio-ranges" DT property.=20
Unfortunately, the in-the-tree DTS files have no such property in=20
arch/arm/boot/dts/armada-388-clearfog-base.dts. Is that a bug in these DTS=20=

files?

> However, the reason why I sent that patch was because the absence of
> GPIO ranges would actually cause pinctrl_gpio_request() to crash,

It's interesting because it doesn't crash for me. Are you referring to=20
pinctrl_get_device_gpio_range() which gets called from=20
pinctrl_gpio_request()? If so, I think that that one iterates over all=20
pinctrl devices in the system, and it doesn't seem to care about a=20
particular gpiodev's pin_ranges. It does check a pctldev's gpio_ranges=20
later on in pinctrl_match_gpio_range(), but that's a different thing (a=20
mapping in the opposite direction, right?).

Anyway, I added a few more print/debugs, and here's roughly how it looks on=20=

5.7.1 with 2ab73c6d8323 reverted (and extra debugging):

[    2.313257] i2c-gpio gpio_i2c: GPIO lookup for consumer sda
[    2.313261] i2c-gpio gpio_i2c: using device tree for GPIO lookup
[    2.313278] gpio gpiochip0: gpiochip_generic_request for offset 25:=20
empty list of ranges, proceeding anyway
[    2.323070] pinctrl_gpio_request: 25:
[    2.326762] pinctrl_get_device_gpio_range: for gpio 25
[    2.331916] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 25
[    2.341514] pinctrl_gpio_request 25: requesting via _request_gpio
[    2.347628] armada-38x-pinctrl f1018000.pinctrl: pinmux_request_gpio pin=20=

25 gpio 25
[    2.355313] armada-38x-pinctrl f1018000.pinctrl: request pin 25 (PIN25)=20=

for mvebu-gpio:25
[    2.355318] armada-38x-pinctrl f1018000.pinctrl: pinmux_request_gpio ret=20=

0
[    2.362211]  got 0
[    2.364233] pinctrl_get_device_gpio_range: for gpio 25
[    2.369386] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 25
[    2.378987] i2c-gpio gpio_i2c: GPIO lookup for consumer scl
[    2.378989] i2c-gpio gpio_i2c: using device tree for GPIO lookup
[    2.379000] gpio gpiochip0: gpiochip_generic_request for offset 24:=20
empty list of ranges, proceeding anyway
[    2.388771] pinctrl_gpio_request: 24:
[    2.392441] pinctrl_get_device_gpio_range: for gpio 24
[    2.397596] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 24
[    2.407192] pinctrl_gpio_request 24: requesting via _request_gpio
[    2.413302] armada-38x-pinctrl f1018000.pinctrl: pinmux_request_gpio pin=20=

24 gpio 24
[    2.420985] armada-38x-pinctrl f1018000.pinctrl: request pin 24 (PIN24)=20=

for mvebu-gpio:24
[    2.420989] armada-38x-pinctrl f1018000.pinctrl: pinmux_request_gpio ret=20=

0
[    2.427884]  got 0
[    2.429900] pinctrl_get_device_gpio_range: for gpio 24
[    2.435055] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 24
[    2.444806] pinctrl_get_device_gpio_range: for gpio 25
[    2.449964] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 25
[    2.459576] pinctrl_get_device_gpio_range: for gpio 24
[    2.464736] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 24
[    2.474337] pinctrl_get_device_gpio_range: for gpio 25
[    2.479489] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 25

(these lines are reported about 200 times...)

[    8.081207] pinctrl_get_device_gpio_range: for gpio 24
[    8.086362] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 24
[    8.095965] pinctrl_get_device_gpio_range: for gpio 25
[    8.101117] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 25
[    8.110723] i2c-gpio gpio_i2c: using lines 25 (SDA) and 24 (SCL)

I'm not saying that this is perfect (why is that repeated about 200=20
times?), but it works. And here's the initial probe along with the in-DTS=20
gpio-hog definitions:

[    0.050828] armada-38x-pinctrl f1018000.pinctrl: try to register 60 pins=20=

...
[    0.050832] pinctrl core: registered pin 0 (PIN0) on f1018000.pinctrl
...
[    0.050971] pinctrl core: registered pin 59 (PIN59) on f1018000.pinctrl
[    0.050975] armada-38x-pinctrl f1018000.pinctrl: no hogs found
[    0.051002] armada-38x-pinctrl f1018000.pinctrl: registered pinctrl=20
driver
[    0.051014] armada-38x-pinctrl f1018000.pinctrl: pinctrl_add_gpio_range
[    0.051295] armada-38x-pinctrl f1018000.pinctrl: pinctrl_add_gpio_range
[    0.051740] gpio gpiochip0: gpiochip_generic_request for offset 19:=20
empty list of ranges, proceeding anyway
[    0.051753] pinctrl_gpio_request: 19:
[    0.051758] pinctrl_get_device_gpio_range: for gpio 19
[    0.051766] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 19
[    0.051775] pinctrl_gpio_request 19: requesting via _request_gpio
[    0.051783] armada-38x-pinctrl f1018000.pinctrl: pinmux_request_gpio pin=20=

19 gpio 19
[    0.051794] armada-38x-pinctrl f1018000.pinctrl: request pin 19 (PIN19)=20=

for mvebu-gpio:19
[    0.051799] armada-38x-pinctrl f1018000.pinctrl: pinmux_request_gpio ret=20=

0
[    0.051805]  got 0
[    0.051813] pinctrl_get_device_gpio_range: for gpio 19
[    0.051821] armada-38x-pinctrl f1018000.pinctrl:=20
pinctrl_get_device_gpio_range: found a range for GPIO 19
[    0.051833] GPIO line 19 (phy1-reset) hogged as output/low

Unfortunately I'm largely ignorant of the relation between gpio, pinctrl=20
and pinmux, so I'm afraid I cannot dig much further. Should I try to=20
blindly add the "gpio-ranges" into the DTS, for example?

With kind regards,
Jan
