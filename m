Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370822D8D71
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394752AbgLMNxP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:53:15 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:35021 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbgLMNxP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867595; x=1639403595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NMOaX7nnqHG5Nvk9gqNKok5Ph5Os8Tyr372uplmj7Zk=;
  b=g04V3NFoD/xcJj4SnXGSsK4aSvfkYSWOfrHL5tDlXOknCQyy5FYbjwX4
   4+DM1DpAHtGt/pwoW//1NnVhc+zAXQhl1hVVq7yle4/R+hdCxH98PI2Dx
   kq4VR3KbC1LNMIVA3CwBY5citgsqhn/zne+3FxuT+DtRjpsXMlk5xyXUG
   EGMiM6AeFjTLGUR6s2A7/NYSA8mz99/m9P55qPGPFPAnNIxv5uHkPXIiL
   S0CTjurQtk4K6GuI+wynfCepFxsxl+0vzyqr1zc+dzw/XBtALYwAKClV7
   c/p6U4ByI7tR9o0sIOEn4KwCAgPmSKtu3/2aw1yMBAPXPot+KGIycAGWq
   g==;
IronPort-SDR: 8TB03RabdsuC+82tAo7IbvgJ2vY9KK6v8lAvytgRMVDxMfynqO+VRRcvFd6XRapsaSmwcnA8aW
 JaAziUpNEEmsk6CMFsG394VU2NIOXu30ajjxRtXp3sHCJxGXEKb2CoURijLKO2rZlJ/DJkFHAg
 PCl9F6zuoyjuFb5XKWHa0OE2g1rfMHS51ohgkC6f/PrNhfmVI6rO80D3T+NBBbhz5MO/20z70Z
 U8yQ1uUbv9JzmsR0IrKCz5Sb8jPoQ60rcpRIuW/ptY0Aq3KZAyqDdRiqlvfGlSW0H+ThXh2h94
 fNg=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494592"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:12 +0800
IronPort-SDR: 5CMG4gJ4x1IesKkyg8S93UJSFPO2640icsflHWFXX5luPTLoQl2XcoyEdFeqRUQljew1dk2c8E
 LVcxnSvUFem2Zq9N74Z0D9Dkoq9yJORprpEQ/M9pQc9VF8UmrPCMKlWX1pnlqRgsoeeWgnoxOa
 bYIAqAmm8GLuQN9otGOWX2x5E3+XIe5MPYdJmB34Xd6XyHEQhMpmrUF4JhtfWeBoBRaO4DJ5VZ
 Af/xcsxZrWd5HyNYn/m1Qedz1X/2w7uwZucPfTVUmMrbVlfpsTbBBjwjzril+qW+3ZnDwof4Cx
 GP6p7wkZren6tWkDWuZAX01/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:34:57 -0800
IronPort-SDR: IJsD/MpnNU/E0sI0QTn7PtJBBa/rZb8u6wNxKXFJ6F1ldYnWc6CDAFDeSyF6RO0FTU95D5oay1
 s4k12NUYqt89FnqwuvNGzfMsIC3aLf99HxB/FX6u7/DTXDSUyIWpf4vxdK9JctFR8xsISxjWTr
 Kx1P8BsMbtVjJP7ljHDmGX7gclUxNN+oSX1RzKb7Rn7JGm8FdJhRjrtUf2I9ho1Znun+thNkus
 1X4MD5u4kcswGI7LJ76TDS+StijOK6DqcFoOgyWPeYg4nPVnQWH6yERhXAYQ2bZA1ZR1cHi4xX
 qhM=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:10 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 06/23] riscv: Fix Canaan Kendryte K210 device tree
Date:   Sun, 13 Dec 2020 22:50:39 +0900
Message-Id: <20201213135056.24446-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove the clocks property from the cpu and clint nodes as these are
ignored. Also remove the clock-frequency property from the cpu nodes as
riscv relies on the timebase-frequency property.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index d2d0ff645632..354b263195a3 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -38,8 +38,6 @@ cpu0: cpu@0 {
 			i-cache-block-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-block-size = <64>;
-			clocks = <&sysctl K210_CLK_CPU>;
-			clock-frequency = <390000000>;
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 				interrupt-controller;
@@ -56,8 +54,6 @@ cpu1: cpu@1 {
 			i-cache-block-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-block-size = <64>;
-			clocks = <&sysctl K210_CLK_CPU>;
-			clock-frequency = <390000000>;
 			cpu1_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 				interrupt-controller;
@@ -101,7 +97,6 @@ clint0: clint@2000000 {
 			reg = <0x2000000 0xC000>;
 			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
 						&cpu1_intc 3 &cpu1_intc 7>;
-			clocks = <&sysctl K210_CLK_ACLK>;
 		};
 
 		plic0: interrupt-controller@c000000 {
-- 
2.29.2

