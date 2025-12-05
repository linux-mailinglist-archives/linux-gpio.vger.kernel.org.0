Return-Path: <linux-gpio+bounces-29295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDBCA8543
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 17:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FE1B30208F0
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 16:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664F67083C;
	Fri,  5 Dec 2025 15:04:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D824340A63;
	Fri,  5 Dec 2025 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947056; cv=none; b=RuPbjgV/V7qqKwdEUxV+J5M8OaXY5sLpVenr6XuPvOPPWrNS889BWJjhmAsy1DrMkgeQOSwiaasatMuSmB/FjPOy36RRVo/mz5F7Yg7rtBLbAEK9yIBSXJyKdVofWM3zlU6QwytvCsSrl7PIDNCzGMnZcixqw6+mwNtKMxSCgxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947056; c=relaxed/simple;
	bh=KMHkYhnYmqxTtq3KX0FEI2BkPOZrHLaa+sDCYGbpFEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgY3hF6UndXSBz7GXb7282A5WzDbEoERngiYNaOiX/M/fOuiSMAYfDUyKcqsBNfWRu4qA+u/vT6Enp35yTXcGg233RsNx5lAjcar/7w/hNegoBz23l/9t9Q4RePAgUZ2+WB8712TdqMCGvkGHgzc/jxqpeDTIXP4kNKnDUDhqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: MVk5J+a2RneP26ActZfuIA==
X-CSE-MsgGUID: kMxTbUWiQ02OBlWmN0e69Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2025 00:04:09 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.202])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F22DF427BFF8;
	Sat,  6 Dec 2025 00:04:05 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
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
Subject: [PATCH v2 8/8] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: add GPIO keys
Date: Fri,  5 Dec 2025 17:02:34 +0200
Message-ID: <20251205150234.2958140-9-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
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

V2:
 * no changes

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

