Return-Path: <linux-gpio+bounces-25541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24757B42BDE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 23:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D599F565A79
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 21:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3012EB5C8;
	Wed,  3 Sep 2025 21:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FtvtKDQw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YjYrLE5Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296F032F755;
	Wed,  3 Sep 2025 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756934836; cv=none; b=dS7uPTGlN6kUxWFY4CfqJFeeiSOe/obIoTI5ejULWw/p4Z66v8tWdsF9PvsEv/Bn6/hKhTue6cOo6KTzwf2SGlL5JlnXTDDosA5AE1ErFl377V0MOdDkaJDV4xg5BPecOBY83VjlRuUkhLs3HePLF4jl6HIlzREWd6HNetCGi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756934836; c=relaxed/simple;
	bh=wmw2TX8XeI2jwe+eIPMA5Br3dVaIT7iuD5zo+71Kf2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R46Gx3glCNefozk7ZsYEbVqFgXzKQN8E0YBw/r0sGuaeLW4bSCKS9kK/gOoxvsdG05DnFqrffvGRds6tvZ7kcWUbeLS7aAaLsBC7L8F59/qebSQkQupy5Oj6uc7H+WqtUrJIBSvyLi0vYvFmOcIgRJaG0BupnxnA1UuMAiUNjeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FtvtKDQw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YjYrLE5Z; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756933750; bh=wcjl887H9qoorQWShXf6Wly
	U3a8kHxCqn+dkIRbrhsg=; b=FtvtKDQwMztThO/YTunD7nGmLxaV0Y9WJ7qmK2JiRpJN25JbEB
	Gk1T9yYspxn72qrdP2JqvCznk8DSTSRjorTV45H65Ht9PEDNtgSdyIn92x8ju4ZeUb+v4CCRSqZ
	VU+UbjnT7/NNARK8PBSoIo6EGXNn5RBOTGxi6xEFWPfdOnbvf86RWTkdtLX3cVpueCvrzKM2Y93
	u2PwLLpwl8pB78BUbAkFR0cNyzIvHx9B0v/Mi2HxIwAD1JfDLi+/gkt0WXHuMPGM31B7r7CvHNG
	oCLW7Op5X+v7rg8V3tXjCcvgcEEKKeqMHfdN5mZENfm0665Bb9bhgfL96C/TaOPc6Pw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756933750; bh=wcjl887H9qoorQWShXf6Wly
	U3a8kHxCqn+dkIRbrhsg=; b=YjYrLE5ZK/ZhRhhImymIjEMjL9eMA0jp0i4N5dOrZS6gTBLIyp
	ltgM9ndFdyFeJ4FPKmV511O7zD0vLBkib0Bw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 03 Sep 2025 23:08:24 +0200
Subject: [PATCH v9 4/7] dt-bindings: display/msm/gpu: describe A505 clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-msm8937-v9-4-a097c91c5801@mainlining.org>
References: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
In-Reply-To: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756933738; l=919;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=wmw2TX8XeI2jwe+eIPMA5Br3dVaIT7iuD5zo+71Kf2U=;
 b=Uz9WC47B3vCM325KDBO9wAQFD099MPOErAaXKGECLXC5/1U6aHUfR7bsIIJ6OyPcZJ0yQg0w9
 3KtpREUObdUDJM1PmBNHYJn0BLPxd9rYXtt1PozDewj/ustXv7LwK+i
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Descirbe A505 clocks it is using same clocks like A506.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 7ef80f9fac8b2927b2a69100a7f6c729d9d188ab..3696b083e353031a496a1f299d8f373270ca562d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -252,7 +252,7 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-506\.[0-9]+$'
+            pattern: '^qcom,adreno-50[56]\.[0-9]+$'
     then:
       properties:
         clocks:

-- 
2.51.0


