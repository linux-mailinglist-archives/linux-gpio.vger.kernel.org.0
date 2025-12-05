Return-Path: <linux-gpio+bounces-29294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09300CA834E
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 16:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E72EF32B8D82
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 15:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC975340DA3;
	Fri,  5 Dec 2025 15:04:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03563340A6D;
	Fri,  5 Dec 2025 15:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947049; cv=none; b=LL6Fz8kuro6AZ56KFnkvN2qxdNZDyXhrz9p7s+TJwqX2KyE/FZhOJcsmG6TNHXnBotZZk8ui/hb6kklLhzKO+sDj9/vFBVBMYRfABwq3Hg+ZKb1DR9sq2fPYEDmvQE392+sDWnjMXST3m+WrrxeH1j/YLKL7HD3QcjAbjB4dkj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947049; c=relaxed/simple;
	bh=lzhjc9GfCVjKFFXiYW2RNyHcVm6fRIxR/unxy+GSB4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlSvYrCiwrqMozMZUyaUF0SwYiXUbVfFBdbHBAR/VfNw6ggSta8Yes7BZb163IYJ5tdrJqvcT4AJUC6vsdsxfcsXuO+bFMWFtIATG8kd/cyxk9pZHKed0MsbhS2QA0bYVZyIJEKiaGDn0rsud6dFKjkKaHXpNfwsLXX/YNW6I2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: F8F0wSGwT7a930s6VbC8Ow==
X-CSE-MsgGUID: RWkaoWS4QGSZdawq9MfR8Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2025 00:04:04 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.202])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CC3D9427BFF0;
	Sat,  6 Dec 2025 00:04:00 +0900 (JST)
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
Subject: [PATCH v2 7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add GPIO keys
Date: Fri,  5 Dec 2025 17:02:33 +0200
Message-ID: <20251205150234.2958140-8-cosmin-gabriel.tanislav.xa@renesas.com>
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

The Renesas RZ/T2H Evaluation Kit has three user buttons connected to
GPIOs that can be used as input keys.

Add support for them.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

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

