Return-Path: <linux-gpio+bounces-16846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7961A4A2B0
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 20:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABDB13B2E68
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 19:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E9B1F875D;
	Fri, 28 Feb 2025 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="R2j3qscT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D95917A5BE;
	Fri, 28 Feb 2025 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771353; cv=none; b=cLV7PAkZn+2vlNxWdhHXbG0UoeKFjI1uJfAcLbqE7q4P096HzzpfgX33L3FuqSHX/8xAyJBRZlw7TiMSPKiSanNODFoX0V1ehijVzWxYO0ds7rfUxy/oS6Le+cqaDW/GZsB7ctd4610ZCr/freOOFgEmCR31xQla6Axq2wVkhvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771353; c=relaxed/simple;
	bh=3KuArGVEvNRiF+Sx4ok5DbT4miGuSlGV6XyWmQsYKeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZmT2Ox8hx+ZXxyGHxYLSCh6ZQb+OxpziWkeSD+bOD+I16NYHwms+q2Mk0hL0obqqPLRb/cxONFiwjYitk+sTwFValYyBQXGdag6dvHKLZu3J/NQio5rKxeibkbyu0WDdXmb/TxjwnBtEgINfp1MI5aXO2qXLD9EiWQdO+W4bSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=R2j3qscT; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C98A623CBE;
	Fri, 28 Feb 2025 20:35:49 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAI5XJyzXteh; Fri, 28 Feb 2025 20:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771349; bh=3KuArGVEvNRiF+Sx4ok5DbT4miGuSlGV6XyWmQsYKeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R2j3qscTbNqtSJnrV1lwH8SSe/BOYhBxDSoX63lygNzOetFdWbcRbYVTtvLJDlnVi
	 859WKy2u9CJOgQiST14jg/R/pjGnYjkAntWMbm7gVtDCIz1hE11r+9bAWVs5hpPow5
	 RQq1UE3PAV/go6h+Do0HKBxLAklDLF3IX5Fq4zJjaYoIl1slQ6Xg6MlS8Rsl97lVs+
	 qtDVE6uljRnHQo34kWFeeqVDWmAkdpf5bM1TTDfC/hBDR1UCEoM1lFNq1PLiJRfUkZ
	 4U2aYqAOKTuu6WNpe4NtCHjzBcLoyhNNkG8vxjjifBKHXEZyV8pZUIJoSbsM/StAj8
	 F7Qoa9ssLo84A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:05:18 +0530
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: samsung: add
 exynos7870-wakeup-eint compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-pinctrl-v3-2-ba1da9d3cd2f@disroot.org>
References: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
In-Reply-To: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771331; l=1398;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=3KuArGVEvNRiF+Sx4ok5DbT4miGuSlGV6XyWmQsYKeI=;
 b=E75whbAQuAAqa+a1e5qsB15H8Ie3vBI9VrEVwpXU40NAwmVSSPny0ws5uwOVa8Nq6u+bQD+hF
 1eC/Uxj3pzSBMz64kZmB0ouoz8T1ZbUIO7Vce2Q2qn0RdcvSamQZzjx
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's wakeup pin controller is entirely register-compatible with
Exynos7, thus document the node for Exynos7870 appropriately.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 64db551d89da6290b7ae9d089f941c905e0e5b16..0da6d69f599171b6946992c036f23c5dea17bd0d 100644
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
@@ -105,6 +106,7 @@ allOf:
             - contains:
                 enum:
                   - samsung,exynos5433-wakeup-eint
+                  - samsung,exynos7870-wakeup-eint
                   - samsung,exynos7885-wakeup-eint
                   - samsung,exynos8895-wakeup-eint
     then:

-- 
2.48.1


