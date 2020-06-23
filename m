Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB30A2063CC
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 23:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393355AbgFWVLU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 17:11:20 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:35542 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391397AbgFWVLS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 17:11:18 -0400
Received: from localhost (ip-78-45-210-6.net.upcbroadband.cz [78.45.210.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 3DA1A400052;
        Tue, 23 Jun 2020 23:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1592946673;
        bh=kyzb0R151FwZhf5vFCabNIOPlmDsR1DUIWV7415zICo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Tkifmqmr6rR70aezTvBGGOIVbgEwZdeDweCuyHNG5biSsjHbyMrDlbl72Wg8EG14D
         5QaERmiAqLby+/qIbhuZ8pPugVpwF9xl7HyD5pcOuDvKTckswGfYgZTG2b0BhLzn9c
         EVumHI1V6cieMT4NKVT1MPEq1zKh4+JMV1ufus+Pr3zi9kclfOdV30Cn0Cc5J0vIiV
         kvopt1JqIjQtQB2eBsvqqfyCiEQ1/r3mzNcpDb16PkuPFyFj1cCLCedPgczhwnj0cV
         S0a++ddIowS6lLBUlEB9i+sIiSw/JZKxnvRy0c+XIc/YrQFRssXsSI3P83UoYnkjtN
         /VHhpLODB/PIw==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Thierry Reding <treding@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     <linux-gpio@vger.kernel.org>, Vidya Sagar <vidyas@nvidia.com>
Subject: Re: GPIO regression on mvebu and/or max310x since 2ab73c6d8323
Date:   Tue, 23 Jun 2020 23:11:12 +0200
MIME-Version: 1.0
Message-ID: <30fdc2f7-47f9-486d-8987-3c3d8b157fe6@cesnet.cz>
In-Reply-To: <7e4a427c-a6bb-4036-ba8d-0f290a17852c@cesnet.cz>
References: <8cffce08-ed84-4242-8dcd-72de693f0f71@cesnet.cz>
 <20200610080327.GA1805015@ulmo>
 <7e4a427c-a6bb-4036-ba8d-0f290a17852c@cesnet.cz>
Organization: CESNET
User-Agent: Trojita/v0.7-412-g2869c385e; Qt/5.13.0; xcb; Linux; Gentoo Base System release 2.4.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On =C4=8Dtvrtek 11. =C4=8Dervna 2020 18:12:07 CEST, Jan Kundr=C3=A1t wrote:
>> All of the above seems to indicate that there are no GPIO ranges
>> associated with the pinmux controller, because that's the only reason
>> why gpiochip_generic_request() wouldn't call into pinctrl to request
>> the pin for GPIO.
>
> I think it's the other way round: there are no pin_ranges=20
> associated with the mvebu's gpiochip, but there definitely are=20
> GPIOs registered for the pinctrl. I went looking further, and=20
> indeed: nothing calls gpiochip_add_pingroup_range() or=20
> gpiochip_add_pin_range().
>
> From the docs it seems that this is supposed to be called by=20
> the GPIO (or pinctrl? or pinmux?) core upon the "gpio-ranges" DT=20
> property. Unfortunately, the in-the-tree DTS files have no such=20
> property in arch/arm/boot/dts/armada-388-clearfog-base.dts. Is=20
> that a bug in these DTS files?
>
>> However, the reason why I sent that patch was because the absence of
>> GPIO ranges would actually cause pinctrl_gpio_request() to crash,
>
> It's interesting because it doesn't crash for me. Are you=20
> referring to pinctrl_get_device_gpio_range() which gets called=20
> from pinctrl_gpio_request()? If so, I think that that one=20
> iterates over all pinctrl devices in the system, and it doesn't=20
> seem to care about a particular gpiodev's pin_ranges. It does=20
> check a pctldev's gpio_ranges later on in=20
> pinctrl_match_gpio_range(), but that's a different thing (a=20
> mapping in the opposite direction, right?).
>
> Anyway, I added a few more print/debugs, and here's roughly how=20
> it looks on 5.7.1 with 2ab73c6d8323 reverted (and extra=20
> debugging):
>
> [    2.313257] i2c-gpio gpio_i2c: GPIO lookup for consumer sda
> [    2.313261] i2c-gpio gpio_i2c: using device tree for GPIO lookup
> [    2.313278] gpio gpiochip0: gpiochip_generic_request for=20
> offset 25: empty list of ranges, proceeding anyway
> [    2.323070] pinctrl_gpio_request: 25:
> [    2.326762] pinctrl_get_device_gpio_range: for gpio 25
> [    2.331916] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 25
> [    2.341514] pinctrl_gpio_request 25: requesting via _request_gpio
> [    2.347628] armada-38x-pinctrl f1018000.pinctrl:=20
> pinmux_request_gpio pin 25 gpio 25
> [    2.355313] armada-38x-pinctrl f1018000.pinctrl: request pin=20
> 25 (PIN25) for mvebu-gpio:25
> [    2.355318] armada-38x-pinctrl f1018000.pinctrl:=20
> pinmux_request_gpio ret 0
> [    2.362211]  got 0
> [    2.364233] pinctrl_get_device_gpio_range: for gpio 25
> [    2.369386] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 25
> [    2.378987] i2c-gpio gpio_i2c: GPIO lookup for consumer scl
> [    2.378989] i2c-gpio gpio_i2c: using device tree for GPIO lookup
> [    2.379000] gpio gpiochip0: gpiochip_generic_request for=20
> offset 24: empty list of ranges, proceeding anyway
> [    2.388771] pinctrl_gpio_request: 24:
> [    2.392441] pinctrl_get_device_gpio_range: for gpio 24
> [    2.397596] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 24
> [    2.407192] pinctrl_gpio_request 24: requesting via _request_gpio
> [    2.413302] armada-38x-pinctrl f1018000.pinctrl:=20
> pinmux_request_gpio pin 24 gpio 24
> [    2.420985] armada-38x-pinctrl f1018000.pinctrl: request pin=20
> 24 (PIN24) for mvebu-gpio:24
> [    2.420989] armada-38x-pinctrl f1018000.pinctrl:=20
> pinmux_request_gpio ret 0
> [    2.427884]  got 0
> [    2.429900] pinctrl_get_device_gpio_range: for gpio 24
> [    2.435055] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 24
> [    2.444806] pinctrl_get_device_gpio_range: for gpio 25
> [    2.449964] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 25
> [    2.459576] pinctrl_get_device_gpio_range: for gpio 24
> [    2.464736] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 24
> [    2.474337] pinctrl_get_device_gpio_range: for gpio 25
> [    2.479489] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 25
>
> (these lines are reported about 200 times...)
>
> [    8.081207] pinctrl_get_device_gpio_range: for gpio 24
> [    8.086362] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 24
> [    8.095965] pinctrl_get_device_gpio_range: for gpio 25
> [    8.101117] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 25
> [    8.110723] i2c-gpio gpio_i2c: using lines 25 (SDA) and 24 (SCL)
>
> I'm not saying that this is perfect (why is that repeated about=20
> 200 times?), but it works. And here's the initial probe along=20
> with the in-DTS gpio-hog definitions:
>
> [    0.050828] armada-38x-pinctrl f1018000.pinctrl: try to=20
> register 60 pins ...
> [    0.050832] pinctrl core: registered pin 0 (PIN0) on f1018000.pinctrl
> ...
> [    0.050971] pinctrl core: registered pin 59 (PIN59) on f1018000.pinctrl
> [    0.050975] armada-38x-pinctrl f1018000.pinctrl: no hogs found
> [    0.051002] armada-38x-pinctrl f1018000.pinctrl: registered=20
> pinctrl driver
> [    0.051014] armada-38x-pinctrl f1018000.pinctrl: pinctrl_add_gpio_range
> [    0.051295] armada-38x-pinctrl f1018000.pinctrl: pinctrl_add_gpio_range
> [    0.051740] gpio gpiochip0: gpiochip_generic_request for=20
> offset 19: empty list of ranges, proceeding anyway
> [    0.051753] pinctrl_gpio_request: 19:
> [    0.051758] pinctrl_get_device_gpio_range: for gpio 19
> [    0.051766] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 19
> [    0.051775] pinctrl_gpio_request 19: requesting via _request_gpio
> [    0.051783] armada-38x-pinctrl f1018000.pinctrl:=20
> pinmux_request_gpio pin 19 gpio 19
> [    0.051794] armada-38x-pinctrl f1018000.pinctrl: request pin=20
> 19 (PIN19) for mvebu-gpio:19
> [    0.051799] armada-38x-pinctrl f1018000.pinctrl:=20
> pinmux_request_gpio ret 0
> [    0.051805]  got 0
> [    0.051813] pinctrl_get_device_gpio_range: for gpio 19
> [    0.051821] armada-38x-pinctrl f1018000.pinctrl:=20
> pinctrl_get_device_gpio_range: found a range for GPIO 19
> [    0.051833] GPIO line 19 (phy1-reset) hogged as output/low
>
> Unfortunately I'm largely ignorant of the relation between=20
> gpio, pinctrl and pinmux, so I'm afraid I cannot dig much=20
> further. Should I try to blindly add the "gpio-ranges" into the=20
> DTS, for example?

Hi Thierry, Linus,
can you help me with this, please? As it is now, my GPIO-based I2C no=20
longer works since 2ab73c6d8323 on this Solidrun Clearfog Base. I suspect=20
that this is because of no gpio-ranges property in the DTS files, but I=20
don't know how the mvebu gpio/pinctrl/pinmux drivers work internally to=20
debug this.

With kind regards,
Jan
