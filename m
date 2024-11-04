Return-Path: <linux-gpio+bounces-12540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE939BBAD8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 17:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 073D8B20A33
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFFE1CACDC;
	Mon,  4 Nov 2024 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPLK9zER"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D7D1C729E;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739545; cv=none; b=BngfyOtMD+06dcF0Aw0Wvl1bg5j3PG4rtPaVX8bV0wyX5S6WY3h0ZeBKkxRg079gPBe7cH2n4MjRe4afdXgi4SrlVe1w9bn8Yj5tXi9Fg+QxqTf4eYoQAYxt7c0pdJ65M8ZZo+ErMRYb0uxAWDMXeLWMXAst0q1YbC6GCkxiHsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739545; c=relaxed/simple;
	bh=4D8XOtjbC8UY5TysZkndfhmFBX5acb3YFTXYUgMYqgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z6Hwu32c+vW7mRbfagqqMaSSBuUugLLmpDikaLZYTrC+LmjoALA9wp0D0hxRaPCJaYF1JKtN2DDebcNtEDACa6qIugo6ZlBt75GPfeqYkaYSed6ob3eFYXdh/joDGWuZVybDXr1AVnb87bTplKwwrYz2fNtsnVnuocJy/9otBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPLK9zER; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 611F4C4CEEA;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739544;
	bh=4D8XOtjbC8UY5TysZkndfhmFBX5acb3YFTXYUgMYqgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IPLK9zERO09znRa4QzZ44/eMpgIcXm667HQQxVqcxTgvWk2MfTEJDKPNv7TYYw4lR
	 lVOJznEUuqbRhMuxHNL+rY3ZXn0aCZn0KfDc3xPgWPp0rzhOOhiNgflta0O+s84wVI
	 6ONg7+EGd/g9BCV3RrPfBt8xCvnMyze78OO/dMpDF0sBQReaNKFYNu8D8OB9hqsf7U
	 wHou6M0FRCGcJhCnQxjm66Ybg62RQ6Otg0XnnVLzDQnBwstLMgUbHtUveWLpmd2Wcd
	 VvI2R46TfYBocuCpLgif1G9yigL3LjXki11sqp822Ps6BgU3NDrYw9pCwLdj9PQ6in
	 OB8vZUbYg9pKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55471D1BDCF;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:11 +0100
Subject: [PATCH RESEND v13 09/12] dt-bindings: marvell: Document PXA1908
 SoC and samsung,coreprimevelte
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-9-e050609b8d6c@skole.hr>
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
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=15/cjXcDaPcYZAg2O4CmYNIfoTNEYP0hlzt3MbHnBig=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0NZpj6s7Q25skhCY+qbRc+FeZjllY07j/y+rCWza
 55P99H0jlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjIlWJGhsddXT2bXPSX+UrL
 /N0UoH3n5zTjV1+ZTmw5dLDs4IssXTmG/7nsH1f/3MC3ZeOq/wH3HnlVSC2UvnksqMNnLXP6vBQ
 2ax4A
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add dt bindings for the Marvell PXA1908 SoC and the Samsung Galaxy Core
Prime VE LTE phone (model number SM-G361F) using the SoC.

The SoC comes with 4 Cortex-A53 cores clocked up to ~1.2GHz and a
Vivante GC7000UL GPU. The phone also has a 4.5" 480x800 touchscreen, 8GB
eMMC and 1GB of LPDDR3 RAM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
index 4c43eaf3632e4ec8e7d9aeac62f7204e2af4405a..f73bb8ec3a1a1b9594eb059b72d95dcbf8c87c6b 100644
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
@@ -35,6 +35,11 @@ properties:
           - enum:
               - dell,wyse-ariel
           - const: marvell,mmp3
+      - description: PXA1908 based boards
+        items:
+          - enum:
+              - samsung,coreprimevelte
+          - const: marvell,pxa1908
 
 additionalProperties: true
 

-- 
2.47.0



