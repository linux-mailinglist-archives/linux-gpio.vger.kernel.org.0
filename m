Return-Path: <linux-gpio+bounces-26131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08036B56BAC
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 21:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E260189E3AF
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 19:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369D42DE702;
	Sun, 14 Sep 2025 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="iYkeJ7ox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9D913BC0C;
	Sun, 14 Sep 2025 19:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878475; cv=none; b=Ug+22tCCWJplqunEsR+8JMe+DFL+fvNROMQUMxwksrBjAJixN1i3Mgq9ZVJambWIfP653Dzc7zHnFIJhOI/t2MF17+zmzpfJ5zjLRR7P0XYmUE4pqRMAm2+5adq26+sx5gEUTddfSFy8LamQBKsKWg2kfeV7jIzB2/sjfI1dh68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878475; c=relaxed/simple;
	bh=XyJr1Et83VSZI4TiOdi7NfvvgURQCYI5SyEeqwKJn9c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wofj8RLBVkKKCmvxfTi0nFHtW2H33gaTVGzm/H3Q1N79zWD8TE4CWZxmoHRTHzWDzbGN0XiYjlLU84WjIjtAYHsI2IesLN9yyyXOKY9muTVx8rsSvYGlGPeJvW8EkNAtMsNF1quOIUvkMd3m9Hh1yVudf3yrc7FxgmIWpVEdSdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=iYkeJ7ox; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878471; x=1758137671;
	bh=7lpOnihuzgN8aXgYGmo1vFZZPGJlskHF0+CRgoIdYsg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iYkeJ7oxFPeF0Ogfj0g+m4tDHNF5R4qLTuXc13KtuJfY6tNvzutx6m/Kr+3ssKMlR
	 YJ4PDNBJsWBved463O2SI2fTo3nlDQGJ0su5gpVUMUXTV5MGY2QUcL5yq7dNfXBXDO
	 wcQ/jeoGACuYYU6wDoQWLmNTgAHPJ8I9dql4ewIh97NeeVQAa3a4agVtIFkrCBwh8u
	 uSlQAvnIznj1zOKnqMJReXCpCgIYa/QOPCCMeGtFLeBn3JZaQE6AuV371Sw6KE8zBU
	 EgBIiwbzY88hXMJLUsbq4JkUg2kxQ+UEMKJWI8i7SK2pMayRfmMmqn5ZQJ/dcDtFh6
	 jqWxcg2weinsw==
Date: Sun, 14 Sep 2025 19:34:26 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
Message-ID: <20250914-exynos9610-pinctrl-v1-1-90eda0c8fa03@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: e3fd850e34ca0b8637da029291435a099c697aac
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
index de846085614166087ef9046cf5d154fb9dad8309..2ebe9353d3bff9f708118a249b5=
e969aa5fc393f 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -56,6 +56,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9610-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl

--=20
2.47.3



