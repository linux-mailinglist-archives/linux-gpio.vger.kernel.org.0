Return-Path: <linux-gpio+bounces-26132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB14B56BB0
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 21:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2BF57A60A9
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 19:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED2113BC0C;
	Sun, 14 Sep 2025 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="XZN50oF8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5F625486D
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878485; cv=none; b=c2Zg/Q45bgFnY8+Jh4pW7mWi0P9VnT3gjsz8yNZGcSYlZsRcvauQiW0PT+2lxdT6Lm3aBlh6p4BiZntW1pWKmA3Q9dGgExh99vtjDuPoBMZHJmi5jQ6Gxz9wPwPQrIxj6DtDdh87mFIGTkJuYAMUM9L5CrddB6Ofc73ROiYRV2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878485; c=relaxed/simple;
	bh=F//VEGGKQ4dySAaUx/MMsnPS7gqkPc0NM8iIn0Frh7c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HO2uH6p/j5PkwLME82XOzN456yHy/ACWiq9+4wnQtiz3QFt3KdAJAo0TBBx44lml7upI21/W3TDv4Dbaev/tSUeSmHQ/L9KErIRBkGJRHSKid1iKsxMScmmcAMupOBg1DoeT8RZkcNAyH3IC0qLh72ahKdgfjSKk9/k2FGSBQNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=XZN50oF8; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878481; x=1758137681;
	bh=E+xJKNk5JY17fob/Z1mGipjlu1Tw15TGNfmIUUFMZBc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XZN50oF8Qh12FYWKXsXrL1uoywEBL24DVU8/X/BPINIvJe4Lk+x9aM2GrpD+Efqag
	 A+jW9jPemMx3yzWUtaNdRWq6doD9DII1t6XUbwtK/8D4WBOXxb2m1mE7aj463b+0B2
	 SzI/TpkdegotG9aB/YS9PSFep1rZeIah+SapcJ38B0SthBRqudCvbJZ521dDlYKcTg
	 2s3rBoX9yUi7LS8TrftiN4SCDMclS1OWhjUw8tsCL0qAZu0FTU53RKvbhxws5Dowcr
	 ghjiKWtbPocHyhtS9QxPWvcj6TaxQ7+fCtv4Mik4/Q2+qySm4BOORddn3HoIbu6Z8+
	 2lQvt7aVeQ72g==
Date: Sun, 14 Sep 2025 19:34:37 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <20250914-exynos9610-pinctrl-v1-2-90eda0c8fa03@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 3c75b62b02e9849df976c000fd5158f746a985f1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a dedicated compatible for the exynos9610-wakeup-eint node,
which is compatbile with Exynos850's implementation (and the
Exynos7 fallback).

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | =
2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wake=
up-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinct=
rl-wakeup-interrupt.yaml
index 0da6d69f599171b6946992c036f23c5dea17bd0d..fe06c0d2734960d3fe57783c1c5=
28f58fa297c57 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
@@ -49,6 +49,7 @@ properties:
           - enum:
               - google,gs101-wakeup-eint
               - samsung,exynos2200-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
@@ -123,6 +124,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
     then:
       properties:

--=20
2.47.3



