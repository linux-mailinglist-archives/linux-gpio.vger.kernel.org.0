Return-Path: <linux-gpio+bounces-28949-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC834C78CBA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 70F152DB52
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B1B34D381;
	Fri, 21 Nov 2025 11:28:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD3F34C9A6;
	Fri, 21 Nov 2025 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724479; cv=none; b=F+yoXeGPN1ycd8FOcCDCV7qXAC3r8jQl4zVsclIEezvP/fKcyqFGx5BPHJ8uefLiTthiXyUI9fD6hEHLV4Uqqq+MeEbZHHW76j1C1mscEPc9YBtXYyR0UnI/pTLBAYWNpEjW9IDTZVk+tAuAMbxUDsXkH5EGTqzcGmyuZYUT1sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724479; c=relaxed/simple;
	bh=i+DrjT0Zgr1f5K7hSlFtySDw90VBzamvsEjfkOYaRz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONUcxPGCqHwh53iTA/CvUMWg89e5LBS5VGqlU5k+ZwG/+GTNjQspcUES2+oGBtHSCKhSaRqpYQ87g6dhVEiYKTNaDYsssfb55AmA6moJt6DXvhjbVVFOonItC4VU4KvH4Hi1DP81i7pREkF/SGrNXx3r6jHY6puSg61TLtwVmTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 314/AnGdQWK47aAcv2oL3w==
X-CSE-MsgGUID: K/rKLA2PRrqm6bMRnJdosg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2025 20:27:56 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 90A17437C1A2;
	Fri, 21 Nov 2025 20:27:52 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 8/8] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: add GPIO keys
Date: Fri, 21 Nov 2025 13:26:26 +0200
Message-ID: <20251121112626.1395565-9-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/N2H Evaluation Kit has three user buttons connected to
GPIOs that can be used as input keys.

Add support for them.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index eaf73868783b..252f1c21ff90 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
+
 #include "r9a09g087m44.dtsi"
 
 /*
@@ -77,6 +79,34 @@ / {
 	model = "Renesas RZ/N2H EVK Board based on r9a09g087m44";
 	compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
 
+	keys {
+		compatible = "gpio-keys";
+
+		key-1 {
+			interrupts-extended = <&pinctrl RZT2H_GPIO(18, 2) IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_1>;
+			label = "SW2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-2 {
+			interrupts-extended = <&pinctrl RZT2H_GPIO(0, 4) IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_2>;
+			label = "SW3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-3 {
+			interrupts-extended = <&pinctrl RZT2H_GPIO(18, 7) IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_3>;
+			label = "SW4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.52.0


