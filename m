Return-Path: <linux-gpio+bounces-25228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A77B3CFF7
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 00:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8A420673E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 22:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1922627EC;
	Sat, 30 Aug 2025 22:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oGyubIDu";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="t5GVM7Ew"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9090733F9;
	Sat, 30 Aug 2025 22:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756593826; cv=none; b=ZCWlJDTQU75ZJQcg8r5g1fidk/PXgKAAMTwcudAKlm6DQaf7mF4FrTkb7Rk5vTPDQS5mgTnDiYhdBrwgN5pc1DguHdWJQ95PyxpW+cDlkp6Wm1B4lU9XEIfm+Bm1FfRjrvXLMDcvNUOPsTyEFrwTY4DjHkYxHXHmXb5P4eaWPCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756593826; c=relaxed/simple;
	bh=MnWusNcFCa2Zg4e3EfsWg+xVTvEHMbXZjtCTnraquOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTEp6ll/KjfYGxiE0stQynfA/rN68n9+4wrzGdXIyXdTQ2p+jymwtal5tBE5/gP9iJwFpd8tQ8uyQhtkS5dwN40DwCTgnjN4SOmSgdD4InjyjLw6fvLYCGIy7YVqpMV0TawfTjlVyNZ9K4zxrY6BujZyT9NNK8nqAfXGV0yum6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oGyubIDu; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=t5GVM7Ew; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756593510; bh=c4MGC8FIVSrF83JvXLuGkEw
	gC/SqBYt8eFhZPlAakzM=; b=oGyubIDuIxZDQfdx8p/JGECzhv7FYH+5EceEVR/TjQpv7Noby/
	qb9gomsQVJpBAE2WxUBCFmiutZPiq/7SNtLCy4dIOesP3sb4fStf13v4uEG4ErUBCKToYK6c8rz
	s0Vfydfv2yOgcBv28CYdGcryXBv1tXiscsS7fFCMEAAXdcaRm5K4Syy/5ZN2eHyYEVWtlhpu+Uh
	Xt4+8DCb79mrG0pIsy52fWU57u4O1HJSsVX/JtXo/vZmqa0FlJwPLE3uzDK2R7VX/j0ejGake3q
	Z67rcNBH3edN/qjEG7TpcG7ltNnmia9O0WqPV+QfkeAFQmP/C1EGOBhMJZcva64Bzkg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756593510; bh=c4MGC8FIVSrF83JvXLuGkEw
	gC/SqBYt8eFhZPlAakzM=; b=t5GVM7Ew8aWwR6aIUTGKN23w6nky59kGB25AWU5QgRVXmKeWwJ
	KIez5BzIlV5ypCBRMv3jIePwZl/GmstNljCw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 31 Aug 2025 00:38:17 +0200
Subject: [PATCH v7 5/6] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250831-msm8937-v7-5-232a9fb19ab7@mainlining.org>
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
In-Reply-To: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756593498; l=1178;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=MnWusNcFCa2Zg4e3EfsWg+xVTvEHMbXZjtCTnraquOw=;
 b=c/UauX69QuEokVwm+qA6a1d6tY0ILmj+/oE6RJSbCgRuF5sDcEc4QANicOuwKnSSN0mmvjgaU
 wQGfWra3sAxBi8Fa/9zs3NBoioZP9LH7PvWoRXSHPvGdeAILub7bfpy
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document Xiaomi Redmi 3S (land).
Add qcom,msm8937 for msm-id, board-id allow-list.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 55e5eb75af8905c93e6604d54d516585f70a8e29..16e003ef0e1892cf8b1d2e5c581358e344b46349 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,11 @@ properties:
               - xiaomi,riva
           - const: qcom,msm8917
 
+      - items:
+          - enum:
+              - xiaomi,land
+          - const: qcom,msm8937
+
       - items:
           - enum:
               - motorola,potter
@@ -1153,6 +1158,7 @@ allOf:
               - qcom,apq8094
               - qcom,apq8096
               - qcom,msm8917
+              - qcom,msm8937
               - qcom,msm8939
               - qcom,msm8953
               - qcom,msm8956

-- 
2.51.0


