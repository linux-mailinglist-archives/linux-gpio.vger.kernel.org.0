Return-Path: <linux-gpio+bounces-29967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C6CE554E
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 19:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A69630072A4
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 18:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC878237180;
	Sun, 28 Dec 2025 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="p4VeRfPn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C9B239E60;
	Sun, 28 Dec 2025 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766945163; cv=none; b=CZx/kATf7Cxechkw4/g934hn3h+6TZPFKgaykgJOhcrC3c12WdhPVDtpkE+P0eniay8XYKKSLXA8/aPoZYpaeELAIQVzKrqOQiYKNklIytoQNEu7pWMlIfVCzxGSMeJN2jQcnyltNZQLVDMmwE5ZmbQ1u3cZ6VIRLK2cwAplDSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766945163; c=relaxed/simple;
	bh=qzuDAQL6ncaR+g778ifbBHl2XeBed/a8pCB6zp6QPt8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Atmo+FWSBYTJIkHpttvZ76IYoC2FPTpwsBoOJNmKoPZt56UBsdRZHA+20X7xgexlPLGizssiYJEDsOUBTqVrhIur0uFqh19bxCUz3MgOH/FS1EmtUnG2q7nCU1GPBJK77BUGXJD6rRLHHGX+ynKJUTrcQ6ZNLWspczirAyTBf54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=p4VeRfPn; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1766945153; x=1767204353;
	bh=U84g9CNDZRq+0bG0puOFpJgmnKLOVSi6/RBHeipEFfo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=p4VeRfPnmuwbB/4/t5To9ZAYZkpxLHqjspeB/8+Bf6LRmIr7CX35SkKTfUDOdQckv
	 HCqPRSmX+uCd7bGDw6Grs6gTqBSNv7pz+O4dL/1BmL20z35VQKwZy85ITJVCouQgjX
	 G6dtKVY5dDxzgldrX29hL5qMT9v6q6MFcG/53CNZUjcPdPZRUsS3LFo3aRXMNlseDW
	 WReB/7iLp7VGW88p0FSLsqTYaHVQs33WPFFfwncMBhyVPlgEMoMa1R+3+A2yJYtc3n
	 ce1HQyfq4Uw2xNTh1DGfGdXE960FVsdeSOc8+QJ2tIEZHuIUwLkH5qxmDrz9baMuvr
	 Cj9yOTdYdVQog==
Date: Sun, 28 Dec 2025 18:05:46 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
Message-ID: <20251228-exynos9610-pinctrl-v2-1-c9bbeee4c54b@chimac.ro>
In-Reply-To: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 828a442cbefb8ebc3891c49265d0673f3cfed4fb
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document pin controller support on Exynos9610-series SoCs.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml=
 b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index ddc5e2efff21..7b006009ca0e 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -55,6 +55,7 @@ properties:
       - samsung,exynos850-pinctrl
       - samsung,exynos8890-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9610-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl

--=20
2.51.0



