Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66BB72AB8C9
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 13:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbgKIM47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 07:56:59 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49807 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729882AbgKIM4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 07:56:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0DDF45C02B4
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 07:56:49 -0500 (EST)
Received: from imap22 ([10.202.2.72])
  by compute4.internal (MEProxy); Mon, 09 Nov 2020 07:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiius.com; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm3; bh=nJND+74rJtWsZauz0uPnNk+J58BKR0M50nAkBoSy/jo=; b=0dyJfg5J
        RmcVdku97553VZT968gO+p+zXLwGpc+gPW6IfWdJESwE7KGjcX19CH4+y/8YKBel
        F2r0pMhXhERwBvDAj+8tF3FVstUzJFppLuvt6fmtmN3NJHlIBkbGyH4af/5W5FAi
        Z1kDCFEUbR6WCxSfXCAgONClopUtH/+6AyGKaYsQIl8mi7IJRIlG5tCUiWphK8Se
        /YS19g+n5dIMsYJbsWCtgVhMkvQuR/YYjXDSYrTCI7SLmRb5iCMK5hEHCPNli4XV
        st5Qtj5dZOY09Jo37wRJWubi4Y23yIbKbeZuLbA6tOH9cWWhibm3gjatfAdY0zur
        b4OeivF2ssEwmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=nJND+74rJtWsZauz0uPnNk+J58BKR
        0M50nAkBoSy/jo=; b=X+C4Is/DvSPh4LloxP6piW/vleU3lISnpsbshH877uLt/
        t/BsE8ZczYbqhfWIrhcHF6oEZcpRWPuMyAJ2rt5sKXqOOs9OpNST8pi0T7X2IUnu
        lJpiHJ+il5tqOu4ulJ/YbrYSYvXM4BJo+N7HuyfRl4Jfbwktk/r4SGRbhQi70/lD
        OrGWV12f0ijK6+eH3+T8l6lf4muq27mlyRx9bbo5nBXdYUqcEaredEpUjT2yTWVm
        oFDsVzVEU7xXa+Dx23kVBkGbcnXKcvhqcnyeXaen0lX0ZSuzIZgAtP/hpGcIIQmk
        BKGBzC3pqAYCtQpG5Dgii+HDlShpMO8xhcBUnHBtw==
X-ME-Sender: <xms:kDypX6PSpXjkZfMVHDr6wPEY5nzaRGy2UzAoX3-RsDbrbU2aMdnKWA>
    <xme:kDypX489Eyolm4sIC4UM75AVxnirMqVWLeO8fOJvFd_IksAWeZfJD8ddvCPMk7JJZ
    aaoj9-Lgx1y3ZtSOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudduhedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erreejnecuhfhrohhmpedflfgrmhhivgcuofgtvehlhihmohhnthdfuceojhgrmhhivges
    khifihhiuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeludejleehvddutdefleffhe
    ffffffffeljeejieegheeguddtjedvveekieevfeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehjrghmihgvsehkfihiihhushdrtghomh
X-ME-Proxy: <xmx:kDypXxQItOy4gGr_40YfNqa8oPKmd5flW4_WnzpYiyebM6uJaPX8-w>
    <xmx:kDypX6vUPJfvxe85_PH0hcf8jkX403W-gsYRMWzPiS1401YrIMs3Ig>
    <xmx:kDypXyfz359t2Mp1eo0tnva6kam8qzdSMXpP8etrkweK4Y_8oYeGaQ>
    <xmx:kTypX8rOEsbEETKufaW6Xy0UPG5rnZqjtctIiC9qJ_K5_KG2E_WbOQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7E40C668007A; Mon,  9 Nov 2020 07:56:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-570-gba0a262-fm-20201106.001-gba0a2623
Mime-Version: 1.0
Message-Id: <a491261f-8463-474d-a6b3-d674670c7bb7@www.fastmail.com>
Date:   Tue, 10 Nov 2020 01:56:27 +1300
From:   "Jamie McClymont" <jamie@kwiius.com>
To:     linux-gpio@vger.kernel.org
Subject: =?UTF-8?Q?How_to_handle_a_level-triggered_interrupt_that_is_slow_to_de-a?=
 =?UTF-8?Q?ssert_itself?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

Background context:

I'm continuing my efforts to reverse-engineer and write a driver for the Goodix GXFP5187 fingerprint sensor in my Huawei Matebook X Pro (the host is an Intel i5-8250U).

The device is connected via SPI plus a GPIO Interrupt pin, defined like so in the ACPI tables:

    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
        "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,) { 0x0000 }

This line is held down by the device when it has a message for the host, and stays held down until the host finishes reading the message out over SPI.

I'm handling this with a devm_request_threaded_irq-type handler, where the irq part is just "return IRQ_WAKE_THREAD", and the threaded part does all the work. My understanding is that this is a reasonable approach since I don't have tight latency requirements (and the sleeping spi functions are convenient, plus I don't want to introduce any unnecessary jitter to the system) -- please correct me if I shouldn't actually be using a threaded handler here.

---

Here's my problem:

the IRQ line actually stays held down for roughly 180us after I've finished reading out the message over SPI. That means that as soon as the handler finishes, a new one starts, and it reads out corrupted data, since the sensor doesn't have anything to say.

This is okay in theory -- the corrupted message header can be detected by its checksum, and disregarded. However, this leads to a race condition where the chip can decide it DOES have something to say to the host, WHILE the host is reading out the corrupted header. At that point, the two sides de-sync in their ideas of what needs to be read, and everything stops working.

So, I'd like some way to pause interrupt handling for 200us+, and only re-run the handler if the line is still held down after that time.

My first approach was to add a sleep (usleep_range) at the end of the threaded handler, right before returning IRQ_HANDLED. However, it appears that after the sleep finishes, the IRQ is triggered one more time -- presumably it has been set as pending before/during the sleep?

My new workaround is to save a ktime_get_ns timestamp at the end of the handler, and check it against the current ktime at the start, returning early if not enough time has yet elapsed. This is unsatisfactory, as it is effectively a 180us busy-wait, and gets in the way of whatever the core could better be doing (presumably idling and saving power :).

Is it possible to return to the first approach, but prevent that one spurious interrupt from firing after the handler ends?

Thanks
-- Jamie McClymont
