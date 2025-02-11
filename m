Return-Path: <linux-gpio+bounces-15778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A492AA318D5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 23:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55402164F05
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 22:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6936226B944;
	Tue, 11 Feb 2025 22:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fEVkfDKu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01F26A0D8;
	Tue, 11 Feb 2025 22:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313501; cv=none; b=RZE1YqcHoXbmutNvv8VU7Yos8ETAPbFaCGGOQORsOUGU7C/KlAvDHYh2CbqCQhFyOA4yeleqjo5044qUuxdE6CkEABRK0OMPJG9spOhsRCM+R/4Tk/RRknfahMx2PpEZrv/qrAgPRcdzQYtygSmcl7uRp1ix7ANk5SJFal/fpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313501; c=relaxed/simple;
	bh=ZTp2rK1lKVJ28+wzsiDNzhIM5Pj+1PvObSdGWhC/y8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7aVipmw5599LSaSiChZBYmgNDkF52i064On0QEEjiY7qUGSQ0fewajHzjijcT/iSY635g/Q5VCRYe0bLPlfxbDrd1AWsSF4SIiQcqtU92qvltIyPwVqI6uok6LB6UiddmOASjC7k5DYRIeQfI8Sx6/y+K7ZG9pAi3vTgnsc7xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fEVkfDKu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C21CD.nat.pool.telekom.hu [37.76.33.205])
	by mail.mainlining.org (Postfix) with ESMTPSA id 3AD63E45D4;
	Tue, 11 Feb 2025 22:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739313497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9+Mj4wFdl4mXrpp58sXv9ggge6TTxvn7lFHGTazfkY=;
	b=fEVkfDKuIFRahInQUJ5X+NxPNGdd/Hph+aK26LQ0n7Fv2zpS6VfqhXNVUc0B0rHbknGhWk
	H4P6fGOODPrlu5xcrBO3vL1vMzUKrZgRKUzULwgGN6JJizRP2ZcBA7oTF83rWthkrM3Ze8
	x2AcbM9TOZfFPWwsDHGOHGt9G2XcfReSMwRf79tpauiBqcK4cwMAok/nkA6stKiu2BMY1n
	FfsASaDilr+zC4h/pE0Jzn6rB1+LcZjWtm/iA+zbqc5JWEmAkGIzVE7WqFxUoDpo5oeafl
	me1QTQg0Cg54oAUiaI//AdtILkbxwQZRFh8HD0m7SzOqEh6uv4yS7kia45PqXA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 11 Feb 2025 23:37:51 +0100
Subject: [PATCH 07/10] dt-bindings: iommu: qcom,iommu: Add MSM8937 IOMMU to
 SMMUv1 compatibles
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250211-msm8937-v1-7-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739313484; l=959;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZTp2rK1lKVJ28+wzsiDNzhIM5Pj+1PvObSdGWhC/y8U=;
 b=Aga/7KRR8PTt/sz6nN4bzsD6JKKQG9OtVEdDQtF+we+GpJVEWAzXnjAWKFfQQMMGjXDUNlnrD
 WK5L5HShp6zCV7iDViuZomHAW/dA+SFGwQ1+gCIyW9Zg80ChzNSFD4S
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add MSM8937 compatible string with "qcom,msm-iommu-v1" as fallback
for the MSM8937 IOMMU which is compatible with Qualcomm's secure
fw "SMMU v1" implementation.

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


