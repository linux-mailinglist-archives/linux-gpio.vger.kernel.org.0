Return-Path: <linux-gpio+bounces-8457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2277C940F2E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 12:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D82BB283F3E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 10:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3803F19E828;
	Tue, 30 Jul 2024 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0uM/UIO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C140819DF8D;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335171; cv=none; b=f+nZW4QAQQf8Q0yPNGsr8O1PquQ3RDFyimJRgZCkolDpTU+olG886KSVJtY/3Am0tXq4jCOAq1RgZFhfqFdIT04uV7ApMPQCTgGUvfOGJ6QnbN3QunLShSNTc3n7Y/U+NuJVLFe5Ktbcoq2k2QWSLduTNnlI07gYDttzBd6Y2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335171; c=relaxed/simple;
	bh=LvMq5OWPCJvwQ+xTc3PItgAvDl5FpjadGqHgP819Ft4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuhD8JU8tTsDpjRahomLA+Sel/yefTM58Bd24LUpbXYqykyJF9wvVdrBCEcGJUhxkHhnjv+myZK6TOOczSRHzp0K3V1ZJPFBZ+DIcNSgIVdcyLM1k0dB/J/xPj23bYc5L4dADkdu5r8YobiBMIOGHmJL4XtIsdP1ioUEd2y8Ry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0uM/UIO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96A54C4DE04;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722335171;
	bh=LvMq5OWPCJvwQ+xTc3PItgAvDl5FpjadGqHgP819Ft4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V0uM/UIOFnHBGgkYKrs0dlfAOgS+jBTE9GcJRQr3dxHi5j2W4JGpm3G725PHwXh7B
	 U+Yw8BuzAWbMBiAMu0BzXvQL89OFu2LumHEt/Dx2+0PARUH9VOflB8I9r5Z0ibTBsK
	 ATNPCZjGty7fSojAYlOzQ4jDCUTqapnCgN3QQD02CkYasXaFkLBZ6ENBrSlJ+zwiQi
	 AOVfCK/6CP7XZFeQiuWXKEilv64VYocRD9/uncFJxo/PqLtjQZOXPMqM6LjGR7WI11
	 BY6cn/yM1RzsGBL5JM+bBnbMhZ1S6X++T3iCrkJWcXypU4/Z5RJe9IUsJ/NTwuoIzk
	 AIOqq9f5eHzcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB2FC49EA1;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 30 Jul 2024 12:25:20 +0200
Subject: [PATCH v11 12/12] MAINTAINERS: add myself as Marvell PXA1908
 maintainer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-pxa1908-lkml-v11-12-21dbb3e28793@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=sg85E8aStsdrf1kcIf2gx3rGYTEorPNrQYUYJ6B5fTM=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGkr9m+ZKXihIcpaS/fNh7Otz1PW7ds6P/78m8sn5jQE/
 7yycvE/oY5SFgYxLgZZMUWW3P+O13g/i2zdnr3MAGYOKxPIEAYuTgGYyFUhhv+RLQJhy1Tm3+y5
 OeP7VM5rtqlHDh1Y9tlF8+U9WfUf63b6M/wvuinVL14381eznZjrKfE8ka87PZ4dS0g+ZPFHzq7
 Q05sNAA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add myself as the maintainer for Marvell PXA1908 SoC support.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..40d14d11a09a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2481,6 +2481,15 @@ F:	drivers/irqchip/irq-mvebu-*
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



