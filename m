Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD33289F7F
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Oct 2020 11:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgJJJN6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Oct 2020 05:13:58 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34201 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729774AbgJJJGx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 10 Oct 2020 05:06:53 -0400
X-Greylist: delayed 441 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Oct 2020 05:06:52 EDT
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id F35089EA;
        Sat, 10 Oct 2020 04:57:59 -0400 (EDT)
Received: from imap22 ([10.202.2.72])
  by compute4.internal (MEProxy); Sat, 10 Oct 2020 04:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiius.com; h=
        mime-version:message-id:date:from:to:cc:subject:content-type; s=
        fm3; bh=h4L4xcSjTMsLYI/deQYifefhu3uu+ddn2HqbrenwFuw=; b=M+nGXN+w
        oklIyElgLSMdr1BXKjWyxl0eaRQYjU+EtCI9Fs1NLDbiiUA7Kmolr2VlNpPpddkZ
        vuFIqCHGZ8Lpv8PcxxGw43SzPAGPdoRAvj72JBYsMBHPQN4Fcn48GNJ/LVsK5o48
        ZHaATHFOPzz9qF62sx6A8q7Q5h2RjG/7DEeqvy2mjWgRkdUsH+/w5Vj/fw8+l9dF
        3YfQXSx3jAVXXHJ88D18ASNBK/3siWFMxcdQHTYYZK/VH3L/qknhA2kot8T2/XwO
        5wbZvEwqF+JBfIlwKEW86UuEiSKVT7dVp9fv22eOgKBYig59k5ASmiwkPj6/3iJJ
        v/DkoElNkSxgiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=h4L4xcSjTMsLYI/deQYifefhu3uu+
        ddn2HqbrenwFuw=; b=nWKNsIaS6hxzq956oD62iDvQ6xvuQq2PSSjdGCTd6vGRO
        Rvej75bBVzrbgmMGJbrPf72JWh4NYhpReVH+CLqckBGJ1rmQlnsXYQhsbbTBETJN
        zfTnt1y9fer9jUPzq684Jx6OekczNu2IUhu69hakQpIziUjBBkH72hdcDkVCz4y3
        TpCEsu9iQ3TTaYcoof52m5NJKNaSJPx2ToE+huzVQB4udPPFu+60Z7Dql8LeBMx9
        jcGI7rZKV1x17qO/bB7iQj0a5u+dMXdJuInA1PblUylPAxbWchP2lVed+tRwOVYS
        yt7s7s7PeVQ5bRNjsAbkhjdAfl0CKv40fTgLI6c0g==
X-ME-Sender: <xms:l3eBX3rES_kblsPxmPGIZ-ggZ0z2gFocovZSIWE8A5GH-REEFVVc-g>
    <xme:l3eBXxpgNmzcHLllLRGUN8qAhllPesetlpShPcW7ZtKbrqsTvV6Z0nsawpMPzexFt
    itXEZ9O_3AwSAT5iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheefgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvufgtsehttdertderredtnecuhfhrohhmpedflfgrmhhivgcu
    ofgtvehlhihmohhnthdfuceojhgrmhhivgeskhifihhiuhhsrdgtohhmqeenucggtffrrg
    htthgvrhhnpeekhedvvdeltdejvefhjeeljeejleekveduieelheektefhueevjeejudfh
    jedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hjrghmihgvsehkfihiihhushdrtghomh
X-ME-Proxy: <xmx:l3eBX0Of1ggERW7RYaPgQFuKxckJSAlgmYwC1sny0B3HU5m9NNNdng>
    <xmx:l3eBX65tH8ex-Bu-m1dEHObni-4INj4IBrras7YK95zg41TpRYbfIg>
    <xmx:l3eBX27Ll0Hc0CfuL0j6Rkl1hFMt3f08wATiF1M_hD2NePTTgnC1sQ>
    <xmx:l3eBXzW8ODIlBB8o9qgxWtJP82KNet0hc6pU_koBEYeeDcio_C6bww>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 178D86680078; Sat, 10 Oct 2020 04:57:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-407-g461656c-fm-20201004.001-g461656c6
Mime-Version: 1.0
Message-Id: <778e96d4-1695-43ee-90d6-86cc34b20418@www.fastmail.com>
Date:   Sat, 10 Oct 2020 21:57:37 +1300
From:   "Jamie McClymont" <jamie@kwiius.com>
To:     linux-gpio@vger.kernel.org
Cc:     "Andy Shevchenko" <andy.shevchenko@gmail.com>
Subject: Configuring bias on an APCI GpioInt
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi again,

I have run into a second GPIO issue while writing a driver for the fingerprint sensor in my laptop*, configured in the ACPI table like so:

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

I call devm_request_threaded_irq with the number provided in the irq field of the `struct spi_device` during the spi_probe.

This configures the right IRQ number, and it triggers when it should, but it stays asserted for 140ms-600ms after it should have been cleared.

Given it's an active-low level-triggered interrupt with a pull-up requested by the acpi table, my theory is:

* The interrupt line is driven open-drain by the peripheral
* The pullup is not being correctly configured
* It is slooooowly pulled up by leakage current of the GPIO input, hence the interrupt being cleared after 140-600ms

Looking at traces and confirming by source code**, it seems that no code ever attempts to configure the pin's bias during the irq setup.

Is this a bug, or should I be manually setting up the GPIO some other way before requesting the IRQ?

Thanks
- Jamie McClymont


*Hardware details
==============

Laptop is a Huawei Matebook X Pro
CPU is an Intel i5-8250U (the specific pinctrl is pinctrl_sunrisepoint)
Fingerprint Sensor is a Goodix GXFP5187 (not well-documented anywhere, I'm working through reverse-engineering)

** Tested on 5.9-rc8, but I've been reading the source of linux-next and haven't picked up on any relevant differences
