Return-Path: <linux-gpio+bounces-16446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C7A41119
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 20:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0CE5173950
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 19:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7CF204C0E;
	Sun, 23 Feb 2025 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pvnp+GZi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDAD1DC1A7;
	Sun, 23 Feb 2025 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337140; cv=none; b=bePb7PK0PutK69caecr+isX2NMjkj2jzEevzssZcA5YaFNvZt2gs1M+rMj74VZ21O7TYu4ovG/K3SzakH6iO0uRvTsM4nHSv65gJRD9vga6+k1ZcBab/kelnVaT8f66rHwHYQqhimE8MYwRyxMQAWJ9CnUot0zgzixeuPvME+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337140; c=relaxed/simple;
	bh=7gteflxmVPmIbj4NGKsgGXs/abIMpX6wEsN9a9Luobg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i020a/E2agSXYZYG8apyviP9HOyZXB3kmZ6ydmQOqnY0fQ7eSnPT2Wga/4Cx/oRrfuVWqeXpyJ65eJgW9BNM7u7MaEJIRBYj2QODWxugVtEhbpA9d7VUsMFmBm7kTFUa7enjBj/6v/KHP3HPVu2rP4FCiH9LyWWnNdlfoERo5H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pvnp+GZi; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id A3CC4BBAC0;
	Sun, 23 Feb 2025 18:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740337137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FrRCBL3fnGY2sDlC6e7VGyzyNksljZ8CHpblowajqU=;
	b=pvnp+GZiGUqzG7JPjybrnqNNxCC7TaYcDoQgdNC1AsvlN+aukYMkLOf7cDSNKJQma8kNeK
	xsapNu5zhDAgxHXKzGeiMULyL7lkc1wPeqeFgiaj6mz4O5AdCuciyXGb/q2C6xkS3Wpmks
	9Jak7wToAb1t1Oiz8sxhzr3lHGu+Vc9YR/8ohkhHenaUlS+Ay75yfLdadfQXW+reixJPf9
	JBlPEFQwCLWvah5SZuGIx6wSK5+s3CfUqja7moAjN5gll5qcBG2zafUOd85eYVxQpDvs/W
	7FXNZBVJ1nWQtCk2biXHf3TiG+mjBQVLnOOAuiQrkyqrvfvrDsRDfv/VayuvPA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 23 Feb 2025 19:57:52 +0100
Subject: [PATCH v2 7/8] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250223-msm8937-v2-7-b99722363ed3@mainlining.org>
References: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
In-Reply-To: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740337120; l=1339;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=7gteflxmVPmIbj4NGKsgGXs/abIMpX6wEsN9a9Luobg=;
 b=AvGxBWqve5fG3z192NfeaVquYZgllS5poM7XGdg2FPqTieXrhlER8FU6ohPtOI9J+ogFXZa9i
 ZDOhI+8ALvHAc4P6UGrlfjQNrKTWelny8UrjQTHohk1JRNFDjp6Dda8
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document Xiaomi Redmi 3S (land).
Add qcom,msm8937 for msm-id, board-id allow-list.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1dc32b40a2201bc219a4f12e9f3e8..d082c1a2c8b3cdb36caf511840bf217f1175cde8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -38,6 +38,7 @@ description: |
         msm8660
         msm8916
         msm8917
+        msm8937
         msm8926
         msm8929
         msm8939
@@ -272,6 +273,11 @@ properties:
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
@@ -1222,6 +1228,7 @@ allOf:
               - qcom,apq8094
               - qcom,apq8096
               - qcom,msm8917
+              - qcom,msm8937
               - qcom,msm8939
               - qcom,msm8953
               - qcom,msm8956

-- 
2.48.1


