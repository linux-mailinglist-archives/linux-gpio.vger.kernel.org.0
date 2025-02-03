Return-Path: <linux-gpio+bounces-15295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7377DA264A6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 21:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12E583A5194
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 20:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB5220FA9D;
	Mon,  3 Feb 2025 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MJUesXJw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA220E71C;
	Mon,  3 Feb 2025 20:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614970; cv=none; b=EjdQmBAbljkVnpfq97VH24mmO0fqLAfau0IIuOoD7iiG+ZGtsmT/suJflIUj3/uyO13fGLltcGNvgcyXa5ESySAizThYgzFtIit+dw9+IATiVjteHyTKL5mnKs2z+9O077TbM0ToQV7pxeabv7F1b+qN5D8jSBbE1tfEqKxfuzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614970; c=relaxed/simple;
	bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZjmcev0VMW+BlazkOS4ke0LNc4mZE8IlkaNK3btGL7uKgYHSA6UP3ro+2jqnJDvRrX2dFfsrOyL+pGBR6C9Jd9Yl/Uc7kQ7WjLHPj6WRSXtuABXPTPe9DgCVJyHKcExYKbancCFcp5zj7diXrRlXeZtU0IzA5HlnSnsZKMkkcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MJUesXJw; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 54E9C25684;
	Mon,  3 Feb 2025 21:36:07 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zVheoC5DaF4; Mon,  3 Feb 2025 21:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614966; bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MJUesXJw7tSBGYyu5TNIYiieu5RrMS9Yi1nJ7NtBN0Gdr3GLZc8cWGmnr0V/CTOKa
	 TmaCTKsvwM/XD220GxhcvSyWH11lyQRh1L2QIbgQBkrZp9wr+YQ8JQYDQ0XzYhi20S
	 +Adcy784fi8tIX+fRpq7zgV1Y61EVnLUmwXuR4qc0RVlVPNMxtbaEi83QYNHYuXJL3
	 biP+dUE736rv64xUlgWOjTxdDpsbR133JQqXxJac0wgtfXvOpfqvVoXHCzHkQirZys
	 j/XnoOvTvfBsGy8rALer60sIYcY0Lj/GvH4CUMc8rmWd9WJk7gy1Tf3bxQeoRpZq3I
	 +Q/jhDwAwi1lQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:05:44 +0530
Subject: [PATCH 2/3] dt-bindings: pinctrl: samsung: add
 exynos7870-wakeup-eint compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pinctrl-v1-2-77b9800749b7@disroot.org>
References: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
In-Reply-To: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614951; l=1398;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
 b=olnP1Y4oI3gf3mGWv3FtPR8yFDUsBNbKiAuekEr3pdxZGdsD/cokxlst0Lnw/9/U3Jv+8nIuj
 QPdt+WU/MMyAkElHwWZCZGcVE719juYukYdQa082WF6X8G9J5+dXEwH
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's wakeup pin controller is entirely register-compatible with
Exynos7, thus document the node for Exynos7870 appropriately.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 68ed714eb0a178c46228bac142d69bbd6baa6277..bdea42a19a1d32e5e08086032c58e7a1fd9999fb 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos5433-wakeup-eint
+              - samsung,exynos7870-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
               - samsung,exynos8895-wakeup-eint
@@ -104,6 +105,7 @@ allOf:
             - contains:
                 enum:
                   - samsung,exynos5433-wakeup-eint
+                  - samsung,exynos7870-wakeup-eint
                   - samsung,exynos7885-wakeup-eint
                   - samsung,exynos8895-wakeup-eint
     then:

-- 
2.48.1


