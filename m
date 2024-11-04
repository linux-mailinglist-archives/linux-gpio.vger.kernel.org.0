Return-Path: <linux-gpio+bounces-12531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D09BBAB4
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 17:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D5971F21A23
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 16:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742781C4A01;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WORcV19b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192691C07EA;
	Mon,  4 Nov 2024 16:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730739544; cv=none; b=aSxikPH6loXJc/jmdmvAf4ty5z4T43PFCGvr7SJAJUkMD7EF99HpzLKPC0NVdzTWaZjBCZ8NOktHDyiq3EUnx3fbgoSm8MJ6+FsrAU2Pshk9jF51Ginc83LYUhydkG6upJSdzYSB8Q8dwI1gRRUrhEHW+kkYK/1xuVXq3QQMots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730739544; c=relaxed/simple;
	bh=L3DrkLCOcqjknCMhAQF7j0FUEZocm0qqzVclckvGYag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p84zfN0LGsIlTN2RQN4YFOavW+Uk+XdNUM8hEoIda3hVh20IyIr8KnoVp725cuP0l7fcW2aVvf3L1AmqQsu7nT4IpmWeZQ/fA4Zb9W7VIt8P1+e/1nNN4osDS7kIiQdaw0lICW1Ptj4BnXQHgxQY1a/CRQuZWUjvheSpg/jzf44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WORcV19b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2CF1C4CED0;
	Mon,  4 Nov 2024 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730739543;
	bh=L3DrkLCOcqjknCMhAQF7j0FUEZocm0qqzVclckvGYag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WORcV19bzEefchoBsg3LNt6oyUKOHKJvKTpEic5Fsghk+12jorMWhsyoUtmCYr4HN
	 j9CvBqCJcphPNEN5OW6NAtFdb+hAX145m7M0VQVNDwRD35H28T+U1mQ6U/eo2IIJ4N
	 iPiIAJVSnhD4J39V12C1avE01Z1UMb7O1bsAsMIBIbMAvYptsHGJIvsPJ+2mDwCebV
	 Sdf8blOBSw2i3SGQke+PexQ+MeQ0SfHeGGeMH6U3tveS+aFpjbeWFgMecywP5/LHzj
	 nEzjz7zs/W9aYHqbdcX2lLrDn4R86a7L0acX7KhoT+lpiki2Dqgp1gJLyv6ZiKbKjf
	 H0LddWLIxN/iQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DDFD1BDC9;
	Mon,  4 Nov 2024 16:59:03 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Mon, 04 Nov 2024 17:37:04 +0100
Subject: [PATCH RESEND v13 02/12] dt-bindings: pinctrl: pinctrl-single: add
 marvell,pxa1908-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-pxa1908-lkml-v13-2-e050609b8d6c@skole.hr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=6nc60lajp3lpZ1HO45puIg9C6lXhIYLQzqwWa3+044w=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkaf0M0jyo8t7+Qf+85C/u1tF6tlQ1p+3xSTm9fuuu50
 Y9dDya/6ShlYRDjYpAVU2TJ/e94jfezyNbt2csMYOawMoEMYeDiFICJNHYx/C+rZuufZ3Zqwqr0
 m7cztoqJHvGuUWCasXby0YMfhb1n+Wkz/NPVPjxN20L/Z8RbPsH0ZrYvL93rtvYc0Tp5wm37Qu4
 f/3kA
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
2.47.0



