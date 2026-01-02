Return-Path: <linux-gpio+bounces-30065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC1CEE5BC
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 377C6302818E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE6D2F3C3E;
	Fri,  2 Jan 2026 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="re7W3ZXh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C919F12A;
	Fri,  2 Jan 2026 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353389; cv=none; b=ffWzCYcCUV+s5pZmg4xSKR+Z989j8pdctCe+v6q6rbCnC68Z7nK2AWHkg2XGiAHMdWmkBzmKZkpVvAqsS/WSdRIFht0VWBK3iEdeute8rP1nXbRv5HGlfP+GlxK9Heh6ge1tsxLlXs81od0zNYTvPL5XRVL971jxsomegwVxQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353389; c=relaxed/simple;
	bh=5FB+4nW9/S83V6EMTeFaeJC5s//Gh8HdTYG7hCgVka8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HK6x1Fc7ROc8nQoeic2OSODzoKm6dZClALQUGQxU8BPyKiBC4EpNxJo0eVmK9k6gsIIdl7COK+vZqVUBcF3TxbwG329YTtFSIIRXiafwia0JG+Qge6KLexy0b+DsDsP3GjJyOrxy1Tbq6af1fAt7wdWTRvMJEajcIOUFCLiuXtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=re7W3ZXh; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1767353377; x=1767612577;
	bh=gp/pH0zKhkxkA62RfQkWYKiIcEXEvhrGjKjOOk9sD+s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=re7W3ZXhj+mdwH5csuRiJONd7iRTZyPn7ocSsb3oJWjpfmYD94lxGvYAiMokkc6Sk
	 eOaqVe87flopn1hQJcWbJ0jZ5LxKp2aIxb6cFGLesY3B5i0OenGwoJKMwmZ5aqFhgy
	 L+iy0gULy5lHO+Ut5uSWCiXjd0tvVpjC3oxnNtCF+iQPYT6yFdGKYG5J4u/YXxHvwp
	 tH7AsIRrZcEM3DKhB04RpIDNbOfMB694gcyMmMLkmzn8Cbrnt2VY5QVNICqp72fsWd
	 ks9WS5LXbeudt/Mb/FeAdSUT3AjV9V8pS5SvFY1sDa56bEjVgjWl8UiLLjsxDrGSNW
	 mEXvpjZt2blTg==
Date: Fri, 02 Jan 2026 11:29:30 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v3 0/3] pinctrl: samsung: add Exynos9610 pinctrl support
Message-ID: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: e5b2425ccbd1e6514bc36e6cf6fae9f892a47cae
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
v3:
- Remove unnecessary addition to enum in samsung,pinctrl-wakeup-interrupt.y=
aml

v2:
- Set proper FLTCON offsets for ALIVE, FSYS, DISPAUD, TOP pin banks
- Define samsung_pin_bank_data structures as initialization constants

---
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 117 +++++++++++++++++=
++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 122 insertions(+)
---
base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
change-id: 20251228-exynos9610-pinctrl-7d7988fd50a1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>



