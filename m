Return-Path: <linux-gpio+bounces-10644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF998C04F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105E41F2363E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAE81C9DCF;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hbe9VCJB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D91C9B60;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727793568; cv=none; b=RrCvzAISsQcG/QNkKRDbGHCtqBuLAyQ5sVQFWJ+ppd7hOfULi4huVH68crP4JDdfnmT32QvI4VZqKyiEsK2iLpVeBgOC7uK+AgP8Heep7l7Ce6i+CyfLRASPfOyeQU3/MmGQFabZuWkUJHlRlQNejeeRs4hu2iMP39kCHge3xFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727793568; c=relaxed/simple;
	bh=7I2v7t6S3ntwq4WUq0KCIBkDQRiVz4h4Lde8AVA/x9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNMA0vie0xIqIpZrVUtbjHzqaYjvO6C3sl37D6eTckYJcwS27Yf2OoomYc+hIJNqdnnjAofI7VCN5B7REXNdCFw4rMxeulZ3TXNj5IuGaYABR+Ix/Df+8f6aTTz3zIrWynSAKEBNsqLXYDNlFhGfpPAV9oNq7RWEmqSVf+1yLLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hbe9VCJB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08F9BC4CEDB;
	Tue,  1 Oct 2024 14:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727793568;
	bh=7I2v7t6S3ntwq4WUq0KCIBkDQRiVz4h4Lde8AVA/x9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Hbe9VCJBo6OJ6JxZL+8kTCayPjhnZh+uS5FEUWfkik30y0R7V8NN5Ih2TYkAdquSU
	 0xVUJ/3vo2G2MeIXyQuscmGq05S3i0Jt73zrdyDOPUcz42Hj5JyJb/XDXWTyGy/eu1
	 P+EYqRX76SVLqPAzXMekK4gqT/kCQ29ayGorbtrKgmj6kZZYMhPGaaiynLZ3XfaiMf
	 Am0BIkW0YEPWJOT6rl/i2Qcf//znXBTQIpmQro+v/uvecDAGqAu8hVGzx74O09PjHS
	 n9XHtnQb3BFgco7BmQkC9OY3eqPqzQ7QLkEDnE7g7cp5QjlySjRaBLDmvA7Bw/X+Eh
	 PLxs3D+vwE5rQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAC7CEACD1;
	Tue,  1 Oct 2024 14:39:27 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 01 Oct 2024 16:37:32 +0200
Subject: [PATCH v13 02/12] dt-bindings: pinctrl: pinctrl-single: add
 marvell,pxa1908-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241001-pxa1908-lkml-v13-2-6b9a7f64f9ae@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=PwVocv4KFkv3uR8QNDc9w7P47TxGZXpYEjcO65RpZ14=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGl/OCdtP3fWOnTRQ6FfNcJHBdd8+lTZKjjbs4Vj6umzP
 N8MFixR7yhlYRDjYpAVU2TJ/e94jfezyNbt2csMYOawMoEMYeDiFICJMEswMnRPcfq1aK+TedU6
 p+WSRdIJMtrFa2UNc/tyL+0/tS/AR5aR4ducrbUieVs3P+lU0nMyddBWnpl0PdE/K03O69V1k+f
 H2AA=
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index e02595316c9f4939ca5a7c61115f23ca4dc5e1b8..f83dbf32ad1838f25429e22bae14f6c74cb38d96 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,10 @@ properties:
               - ti,omap5-padconf
               - ti,j7200-padconf
           - const: pinctrl-single
+      - items:
+          - enum:
+              - marvell,pxa1908-padconf
+          - const: pinconf-single
 
   reg:
     maxItems: 1

-- 
2.46.2



