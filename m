Return-Path: <linux-gpio+bounces-28946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE477C78CFC
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 22AB131F2F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7538934BA20;
	Fri, 21 Nov 2025 11:27:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49F2347FED;
	Fri, 21 Nov 2025 11:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724468; cv=none; b=e+h+ve69gDdq4x0gPgBpq8z4Wrl3oNSkPzcsjmVY3VZ0AekF6BeLYtf0zbZqtckYfwRPHu3YEdP7uRM0v57mts15ndgMwsh6g0tjpijsQ9kw8qYZoo1/2PzOz+Jx79dOUt6pv1nl41vlbOhE6GB9vGdsPaCmTn6yzCBMF11yHLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724468; c=relaxed/simple;
	bh=Eu4SFHiwNqPA8SYvGQfE3O0NOzxe0A5U5CTWodUZHvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5A8ef2I03Dc3CHw0oK19Q/iMULhcmGVNYPRAfMYEhPlUcpHLyrcCPILN2uBHHW4y+2Fj34V5laWdxYkayV6SwWjQJIFzOOzZscb/9M7MxQiffeez9nyA8Mgi/JlPJwvCFsXMYwP1i1mudNs/C/HQ0ca9nLFy0CDPMv3W9BmNdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: IEju188HQCG2GoX4ToRTVw==
X-CSE-MsgGUID: c+hvDFQKTaCDSHLzBUFq0w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Nov 2025 20:27:41 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B7F5C437C1A1;
	Fri, 21 Nov 2025 20:27:37 +0900 (JST)
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
Subject: [PATCH 5/8] arm64: dts: renesas: r9a09g077: add GPIO IRQ support
Date: Fri, 21 Nov 2025 13:26:23 +0200
Message-ID: <20251121112626.1395565-6-cosmin-gabriel.tanislav.xa@renesas.com>
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

The Renesas RZ/T2H (R9A09G077) SoC includes pins which can be routed via
the ICU to generate interrupts.

Add support for using the pin controller as an interrupt chip.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 0af41287e6a8..6812af127684 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -945,6 +945,9 @@ pinctrl: pinctrl@802c0000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pinctrl 0 0 288>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupt-parent = <&icu>;
 			power-domains = <&cpg>;
 		};
 
-- 
2.52.0


