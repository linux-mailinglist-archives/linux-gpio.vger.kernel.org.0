Return-Path: <linux-gpio+bounces-10650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 478EB98C05E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 078E228459D
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5554F1C9EDD;
	Tue,  1 Oct 2024 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1M1F9yP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1061C9DE6;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727793569; cv=none; b=DBJg0/MgH3MV7R8PyaIDJC0eU6A5h/Yrzur81pU9UnjAZR8AduibgODbLc7wiG7+UZLv7pHhsa+ZRnu7+NP2Uyq/m2AWKpXFsqE1qfsLlJD5y/03DIjHBJ7gJuvUZln3Br3kibsx83nrmf4D8IfKh7A+T89XOnm8q3dp3DC9n10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727793569; c=relaxed/simple;
	bh=mYWEdE//FULK0qxAD5yB/3zDFvbyDKytJVQXMmCHOpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAswrTfUPEsDJb9msvrsi2YgseyylRHDyuyLWBN6aYEkA4FR/L6utDkADro7RVuddP6IBHrPviVoqmesCcELwqtJffJ+TWTwO2wy3TasM/NgeyjEY140vIw9214q6cL/cpmyRxUaLfbEnJNogAlt2sXEQlIpz/BKaXGhhTZdOp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1M1F9yP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0D1BC4DDE2;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727793568;
	bh=mYWEdE//FULK0qxAD5yB/3zDFvbyDKytJVQXMmCHOpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h1M1F9yPuTTr0WIRhAgC0ZkiIKfxDoIwzOPAEcmmAPlVpyvXq1f81PJWIW+Zfg/rc
	 ORIgO20Fvo05uS8pqF16q1CxExmv9AKZ0pcwBd2VFMF2mG3inYPamo6GxFbVAWE+oy
	 Mj14q8WlyPy1VJ8LCyQ5koHmD1voaJWhScVE78ozR8z10DpItIrUcI6uGwsXyLTl8d
	 k09yZFUyJjAcfi1TN89vj8GWNHVmzBJoeCWxY92V+dsAnnw9Dctpdd3qMOcgOTe5tE
	 SenTk+KywpQsIoLcmFQoOU3F1N5p7BLbmQJuAJ6szBC/9Nyeyw96sDaS1BvK3CSCSn
	 MGIRl9MjTNgKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AFECEACD6;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 01 Oct 2024 16:37:40 +0200
Subject: [PATCH v13 10/12] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241001-pxa1908-lkml-v13-10-6b9a7f64f9ae@skole.hr>
References: <20241001-pxa1908-lkml-v13-0-6b9a7f64f9ae@skole.hr>
In-Reply-To: <20241001-pxa1908-lkml-v13-0-6b9a7f64f9ae@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=911;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=tQRucUNiycqO1XW8ycQFY99fu+HGVhgzKCsVcf8lGtE=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGl/OCeHN/r1HVB7uJiBv+Kb45Wt8zZsXK356rKbEsvCp
 zdYRd56dJSyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBE5I4wMsxuPtC1/8vHHdpq
 S1O+FPDeqH7EL3W0Z9V9kR7PjRuV99xh+O+ydmbDDN6qGb495SUvvj/VWn/f45qNhm+Z9vNECQW
 R14wA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add ARCH_MMP configuration option for Marvell PXA1908 SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6c6d11536b42ec6e878db8d355c17994c2500d7b..6cb21a27844718d8dfbdc49cc764a6ca39296484 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -175,6 +175,14 @@ config ARCH_MESON
 	  This enables support for the arm64 based Amlogic SoCs
 	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
 
+config ARCH_MMP
+	bool "Marvell MMP SoC Family"
+	select PINCTRL
+	select PINCTRL_SINGLE
+	help
+	  This enables support for Marvell MMP SoC family, currently
+	  supporting PXA1908 aka IAP140.
+
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
 	select ARMADA_AP806_SYSCON

-- 
2.46.2



