Return-Path: <linux-gpio+bounces-8458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9990940F33
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 12:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 645F228414E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 10:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7194319EEAA;
	Tue, 30 Jul 2024 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kY9V0dp6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EA519E7EA;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335172; cv=none; b=Vz/iCEYQuDDFqIzvgGnbxX53gNgZ8wvOcUbL1dibrDPqheGYZoIKWKY38mMnnP8gsoBvXF/0lMHLnMWYHqakzNxl9cfnKg8MvtO7/WoOkPEV+z8jWYs5rnw6pm/BRl0rQdEoxDvUMXqYxqrWqvoMCgAS1BOy0zpoNoOuNtJi/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335172; c=relaxed/simple;
	bh=3uP1ih7kI4uavjZo4LIj3wv6JlboRRHhfsZJxoGFZS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1GVy+GiYLe1oteLFxzCQw1ZXJAoIzzdMPexdTflsscF7eLBcX6HviYzp7RiFL49TGBQTH7CGoKD8eZOvTQgjLFViLaaqoZjEYQKC2w8/eSh7mgnuIkbs9bTupNvE911ayKSMjrpqmysyKNaR+o+t14u1nRXOJJzCL4yRGnJMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kY9V0dp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74417C32782;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722335171;
	bh=3uP1ih7kI4uavjZo4LIj3wv6JlboRRHhfsZJxoGFZS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kY9V0dp6oosJp4JpcO4JrGdJt7Xkh4kcep9NUHeUQbyPLQX36MOhq9gS/AR9wEYx9
	 rhZFEUnuxUjTmQA7Brifxk3tixD1A14Oc7YtqTV/3R8zooM+s9T3EWFjWs/rc8JrKi
	 Ppb+29tx2jkhXRe+iiTeYe308N7vVdTM92Z6HiUqIFxr8enB0G0nTpvRh/Dyl9ZF6E
	 8YMIUnV77fEGamutIYOyIn/JwVyqk/tdVTuJKKmOflv5C2+2Ycuo4lDv23kS/QdxaM
	 8a8XjjiwFNNn7FOlhJrIXviyi5Va/b9g7Ssgc136L16uT/64BSLEPG/8wljc76sWLq
	 PY92hyDc5CcPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699CDC52D1D;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 30 Jul 2024 12:25:18 +0200
Subject: [PATCH v11 10/12] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-pxa1908-lkml-v11-10-21dbb3e28793@skole.hr>
References: <20240730-pxa1908-lkml-v11-0-21dbb3e28793@skole.hr>
In-Reply-To: <20240730-pxa1908-lkml-v11-0-21dbb3e28793@skole.hr>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=Lm9peBaijgoN8aADZVkx1zUvsBlNv+32SJbjS2JYwt0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGkr9m8xD932lYON3zG1VavhfNeJHwtW6GTx+WserHgZy
 73Rktu+o5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACayTpuR4YbSmfTkfQ7Fyd0X
 jvO88qm51Rse7HRn3dOmVusdAZctFzL8ZMx8XccyVfr4NYEmjfzWlv9GU25oVyfvXHXFuLRnTXQ
 GDwA=
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
index 6c6d11536b42..6cb21a278447 100644
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
2.45.2



