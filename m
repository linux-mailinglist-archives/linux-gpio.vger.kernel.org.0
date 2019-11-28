Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3E510C9D6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 14:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfK1Nu3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 08:50:29 -0500
Received: from office2.cesnet.cz ([195.113.144.244]:38810 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfK1Nu3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 08:50:29 -0500
X-Greylist: delayed 381 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Nov 2019 08:50:27 EST
Received: from localhost (unknown [IPv6:2001:718:1:2c:a5b5:770:4491:af45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id C223F400052;
        Thu, 28 Nov 2019 14:44:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1574948645;
        bh=4yrHp5HOMLkdPiO7NgtJ2qJ5Ivm8EZvRRYMx+NljQuI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DPllQ5iyBQ9S/jI96VPUH+eaACgvxiAEBscbRsk9fBYvs94J1jfvIDMVjU0ME9wWG
         GEqLQR0XGdKUOKItpdAkS2EeeeJZrYDXrcS7HZonIY5iha9x64wcMtsXzMRuO+m6HV
         gejkuUcR6ExK+8Z43zaMvRtBzHfBU2JChsJcsIzY58dNE3PgwG6ShgsdKQAb7Ryrvv
         l2TcKkGkARjzV+mjEGS+GbHtLjJ6mCZOLUy/E+ny40kcMgIhUxQ8gCjJXXY9ly0QK0
         iYBfpq0fhFt3R2mQsddjMVH2ok9tjiUZr8+qq5pC0mYz4C46bOj3PrkNSl3JnBWLA9
         y6XqL1yVHZ/HA==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Phil Reid <preid@electromag.com.au>,
        Phil Elwell <phil@raspberrypi.org>,
        Jason Kridner <jkridner@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: Multiple SPI MCP23S17s sharing a CS line
Date:   Thu, 28 Nov 2019 14:44:04 +0100
MIME-Version: 1.0
Message-ID: <3ddc0c46-a5da-4617-b6b2-129ba062a9ec@cesnet.cz>
In-Reply-To: <CACRpkdZ23ncXQE+aqEDeZoppToXmWV+TpnJHjVvK3nxnN78+rA@mail.gmail.com>
References: <d8f95334-789e-995b-9abf-7bb15abb1daa@raspberrypi.org>
 <CACRpkdbWZqNzEcLAjCma8=YdjDPbnZaxt3KYvZTdELLrGzm_FQ@mail.gmail.com>
 <943fd3dd-9090-0c7b-3010-c92c139503b0@electromag.com.au>
 <CACRpkdZ23ncXQE+aqEDeZoppToXmWV+TpnJHjVvK3nxnN78+rA@mail.gmail.com>
Organization: CESNET
User-Agent: Trojita/v0.7-402-g90b417b1-dirty; Qt/5.13.0; xcb; Linux; Gentoo Base System release 2.4.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> "Linux  does not support multiple child devices "within" one SPI slave.
> If there  was proper support for this, this patch would be superfluous."
>
> This is not a real limitation, we can have children inside SPI devices,
> no problem at all. The driver can just parse them with something like
> for_each_available_child_of_node(parent, child) from
> <linux/of.h>.
>
> It is possible for the driver to create proper subdevices for each
> node or just create (I think) the different gpio_chip:s with
> a reference to the unique DT node for each chip and then the
> .xlate function will figure out the GPIO translation.

Hi,
I agree that an approach with "subnodes" is probably the best solution; I=20
like that.=20

When you have a patch, I'll be happy to test it :). I had no idea that you=20=

can put multiple "client" devices such as gpiochips behind a single parent=20=

device (itself a SPI client). I suspect that various fixes for making sure=20=

that no duplicate data are present in, say, debugfs for pintrl and regmap=20
and gpio /sys/kernel/debug subtrees, will still be needed, but I think that=20=

most of them are in place already.

For reference, this is how I've been using these chips:

        gpio_spi_chips: gpio@1 {
                compatible =3D "microchip,mcp23s17";
                reg =3D <1>;
                interrupt-parent =3D <&gpio1>;
                interrupts =3D <22 IRQ_TYPE_LEVEL_LOW>;
                interrupt-controller;
                #interrupt-cells =3D <2>;
                gpio-controller;
                #gpio-cells =3D <2>;
                microchip,spi-present-mask =3D <0x06>; /* extra addresses 1=20=

and 2 */
                microchip,irq-mirror;
                drive-open-drain;
                spi-max-frequency =3D <10000000>;

                gpio-bank@1 {
                        address =3D <1>;
                        gpio-line-names =3D
                                "EDFA1_RESET",
                                "EDFA2_RESET",
                                "PMB_ALERT",
                                "EXP_GPIO2",
                                "WSS_SC",
                                "WSS_RST",
                                "I2C_XOR_RDY",
                                "OCM_HS_OUT",

                                "EDFA1_OUT_REFLECT_A",
                                "EDFA1_PUMP_CURRENT_A",
                                "EDFA1_ST1_IN_LOS_A",
                                "EDFA1_ST2_IN_LOS_A",
                                "EDFA1_ST2_OUT_GAIN_A",
                                "EDFA1_CASE_TEMP_A",
                                "EDFA1_ST1_OUT_GAIN_A",
                                "EDFA1_PUMP_TEMP_A";
                };

                gpio-bank@2 {
                        address =3D <2>;
                        gpio-line-names =3D
                                /* these are all grounded */
                                "GND",
                                "GND",
                                "GND",
                                "GND",
                                "GND",
                                "GND",
                                "GND",
                                "GND",

                                "EDFA2_OUT_REFLECT_A",
                                "EDFA2_PUMP_CURRENT_A",
                                "EDFA2_ST1_IN_LOS_A",
                                "EDFA2_ST2_IN_LOS_A",
                                "EDFA2_ST2_OUT_GAIN_A",
                                "EDFA2_CASE_TEMP_A",
                                "EDFA2_ST1_OUT_GAIN_A",
                                "EDFA2_PUMP_TEMP_A";
                };

                // FIXME: this hogs both .1 and .2 chips' #6 pin...
                i2c_xor_ready {
                        gpio-hog;
                        gpios =3D <6 GPIO_ACTIVE_HIGH>;
                        input;
                        line-name =3D "I2C XOR ready";
                };
        };

Note that FIXME, though. I think that requesting GPIOs by name from=20
userspace works correctly (or perhaps only by chance? Cannot check atm, I=20
don't have the board + scope on this desk), but a gpio-hog from kernel=20
(which uses a GPIO offset within a chip as far as I can tell) appears to be=20=

slightly wonky as wittnessed by /sys/kernel/debug/gpio on this system:

gpiochip4: GPIOs 464-479, parent: spi/spi1.1, mcp23s17.2, can sleep:
 gpio-464 (GND                 )
 gpio-465 (GND                 )
 gpio-466 (GND                 )
 gpio-467 (GND                 )
 gpio-468 (GND                 )
 gpio-469 (GND                 )
 gpio-470 (GND                 |I2C XOR ready       ) in  lo=20
 gpio-471 (GND                 )
 gpio-472 (EDFA2_OUT_REFLECT_A )
 gpio-473 (EDFA2_PUMP_CURRENT_A)
 gpio-474 (EDFA2_ST1_IN_LOS_A  )
 gpio-475 (EDFA2_ST2_IN_LOS_A  )
 gpio-476 (EDFA2_ST2_OUT_GAIN_A)
 gpio-477 (EDFA2_CASE_TEMP_A   )
 gpio-478 (EDFA2_ST1_OUT_GAIN_A)
 gpio-479 (EDFA2_PUMP_TEMP_A   )

gpiochip3: GPIOs 480-495, parent: spi/spi1.1, mcp23s17.1, can sleep:
 gpio-480 (EDFA1_RESET         |EDFA reset          ) out hi=20
 gpio-481 (EDFA2_RESET         )
 gpio-482 (PMB_ALERT           )
 gpio-483 (EXP_GPIO2           )
 gpio-484 (WSS_SC              )
 gpio-485 (WSS_RST             )
 gpio-486 (I2C_XOR_RDY         |I2C XOR ready       ) in  lo=20
 gpio-487 (OCM_HS_OUT          |OCM HS_OUT          ) in  hi IRQ=20
 gpio-488 (EDFA1_OUT_REFLECT_A )
 gpio-489 (EDFA1_PUMP_CURRENT_A)
 gpio-490 (EDFA1_ST1_IN_LOS_A  )
 gpio-491 (EDFA1_ST2_IN_LOS_A  )
 gpio-492 (EDFA1_ST2_OUT_GAIN_A)
 gpio-493 (EDFA1_CASE_TEMP_A   )
 gpio-494 (EDFA1_ST1_OUT_GAIN_A)
 gpio-495 (EDFA1_PUMP_TEMP_A   )

I think this is more or less the same thing as Phil Elwell wrote in his=20
initial message. But I think that=20
https://patchwork.ozlabs.org/patch/1052925/ at least makes it possible to=20
request the GPIOs from userspace.

Hope this helps,
Jan
