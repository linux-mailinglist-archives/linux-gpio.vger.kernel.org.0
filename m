Return-Path: <linux-gpio+bounces-25538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90292B42BAD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 23:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04F6E580432
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 21:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028C82EA48D;
	Wed,  3 Sep 2025 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eU8q2ccc";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XSQw6hiD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076CE1F948;
	Wed,  3 Sep 2025 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756934215; cv=none; b=GIJhkf24uBFBKc13xTpnzDBjOMemcjLUwX9kHvWjpgtrzCR/362EPeGyjlP9MOu1t1FuPWo02MOyJeooLl2x0z0LyX3HtSDfqPwAKcMxuTCc7RlHFdyf7E1Uak9ZsUCARIw9TdKUSPlFs54EaXgpvpU24pa7OPpM5eb3kfnt3vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756934215; c=relaxed/simple;
	bh=+mItAOG59rGinQ2XR+ePk1MVgl6A5X9XQuMV2FUqTKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9xmEKQnhocWnmuq9ZB1PgqXFHdysVQh/Epm2vkkhLu8UGhEbSqbDhT1RxqDg4/xW+43qkMMk1isJi2q+xABiT8pdBCZWhFM1UYT6ISbQTSxtIF9VwqPM/baoASZ2Gt/dJGjb7Z/Y+qbtrzNGyvCJgwUF8Sqm0ivSG8MOyeyH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eU8q2ccc; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XSQw6hiD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756933755; bh=HMw3WLg5mJfKA8fSJ/KLmYY
	CdOgCdItnwlmaM+O5sEU=; b=eU8q2cccqDDy375Xs+ufteXHPpWI5cp/Lv7Ts24m/MfAsSR9mw
	eZ5bzkaLXCVNKnyb4/LB3570M4DDeQOZ0iBcpoBk7aDd7YKTa8ab/GC+8F4NqYAV6O8D3Gw9Eqp
	Foyvo8o7F7YMTa2kiR96MiqDGqCouA5UdWhVwm/rOx8SWOSc18oY/f9jXq+H4lAnpKZLb1yTAd4
	+JPmneNYhtUvp99m1LyHgSxvUY7s2cCgMTGRxa6l8gS1+TfXbaz5pFG4PfCaEeK0M/ZYycBlqj0
	p/WlCqmZXQlwzrlytkugZXexwoen2tgVlviBACi8c8+UyF8D1z2YuyJ6lQKxgX6T/OA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756933755; bh=HMw3WLg5mJfKA8fSJ/KLmYY
	CdOgCdItnwlmaM+O5sEU=; b=XSQw6hiDY6km4EYvCdBnNXLwZkWVo2TVbNZXKTP1GUzQYWSJpw
	GZd6QmUBAzkA5aNnvzonFSBudkn0w80VJ0Cg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 03 Sep 2025 23:08:26 +0200
Subject: [PATCH v9 6/7] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-msm8937-v9-6-a097c91c5801@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756933738; l=1177;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+mItAOG59rGinQ2XR+ePk1MVgl6A5X9XQuMV2FUqTKo=;
 b=Nz8pmQkTF067c3k4ibsNzTIlt5Qm/oTWDdAFwKukccz0r9JTNTbAN1dwRIwKD4pOyr+hvRALI
 hC1wGN2BoxkAFGTwInzPZ6b4nP8YfgWH6Ae1Lol+RHF+AAcv910G5Hf
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
index 0110be27c4f6602b25aa4feb742bfe62e4a40d51..842b5366a653240d9ae70b2d53f97f88d67758e6 100644
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
               - flipkart,rimob
@@ -1157,6 +1162,7 @@ allOf:
               - qcom,apq8094
               - qcom,apq8096
               - qcom,msm8917
+              - qcom,msm8937
               - qcom,msm8939
               - qcom,msm8953
               - qcom,msm8956

-- 
2.51.0


