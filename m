Return-Path: <linux-gpio+bounces-39917-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OLarJFuwUmqGSQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39917-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:06:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C416B742E9D
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:06:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=DZVBoKIU;
	dmarc=pass (policy=reject) header.from=nabladev.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39917-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39917-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CEA43066221
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 21:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BB83176E0;
	Sat, 11 Jul 2026 21:02:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989C328B56;
	Sat, 11 Jul 2026 21:01:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803727; cv=none; b=j2cnjBHmxfn/yZGCz32DLXhgBbVchsTfpBAvJI8DDiz+AfRrG3Frtv3/Lec75X08iBXkNpBF2oMx+hyxxk6ShxELDbw4WcLjk0oT7IM2T1p6AiA22jgSslROrcPJdWj2/trjhzyTccNCFNfo8eQ5MCKGSph3kslQz3Q2r6/ZOmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803727; c=relaxed/simple;
	bh=g+mNv/EntfDcFHQpYr7sm0Khvaj0iEaLqSyCIEuXEsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCHltmvDuDscji3aITuUIaZ5ZDgatu/+Y/SYNAXKm8Toymj3Fv03y1Xm1AV0XtIoCT9t0WiIQ5YR7R19IrKNwdcT9/SddcbsCBSsX9lXvrzLqiqgj3yw4fKBATIuxJIjuuvgfb5Tl6uT3m5MR1tYvIaOlozK1kpiTUPOSLqh1e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=DZVBoKIU; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C51B11984E;
	Sat, 11 Jul 2026 23:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803714; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VbelV6kMKLwt1ovagDKTC4aicrv3CH9g6/cgnCIdd/8=;
	b=DZVBoKIUBLjRDr5OVo9oweeK2Gi6GOhuBjVgosmYvZIBdK5L5NCHKsHJu/wdQeccN7rpsp
	nxKW4QY2IWqGkBP20/EfcSnsFzdbxrd464ZvDBHDJvaBUf5cDNKsrZx6ot5611muQ6PPBV
	9rx3iS/boqxeAgI1sTebOuVmYbpCf1uGGL3SVWMPoyyYS9sNiBRHYaow3VzyWwq+m7J22O
	DGQ1noCsNrA5LZfsWSgTqyxeDKjsTir//I7VTGQQ6CJzk1mj48VZdhrNIZvmVpFsclnzUG
	/0lwyfKgyoq0ibwdnQjPAwZWJkGNhKH2U1bzyDHV20WO7kdxDRHRIxdG2O3wgw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 08/10] arm64: dts: st: Add pinmux nodes for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board
Date: Sat, 11 Jul 2026 22:59:37 +0200
Message-ID: <20260711210131.236025-9-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39917-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marex@nabladev.com,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nabladev.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C416B742E9D

Add new pinmux nodes for DH electronics STM32MP2 DHCOS SoM and BB board.
The following pinmux nodes are added:
- ETH2 pins
- I2C8 pins
- MCO1 pins
- SDMMC1,2,3 pins
- SPI1,8 pins
- UART8,9 pins
- USART1,2,6 pins

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 564 ++++++++++++++++++
 1 file changed, 564 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc3..1aadbc6b47da9 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -182,6 +182,30 @@ pins5 {
 		};
 	};
 
