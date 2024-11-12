Return-Path: <linux-gpio+bounces-12880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FAB9C5C4E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 16:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E12931F22531
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 15:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7DE2036F8;
	Tue, 12 Nov 2024 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QsprIbAT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6E1202647;
	Tue, 12 Nov 2024 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731426588; cv=none; b=DiCVJQawFWmsdyqbIjpA3wwZtTTlw1A7Y9Hqmmu/ti+9pmyVMkzRxMa0MJUCgS275Ss/R6SWzHI5QkIoVX3uuHxx+nU1RQ9So9t9lkbw+3MI9GCllnEij2ZpVskxcU2hN8aHiz42DkBW0JSyO8r8mmeUnOLh7uCao+52B5Wg21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731426588; c=relaxed/simple;
	bh=HpsJRRqcEB7ubb20AIGzwyE59bS3PSN7BTK6n02gdPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OqXummaDfZvS49LgD0QHFwuM9Tn1+jjfvuV1lvc8HcareS52TVVjBCJqIlMA8TrDnKkB1UlyE2zgNkNpoyXP5PXICTqo0yVvyfpKVzu3eaKY7pR2hC2wcs3gWLhyooA3nfP9RZXsXM+xA/NNbVBCbC8jWj6B4f5UbSo7S6wVRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QsprIbAT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.93.162] (254C22F6.nat.pool.telekom.hu [37.76.34.246])
	by mail.mainlining.org (Postfix) with ESMTPSA id 89B86E45D1;
	Tue, 12 Nov 2024 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1731426584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJVsYRZf77zXzY1oz4aX5qV6KoAi5dZCp6QEtJjBO5E=;
	b=QsprIbATiOINK8e0KFx0W6G6LBo+DCR+4FYoe99tHNQu1DFhTA9AzT8kjnn26KV/P8a+du
	6xlSV3mNhVvHMPTQ4B6Sp5jwwfQ9rM/ajunE2zK6Nefgw59Ot9/skf+Ww1nmbOSg+r8kLG
	/32YYg87GMBll0Bb+3/HzZ3v5Azu/SUAmOSeBzZlmmk4zMAT6/lKeEfgva3JKxt/kDfcd6
	aJoCKWwz5v8yZFFD4Nfnw2Lm/66zjvkIJvuv5bnFaQzkQo90q40RGJ+bYOVUcbwE9mqENq
	n4dAzsucfRBMWDzxbRn7SFTRIpHhTXmxmztWjmu5sv6vmg4XUvix+ok0W5BXWA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 12 Nov 2024 16:49:34 +0100
Subject: [PATCH v5 04/10] dt-bindings: thermal: tsens: Add MSM8937
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241112-msm8917-v5-4-3ca34d33191b@mainlining.org>
References: <20241112-msm8917-v5-0-3ca34d33191b@mainlining.org>
In-Reply-To: <20241112-msm8917-v5-0-3ca34d33191b@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731426576; l=935;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=HpsJRRqcEB7ubb20AIGzwyE59bS3PSN7BTK6n02gdPE=;
 b=hCmJQ/PjL3fYNUJJwOkctpo3PjNNP0NUMuxB4G8XdrEw3bcCtm8516+TLgLQ1scISU9Gp+bzr
 jTRdbQhWo2CC3/cH4Nzho76V8ihIN58Dfh+ncZWLJZckN1jdL684Vxs
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document the compatible string for tsens v1.4 block found in MSM8937.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index a12fddc8195500a0e7bdd51952a558890b35935c..f51656b672030b12ea0405fd392af11056093be7 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -39,6 +39,7 @@ properties:
       - description: v1 of TSENS
         items:
           - enum:
+              - qcom,msm8937-tsens
               - qcom,msm8956-tsens
               - qcom,msm8976-tsens
               - qcom,qcs404-tsens

-- 
2.47.0


