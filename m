Return-Path: <linux-gpio+bounces-7541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7790CB49
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8176E28A31D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E66143876;
	Tue, 18 Jun 2024 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kz4ASy8x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC93A13D8BC;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712557; cv=none; b=f0T6TZYJ03NBKyDLkZZSbSecr550rnY8NohMZ4Kw0EIVtfmeiY/+AoJ/Q9tKJrPvYlUmihbepz8gemHYZs46lFeKBQ/Bg+HF6GpxCotYYiRMcQzJH5jlazp5qu92HTHOEgWMuEGvx7Ov3HTubDANqjmmLKhLZ8iuA4tiv00q1Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712557; c=relaxed/simple;
	bh=RURqcQtjHLH2c5A0WLEPpX1plb41Y006qE3w0sIwd10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jK42oAWSHiSyjId0QhxIGSoLiZupHL+Wxi3FvblL19i3HZ4GZbXRKvGkubMLogWMl9rnEubiewp5wrlS7995fzYeS2qwgeWbBVGrgq9kV2BbBXGVF8m5+6z/parqIDHnmFA+CbX1MlzvgbCXEp6r1q6HVk/a9ndg0LDCQq4q3gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kz4ASy8x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4936C4DE1E;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718712556;
	bh=RURqcQtjHLH2c5A0WLEPpX1plb41Y006qE3w0sIwd10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kz4ASy8xWl4bc28uk5Alnc58hmjGB4rA92alaVUxjafHFH8Ewnd7XXl2ZTpX6muAg
	 JHyX9S0ICo6zLxz63PtIKvmN4qshFa+77yI4r7a/9+iR6eorj5Lg/2fV01W/m4VMdt
	 RnTUUqrT/73Eb0sCkY05NL1qWD+3gPJZ/PfC5c/2dgiKZMjTHUUOrmlfqobX6L5lY6
	 WJv8IfAQHJQVY/sVGw1mqK3+TFXw+Dy2AzT4PE75c6+7CX49HHiVQlX9KEhZfjvvvc
	 SuC6AVblJ1o4SS1JqGkShmbTPKcvU14tfsttJiEcYK4VgB5d0Oz7WUfw2Ozj4cRdB+
	 mnH2T/6hOErdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC05C27C4F;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 18 Jun 2024 14:08:23 +0200
Subject: [PATCH RESEND v10 12/12] MAINTAINERS: add myself as Marvell
 PXA1908 maintainer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-pxa1908-lkml-v10-12-754e5ece9078@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=60K3FrnypIaQAvLz7O5bioEXx//y4S3+gFksHisDh74=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBmcXjSOS2p/8rQZm7yByMQ4Nd1bGlAhS7uPLxlC
 EYrHx1yZ/WJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZnF40gAKCRCaEZ6wQi2W
 4SReD/0R+w8r1SQk27VkYmuF17pC3bOJfVr3ndxV4wp9r/gwPZkmNhSb3DioagOAqfkwsydp/6/
 asykAUecEIC5PFjwlwybZt5cKG6ivRGymWe6/zJSRznLNqrAlde39TfsBVsseaqBk9ACvRzr0Qt
 aikYJ+/ih9dTTooNlMwZZfpkK9pqa0htORPEXED5lsum20iGhZG5crI4QEKa2vaD2AAaMT3rfNH
 XbwXb5dWgYgYTfXcq+qFJ44T3tzdiuPsCAP43qjNSqvNNOfloEaCWm0shSLWIygbI9TAGChrre3
 x4qv6CpDEoX0cy6CTQ3ryolx5sB80VPnfhnC4u1dlhpzH3uQ9bv8UDQ6eVxyPgiuZLGy2Iz9ATb
 cwU2J5fjSYZwq9XOTP6t/e+MmAdaxHZN7OIRtNi2bowpcn2NxTg4McekOoJb0i0KYSAdiuOPqP0
 QGi5/msfk4GuAPTDBBF62/+LvA5LMzEoNETRVDzlWFkHFAhoy59Rx/KGcsWJBwWW0Oia+49nMXV
 fr4VxRq7hWzJgxiz9M0S4/NyZIzFyMlyIKAG9yR5kyqgUWUE8I8az+FTD861xkavzzIDCMm8C6k
 302wJb7EUMzdqWMej10EGXp53jGSbEFjRrQu/KYg/F03DXy4CrbFwFethYGNkbxX47Xxos9ABC0
 TQge00coxSI+qYA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/default with
 auth_id=112
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add myself as the maintainer for Marvell PXA1908 SoC support.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ebf03f5f0619..5d48ac9801df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2370,6 +2370,15 @@ F:	drivers/irqchip/irq-mvebu-*
 F:	drivers/pinctrl/mvebu/
 F:	drivers/rtc/rtc-armada38x.c
 
+ARM/Marvell PXA1908 SOC support
+M:	Duje Mihanović <duje.mihanovic@skole.hr>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git https://gitlab.com/LegoLivesMatter/linux
+F:	arch/arm64/boot/dts/marvell/pxa1908*
+F:	drivers/clk/mmp/clk-pxa1908*.c
+F:	include/dt-bindings/clock/marvell,pxa1908.h
+
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.45.2



