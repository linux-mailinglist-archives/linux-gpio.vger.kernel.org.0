Return-Path: <linux-gpio+bounces-9099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CD095D82B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 22:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FFDC283E8A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 20:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC271C8FA4;
	Fri, 23 Aug 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixgJ1ZZB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30911C8225;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724446540; cv=none; b=ss+IHrHjicM0DsS/IcnZc0PC34JA1UV4+QIijYojY9fjl04ke/BIh1+kha18dwQSASW2rE4QQTBcpIZzB/5NRd4kXYddlNqb+PjxBIrYv5hjO7C6wJPDz3Z8KGudMPY44LIQUYT5GwmlAE/57ffxX+aOeVHuAujDNp4XILKGnyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724446540; c=relaxed/simple;
	bh=dKnC46XozTJpypvkpaetASRFK//qRCP4l+nrbuy+mis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1kGhbFGsrcUUeKyCwPrr2fi+zlkfjI9W6OpD6YToREui4g2J2ZO/RuqDuKGnJtMYkpLkY1+hnK1iJVVp/aNwB5GngeVI5kLs1KD0eo13IdGIW1yR32EItOSS3mI96EAQi8kQWVSoFlZSC8DbhdXmxsQOKDD7Pl6Fdrld48oTTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixgJ1ZZB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A62C8C4DDF4;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724446539;
	bh=dKnC46XozTJpypvkpaetASRFK//qRCP4l+nrbuy+mis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ixgJ1ZZB3ej/732cXAAuG8ccGemWCiQ2c0nUeqgrefgU9i9z7KBcfXt8xPwh6Kke2
	 a7TTyVGiRBpQ6ztrSAGPfko7EEGQj3/ISQuTcbZp1u2erYNOtT0aSqgjwrVuXyF+Nz
	 DSjVYCCNnNvbjp2p/t08zj222mWJ9dDJ5kpoFZbsSL+34youmwBD7yCUBdFFZ27lOl
	 iGeH5556KCS9QIjEOZLh9g/k83NZVLtJJLx1t89eYinoqbjdjSuRJro3s/Jr8Nk8Le
	 vy7k3rUtkDvh+GV9RIFQmKzBvGQhklWcyRkfhgNnBXYrSoMMxjdhIbl7qC2/WzHMFb
	 bi4KGJoDt2XKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB35C5321E;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Fri, 23 Aug 2024 22:54:44 +0200
Subject: [PATCH v12 09/12] dt-bindings: marvell: Document PXA1908 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-pxa1908-lkml-v12-9-cc3ada51beb0@skole.hr>
References: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
In-Reply-To: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=QrqVNghZjJ0danHmekNgPNEViycSfbtrsGgmjE2XERU=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGknvmvufKZe53Y0IyqncPrBaK2Mbo3w5QvSNx0z/jK1p
 Xj7ojNJHaUsDGJcDLJiiiy5/x2v8X4W2bo9e5kBzBxWJpAhDFycAjCRXScY/pm6Gx22LY3rKjr4
 pyXcZ2aWwOUCBYm5yn3ZL4XZVgQ6FTD89/663PTP4oCXsqdcZ+88VubQJhW39JLdJPdX7ocj10y
 yZwYA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add dt binding for the Marvell PXA1908 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
index 4c43eaf3632e..f73bb8ec3a1a 100644
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
2.46.0



