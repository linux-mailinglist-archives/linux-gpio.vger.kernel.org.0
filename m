Return-Path: <linux-gpio+bounces-29966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACAECE5544
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 19:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69EAE3007683
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 18:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EF422A7F1;
	Sun, 28 Dec 2025 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="Yey80o5c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA42226CEB
	for <linux-gpio@vger.kernel.org>; Sun, 28 Dec 2025 18:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766945152; cv=none; b=BhyD0C5geJc36QbNb+iRzSkcm7VKySyC5Fm/J6yKoQeK3WM0Fo9dEevlfl8iHlyy5hm9ExNdpMwdAgJzDEvLwhjXjIv5P4It3QrHzsovp5Yy6/F3g6Rm9RAmii1OFZzPn7otpyDjc4g/cKz72uhsSt4nSpQBmhFe+YXwtF0ppAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766945152; c=relaxed/simple;
	bh=A1JSiHL/dceEd6PPoXWRnInCuiNP6oeRNhIAsUcqkb8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BpFokSj41/LmG5jvf/i8FyONdxhphG9zeblWciwN/o2W/RJctZj1Jo6eSaDgHflpdSOBgPClpQpJ+R6UAjznF+vla/NhmdXNkkd8Gx9nVNCLZ4RsIWXafViBcSM1O4KQ0kIEKfsJ2aU3Lr14F5YyvVjVBHls5dImSUoLAeVG5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=Yey80o5c; arc=none smtp.client-ip=185.70.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1766945142; x=1767204342;
	bh=oaUC9LI3elKfK3dSHnAIr/04lkVLw5nLjwexGRodyx0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Yey80o5cRU02yCd6jBEfTCDJhi4okVdB8KtrhHxCDFV/4PPXpSqFCU7aAKwVuveQU
	 jayNfPWmjiUAIC5tcmdwhhcKiQPXuwR79lTzBz8YCNd9i2Au3WX+vbRDQJNGwlfNEI
	 yMKLf7RKFO6QeYwkOQqDiIUAE6IhfGpLZe8rCsyK9HUA4MIuuKnLi4D5ZmH49iXRv7
	 JhXeWDt6CgDTcW42kHaVcrodSwJUtZQWqfQXbBov039jK1W2ADqtV47EaWqGbJe4+x
	 vxGUm7G2DnOnEtApOTCZmkd9W4ORgBqS4s/mw36ZOdVQvH4s6sYRSSBYJR188iKtze
	 mFAZyMFuJKzVA==
Date: Sun, 28 Dec 2025 18:05:39 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v2 0/3] pinctrl: samsung: add Exynos9610 pinctrl support
Message-ID: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 03372dea5be5ce295a5aa4e421e99660dc2dfff6
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patchset adds support for the pin controller found on Exynos9610.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
v2:
- Set proper FLTCON offsets for ALIVE, FSYS, DISPAUD, TOP pin banks
- Define samsung_pin_bank_data structures as initialization constants
---
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 109 +++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 115 insertions(+)
---
base-commit: 48c4c0b684f394721b7db809e1cc282fccdb33da
change-id: 20250914-exynos9610-pinctrl-b44cdfaeeed1

Best regards,
--
Alexandru Chimac <alex@chimac.ro>

---
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 117 +++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 123 insertions(+)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20251228-exynos9610-pinctrl-7d7988fd50a1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>



