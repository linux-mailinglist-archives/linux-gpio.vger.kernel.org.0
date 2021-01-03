Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818352E8B95
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Jan 2021 11:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbhACKBW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Jan 2021 05:01:22 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:47227 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726551AbhACKBR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Jan 2021 05:01:17 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 063BE5803E6;
        Sun,  3 Jan 2021 05:00:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 03 Jan 2021 05:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=guJpiRmPNmpuay60jtLre2M1kZ
        YS531pnroQeqKbbp8=; b=YLDuPULraX09Gwh5S9275jKOlHpmSStsqW94OkeYxn
        Hh6Qil1iiurLo+nuzPV4bEpVKpyQJLUsWse5NAy8dmdCsct9RkzYP03e4kVJts/T
        LaYfuqps8v+rZpM7oZPdjf0ypbWbYTjZlnu/RG0UDxfjrsPD5OjhIcn5RVH3nu+X
        D8mMtSdrhMW3cbog1JF4CzfTxKAV1xuJOLpQkIa5WGQwO3fJTT+jAbLaHn27ix3c
        wYwrGZD3qeSRSuwO862por3DxlXosye3jxCkm2pYfGz3JGEyRz6Hy+NkxxSm44Wv
        HQl2LfXspvALgsknS2uFwbJWCYgqre8++bvqDBh2jSfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=guJpiRmPNmpuay60j
        tLre2M1kZYS531pnroQeqKbbp8=; b=XqukjVFBhkXyrlYdkIfVHin2RGLB+4Xrp
        5kCugZ3nr/hjQUb4ulN0voovduXwX8ulsZ8nHcNGHKRFdHMPxPvA3apRc1fiZ4o2
        AyZjnUNup7eG03QXH5nUwwO+MU/3Iz7X1ynoAQmbRjtL5+RSLXvzyvReXfgLk5iI
        lg2qmy2zJ5kUvP86Qa3jNEQm8dwi6CfYDUBRYNuVSytb9JLaBsePz11gjfDbola7
        OfFviaN/DQr0AlNAtGpHnz4ozkuJFRHciLNvYFKnYwYkbdPe4ptr7Lg0Lbyed72K
        tL+BkAZjmaDWT53tQKYWWBby1ei+YZUw8z0oKaV11tXjnUo8r5Acg==
X-ME-Sender: <xms:qZXxX0phcwZrR8dRkK3P7v8ZrkTS3YVxss9LyeYLCIiTaHzA2boatQ>
    <xme:qZXxX6oEt4wmoX6PEIoRaNly11DRrzVkBLjfuLra6Z_so6q8If2H-p8AyrD51IQex
    L9GfhxvMQsy79miqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefuddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
    vedtveenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:qZXxX5MQNgi5QNT9nVQ-OM0WoSlteqazr5vufWThLufZAOB9WCP9wQ>
    <xmx:qZXxX76MUBgCyU2tuM0GBzX5yp7WlXtI9DvgRr92WAkmlo9C1a5Hlg>
    <xmx:qZXxXz5lKngfOPJnYJ_3JpD8YHZD10fH6P3gX3j0dNFqBp5SGj1Gjg>
    <xmx:qpXxX6L9aMUoSmBILSK09FG75vCLdiXSlGuLRfc9mHgBaO1FMMDAfA>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 82CD11080059;
        Sun,  3 Jan 2021 05:00:08 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 0/4] Allwinner H6 RSB support
Date:   Sun,  3 Jan 2021 04:00:03 -0600
Message-Id: <20210103100007.32867-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Allwinner H6 SoC contains an RSB controller. It is almost completely
undocumented, so it was missed when doing the initial SoC bringup.

This series adds the clock/reset, pin configuration, and device tree
node needed to use the RSB controller. Since RSB is faster, simpler, and
generally more reliable than the I2C controller IP in the SoC, switch to
using it where possible.

This was tested on an Orange Pi 3 and a Pine H64 model B. This series
does not switch the Pine H64 to use RSB, as doing so would prevent
accessing the external RTC that shares the I2C bus.

Changes v1->v2:
  - Put the new values at the end of the DT binding headers

Samuel Holland (4):
  clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset
  pinctrl: sunxi: h6-r: Add s_rsb pin functions
  arm64: dts: allwinner: h6: Add RSB controller node
  arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection

 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 38 +++++++++----------
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 14 +++----
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     | 22 +++++------
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 ++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c        |  5 +++
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h        |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6-r.c   |  2 +
 include/dt-bindings/clock/sun50i-h6-r-ccu.h   |  2 +
 include/dt-bindings/reset/sun50i-h6-r-ccu.h   |  1 +
 9 files changed, 67 insertions(+), 38 deletions(-)

-- 
2.26.2

