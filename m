Return-Path: <linux-gpio+bounces-12542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 023229BBAD9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 17:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8952DB2145D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B021CACDE;
	Mon,  4 Nov 2024 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzcCOUvZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05AD1C578C;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739544; cv=none; b=o4VUaOILuta+1SP6T5XHyurdtrDm0nA3hFn6fPpg9vgT9O6S6FExxCzfY0KtPv+Wc/kH5qwhQ1noOFbLk5QNqdrpitNhW53hht0WckWOQU2X9Q3EoNz1h6MO0t3xopIyh/coEgExV8cGLiJXzSBqsYVPeH74FlHI83s9Z2bGues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739544; c=relaxed/simple;
	bh=lbNqtG/m96O1XxfWmwnamE8s0OXTLNk3DYJ8x3TZBJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDNLo1wa/8gsJodIiXTM2TAo1MT9u2UMhf0duVBObIRv8IazlLGlfdSUTAPXNMbl5ZLnzaRuMHdRIcsJVL2d83LhUgDGwboAz2Vc52NzZdSQYadLyqfd7C6rMhC9E83LNVAV0cmDIGumjE5kWIfJ3gHMfXxQY1LR0RE31SBgpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzcCOUvZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D4FCC4CEF8;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=lbNqtG/m96O1XxfWmwnamE8s0OXTLNk3DYJ8x3TZBJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OzcCOUvZLMo2VGgqdkqnOSzi5y2q96zXYMLeNdqAXYZwJr8IBvq908M9GVmksMm4P
	 zwpPOjlJxFbxfpRqpoZxN+MVu9osbUynUI8Vz+jzvI6YDbyi+BaJ0nBd+YfMMHLhGk
	 G4ai6zUPTqDNw42eyOZmeOuH8Fl2F7WTajzIzOGrCxAnyjD5FFvrnADMojog9M9gz1
	 fEimBNNKtLcYaczC49lHGLB80PrrOTsmJuaCaTHDkSiim0zYKiZj0H9JfFlLwvVF61
	 KAvZzgvMfuzv6mIBsYjPBEnRCe1rKkdCcDHTgsa944RNrS1AAhn/J+ZY+t9GkapiK0
	 Wlq2OwV6mcPQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D06D1BDCC;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:14 +0100
Subject: [PATCH RESEND v13 12/12] MAINTAINERS: add myself as Marvell
 PXA1908 maintainer
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-12-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=WJM+jdOH+cWyAFZLAoZ/ZBIMQFxb1HLmL8TqRXOMrF0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0MNPB6lPD7iNKF2s8Rsb+V5SXwSPWseiFx8wBlUV
 96w78GDjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjI1+cM/+z3NQT+mvjB6FRY
 smqTh0/i24+zdqZ+6H19a285Z8N1NUGGfxZSe/q2C+Q/r9+ycP1vvXM1K1a9u3S5fdGCJ86LVwS
 kz+QCAA==
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
index c27f3190737f8b85779bde5489639c8b899f4fd8..8d50cb7457924e3290810eaf7d3c4b145d988ede 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2593,6 +2593,15 @@ F:	drivers/irqchip/irq-mvebu-*
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
2.47.0



