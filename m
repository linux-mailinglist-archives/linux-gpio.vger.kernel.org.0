Return-Path: <linux-gpio+bounces-38372-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MeowGZgwLGoVNQQAu9opvQ
	(envelope-from <linux-gpio+bounces-38372-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 18:15:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C026D67AC85
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 18:15:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=ZiTFCVAt;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38372-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38372-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53D75335D846
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 16:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6238390200;
	Fri, 12 Jun 2026 16:11:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BC390C88
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:11:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280712; cv=none; b=L7h12nTDFrwASOah3m2CiVgTs0zpAEUYd+tRnovIrweU0iWCBavj8/lIieZn2LsXoG2xk5CjNAts0fNEO90hutRG6muHVltHR/sP74eeF7vUakgSQalzdEdf+/6ShuupmI+lHtYHBW0r182laFtKd5nhMk1yobg/gJQ3qKd2PtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280712; c=relaxed/simple;
	bh=gwRnoLHEJ2e2aonm55QxECGc2QHr+NFFJDbfBSwoje8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=VbcJzS2x0bBB8wl2M1uVhR52qc6dO29v4okLL9rv7t65JePG3/0CskxNdZrqUc3/EPkzhAMMyz/ciiRFLMByA5SW+RyX7t7PS3ivI+GfnY/lo5TePFBo/JbgTxDVk8OyJH1xICZAkdUrEONTvI1Jl4Cvw+atCnXxVmNsqUiwQvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZiTFCVAt; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260612161145epoutp048ed9e79b4d086a7aa5f309a46057abe1~4YV1K93Si2799127991epoutp04S
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 16:11:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260612161145epoutp048ed9e79b4d086a7aa5f309a46057abe1~4YV1K93Si2799127991epoutp04S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781280705;
	bh=XdYfOrCvTbsEsdY21teYUxDeME1thY/TBXXAdk+fCP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiTFCVAtyctusdoqK4L7+7xYP9xITtFcBCHIThWGfFD3HxYDIEUGUofIpF5bbGDns
	 MbmF24LkKjUmai46Q3iUZViboJoyRzKhh3S8PAKYV0ROdSYhPqlcOiYHcVAsKm89we
	 MqFC/FW/1yKxFuRoDTQZk6x8TQBZadxDVHf50Xfo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260612161145epcas5p312e137a9f8c479e6515b52bb525266ba~4YV0wIigk1858918589epcas5p3S;
	Fri, 12 Jun 2026 16:11:45 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4gcPf85rfjz2SSKX; Fri, 12 Jun
	2026 16:11:44 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260612161143epcas5p139a40813c518c1eee739ba9c0984e911~4YVzNLqDs0799207992epcas5p18;
	Fri, 12 Jun 2026 16:11:43 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260612161142epsmtip14e0e5bb007a523c2e20695ee95f34c7e~4YVxla5TI2450924509epsmtip1e;
	Fri, 12 Jun 2026 16:11:41 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 4/5] arm64: dts: exynos: add initial support for Samsung
 Exynos8855 smdk
Date: Fri, 12 Jun 2026 22:00:19 +0530
Message-Id: <20260612163020.411761-5-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612163020.411761-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260612161143epcas5p139a40813c518c1eee739ba9c0984e911
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612161143epcas5p139a40813c518c1eee739ba9c0984e911
References: <20260612163020.411761-1-alim.akhtar@samsung.com>
	<CGME20260612161143epcas5p139a40813c518c1eee739ba9c0984e911@epcas5p1.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38372-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,samsung.com:url,samsung.com:from_mime,samsung.com:dkim,samsung.com:email,samsung.com:mid];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:alim.akhtar@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C026D67AC85

Add initial devicetree support for Samsung smdk board using
Exynos8855 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 581 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  37 ++
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 214 +++++++
 4 files changed, 833 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 76cc23acb9b2..8c48ce2e02e5 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7870-on7xelte.dtb		\
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
+	exynos8855-smdk.dtb		\
 	exynos8895-dreamlte.dtb		\
 	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