+	/omit-if-no-ref/
+	eth2_mdio_pins_a: eth2-mdio-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 4, AF11)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 5, AF10)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	eth2_mdio_sleep_pins_a: eth2-mdio-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('C', 5, ANALOG)>; /* ETH_MDIO */
+		};
+	};
+
 	/omit-if-no-ref/
 	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
 		pins {
@@ -203,6 +227,68 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	eth2_rgmii_pins_b: eth2-rgmii-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 7, AF10)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 8, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 9, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('C', 10, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('C', 4, AF10)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('F', 7, AF10)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('G', 0, AF10)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 12, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('F', 9, AF10)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	eth2_rgmii_sleep_pins_b: eth2-rgmii-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 8, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 9, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('C', 10, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('F', 8, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('G', 0, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 12, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('F', 9, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('C', 11, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('C', 3, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('F', 6, ANALOG)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
+	/omit-if-no-ref/
+	mco1_pins_a: mco1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 6, AF1)>; /* MCO1 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
@@ -394,6 +480,26 @@ pins2 {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc1_b4_pins_b: sdmmc1-b4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('E', 5, AF10)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('E', 0, AF10)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('E', 1, AF10)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('E', 2, AF10)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
 		pins1 {
@@ -419,6 +525,31 @@ pins3 {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc1_b4_od_pins_b: sdmmc1-b4-od-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('E', 5, AF10)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('E', 0, AF10)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('E', 1, AF10)>; /* SDMMC1_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 3, AF10)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 2, AF10)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
 		pins {
@@ -431,6 +562,187 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc3_b4_pins_a: sdmmc3-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC3_D0 */
+				 <STM32_PINMUX('D', 13, AF10)>, /* SDMMC3_D1 */
+				 <STM32_PINMUX('B', 12, AF10)>, /* SDMMC3_D2 */
+				 <STM32_PINMUX('I', 11, AF10)>, /* SDMMC3_D3 */
+				 <STM32_PINMUX('D', 12, AF10)>; /* SDMMC3_CMD */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 13, AF10)>; /* SDMMC3_CK */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc3_b4_pins_b: sdmmc3-b4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC3_D0 */
+				 <STM32_PINMUX('D', 13, AF10)>, /* SDMMC3_D1 */
+				 <STM32_PINMUX('B', 12, AF10)>, /* SDMMC3_D2 */
+				 <STM32_PINMUX('D', 14, AF12)>, /* SDMMC3_D3 */
+				 <STM32_PINMUX('D', 12, AF10)>; /* SDMMC3_CMD */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 13, AF10)>; /* SDMMC3_CK */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc3_b4_od_pins_b: sdmmc3-b4-od-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 14, AF10)>, /* SDMMC3_D0 */
+				 <STM32_PINMUX('D', 13, AF10)>, /* SDMMC3_D1 */
+				 <STM32_PINMUX('B', 12, AF10)>, /* SDMMC3_D2 */
+				 <STM32_PINMUX('D', 14, AF10)>; /* SDMMC3_D3 */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 13, AF10)>; /* SDMMC3_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('D', 12, AF10)>; /* SDMMC3_CMD */
+			slew-rate = <2>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc3_b4_sleep_pins_b: sdmmc3-b4-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC3_D0 */
+				 <STM32_PINMUX('D', 13, ANALOG)>, /* SDMMC3_D1 */
+				 <STM32_PINMUX('B', 12, ANALOG)>, /* SDMMC3_D2 */
+				 <STM32_PINMUX('D', 14, ANALOG)>, /* SDMMC3_D3 */
+				 <STM32_PINMUX('B', 13, ANALOG)>, /* SDMMC3_CK */
+				 <STM32_PINMUX('D', 12, ANALOG)>; /* SDMMC3_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
+				 <STM32_PINMUX('H', 7, AF2)>; /* SPI1_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 8, AF2)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('H', 7, ANALOG)>, /* SPI1_MOSI */
+				 <STM32_PINMUX('H', 8, ANALOG)>; /* SPI1_MISO */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
@@ -471,6 +783,50 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_a: usart1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 3, AF6)>, /* USART1_TX */
+				 <STM32_PINMUX('A', 1, AF5)>;  /* USART1_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 2, AF6)>, /* USART1_RX */
+				 <STM32_PINMUX('A', 7, AF6)>; /* USART1_CTS_NSS */
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_a: usart1-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 3, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('A', 7, ANALOG)>; /* USART1_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 1, AF5)>; /* USART1_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('A', 2, AF6)>; /* USART1_RX */
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_a: usart1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 3, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('A', 1, ANALOG)>,  /* USART1_RTS */
+				 <STM32_PINMUX('A', 7, ANALOG)>, /* USART1_CTS_NSS */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
@@ -504,6 +860,50 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart2_pins_b: usart2-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 4, AF6)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 5, AF6)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 8, AF8)>, /* USART2_RX */
+				 <STM32_PINMUX('A', 9, AF6)>; /* USART2_CTS_NSS */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart2_idle_pins_b: usart2-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 9, ANALOG)>; /* USART2_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 5, AF6)>; /* USART2_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('A', 8, AF8)>; /* USART2_RX */
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart2_sleep_pins_b: usart2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('A', 5, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('A', 9, ANALOG)>, /* USART2_CTS_NSS */
+				 <STM32_PINMUX('A', 8, ANALOG)>; /* USART2_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart6_pins_a: usart6-0 {
 		pins1 {
@@ -547,6 +947,127 @@ pins {
 				 <STM32_PINMUX('F', 14, ANALOG)>; /* USART6_RX */
 		};
 	};
