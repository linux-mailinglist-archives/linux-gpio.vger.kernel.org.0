Return-Path: <linux-gpio+bounces-28947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C71CDC78D02
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 12:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 815CF4EBE38
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 11:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A66034C80A;
	Fri, 21 Nov 2025 11:27:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DA134B414;
	Fri, 21 Nov 2025 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724469; cv=none; b=R3ako3tuT0+fbbydpoN0H36oHBC9R9rc2R4/pJlUQ6CQEYlSpVABynRDZ7YRxGAgR4/htoXv+ZbSzjriNYFXVZ/ejpB/JQ2M68DuL3xQ54uSSje4iyoLkvWktLjjlj/H68KwwwmR1wUCrCs2QWBVy6yVbE1yxBghtbr+a99I7bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724469; c=relaxed/simple;
	bh=7cSQjFoN32MiqQljxqTyhXlkxN5XYqaLrL8uh1wW7/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9gfrNjS8YLVdHVonrSZEZ89BA8rITM2W//iNMu02Kie6WxLmAJikEI2WDciha3XdUYuxzlqFqIrSOEvrDXYzgWtPEhC4X6kTv9QE/LAUNIvF+6gXYYtG6yFK7nkucCAcKrC2HqMWJWy/f+e4ALb3l+QD0wOtVDLzPWb3m/ZanA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: S8XrSRDGQNWbc9UrDoOlbw==
X-CSE-MsgGUID: c/V4W6X9QIuti4qaEz4Xqw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Nov 2025 20:27:46 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C3071437C1A2;
	Fri, 21 Nov 2025 20:27:42 +0900 (JST)
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
Subject: [PATCH 6/8] arm64: dts: renesas: r9a09g087: add GPIO IRQ support
Date: Fri, 21 Nov 2025 13:26:24 +0200
Message-ID: <20251121112626.1395565-7-cosmin-gabriel.tanislav.xa@renesas.com>
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

The Renesas RZ/N2H (R9A09G087) SoC includes pins which can be routed via
the ICU to generate interrupts.

Add support for using the pin controller as an interrupt chip.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 6b5693e5c1f9..19475c72017f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -948,6 +948,9 @@ pinctrl: pinctrl@802c0000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pinctrl 0 0 280>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupt-parent = <&icu>;
 			power-domains = <&cpg>;
 		};
 
-- 
2.52.0


