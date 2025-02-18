Return-Path: <linux-gpio+bounces-16206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B9A3A623
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 19:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A396918973C4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 18:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E7027128F;
	Tue, 18 Feb 2025 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NNezTCii"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895411F583D;
	Tue, 18 Feb 2025 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904571; cv=none; b=baJFp4Qe2a/cfivuLtZpJErd2nkuVFFA5OQCLnQIc7DO0u2LhJajUtoMYyQNl//4UDdDhbYydsBMTs8AmqZygvggv5w0crTak4ploq8e0xJWP3IuukL1gyJ0zAg2k9q7ysfHBoPTXrPI0/FJVc2scZg+MFs23wuMLywojR2egM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904571; c=relaxed/simple;
	bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNGbiZGAB3ziiokr35eP8aQ5Hyrtz30AYECYD4Xvt2Uvp56c9iyPBNjXi3GLy8PNXaKAayxNKY7Z0yGUvwR89VmX3wAEkC7Dm/+pZUpLALLmbcH04cN1ssJoKabSejBuO1h5EZRAmpYaMa2h/tFrFb5BRxydqsj6zltp4Qk1y0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NNezTCii; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 113E225F6A;
	Tue, 18 Feb 2025 19:49:28 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdB9-krv0OKQ; Tue, 18 Feb 2025 19:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904567; bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NNezTCii/tCr4fzDbucVG6Fizowk/9xj7ZsOygjp77N9wxe758V5015wvJM9GQkaI
	 Kvi6sC/BP4VhR6RUUeqjh7P450VN8eyF0b20XHZBsIG0V73/7ek0B/KBJwrW3+xyur
	 FB/0m6odC5KNFkDvyoz+lEkMlqb/u4fjdLNYmlcOUJvaMy3N8V7rFnyuZlpKwOp2au
	 fOG2f6vMxhC47s0+HO5B4t3mZfLGW8osD2LqarcwbFsI1WAscBAyMETJZLQlOx2rYF
	 SJzef+35a6U2fWWyS1e6S+ktvH9cejhKZ9Avf9H6h8X0pcYkASG8NvX5DyWN9WUmfQ
	 fa9Z7XymyHiqQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:18:58 +0530
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: samsung: add
 exynos7870-wakeup-eint compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pinctrl-v2-2-1ff9b10bf913@disroot.org>
References: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
In-Reply-To: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904552; l=1398;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=pTia+u3Qvys/ex4MXczIOi+zNSqm6TYCEnBUzRrxlgI=;
 b=PiYEnBJKqw3NKqJJThgBYRA4dMnnXZcSOLjR1fuN4tkAiDfhlBZtk/WDEq5YkzpWmYQmOzsj1
 SAB7f3gU7LFCyev6QgGy6K5pMxj8bhnstAvL1o/y2OuuDTDuUJNa6cS
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


