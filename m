Return-Path: <linux-gpio+bounces-16444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BFFA4110C
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 20:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3868173973
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 19:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB291C8616;
	Sun, 23 Feb 2025 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ses6nwLU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6CB19883C;
	Sun, 23 Feb 2025 18:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337136; cv=none; b=TbA2yvtkos5lWKDymNDu1mYNuoUoAxUI/6cmdmYh5YAchpec8YW0tJZAnHmeqnfaXnk0+LD3WRCn+Ktz/+xDMzJBBr0j5zHpriQUvc9LGoSvj+wCgg4+Fpdxam8ic9ty3H8JpKSfpWCRN9IfQEmT2TA3kEafb5jj1zC+z9i3mBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337136; c=relaxed/simple;
	bh=nZMJlngEiotXw2FTtCXnq1VSwlgSDbVBsuztBbtsXLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onQoHSz8jzlfqmcafHNK1GmOZb4B6g1xmbpjzd5oiFTeXcqhk27+b/BXoqCdWxO6AZ/wkNj/Fe7tPD8luosFvn/OfDYW2erhDLFE1lztIastqGhM9YRUFfSsEuWVd4MwFqRPIVTsvmIXZ2s2P/RUjX7VdIuVBjCUAUlXAnj2C6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ses6nwLU; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id 5B189BBAB6;
	Sun, 23 Feb 2025 18:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740337133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3WiKNi0MIshObrUkPnMHrbIdV3GvCNsZBMA8goXVDc=;
	b=Ses6nwLU0eo5fm5DmVrN3VwtdABkhE+vJOyS5vOpA0XdSkiYCrRb6R47CcynvFXygHwhn4
	kLyFKpf+8+G2tMXqyyxfNM4pIvBbM2xjKZ3Zg4ywFm1pUsC7YWb3Q13HnaiQJi/s8/qCsl
	R2eyXVX390VFEXqYPj/iXxEB+rxXzRmDnWoCCgAmQ29OuG6THTX0UwtU9CxWyAffx8UySF
	KvXdTSXuQxHu9dRcHtT0aGkLwunoqtVnNlHk3oc0QOTRRYR7VVIc0/Uduopn17c4WUp7Rf
	JD8NSBgiwF2FEJMOXai44JqP+nRJ/9rlZaxStcILCxLprYx2PIdmevQNy25Hpg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 23 Feb 2025 19:57:50 +0100
Subject: [PATCH v2 5/8] dt-bindings: drm/msm/gpu: Document AON clock for
 A505/A506/A510
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250223-msm8937-v2-5-b99722363ed3@mainlining.org>
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
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740337120; l=1421;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=JwsrQQ1h4foaqssnMVZ2dfrZxb+bgTSu50bLlQR5yv0=;
 b=tpxYpeRTM5XGKU7CNSwaYlhV+yW0Zr0m3RaCHUzmitJs1/tcwApQcb7woCo8lUMg6+/TPnhLx
 adB/dHA9ZETAzJd8grSr3wBFvpCyJ3eLhHkcU0g0PJWM8RzTd3WItjT
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


