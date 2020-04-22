Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC2B1B3D19
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 12:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgDVKLq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 06:11:46 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:57742 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729220AbgDVKLj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2020 06:11:39 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 17D993C0579;
        Wed, 22 Apr 2020 12:11:37 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uza13biTiMxw; Wed, 22 Apr 2020 12:11:32 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 0DFC43C004C;
        Wed, 22 Apr 2020 12:11:32 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.60) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 22 Apr
 2020 12:11:31 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     <linux-renesas-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Yusuke Ashiduka <ashiduka@fujitsu.com>,
        Torii Kenichi <torii.ken1@jp.fujitsu.com>,
        Fukui Yohhei <yohhei.fukui@denso-ten.com>,
        Yasushi Asano <yasano@jp.adit-jv.com>,
        Yuichi Kusakabe <yuichi.kusakabe@denso-ten.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [RFC PATCH 3/3] [LOCAL] arm64: dts: renesas: ulcb: Showcase 'use-alternative-interrupt'
Date:   Wed, 22 Apr 2020 12:10:26 +0200
Message-ID: <20200422101026.9220-4-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422101026.9220-1-erosca@de.adit-jv.com>
References: <20200422101026.9220-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.94.60]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

One caveat is that the 'interrupts' property update _must_ go hand
in hand with the newly added 'use-alternative-interrupt' property.
Is there an easy way to avoid it?

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index d2ba9598cd1e..168dadbd1185 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -174,6 +174,46 @@ &extalr_clk {
 	clock-frequency = <32768>;
 };
 
+&gpio0 {
+	use-alternative-interrupt;
+	interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&gpio1 {
+	use-alternative-interrupt;
+	interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&gpio2 {
+	use-alternative-interrupt;
+	interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&gpio3 {
+	use-alternative-interrupt;
+	interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&gpio4 {
+	use-alternative-interrupt;
+	interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&gpio5 {
+	use-alternative-interrupt;
+	interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&gpio6 {
+	use-alternative-interrupt;
+	interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&gpio7 {
+	use-alternative-interrupt;
+	interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &hdmi0 {
 	status = "okay";
 
-- 
2.26.0