new file mode 100644
index 000000000000..f5d30fd299b6
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
@@ -0,0 +1,581 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's S5E8855 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2023 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Samsung's S5E8855 SoC pin-mux and pin-config options are listed as device
+ * tree nodes are listed in this file.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "exynos-pinctrl.h"
+
+&pinctrl_alive {
+	gpa0: gpa0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpq0: gpq0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpq1: gpq1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpc0: gpc0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc1: gpc1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc2: gpc2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc3: gpc3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc4: gpc4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc5: gpc5-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc6: gpc6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc7: gpc7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc8: gpc8-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc9: gpc9-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc10: gpc10-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc11: gpc11-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc12: gpc12-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc13: gpc13-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpc14: gpc14-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpj0: gpj0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpj1: gpj1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpj2: gpj2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	uart0_bus: uart0-bus {
+		samsung,pins = "gpq0-0", "gpq0-1";
+		samsung,pin-function = <2>;
+		samsung,pin-pud = <3>;
+	};
+
+};
+
+&pinctrl_cmgp {
+	gpm0: gpm0 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm1: gpm1 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm2: gpm2 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm3: gpm3 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm4: gpm4 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm5: gpm5 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm6: gpm6 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm7: gpm7 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm8: gpm8 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm9: gpm9 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm10: gpm10 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm11: gpm11 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm12: gpm12 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm13: gpm13 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm14: gpm14 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm15: gpm15 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm16: gpm16 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm17: gpm17 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm18: gpm18 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm19: gpm19 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm20: gpm20 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+
+	gpm21: gpm21 {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
+	};
+};
+
+&pinctrl_hsi_ufs {
+	gpf3: gpf3-gpio-bank{
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_peric {
+	gpp0: gpp0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp1: gpp1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp2: gpp2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg0: gpg0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg1: gpg1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb0: gpb0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpb1: gpb1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_pericmmc {
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
+
+&pinctrl_usi {
+	gpp3: gpp3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpp4: gpp4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg2: gpg2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpg3: gpg3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
new file mode 100644
index 000000000000..3ebe847c21cf
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos8855 SMDK board device tree source
+ *
+ * Copyright (C) 2026 Samsung Electronics Co., Ltd.
+ *
+ * Device tree source file for WinLink's E850-96 board which is based on
+ * Samsung Exynos8855 SoC.
+ */
+
+/dts-v1/;
+
+#include "exynos8855.dtsi"
+
+/ {
+	model = "Samsung Exynos8855 SMDK board";
+	compatible = "samsung,exynos8855-smdk","samsung,exynos8855";
+
+	aliases {
+		serial0 = &serial_0;
+	};
+
+	chosen {
+		stdout-path = &serial_0;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x80000000>;
+	};
+
+};
+
+&oscclk {
+	clock-frequency = <76800000>;
+};
+
diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
new file mode 100644
index 000000000000..cffa40b6bb98
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung Exynos8855 SoC device tree source
+ *
+ * Copyright (C) 2023 Samsung Electronics Co., Ltd.
+ *
+ * Samsung Exynos8855 SoC device nodes are listed in this file.
+ * Exynos8855 based board files can include this file and provide
+ * values for board specific bindings.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "samsung,exynos8855";
+	#address-cells = <2>;
+	#size-cells = <1>;
+
+	interrupt-parent = <&gic>;
+
+	aliases {
+		pinctrl0 = &pinctrl_alive;
+		pinctrl1 = &pinctrl_cmgp;
+		pinctrl2 = &pinctrl_hsi_ufs;
+		pinctrl3 = &pinctrl_peric;
+		pinctrl4 = &pinctrl_pericmmc;
+		pinctrl5 = &pinctrl_usi;
+	};
+
+	oscclk: clock-oscclk {
+		compatible = "fixed-clock";
+		clock-output-names = "oscclk";
+		#clock-cells = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core3 {
+					cpu = <&cpu6>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a520";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a720";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x20000000>;
+
+		gic: interrupt-controller@10200000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <4>;
+			#address-cells = <0>;
+			#size-cells = <1>;
+			reg = <0x10200000 0x10000>,
+			      <0x10240000 0x100000>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		pinctrl_alive: pinctrl@11850000 {
+			compatible = "samsung,exynos8855-pinctrl";
+			reg = <0x11850000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pinctrl_cmgp: pinctrl@12030000 {
+			compatible = "samsung,exynos8855-pinctrl";
+			reg = <0x12030000 0x1000>;
+
+			wakeup-interrupt-controller {
+				compatible = "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
+			};
+		};
+
+		pinctrl_usi: pinctrl@15030000 {
+			compatible = "samsung,exynos8855-pinctrl";
+			reg = <0x15030000 0x1000>;
+		};
+
+		pinctrl_peric: pinctrl@15440000 {
+			compatible = "samsung,exynos8855-pinctrl";
+			reg = <0x15440000 0x1000>;
+		};
+
+		pinctrl_pericmmc: pinctrl@154f0000 {
+			compatible = "samsung,exynos8855-pinctrl";
+			reg = <0x154f0000 0x1000>;
+		};
+
+		pinctrl_hsi_ufs: pinctrl@17040000 {
+			compatible = "samsung,exynos8855-pinctrl";
+			reg = <0x17040000 0x1000>;
+		};
+
+		serial_0: serial@15500000 {
+			compatible = "samsung,exynos850-uart";
+			reg = <0x15500000 0x100>;
+			interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_bus>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
+		interrupts =
+		     <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+		     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+		     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
+		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
+	};
+};
+
+#include "exynos8855-pinctrl.dtsi"
-- 
2.34.1


