Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0FC2D9149
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 01:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbgLNAGe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 19:06:34 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:34897 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730264AbgLNAGe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 19:06:34 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1A5D85802FA;
        Sun, 13 Dec 2020 18:55:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 13 Dec 2020 18:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=z+hKEFWzaz+NIB1StV1wepaJfG
        /xJSZ0kvj+tC6Swzg=; b=hUAoEDQlcEgvw+PQNvhoiwlISPOjjc1xoGHfmzRgy/
        kaSGM6aRagVBqw8jB8Xuq3gAB7TdxL0WYA6TNiJutuPOd3beaxZfLX9cN1sg8YO8
        8ewMOeTO70NN6Hvrq+WHzodkVcoXLXF633z0CWjvmrfe/8O8NWCRyT2bxVcJAvwM
        YUl18Lrr20r31G8BMQ7oZJj0BJ4EWawRAP3a8lNAGvInsxHBn0/1+4R9YujXklzG
        nE8nngtwU+lF7exzlltJiHSRGUKlZZ5dPcrTiO+TL6jrTO70dxivyf+bh+5GcVEC
        wgbg13RDeOoFTv29uX1Yy4ao95nkcFW8p83BQCjnUbRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=z+hKEFWzaz+NIB1St
        V1wepaJfG/xJSZ0kvj+tC6Swzg=; b=pWvnIbVBMSjFTzkAtIcchsKt/X99tjTMD
        3RYjhRwnGL0KsdW1S6dje2WnKDE0boi/PEP2eS6SbH12YCXdUaIpcyPScB5s6zsw
        hriy4r2wbeJq/WwC2oIjH2gq7UipEt8+ybcavDKeCmeE9H6dPPjLoVuwDPq7rFa9
        oI4gRpEntf/x/3MqDwClvjzr37RXD9D7E7boQ3dccAqgvx6xBNYciu06ppHOIqSI
        L/LLNowk6TtnNqQ4/ej27+GdhpqeuTgklHNJld8BmkPu8nG8SKuXkhd1I6pz5KR3
        dR0qQtmGuhUsnReV6rdyaqGEU2Q6BkeNVxuwi395GOByAgnaPvo9g==
X-ME-Sender: <xms:26nWX7i9C_yrIDIvLTrAF2maQllK-Kj_MT1WRlc0Gw6Ry9dPGQgbtw>
    <xme:26nWX4AzCZv7b33a2JebDz2ETVYgqZEYJLKXKZI8k4UyF0BXQ0RxZCUBl8i7J-Lzz
    6FNHDPWSut4qeN-Iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekiedgudejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehieff
    tdevtdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:26nWX7FFkLjHgFyHfoPypPqwrvCqIori9_4SN_6xFtKfaC3Y7XcV7w>
    <xmx:26nWX4QeGjbhn9OxV3LLWyliRtNqaYF81MdO_TrESktnrSKITn4uBQ>
    <xmx:26nWX4xafVZPVc_gdrAGZy_VMevdP7e1tC91PJLgPHfYdmKw66kq3w>
    <xmx:3anWX0h7Pv2pOfItYHprgcVm1fQrCwN_vHEQDWo0HXtPRNCCR-a4Bw>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 10DAE108005B;
        Sun, 13 Dec 2020 18:55:07 -0500 (EST)
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
Subject: [PATCH 0/4] Allwinner H6 RSB support
Date:   Sun, 13 Dec 2020 17:55:02 -0600
Message-Id: <20201213235506.25201-1-samuel@sholland.org>
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
 include/dt-bindings/clock/sun50i-h6-r-ccu.h   |  1 +
 include/dt-bindings/reset/sun50i-h6-r-ccu.h   |  1 +
 9 files changed, 66 insertions(+), 38 deletions(-)

-- 
2.26.2

