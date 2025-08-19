Return-Path: <linux-gpio+bounces-24582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC8B2D035
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 01:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3E1A16A74E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 23:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC342765FB;
	Tue, 19 Aug 2025 23:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bKPg4Sl5";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dTFwEyCp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0B626F2A9;
	Tue, 19 Aug 2025 23:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646762; cv=none; b=UVyO+ehmrZ0V5IYW3RoZdGgx4UqymcUcHierjsdqaDibWXUvz0/RXIEd7XTd42/PxDyu42QGCk+EhYqegXEwfQpG9zVbuLsh0DwORqaGwlp7Qz9jVrGJwHupByZ4vIeL0L3zf/l5FkOP9kfe9QTvEix0u3ob3RUMmLljFfPR6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646762; c=relaxed/simple;
	bh=UWjU70OuNYk0XHgY7bbFKA+HqNtcawWV3zzkrEaSfE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wti88x23WKHrHl4gpK0R9m1QGkL4i9plqXkKMPisYCc9/IZAVOMKH8j7+rmxjY/66iJWLGkisejhbudeggE62wJ0e65VXzc6J1oel61BD62vPkNdtzYIM64EB/YNC4I0XP39Kr63E0tjESmYYvvD2UG4JzKbp4GIR7M/9KoeIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bKPg4Sl5; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dTFwEyCp; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1755646720; bh=lC9iw6ZEyOuHqzmZ12Qu6oQ
	4qLdG6yQI/X70XorjDdc=; b=bKPg4Sl5uPZ0RtJldBcixU1ToAKZ/uFTYtkbQQVJqciAsyQRoc
	0vyJjNW8MdrkZylcuO+Gpj9yaptqFYZ00ALlIuKNhRseQw7Xdtd5uoYDkAzPf5kfZj5qwr7UDNg
	vjtJp7tBPpxy4h89mTcKe1/j7IWwCKdu7CHQ2D9Anvr6mKiAriwKKnDTx89SjTQA80I21iCPla3
	qfsJCTDlxP7s4fZ5M/OfD12WeyG50gnuCIcSGq7POzh6R386K6UINpeN0xUK9Qx6Qd5QF7sW9XT
	sBFElzlXV0uE8dbvtWsekBRTF9PyoDko7W74SUxruKLRY/HvL5R2vhS6NuF/clupVJQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1755646720; bh=lC9iw6ZEyOuHqzmZ12Qu6oQ
	4qLdG6yQI/X70XorjDdc=; b=dTFwEyCpToo6qdUxS33pFi/YXdNU9jbHQw0WVoo4VhYlxJDN+Y
	Gzp0UsfCFmLB1gtQa+8ZnT5gtIlfkqI4vxAw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 20 Aug 2025 01:37:47 +0200
Subject: [PATCH v6 3/6] dt-bindings: display/msm/gpu: describe A505 clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250820-msm8937-v6-3-b090b2acb67e@mainlining.org>
References: <20250820-msm8937-v6-0-b090b2acb67e@mainlining.org>
In-Reply-To: <20250820-msm8937-v6-0-b090b2acb67e@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755646705; l=935;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=UWjU70OuNYk0XHgY7bbFKA+HqNtcawWV3zzkrEaSfE4=;
 b=3Yk/AwrHoRiWS1QVF7Hcunvsfu/YLNuX96V5b0LbzES0M4spcYPSG7nkfr1m+WeaW5zsqOr0x
 7BBuUpzVzwSDTdd7Wffci4P6KzdY8yuOk6bU8vI/k2xQGV4UC9WXBUH
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Descirbe A505 clocks it is using same clocks like A506.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 7ef80f9fac8b2927b2a69100a7f6c729d9d188ab..478ae6e7e55a405d9443dda97486b6abfa05e22b 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -252,7 +252,9 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-506\.[0-9]+$'
+            oneOf:
+              - pattern: '^qcom,adreno-505\.[0-9]+$'
+              - pattern: '^qcom,adreno-506\.[0-9]+$'
     then:
       properties:
         clocks:

-- 
2.50.1


