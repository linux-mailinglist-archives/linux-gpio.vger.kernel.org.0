Return-Path: <linux-gpio+bounces-7540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5CC90CB47
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9BE21F27B40
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608F3143722;
	Tue, 18 Jun 2024 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dsxkibue"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5413CA97;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712557; cv=none; b=bBH3c3FJvpxHh0bvvjnZqZUZd33fbmcP9nhnr11ME6q6CqGTZbrzjsp3TSX3yzvWighz1gS4buyVo30k5LaAvOBrLSJintXuhepnby9VvTFrQdu9cC5mbYnLrsBqXdUUYSFin73tsoz6p4eLOhFWdpo2rXKcte8ez2DsnQFQvGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712557; c=relaxed/simple;
	bh=TThR+6llJ32HA+OdlH3DB3QYC0ntkDpP2gTGZIn0jkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5pb8DlCzGWNNxWRcvDk/f1C4rmpiyb+B93fLtYdvc/VjwqY9lzwB6MqzGxN7VPmS3kyPNUYd6X6GHZb/Jcrmt7nvVyThZTQBrldAvNWsLv6UUiQKvtWztzJZU446Nvo4Z3j2ORfRHsYLbHXBYS/9mGXY1YHjkb4r6WyHSYzy1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dsxkibue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A02FDC3277B;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718712556;
	bh=TThR+6llJ32HA+OdlH3DB3QYC0ntkDpP2gTGZIn0jkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DsxkibueYKSTSPZYYVdV0GlN5P55phXbuLWpcjojWxiDpVbfHOu8wTMxijHpjDuUj
	 F4aKs3PWuCRQGUVFjupFeNJxxTnrvhzMLyF29GO8dSNETpKPWYMz6bpMh1vr0e0plK
	 gsXAM8BKKHZa1Le1RbAT7JgyHJnBrxCL7IkyDfQpbqisNyrZzP6jlapxDtg7azoUyb
	 6uRvidjKVTKZBKirugMfsG6qWQieIq5rjXbGQE/b7XZpXY2gEXbjuJxZBHb9VSqqZC
	 fUidpPCwErT0NP1dK6m8BPX+GFUZ6xIz95a2kjQ+ohsTCfTgayF4iBJTZU2PeSoI2P
	 1wj0OktGzV74w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9680CC2BB85;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 18 Jun 2024 14:08:21 +0200
Subject: [PATCH RESEND v10 10/12] arm64: Kconfig.platforms: Add config for
 Marvell PXA1908 platform
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-pxa1908-lkml-v10-10-754e5ece9078@skole.hr>
References: <20240618-pxa1908-lkml-v10-0-754e5ece9078@skole.hr>
In-Reply-To: <20240618-pxa1908-lkml-v10-0-754e5ece9078@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Rob Herring <robh@kernel.org>, 
 Kees Cook <kees@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=/weGD6zZ+XyXeVQbi6D5jQYi2yqAzdUWcmbRjG7aBy0=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBmcXjSx3UgRFn9yAkD1C8zTieIUAZnV7ogVifaT
 jRBrokHInqJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZnF40gAKCRCaEZ6wQi2W
 4cmfEACF2iqUZQtq/7/WYuCyPTliDob26KKmFjZVICvZd1pdhaW+nf+c8v55PFq2NnGM7sLsNMr
 9DhfWySt28bkVoQDvkquiieGyC9VcPobDdXAzEMt36+LSfXi8MP0dn6oAbUkBOMVETnusCnn2tA
 Q6BDWr8w/3KoXM4dSvAI4FXt6lLXp6hKyknghZIdTLwogRWaKHP1PTE23iNd/WSn/PjgrZk/WwB
 kQVOZtvmetpJnQEtuwWjlMWLZ9on1RZ9BUDBwccn5jalQPpI3LSRDKII9Bfj1s1gAbq21DwDdFx
 DwIrfJ5zTmD9EvKmFlvEtx2t/QtHrsHs7Tgs2rf045XHECEUZCSKCKcP/rscWFJRz3mVQ9d7sJ9
 gaLJzqJlTVmkVFrMdcFL0KSCm4nUjIUcgSw+3gnMc+6HzQfqHLKrwPdDa7ZdlaHLZ75/z+W97H2
 VZR9B/pPj7MahsMrmXPqt1NsZfOC8H9IIUy59tb74GJQDHhzMCzMelZOLqWJvduDeIcT+wQwN3Q
 QzBdbk96kh3Bmlr8W0ALNtOEHiFsNyg4McLhttpHI6+gR2/xzsvSW6nlqlm6aQMuO0Usuvk5S35
 Qb3+oojydj3CwWEHGo0DH4QTC2hY+ujK6cPWvJ1SjC6wXeAd9qWaDNMdw5g5o/iEGleD8AwlBIr
 BB0Mk7csaRROsIw==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/default with
 auth_id=112
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add ARCH_MMP configuration option for Marvell PXA1908 SoC.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 24335565bad5..d71b0b6e75aa 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -168,6 +168,14 @@ config ARCH_MESON
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



