Return-Path: <linux-gpio+bounces-29968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0046CE5553
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 19:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7214A300A33A
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 18:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72807239594;
	Sun, 28 Dec 2025 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="XCYfBBnn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87482239E76;
	Sun, 28 Dec 2025 18:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766945168; cv=none; b=cH7EOdx9MGkiJO4X3Rf3W7D58Nf4TeDgZYxvVm+F6Le/w/gVBHM4HXjtrLMT05ImMHr9OkS9MxUsl3mtrKT1v4BSPiwDYEzdnqo04BLkY90TO5FlqFu/QJen4dQDtQfC0kKgeUW2h1jUVUeTDMgBDLtVTqhVheH2YHd4DgA1Ycc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766945168; c=relaxed/simple;
	bh=ZDG50FlvkmgFdsnzsQbYIcRoJeMz+gOrfdO/TLMEQno=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNnEyO3Yhw1pgdjE2ibHSv0GdfmNCYnaGovqF/Njss1m12DgHeNr2e6XImBSdoGwbUjCOwsNKL9ay/PUDPbTNkhdnGVRhJ0B8VcSFxAJA7cV88qAkP5b1emhV/JDJ/FmTK1ZYbJCsk8YZVUuuLGQ1JP8BIcJzjBCuoopnNPzUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=XCYfBBnn; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail2; t=1766945156; x=1767204356;
	bh=1dZPvLSYqsp2e4dvW1UiVkvRzxdy9MDBk95k2d13Ob8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XCYfBBnnYXG+yqqviTYcUFChcL4RopouZEnbMMPXyrEXe8wuc0hn++GbgQccfMUVS
	 b8725CZ6/vsdP6c/Yk1mOBlGQHP40y4imQqLgrKCb10UJnlgmXXpE6WK2o1l2n6Izn
	 zxOBf6S37vka3O8bCjtLjwosLm4msPSKJIdtz+WRLpAR5fwyO6VeDfX04I1PuWUMXH
	 49rrREZLkdsu2d25CX4wk0mPrwAIdGm7Akfqih4KSaQLHyR7chgqcj8O/J6W40S/2O
	 7/AB7TmZl6rX1bNe/yni/dBYv7Irth7for5Asy6krAUVN/cUDcY+3rPg3LDfyq9bk+
	 fGGLyd/LcrZSw==
Date: Sun, 28 Dec 2025 18:05:52 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
Message-ID: <20251228-exynos9610-pinctrl-v2-2-c9bbeee4c54b@chimac.ro>
In-Reply-To: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
References: <20251228-exynos9610-pinctrl-v2-0-c9bbeee4c54b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 170dc282ea45b580208235a243129e9f8350d46e
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
index f3c433015b12..deb2730855bd 100644
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
@@ -107,6 +108,7 @@ allOf:
           contains:
             enum:
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos9610-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
     then:
       properties:

--=20
2.51.0



