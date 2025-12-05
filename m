Return-Path: <linux-gpio+bounces-29293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D35CA82F7
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 16:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FBD130551DF
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5528B340DB0;
	Fri,  5 Dec 2025 15:04:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE7B340262;
	Fri,  5 Dec 2025 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947046; cv=none; b=kO8B3DyTLnutU2MjVUwxW2Jus8RojVLfwmGmNqk7X05aU9L1r8/N/Lvz+lXdW74dep01cgbGVKlR4XacGZNK7HdNC0a51I/xMBGRkAZKV7jA28novsUg2pj2Uy3uIBkdX+G2GfSrXsM+AR3ydj/xWVH78TlmjFBcPtGpvdtnNh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947046; c=relaxed/simple;
	bh=H5axve/7IvRQD57JHWUxJtvg+9R4N7VzznbCzJw7t+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sb/QwagonPzWGM5CZy/7Bv+Yd4DsirQRKoBM8QpY5i/6iCHLX71ZGmw+oxd50lBDFVkEvae/9tumb7fmTiwd7c0nn5Xv2r+X7ANQaXDtv9mzM4plpk3VTxAEC+Qim9JedYa+79veGJ9wXr3FlycB2OZsfRX9uQp6Tb2t+K945x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: wfeEnoPKSFSw6c9hSKrPvA==
X-CSE-MsgGUID: jFYdbiGrQbG0Fp6mBmQrPA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2025 00:03:57 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.202])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 308A4427BFF2;
	Sat,  6 Dec 2025 00:03:53 +0900 (JST)
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
Subject: [PATCH v2 6/8] arm64: dts: renesas: r9a09g087: add GPIO IRQ support
Date: Fri,  5 Dec 2025 17:02:32 +0200
Message-ID: <20251205150234.2958140-7-cosmin-gabriel.tanislav.xa@renesas.com>
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

The Renesas RZ/N2H (R9A09G087) SoC includes pins which can be routed via
the ICU to generate interrupts.

Add support for using the pin controller as an interrupt chip.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

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

