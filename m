Return-Path: <linux-gpio+bounces-16459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7EA412F7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 02:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3312E1721AC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 01:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E588A1A3176;
	Mon, 24 Feb 2025 01:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Gcp2Z0lg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414231A2390;
	Mon, 24 Feb 2025 01:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740362197; cv=none; b=tMa10daQRX5A+ylkwnqtqaHDAhtWuYxKdcpkd4wMpSOByCWApCwoSVRTuk64Y1cqZJfP9ZxDYTHE/AHbI3s/jfUBSh3pbQetKThh7VddnkTtt5drGcJDzGdmij2YTVy1lJCH4RsuexGE/HsNKWv1Ii74Tc0+rybbcfbtBBKb654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740362197; c=relaxed/simple;
	bh=LjF/wuS0Kp0a3fx8BedXAUUREYCxLDlQzoS7oLz29U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrvXzQrY+YtoBcavGM8N4qqhp6Wu4KOiYNdF3+l8u/oLByWkDQ2isFAeEVk4fyt8sn1evqVDCYMiPOKdpTbslQDTldFgpoX0jWtABDUn3I6Y/tRvF7VLGS4g3MO8begbSEY5dEcLSxglEXUfNMS+KUBmlO/RTYhw1eKqIN6f/mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Gcp2Z0lg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id 769E2BBAB3;
	Mon, 24 Feb 2025 01:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740362193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z246zezQsbXmW6ySsE8/P5ydLD0Q9o6QEpyka1CHFOY=;
	b=Gcp2Z0lgC92GtnKQ3u+EkmFbx3vqOsqlHTIZrTJ/j342+kw5FHfdezZf+KHFIFMp16RBgM
	kre0XSfKJVm414MNKR0zPn2+7ZTI/fdu3IUlo6uasLo3aFgdNgNJO5Lvx0JdQaDiLXzpnO
	0AinScW1U3JmYHAzsZE8vw30V1M/g9Q7qWO18I1PkypgOsQD1bNoF+O/zfdwOQuqTKwcSK
	gGPElg5cUpN4wPLhTn+vmZdxHJ7FRHPxKcgxixfrZ6jJPqbD1RYHODYFnEeoahmP5nun46
	9ZP+jYzPle3fNYtiIi/EahoSSuJP+2UHhm6HaZFlTRfmqHEmYIkeGoOQoaS9Vw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 24 Feb 2025 02:56:19 +0100
Subject: [PATCH v3 4/8] dt-bindings: iommu: qcom,iommu: Add MSM8937 IOMMU
 to SMMUv1 compatibles
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-msm8937-v3-4-dad7c182cccb@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740362181; l=1026;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=LjF/wuS0Kp0a3fx8BedXAUUREYCxLDlQzoS7oLz29U4=;
 b=h2Xcqip7z+v+H5IKRvjj9mn6BYjbqk67B8Syj+9UIu+A5WZmiMc19afI3UjX/Px3gQ4zmN9tl
 34ZvPRSNG7kAP9HPkiImgAOeHdn0d05EQxgFnfNlaVYfBb39pz+NvjD
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add MSM8937 compatible string with "qcom,msm-iommu-v1" as fallback
for the MSM8937 IOMMU which is compatible with Qualcomm's secure
fw "SMMU v1" implementation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index 5ae9a628261fd251c1e991a70662c6d37ef2c4e3..3e5623edd207abbfbd2ba80f51db7829f02eb7b5 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,msm8916-iommu
               - qcom,msm8917-iommu
+              - qcom,msm8937-iommu
               - qcom,msm8953-iommu
           - const: qcom,msm-iommu-v1
       - items:

-- 
2.48.1


