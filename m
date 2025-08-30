Return-Path: <linux-gpio+bounces-25229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA53B3CFFD
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 00:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BC943BC89E
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 22:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B75262FFF;
	Sat, 30 Aug 2025 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hL2Chxyh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tT7ol6Wt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56804231C91;
	Sat, 30 Aug 2025 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756593882; cv=none; b=faSm3bkjv09w6rVIXP7HH6Be7Gbxdwqq7HvIwL+IqnYmtTFYmjHLJPdPCnayBg0EET3aK//FbaLpbV29r7mHrRoHlkGNMpu9Cl1o6Yu6UZLEH43UOkfykfyObn999a7/q/8rsoLd7cEoEx/oki/M3oIN+DhO2Rlukttypx25QmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756593882; c=relaxed/simple;
	bh=wmw2TX8XeI2jwe+eIPMA5Br3dVaIT7iuD5zo+71Kf2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zll54zwO6cY1nUbe5s7SGxiOtnxJmBKXFfJnMkgQph4vmy9Ia/rWGE3TWmUVgv1/ViCbcWiDtDFeRDN6DHMXWqAxoBXtIF2TlJGkv3R6/O6rxwlp3p2PeBIDfmjw9wRx9qbSABXK4lTURunvgbqgjHvdJrMowEeG64esESRIOxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hL2Chxyh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tT7ol6Wt; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756593506; bh=wcjl887H9qoorQWShXf6Wly
	U3a8kHxCqn+dkIRbrhsg=; b=hL2ChxyhRdniLom09pKkh4h7FKi6j0NprbC4D+EnJ2tLP2lj8r
	uOnbX6DF2zaISq9+xkSBEEzVUSJboZ4Oy2w4tzCyjB3pbxvD3Yp3J92zQGsB/UvtvnzdB2jh8ZU
	uQr/5Js20FOwFH/NhZdcShUhNWYwJH9VPPc6eEQO862RBBBuxrsa9pQx3ogKWNUpkV6fuv8KqJD
	koCUVPFlAbmyCsdHmqtDXuuyRz3/3gPkkO0Ae1KS8lKZ/dHf7B7rsLCblJ/X5Vk4RyXFUYVWtG2
	sh8g3UkZWh5eA92B2DKbfRMQivNFHjOK4FdShIpPlvvib9GEsvz25yPPy+tl1R3uA6Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756593506; bh=wcjl887H9qoorQWShXf6Wly
	U3a8kHxCqn+dkIRbrhsg=; b=tT7ol6WtYcbrZw79RVar6JEuFPLCwlRfVYZ9X2w45sotPlS3NS
	0f1Ju5Eo4Ud+LEdAki+O4LNIMZf2LUa1WiBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 31 Aug 2025 00:38:15 +0200
Subject: [PATCH v7 3/6] dt-bindings: display/msm/gpu: describe A505 clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250831-msm8937-v7-3-232a9fb19ab7@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756593498; l=919;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=wmw2TX8XeI2jwe+eIPMA5Br3dVaIT7iuD5zo+71Kf2U=;
 b=0bW6t37nwGQN6Xctt1VDRSoReDzeMnqijOb2AFbXMExAWxblZ9tb1RKfrRo4i+XXuddw0CtKd
 6ksgHAMo/oBBSP4Q7CYbvdYXxCXnUMuc7OHS/EzzfWNHTbF5Fc3kVRA
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


