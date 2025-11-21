Return-Path: <linux-gpio+bounces-28948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 23912C78CC6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 31FAF3549F3
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C0634B414;
	Fri, 21 Nov 2025 11:27:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B95734C99D;
	Fri, 21 Nov 2025 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724474; cv=none; b=hK4sar2QSsAlClYGaa3RvU4mzUJZoNd35pkAX3lz483T//GPmNVdJ1m5Jqsrai6KeDcHVnVSIwECMVeHitxVy58G7eK9Q+K3YxSINorzNRAzq0+/RSxMXzClEmQMvC5vlZ9xXTTFFtSNdyfU7hMjM9Ni8fcMqgvA9gYKAhJxgHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724474; c=relaxed/simple;
	bh=Ap4bX44BIJtCka1gktq9KVI8VdksDtC6cbwXu6eyz0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCj/mPAmwWcZA5OYPKsThAkl8pNotd/QCOjsZhvLk/dsPshckSTB+VuoaxzzBzSDhLZp3QjZz0blEHxIPEnXHyH0MjxNXqtnC8QoqQdl2jyTJMOaWbBOL8tH/LbCrvfEKd2ad/L6lyyXDfE57Xo7zgcyA+hPkyeNCGvQ5IHuozA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: FUbyhdT0RgS8nYBEptXvaw==
X-CSE-MsgGUID: i9JPR0oVQmSBmO1i6i+fUQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2025 20:27:51 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C654F437C1A1;
	Fri, 21 Nov 2025 20:27:47 +0900 (JST)
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
Subject: [PATCH 7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add GPIO keys
Date: Fri, 21 Nov 2025 13:26:25 +0200
Message-ID: <20251121112626.1395565-8-cosmin-gabriel.tanislav.xa@renesas.com>
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

The Renesas RZ/T2H Evaluation Kit has three user buttons connected to
GPIOs that can be used as input keys.

Add support for them.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index d1474f1bd523..a2584a3afb01 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
+
 #include "r9a09g077m44.dtsi"
 
 /*
@@ -60,6 +62,37 @@ / {
 	model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
 	compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
 
+	keys {
+		compatible = "gpio-keys";
+
+#if (!SD1_MICRO_SD)
+		/* SW2-3: ON */
+		key-1 {
+			interrupts-extended = <&pinctrl RZT2H_GPIO(8, 6) IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_1>;
+			label = "SW9";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+#endif
+
+		key-2 {
+			interrupts-extended = <&pinctrl RZT2H_GPIO(0, 3) IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_2>;
+			label = "SW10";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+
+		key-3 {
+			interrupts-extended = <&pinctrl RZT2H_GPIO(8, 7) IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_3>;
+			label = "SW11";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.52.0


