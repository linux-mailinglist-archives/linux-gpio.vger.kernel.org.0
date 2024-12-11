Return-Path: <linux-gpio+bounces-13778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E269F9ED43B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 18:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE255165C6F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 17:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A533204098;
	Wed, 11 Dec 2024 17:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dP5Ht39t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47963201270;
	Wed, 11 Dec 2024 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939965; cv=none; b=tKT6KgeddwEFHIBN8bntY1sgC/RSvIuMgkESDVZEu5ajwms73NW52cK0LCM4ZEhISX+be5r8WFxx8OhLWJDShXlWOxkSH0o8lV0ugAA0+shhnkcFhuThvqhWZ2xmwQmjNxKuvXaLE5vAiNh4m7f5/3b7Dby6L6SsH2bJjHglH5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939965; c=relaxed/simple;
	bh=+8lEVMWw4obCV6Aj343SDrKXfcdizMCArJdr+FobTrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EHlnhmhaSat9lt5bJiPfF+1/elwxSmVmjsvPoYjw3CpclrLyJU1Z/69hPUo4erNq61XQtKFlQGFnYLwvWU+VpHW+j4GaRnprl+B+Gg7wzU/q4S952x53qRUTJk6QJydacIw0O0wZ1XhwwqA+xy3q33Sorl7+HmTpvWK1ch19koE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dP5Ht39t; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.118.162] (254C2319.nat.pool.telekom.hu [37.76.35.25])
	by mail.mainlining.org (Postfix) with ESMTPSA id 3424EE482D;
	Wed, 11 Dec 2024 17:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1733939961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEZixsrVYC5N42npda3u434fskPdLWwrhKEK+WqDQl4=;
	b=dP5Ht39t1nYOp01R+7BrMPXpUht4+c87wYgDzeVzHiGciURezKhLgpyXmd7ks2bgftXeoM
	cm6af0DsHCsHKPLUZL4/bLUeXfJUM1JAi29rc+v/TWFoc9fNmwjLcg0PLRVwCY1u+oGj7u
	oJLelvR5cl4DJQAMNG9NVPRcBN061oypurSQchsIPq5X6GxO4+ei3nuguF2Qbl+UOKUYrr
	Ox4wYYTe3DWhaxS/olwfNplEc9hQXyyvWAXsdaj1v6o9vSq/Meif2gNGvFthfbzErn2Dd3
	oSzfrJRdzm3oFw3TkUHbO5GoTGPtjPqPcbmZ2XXT6kTpHVnN4dcL8D9Cq3OTSQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 11 Dec 2024 18:59:11 +0100
Subject: [PATCH v8 7/8] dt-bindings: arm: qcom: Add Xiaomi Redmi 5A
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241211-msm8917-v8-7-197acc042036@mainlining.org>
References: <20241211-msm8917-v8-0-197acc042036@mainlining.org>
In-Reply-To: <20241211-msm8917-v8-0-197acc042036@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733939948; l=1345;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+8lEVMWw4obCV6Aj343SDrKXfcdizMCArJdr+FobTrc=;
 b=Vu+OfeyeWeHgJE7v6zILSfyLe1rprNDW63/VHkRuyV2F9fnwYXVqnTyg58LzdnCIHmpvc7/p9
 7H+Q/Q2bXEHDKIeWvNAxbnPQCSWuY/SMPrzCAoSF7vqzaWoZsVz9qWH
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document Xiaomi Remi 5A (riva).
Add qcom,msm8917 for msm-id, board-id allow-list.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d394dffe3fba5a396b85a6093f34e9ef62b6f9cc..fa5e70cee0c6b7cc20f49005ebced0b9389ab910 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -37,6 +37,7 @@ description: |
         msm8226
         msm8660
         msm8916
+        msm8917
         msm8926
         msm8929
         msm8939
@@ -264,6 +265,11 @@ properties:
               - yiming,uz801-v3
           - const: qcom,msm8916
 
+      - items:
+          - enum:
+              - xiaomi,riva
+          - const: qcom,msm8917
+
       - items:
           - enum:
               - motorola,potter
@@ -1199,6 +1205,7 @@ allOf:
               - qcom,apq8026
               - qcom,apq8094
               - qcom,apq8096
+              - qcom,msm8917
               - qcom,msm8939
               - qcom,msm8953
               - qcom,msm8956

-- 
2.47.1


