Return-Path: <linux-gpio+bounces-16461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64539A412FF
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 02:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E74D0188B0A4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 01:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93541C6FF3;
	Mon, 24 Feb 2025 01:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="m+MVlUUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83781BEF81;
	Mon, 24 Feb 2025 01:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740362203; cv=none; b=UlwYfiF4tRqMLxq/gGonwYunJd6b4PExk0GRssjxEY79Z/Y0tWXItxeE20P2zfdBQ8t9VGBcRyZ1l7yyALqqdqoXZW9LdCA16hgQPMp4o9ia1Vym6CTOd5clEQttfZoP9HTvBbJ08CSErEjVDRL0oy6tgNQk30dZmZjYCAaRdHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740362203; c=relaxed/simple;
	bh=7gteflxmVPmIbj4NGKsgGXs/abIMpX6wEsN9a9Luobg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bav24xekYzoPsvw6rYnTTqGWOYzJ9TcgHPI31H79E7ObselZFAmizClTOZYPvLkuz8Qd8znWSKQ9dGfFmlibznWIdbzaraYy4cS889bcYMMvjf0p9//35q3gxuIU1qgA9Ai6kqEcpS044M1BOuHrABcD4RU4dHOV+pus5cZ7+Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=m+MVlUUR; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id 0564DBBAAE;
	Mon, 24 Feb 2025 01:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740362199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0FrRCBL3fnGY2sDlC6e7VGyzyNksljZ8CHpblowajqU=;
	b=m+MVlUURDLGrXvXqX2z3aNGbSiAOqHWMvOtsOZcdcsWRWdX2Cb4zoAcJJMLj5aq0KJmhcX
	kPAWmdNmqnyShjtSJGaZiHB45nFY7rf0qkKxuIAJVoOEbD57QaSQNEIC60z3ub+nzeSmal
	snE/z+pGNkhs+o6aa1Ts3XV7HLhGsdq5kbwdAVJR/51g+DWzskisBQwi5X0XEfRUfNCZrF
	P1hNqrQzfKYTXVmFzRt4h0VPDjXJcPN4RsFdeEKSum0lglhDidZ4oNemtVMm1bvBj93GtV
	oaEMkYK/n5v46gVpAMUYDYltXzkmhe0k7r/eGemziJpLfxYf6WdCk3wjaQ13IA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 24 Feb 2025 02:56:22 +0100
Subject: [PATCH v3 7/8] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-msm8937-v3-7-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740362181; l=1339;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=7gteflxmVPmIbj4NGKsgGXs/abIMpX6wEsN9a9Luobg=;
 b=X8LOOrJVwoZsEY4cZR8Rv65XrrLxYvKmga7XZ5my6ggLhi8WXjFZg4RKIopD7Bw/tO1s3YLLd
 Lg5fTDRIWliAAblPnC9g+5KoMr4aXypIqOoFU4h7s9kEE17WWrZ/O4p
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


