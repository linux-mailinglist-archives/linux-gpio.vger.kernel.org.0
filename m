Return-Path: <linux-gpio+bounces-9096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645FD95D821
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 22:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213932840EC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 20:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFE91C86F5;
	Fri, 23 Aug 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vw5WoJFm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F11C7B79;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724446539; cv=none; b=B/b9fsMecd17UxF3i7eMDoz+/jX57e0IwIAuem8rJxpOiFAaCtp5agNkYnRIAalsVssofGOIeTo8P0sZapa1NFOGOC6K6i0u+DE8+FcVhz7rzjdnWlCJM3HkbqOaCYsmYnykVXl7jw2vvepQ4GgW2MKM3k7IuA/JxLT5aaWPg8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724446539; c=relaxed/simple;
	bh=x+d9e00yawhbZ8h7g7xlFZ3Pv+uhRtESlIjauEB2srI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTaFOe1mtmTUkfhWA+7/9eLf4FVsU+o6k4/TtBB3mOE4eWO1QyjDownEe2E6rRAjuwOCMqQZ9XC7VOlqQfaoGYbCD2HmZgbGKfTgKJybg9x6hHeHMhI7qnd1LupRrKNaQQPZDO09PFL4cnbfJl6b6DyZ6c7GWEicZshOX7qCqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vw5WoJFm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B5DFC4AF0F;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724446539;
	bh=x+d9e00yawhbZ8h7g7xlFZ3Pv+uhRtESlIjauEB2srI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vw5WoJFmUS9i4RR26m5CzzlREH7ZB4GEzXAN9jagszx3EPXvoR15tymDWX03lCNIm
	 4Kx/OTQRwBvPqr2XJsRZ8eU6V/34u7Tdt7RiaSEekZ7RHmmgHly4ZjFUjj34gO7Kzx
	 kUWynawVIk6TIm/jGVsVzWtvgvuLR2icuCJKpDFFVryAtWZNk6QdzL8GB+nCSbpNwD
	 XZL2MbVDI9PZyE1z36Yl3J+4z98bDcmaPWHkVzvEgr/AaUNtU60KhNjBVgcMLhiwwE
	 q30SM8YfHJ9HuADcAYo61XF8z6wyit8tKeu9x2FdOEoTRfz00U1xDnGKiats1h7LDt
	 DqVOA0IKUCnPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299BEC5321E;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Fri, 23 Aug 2024 22:54:37 +0200
Subject: [PATCH v12 02/12] dt-bindings: pinctrl: pinctrl-single: add
 marvell,pxa1908-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-pxa1908-lkml-v12-2-cc3ada51beb0@skole.hr>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=jSu/auev6NXw8rqoRVgMNJdUTPhlK55ZwDiRgbxNxJE=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGknvmtETLGoaaip5PW9o/+ncSHTSucDN1qt7GSk7q/YX
 LBTJdymo5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACZSt5WR4fd2lh/ieY/bUpep
 dJS2SaVtU7ykbMuhUWH46anb0k2N2xn+ynZNWKn/T6dC8Yzj5YCJEa6ysdGq2gpyIkwKAeVz9i1
 nAgA=
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
index e02595316c9f..f83dbf32ad18 100644
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
2.46.0



