Return-Path: <linux-gpio+bounces-16460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049B7A412FD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 02:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD223B30A4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 01:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479A81A841A;
	Mon, 24 Feb 2025 01:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QTYVaGFd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3DC1A2C06;
	Mon, 24 Feb 2025 01:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740362199; cv=none; b=lQPr4iTxhPbJO+bRnsuvkHNF+4cpYIKP5fePL31q4Kn6KNaHt2g5c+3pmkXgdeqVLlj2QHg5AslTc52eWd0DEzP0Tbhjmt5S0hIoSQLaNHteG+UVvNeLLUxMfiEPpNj1/iGq7lnelpm2kVOA7Z/VempeyFXPYMR9qSzIhvkyiv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740362199; c=relaxed/simple;
	bh=nZMJlngEiotXw2FTtCXnq1VSwlgSDbVBsuztBbtsXLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXvikBRD5bGYN4Pm6a4uaY5bFD7hLzqaJqiimhmi9yj5VR2TlDzOEgGUc7qxvx/qKQY3ZLAxEqZXhUd64VdQd6hmTev4wwXrjgtXEJLr5azuOumFFnVTVVQVcgz4w7/EyuMSzyEm62Xdh5qMk5H6z3TUb6CsANgExgxaE2j1B0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QTYVaGFd; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id A51DDBB83C;
	Mon, 24 Feb 2025 01:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740362195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3WiKNi0MIshObrUkPnMHrbIdV3GvCNsZBMA8goXVDc=;
	b=QTYVaGFdXT/fa75dfqHX1JxHPKmXxL4yUxRdNntTKwsIZ+4nC3/8d+PfI4tsYp/t7YL8bG
	Rv/dxVgJgaxy5XNVrBG8j881iDqf27wahVou23AkxivqKgocWh8LBMPl1aezFELbscQu8O
	3rN3YVQpL1AUEZ5hENgBuP+rbAO6H1aLJmwknqxY6gtWnvMVxan28YF5/Lf0skpKEmYw5Q
	f1IlSKfyRYQaQmV8g+mE/R/nEoI5UdIz6u5FAe5EkGq8kKtsepVZSNAk9EZDzILDrtcj+C
	kUnCMQlT/8uhP2nT9kjPvlDadEJHhC7pOFdFHm4ukQTYqrAsBuc9cWCKV4csoA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 24 Feb 2025 02:56:20 +0100
Subject: [PATCH v3 5/8] dt-bindings: drm/msm/gpu: Document AON clock for
 A505/A506/A510
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-msm8937-v3-5-dad7c182cccb@mainlining.org>
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
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740362181; l=1421;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=JwsrQQ1h4foaqssnMVZ2dfrZxb+bgTSu50bLlQR5yv0=;
 b=RCsJKsH4OapMutoK9pfPNKYER6Zs5gC2KpQEgCTJ0KM+ZF/InlYisjN0cpVia3UtHoq242Hx+
 DlNg280xWXRCpRJImRGYC1zv5WEW4/Lo6EhHnog6UbdqkMVk5fx+yA+
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Adam Skladowski <a39.skl@gmail.com>

Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
require Always-on branch clock to be enabled, describe it.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[reword commit, move alwayson on the first place]
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 6ddc72fd85b04537ea270754a897b4e7eb269641..5028398cc3b517e404a92a2c30688f72eab4c1b3 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -152,11 +152,13 @@ allOf:
       properties:
         clocks:
           minItems: 2
-          maxItems: 7
+          maxItems: 8
 
         clock-names:
           items:
             anyOf:
+              - const: alwayson
+                description: GPU Always-On clock
               - const: core
                 description: GPU Core clock
               - const: iface
@@ -174,7 +176,7 @@ allOf:
               - const: rbcpr
                 description: GPU RB Core Power Reduction clock
           minItems: 2
-          maxItems: 7
+          maxItems: 8
 
       required:
         - clocks

-- 
2.48.1


