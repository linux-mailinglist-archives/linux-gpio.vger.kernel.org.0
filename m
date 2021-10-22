Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3793743774E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 14:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbhJVMn2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 08:43:28 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39140 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232564AbhJVMnK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 08:43:10 -0400
X-UUID: ab8199e755454b2a874eaf5e838e175b-20211022
X-UUID: ab8199e755454b2a874eaf5e838e175b-20211022
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1221396786; Fri, 22 Oct 2021 20:40:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Oct 2021 20:40:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 20:40:49 +0800
From:   Sam Shih <sam.shih@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        "Sam Shih" <sam.shih@mediatek.com>
Subject: [PATCH v9 4/4] arm64: dts: mediatek: add pinctrl support for mt7986b
Date:   Fri, 22 Oct 2021 20:40:36 +0800
Message-ID: <20211022124036.5291-5-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211022124036.5291-1-sam.shih@mediatek.com>
References: <20211022124036.5291-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add mt7986b pinctrl node

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
index c3e56ea18638..2c873313e7a4 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
@@ -128,6 +128,27 @@ apmixedsys: apmixedsys@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		pio: pinctrl@1001f000 {
+			compatible = "mediatek,mt7986b-pinctrl";
+			reg = <0 0x1001f000 0 0x1000>,
+			      <0 0x11c30000 0 0x1000>,
+			      <0 0x11c40000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11e30000 0 0x1000>,
+			      <0 0x11f00000 0 0x1000>,
+			      <0 0x11f10000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_rt", "iocfg_rb", "iocfg_lt",
+				    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 41>, <&pio 66 66 35>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+		};
+
 		sgmiisys0: syscon@10060000 {
 			compatible = "mediatek,mt7986-sgmiisys_0",
 				     "syscon";
-- 
2.29.2