+
+	/omit-if-no-ref/
+	usart6_pins_b: usart6-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 5, AF6)>; /* USART6_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 4, AF6)>; /* USART6_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart6_idle_pins_b: usart6-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>; /* USART6_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 4, AF6)>; /* USART6_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart6_sleep_pins_b: usart6-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART6_TX */
+				 <STM32_PINMUX('F', 4, ANALOG)>; /* USART6_RX */
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_pins_a: uart8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('I', 11, AF5)>, /* UART8_TX */
+				 <STM32_PINMUX('B', 15, AF3)>;  /* UART8_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 11, AF6)>, /* UART8_RX */
+				 <STM32_PINMUX('H', 5, AF6)>; /* UART8_CTS_NSS */
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_idle_pins_a: uart8-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('I', 11, ANALOG)>, /* UART8_TX */
+				 <STM32_PINMUX('H', 5, ANALOG)>; /* UART8_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 15, AF3)>; /* UART8_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 11, AF6)>; /* UART8_RX */
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart8_sleep_pins_a: uart8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 11, ANALOG)>, /* UART8_TX */
+				 <STM32_PINMUX('B', 15, ANALOG)>,  /* UART8_RTS */
+				 <STM32_PINMUX('H', 5, ANALOG)>, /* UART8_CTS_NSS */
+				 <STM32_PINMUX('F', 11, ANALOG)>; /* UART8_RX */
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_pins_a: uart9-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 8, AF6)>, /* UART9_TX */
+				 <STM32_PINMUX('F', 12, AF6)>;  /* UART9_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('I', 5, AF6)>, /* UART9_RX */
+				 <STM32_PINMUX('G', 7, AF6)>; /* UART9_CTS_NSS */
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_idle_pins_a: uart9-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 8, ANALOG)>, /* UART9_TX */
+				 <STM32_PINMUX('G', 7, ANALOG)>; /* UART9_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 12, AF6)>; /* UART9_RTS */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('I', 5, AF6)>; /* UART9_RX */
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	uart9_sleep_pins_a: uart9-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 8, ANALOG)>, /* UART9_TX */
+				 <STM32_PINMUX('F', 12, ANALOG)>,  /* UART9_RTS */
+				 <STM32_PINMUX('G', 7, ANALOG)>, /* UART9_CTS_NSS */
+				 <STM32_PINMUX('I', 5, ANALOG)>; /* UART9_RX */
+		};
+	};
 };
 
 &pinctrl_z {
@@ -569,6 +1090,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c8_pins_b: i2c8-1 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, AF8)>, /* I2C1_SCL */
+				 <STM32_PINMUX('Z', 9, AF8)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c8_sleep_pins_b: i2c8-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('Z', 9, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi8_pins_a: spi8-0 {
 		pins1 {
@@ -592,4 +1132,28 @@ pins1 {
 				 <STM32_PINMUX('Z', 1, ANALOG)>; /* SPI8_MISO */
 		};
 	};
+
+	/omit-if-no-ref/
+	spi8_pins_b: spi8-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('Z', 5, AF3)>, /* SPI8_SCK */
+				 <STM32_PINMUX('Z', 7, AF3)>; /* SPI8_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('Z', 8, AF3)>; /* SPI8_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi8_sleep_pins_b: spi8-sleep-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('Z', 5, ANALOG)>, /* SPI8_SCK */
+				 <STM32_PINMUX('Z', 7, ANALOG)>, /* SPI8_MOSI */
+				 <STM32_PINMUX('Z', 8, ANALOG)>; /* SPI8_MISO */
+		};
+	};
 };
-- 
2.53.0


