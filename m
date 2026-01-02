Return-Path: <linux-gpio+bounces-30067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EDECEE5D7
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90375302D930
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115411B425C;
	Fri,  2 Jan 2026 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="GMlYpKce"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC202EAB82;
	Fri,  2 Jan 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353398; cv=none; b=metA0nTQlZW++poowpRoQcu6BHy9worcjEgtvkLrUJXFCObs+UCwyWGcHc048MIr+39FDEmth/pGpFYZyFqp7SiGMeQXPhSUygaLdnxjV5/luB3RX3pt8/4mdBLUbTtXqpzgmEU0jVgNEfCcmLz0V8pj6KrcdPK+4xEbKCJNDXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353398; c=relaxed/simple;
	bh=hNzG//UEyLoPb3J2DnbNtlBDzS8vc/bHChBjTkB+gsQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lLeJrl3M3xw9QNDXU1Jk6bpr0goefIN9tVO5G7RbmkRrGsqoIKEvmBHFH/SYCOGdSy2Yp9IC+1LJqkdLRW2wcfVwAuak0NICQY+mcu5R22/LL7LwhiWpYbqcI5RIxRaE0QviQJjDztqYCZb9fEV7B28hPz0ltwcAmtT2Ss6vBKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=GMlYpKce; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1767353393; x=1767612593;
	bh=sjdFgLhyI2gKa4FyGQgRrvSM1TJIstHiEd/eY+0jaDI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GMlYpKceZo+pkQUh8HthkRuZsxDUuHDCptD7zEFtJdxeWcmsh2jXqQzg2fyUoRSlw
	 Kq6G53sItOUSFBwHA7TgiGbfnC0O5prq4js2x++thLwIjIut9/1GgkLP+05A45z2Jy
	 bC39PMi7xikzIXdt9YNGd3qh1nVwvGqcmisuzBOpeQd598h5OqEEyC+2z7LJGxxT5P
	 7dWE9vGv3bhpH+lpUfDFuZUj/MYyh0Y0H6ykLRIUPUJ7jlQaTp1EOml/0fyFZke/8z
	 xj7LYLs2RUq/YU9oGlNQR76T9B/FoKFXJxUdWYFnSGYK3cFZX0QzNB7lDmfYPX6O+9
	 lluo7jBAk4OtQ==
Date: Fri, 02 Jan 2026 11:29:49 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <20260102-exynos9610-pinctrl-v3-2-3f21f2cfb651@chimac.ro>
In-Reply-To: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
References: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: de7b0ffcfcdd03ed139b527265085e60d44ecdc2
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
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml    |=
 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wake=
up-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinct=
rl-wakeup-interrupt.yaml
index f3c433015b12..2b88f25e80a6 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
@@ -48,6 +48,7 @@ properties:
           - enum:
               - google,gs101-wakeup-eint
               - samsung,exynos2200-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynos9810-wakeup-eint
               - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint

--=20
2.51.0



