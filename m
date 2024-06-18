Return-Path: <linux-gpio+bounces-7539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0A90CB46
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 753DC1C225BA
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 12:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4BC142652;
	Tue, 18 Jun 2024 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txMEMokh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF90113C9B3;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712557; cv=none; b=qiGbeeNimt3GCT2VcYWwu9YeWagAmW/r+GtEFYblROQVajkKJOEFLAoYm9XsxcqXFm0doW5GzdCaFQSo3jOaco5I1Xwe1bFznUhy+50enpFXNF4SvXK7SnBIdWGR+UBM3mwN9F11EgNn3asqDhaUL8M7USYsm4Ys9paf62V0Yxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712557; c=relaxed/simple;
	bh=yfoG8mqn/X97sdC5spzqwus+gtROE5wIfNQiUg05Vcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dAya/qnS0X3uDNXmUMKp28hqtZtEmQE1kkTSOEfrCpBLqoOfiKkXoNIaTDLuzFVyB/invTs9oj40+HmGL6ZwNosciyWxsnhr1j8xFz9WjZSmlAlKQerZGhPtis7NpDDi7vUkpl2svdfAMB2qRAytuMj15Ybj5ytxQcYRatf1cXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txMEMokh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91C38C4DE02;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718712556;
	bh=yfoG8mqn/X97sdC5spzqwus+gtROE5wIfNQiUg05Vcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=txMEMokhgZq734kf7HteODNkeXMdh3sV9+Ox0qn+H/Up93AQvRHw7TreDLeCBayxB
	 1enHbEhCHF5lDp5+kp5+EszxVA09HtCPitAJzitG1Muo2wBhSoEEXynOBvNHlIQtR7
	 n5ADeYR1HIOhyjPzbONl6B/0u+956KvYhYpYrADGlUHpPBFW/JnC4hSPkYknd0RGmG
	 w6kVP9EVTlFVtconSzrkKxWMtXqRZpFPvZ7NzJfXJa0azfujboOVv7UX1YXh2cvfts
	 EdhKHyrq3tAXj2C770R/JseUybEPOo5V7xSxXoeGtHxOJ9HJQGNO0EZGuqod7Juc1d
	 o3a80NGqXi6ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8849BC2BA1A;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 18 Jun 2024 14:08:20 +0200
Subject: [PATCH RESEND v10 09/12] dt-bindings: marvell: Document PXA1908
 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-pxa1908-lkml-v10-9-754e5ece9078@skole.hr>
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
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=sKkIzhW7HxgO/mwjme6nrHzJLLNyn3Ni8Blvn7ov2qY=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBmcXjSmDe4RK5IUJ00M+M7KHJRka8cD3nxrs29K
 JZdzl66DVGJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZnF40gAKCRCaEZ6wQi2W
 4TczEACcGHC/FbESIR7UQzur4xcp9cz1kY+6ci3KLdG4mULEXIXK8gfmGJb4CHwFIXzYCpZB/c8
 cCwiUF8NJq3C46vAZSQ3oXjFsC7OXUWzuVxqOgJn4DSFtKNgVBDVxk30pjnBCi7+z9kWy28Yom9
 ed22QBR6A3snS+5AM7ukq4OrKCQKb7T8tWAaAhbfqOJY4Tsk6mzRx56ryF1nCAVx74/p+N+f+0f
 58/6LsjODLyXotsWhbNz+JTb5sKPgHJ0Vzs7c+/PKXJK6zfenZGKsmK8B33JZQI5m6WTm8ULG1/
 TdOQK0iRdkjh5l9Bhr2Lrq4BhT0UkTbQ3Gl7Pa8JjOEVbcFSMdfbxRoBAB9GmsihVi+bffVS4rx
 sZFChC0s2eF4q/hmdJeyad0B6chrtXVdX9HB6RiNRp6o+D+iUHoBBf06tn9kpgKM3WYVERR9KnF
 Jchdup0CeSvrd86RJOzfSWtYNPD4cgdXJFeG9jryFbOXlrvI7+F+1AXKfEaQAPeg1WYZR5vROfQ
 ZHen7IMoHjzWUHqn7m+fXhCJioVJD5BZrEmBacJ7CZMIUWO1hvND3mqeGSZGdjiVPsbhYs5ObyF
 euZ/L4srlFjCdMO2jPwt3XtRLOC41Ka2hJbM+/J+K+NXKh49oCwZNwJa1hBCABkrOSROCqgUC3u
 t62+w4NE2rJvZxA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/default with
 auth_id=112
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
2.45.2



