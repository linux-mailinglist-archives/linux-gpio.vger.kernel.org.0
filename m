Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C2E286E5A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 07:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgJHF5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 01:57:25 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:51229 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726245AbgJHF5Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 01:57:25 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 544FE7DA
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 01:57:24 -0400 (EDT)
Received: from imap22 ([10.202.2.72])
  by compute4.internal (MEProxy); Thu, 08 Oct 2020 01:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiius.com; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm3; bh=bpLRl7GZ5pNr1Yp+kvyzj2TFqim0Zo00JzhlivmWGlQ=; b=ur8cQfpJ
        VLyD94eL+kaV5jncjERV3x4TjqypxpT7qOezS+sEW/cpp/fr1KRBj83jf4fsVn2l
        hU12tMnl0jjeMOc1ZjX+JMm8t0AwKVtTDJSr/2qDLuWIXDhlHbhQkBRK5Z8VeZ/I
        Q7piMilVfmqFIIMYKNvtZSV8Lu66tRus7xQ5893cx+XDLWPNgYOORqQw1boummzj
        5rKQAqeiSLZBf6JXt5ccNON9CBcpHYuPPeDeji0UvYtqJQh4b0SJcQsK+aik0v7f
        rXP+w9vRoUhLG8+CIHJ4PUAyYCx7XPOt+pOjZsntCbL/E6ojN/Pitk91gHWw0M3H
        Q2tskEtDHJjy0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=bpLRl7GZ5pNr1Yp+kvyzj2TFqim0Z
        o00JzhlivmWGlQ=; b=IahHSwW4mqEs5+1VEka+yeet3BNfyCOZ3WXBmbzOtBhzd
        QXMwrUmxFJx+5Wjx3oCGDwjJfxxPEM55Q3+M6JJx6Qvn4RIVynKplx3T6LNa/19y
        jgpF9FycykYV9vdmaI4nH0NvMITHr2upo5UQKhopJXZ2KbPIMAf06lAczd2Qlbvx
        iLuHjUhE23x0wSTcwwWOWW4+6BsLIaEE7mjQsWhpS275eHhglHRKlQSY2n1OIdSw
        k7S9BYU0oYNn6SBBmICqjmfMj7Xnijcta/bWX2mugXIrkKlLmIKKz7KcYx6gOU0L
        Eu3JZwoHhBaEGE54CTslYE2iZIXroLhkLdYOXI5pw==
X-ME-Sender: <xms:Q6p-X7_vpukFMHopgpzJB0AT-r9-U6ANmqSstbL1Y01G0oE4l-9tNw>
    <xme:Q6p-X3vKg2Xzf_WxzKVTCwC37F-1paMqb51nH0VPa_KRBnyHDRT2XlawMeR3gLI1A
    pIu4B3HgztGBnsvQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeejgddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedflfgrmhhivgcuofgtvehlhihmohhnthdfuceojhgrmhhivges
    khifihhiuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeekhedvvdeltdejvefhjeelje
    ejleekveduieelheektefhueevjeejudfhjedvvdenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehjrghmihgvsehkfihiihhushdrtghomh
X-ME-Proxy: <xmx:Q6p-X5AQzOveFK2IevPKBwLTFgTpsTMNEi_bwej9TGSZXnE2iM8BwA>
    <xmx:Q6p-X3fZZyZuWeixEH5hPgdQ4fXfKE93tz4jmKHdYnrCS3EXfNfWeQ>
    <xmx:Q6p-XwNGkI-HHe7yHrFUVJwIGnJ72V8iqKDOFRX2g0VLlZr7MKkiVg>
    <xmx:Q6p-X2bzV6GS8QZZbe8NIJsaChyjuGQUMFrB6WNW2FiTW4l1rQd3dQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 65EA16680078; Thu,  8 Oct 2020 01:57:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-407-g461656c-fm-20201004.001-g461656c6
Mime-Version: 1.0
Message-Id: <7102c0df-8d8b-4ef8-babf-a920ff11bcf8@www.fastmail.com>
Date:   Thu, 08 Oct 2020 18:57:02 +1300
From:   "Jamie McClymont" <jamie@kwiius.com>
To:     linux-gpio@vger.kernel.org
Subject: Specifying a valid pullup value for pinctrl_intel from an ACPI table
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Background
==========

Hi all

I am looking to write a driver for a fingerprint sensor found in my laptop. The
device has an SPI plus interrupt and reset lines, specified like so:

   Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
   {
       Name (RBUF, ResourceTemplate ()
       {
           // SPI
           SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
               ControllerInitiated, 0x00989680, ClockPolarityLow,
               ClockPhaseFirst, "\\_SB.PCI0.SPI1",
               0x00, ResourceConsumer, , Exclusive,
               )

           // Interrupt
           GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
               "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
               )
               {   // Pin list
                   0x0000
               }

           // Reset
           GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
               "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
               )
               {   // Pin list
                   0x0008
               }
       })
       CreateWordField (RBUF, 0x3B, GPIN)
       CreateWordField (RBUF, 0x63, SPIN)
       GPIN = GNUM (0x02000017)
       SPIN = GNUM (0x0202000A)
       Return (RBUF) /* \_SB_.SPBA._CRS.RBUF */
   }

The issue
=========

Currently, I call devm_acpi_dev_add_driver_gpios (index 1 for the reset line),
then try to access it with devm_gpoid_get, which fails with -EINVAL.

From some kprobe use, I see that the EINVAL appears to stem from
intel_config_set, which gpiod_direction_output calls (indirectly) with the
config 0x205 -- I understand this to mean PIN_CONFIG_BIAS_PULL_UP with the
argument 1, whereas the function expects a specific resistance value; one of {20000,
5000, 2000, 1000}.

The problematic call stack, as ftrace sees it (the leaf function is in fact
intel_config_set_pull):

    devm_gpiod_get
    devm_gpiod_get_index
    gpiod_get_index
    gpiod_configure_flags
    gpiod_direction_output
    gpio_set_bias
    gpiochip_generic_config
    pinctrl_gpio_set_config
    pinconf_set_config
    intel_config_set

The question
============

Any suggestions as to how this invalid configuration gets produced from the
DSDT, and what the best workaround would be?

I'm assuming that pullups sometimes get correctly configured purely from ACPI,
and this is hitting some edge-case?

I'm running 5.8.13 -- if anyone has an inkling that this is a bug that has since
been fixed, I'm happy to try and use a more recent kernel.

Hardware
========

Laptop is a Huawei Matebook X Pro
CPU is an Intel i5-8250U (the specific pinctrl is pinctrl_sunrisepoint)
Peripheral is a Goodix GXFP5187
The pin number is 58, seemingly named UART0_RTSB

Disclaimer
==========

This is my first foray into kernel development and I've been guessing at a lot of things -- please excuse any silly mistakes :)



Thanks
- Jamie McClymont
