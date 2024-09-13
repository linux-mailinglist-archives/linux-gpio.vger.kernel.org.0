Return-Path: <linux-gpio+bounces-10059-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA6977EC0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 13:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B297288AEA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 11:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C0C1D88CE;
	Fri, 13 Sep 2024 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="+JmDCEuF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E21D86EC;
	Fri, 13 Sep 2024 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726227889; cv=none; b=FwHsRoODcuUrToJGf3SdiBQZr1hDGE9xkDq+HZhJZnGc+kORVtpDljVP3P08WCsAcK5t+2IYb0klwp4LDDef8TNwzzzJhs9JQmr31oTZodkcNLrak92csYN+VFLGGEbfp0S+X+4YfOdpBFVkIA6sOxO2iFFkzcc7uNBDy1Sa/2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726227889; c=relaxed/simple;
	bh=D6Aea0vN4+YQgnTaFtA2Xc8h1cmTBP0II52kCPnOPg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HOyMH/p3fVf25PO3hYc1iWG+F+M9DYUunLb968ehzitmZTpAmgKYg8ln+cWF82Y3xOgjo4/4n7doA/dwN3kxRYFVJnDoa+XChll/PdwxQiDJkWbudkhj/+DU2OLdd07qIRHpHe66RtgBIPd+WWR4kwDrBiKeWUMdkGbfk3RE7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=+JmDCEuF; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=uKY+vBHzrvIaEx4iv91a6m00ms046KPp640Lmm3Yn6s=; b=+JmDCEuFzksb5sWhlECW0+2ZkO
	984ONyEZWm3pqtyBG2GROEMIooQCO/NjangcEc7ZcbgeIyPWdsw/N8Zil+lxlxbsBZcBEMtt8bk77
	NqpsRDf+fcrulXLVcyphURBI0VYmHPr/sckH3hX8hm6jmi9EQUPppr5GL6hTV9hF7qWQllUs72Xqi
	WYOuaFQW1VdwGG7xSv88h7NZDV2OzS1miuHqndZENlvrlwqj16iVywhBFV+JI5HaUXwSdTfYrsVoA
	m46isSJTld6JZ5ZiwTJ9b1sedRPelftfEIAgRA7JV56cUCyCQAUtl99SXqB8PiU2JWOM4e9J07oze
	2oJ/06+A==;
From: Andreas Kemnade <andreas@kemnade.info>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hns@goldelico.com
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [RFC PATCH] ARM: dts: omap3-gta04: add line names for modem-related GPIOs
Date: Fri, 13 Sep 2024 13:01:25 +0200
Message-Id: <20240913110125.753142-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is one GPIO which needs a high pulse to toggle power of the
modem. Since GPIO numbering (and even chip numbering) is not stable
anymore, make it detectable via gpiofind, so userspace can take care.

There is another reset-out gpio on the A5 which indicates the power state
of the modem, make it also available.

Note: there is a full kernel space implementation of this issue:
https://git.goldelico.com/?p=letux-kernel.git;a=blob;f=drivers/misc/wwan-on-off.c;h=768b6f9fa745d7f4d820685748a1b801e731962d;hb=letux-6.11-rc7
which never hit mainline.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
CC: linux-gpio@vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
---
This looks quite ugly and does not even fully solve the problem, since
gpioset does not keep that gpio state on exit, so scripts using
sysfs-export cannot use it as a drop-in replacement. So probably some
daemon sitting on that gpio is needed, if things should be done in
userspace.
At least this patch improves the description of the hardware
what is what the devicetree is for.

 arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi  | 7 +++++++
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
index 5001c4ea35658..b00d0d092eabc 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
@@ -469,6 +469,13 @@ OMAP3630_CORE2_IOPAD(0x25e4, PIN_INPUT | MUX_MODE4) /* rx */
 	};
 };
 
+&gpio6 {
+	gpio-line-names = "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "",
+			  "", "", "MODEM_EN";
+};
+
 &i2c1 {
 	clock-frequency = <2600000>;
 
diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts b/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
index 230f6f4fc6bf8..be7f71d720680 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
@@ -44,6 +44,10 @@ irda-en-hog {
 	};
 };
 
+&twl_gpio {
+	gpio-line-names = "", "", "", "", "", "", "MODEM_RESET_OUT";
+};
+
 &omap3_pmx_core {
 	bt_pins: bt-pins {
 		pinctrl-single,pins = <
-- 
2.39.2


