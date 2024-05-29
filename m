Return-Path: <linux-gpio+bounces-6812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67E88D32F2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D8ABB25DF3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA2A16B74D;
	Wed, 29 May 2024 09:29:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F47169AF2
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974986; cv=none; b=pmPGepZ/bCjUmPabHVw/lGMb/UBplWJ4F8HBJ3N93V4enTY+05WQ+vq/xWFv5bQMgFrpGoL4ChM+HTmPxFR81y/JElHuzzOvUsaUkuJFEQPjciWdr+g3cx6m6QMUbbXWnakV2iFSTs+vfjRMnv7FbGzE4JPYV8YIhENOsPnn+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974986; c=relaxed/simple;
	bh=lC9HYilaLEPRJNvUV/3RHQldHaDnLJhOOG8MTKQS3II=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=selq6qoSjgYNHg5IfxgNLd9yDANWYAsuspULcr/V4YBZbjqh9FxO00/ngJ7u+mo6k9NWMIlZrn0wOSq4RAIn85+TMxxDuqwjZKixaqE1cvKX6Awf3TKHMJiuuRnlhkG2KTuLQKuOq8h5emghAZgcjWVd3lclRsqezoJTZpKHPeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by albert.telenet-ops.be with bizsmtp
	id UxVg2C00S3VPV9V06xVglU; Wed, 29 May 2024 11:29:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFbu-00GHL2-42;
	Wed, 29 May 2024 11:29:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFcq-008wSQ-HS;
	Wed, 29 May 2024 11:29:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 8/8] arm64: dts: renesas: r8a779h0: Add OTP_MEM node
Date: Wed, 29 May 2024 11:29:37 +0200
Message-Id: <0e4af5b32b74f901945e24ad2baefbfce37e957f.1716974503.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716974502.git.geert+renesas@glider.be>
References: <cover.1716974502.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device node for the OTP non-volatile memory on the R-Car V4M
(R8A779H0) SoC, which provides E-FUSE services.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 28ac930e7db1f234..3766652623fd8e5e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -411,6 +411,11 @@ tsc: thermal@e6198000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		otp: otp@e61be000 {
+			compatible = "renesas,r8a779h0-otp";
+			reg = <0 0xe61be000 0 0x1000>, <0 0xe61bf000 0 0x1000>;
+		};
+
 		intc_ex: interrupt-controller@e61c0000 {
 			compatible = "renesas,intc-ex-r8a779h0", "renesas,irqc";
 			#interrupt-cells = <2>;
-- 
2.34.1


