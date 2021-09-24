Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331C3417646
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 15:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhIXNy5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 09:54:57 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51413 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231510AbhIXNyw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Sep 2021 09:54:52 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id CB8275C0189;
        Fri, 24 Sep 2021 09:53:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 24 Sep 2021 09:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nakato.io; h=
        from:to:subject:date:message-id:mime-version
        :content-transfer-encoding:content-type; s=fm2; bh=N2z3Rjv7FmN9K
        fp+nGHwAv8da6c1f58EHNdH5XamoD8=; b=Pf3O9iT+IKbbkoul7BEN6P4kdkJN+
        /dEQ6vZVLfdDRUJE/tn3HkXtepvUpYHGMxAzEhs8IzRa8KgDCPRicxyGKx/qhwmS
        6u8LTXg6BagtzvuStFb5klC19OCWOjg5vbJt3cEOk422njHs+gZ2JveqKkgOEE9O
        zrn6Vm84p3cHsGA/dz+2+XhBuNjjqtmeaPJi5T0mSt5mkw/97dR2S0YQ6TN6c+0u
        9tX/5c/ze/S679VyRplu+U68xkt0Ld3XAFlI4IaSSNbxuwhiE8WAQx8NBwQg6KHT
        tfgKMdG+anGGE68mDeoB10GGg4vgGX6u7u8uZI3Qw4RiGJouQpTaTu9Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N2z3Rj
        v7FmN9Kfp+nGHwAv8da6c1f58EHNdH5XamoD8=; b=OJ1WW5H4pp+bMZaG4AdNVK
        XL6YpAJRD5PEzHd7qHw9hZgM06baXFfTYSbp63Mb+77MhMBWg6+2BUppEMQo0YXV
        DrTIV9ZRHmsUIJc0w0XNhJApiMBBAZN8wEyxpWd7RtR3KbBhyA4r6+6AT6WMjHqh
        0YFQxNYHC3xsnPpjc0w5OhYu3iAXGvbEULsHWukkITET0mlVzUWUKghoky23+Lgb
        +tacSROc70HTzCwjqWFQRQ21VVOee985qIT9Nm/x1rM6p64Ld+NHguCHpH9UB59n
        Ne7RgWeIioYdbu95EkYLCNsGGbSkGYxcWt4rUIKGddFOI9A5h2wfj615v9j1H7XQ
        ==
X-ME-Sender: <xms:TdhNYTJ-3K1wiel1-nh-DcsvF-B55iAe2DVzu0NXuucS6nkvl_TxqQ>
    <xme:TdhNYXLDUBqbW4-nVOaYksT_dc91jsSE7j0313Qdl8mvQUiAyt1Js4HyGmnJLo1cC
    g8HLhctOX-QDhmT_w>
X-ME-Received: <xmr:TdhNYbv7c8Sb6N9-NgyH6E6pt4rybc7Eq37GbM2eYKeBj4bpVI6CNePPBRxDAU9KsVzd8Z_CN0301fh7f1JN3ju-LMnApRhkiglEiW5I6BeS2UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkggfgtgesthfuredttd
    dtvdenucfhrhhomhepufgrtghhihcumfhinhhguceonhgrkhgrthhosehnrghkrghtohdr
    ihhoqeenucggtffrrghtthgvrhhnpedttddtheegleeuhfdvkeetgedttdejheejkeevue
    euteejjeetudeljeetleekkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgrkhgrthhose
    hnrghkrghtohdrihho
X-ME-Proxy: <xmx:TdhNYcac01i1KwtR2NSa1UtuK3EH5yZC2vpTteJ0dFY_qDYlPRIa9w>
    <xmx:TdhNYaZov2cQraYbz4BALEIH57tVVuJEAkqPy8Wdcy1XgrgCAQ-zeg>
    <xmx:TdhNYQBPcxJbU5DSW5hBVfestCFJgpFoRswh-mMEcWs1Dkzv-jxPzw>
    <xmx:TdhNYTC1oAv86MY8GN6dgqPHIEJcQGks1tgmMJsMHh9ty6Y5PU9DXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 09:53:16 -0400 (EDT)
From:   Sachi King <nakato@nakato.io>
To:     linux-gpio@vger.kernel.org, basavaraj.natikar@amd.com
Subject: Pinctrl-amd interrupt states on boot
Date:   Fri, 24 Sep 2021 23:53:13 +1000
Message-ID: <5303579.8qqCIou7Ap@youmu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I've been working on getting Linux running on the AMD variant of the Microsoft 
Surface Laptop 4, and have tracked down high power consumption and spurious 
wakes in the s2idle state to the interrupt states configured on the AMD GPIO 
chip under pinctrl-amd, in this case an AMDI0031.
I don't think pinctrl-amd has has been used as a wakeup source yet, as it 
never called enable_irq_wake until this[0] patch, which has not hit mainline 
yet.

I read the gpio state before allowing pinctrl-amd to setup, there's 183 pins,
and there are a number configured.  Pin 6 and 11 for example are configured 
with.
6: 0x00c50000: Driver Strength 2, Output enabled, Output high
11: 0x00052800: Interrupt Enabled, Wake in Si03, Driver Strength 2, Input high

My understanding is that on boot Linux expects interrupts to be disabled and 
masked on boot, and I have found that on boot, on this device, the interrupts 
are in various states of configuration.  I'm not sure if this is a quirk of the 
firmware of the Surface Laptop 4 and if I should add a quirk for this device, 
or if the pinctrl-amd driver needs to loop over the pins and disable, mask, 
and clear the wakeup flags in general.  In either case I'm assuming output pins 
should be left alone.  I'm hoping for some thoughts on this.

[0]: https://lore.kernel.org/linux-gpio/20210831120613.1514899-1-Basavaraj.Natikar@amd.com/

Thanks,
Sachi


