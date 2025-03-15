Return-Path: <linux-gpio+bounces-17640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2892A62EA5
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 15:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE40189B781
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Mar 2025 14:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB352040AB;
	Sat, 15 Mar 2025 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fBqPU3RP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B18B202F62;
	Sat, 15 Mar 2025 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742050699; cv=none; b=JlU4XZvery+EGv/R8EDbvXkXHGJiLdvAdBvHeHbt2RViwE/MvfXb/U3yxtUrVGzD4Nx25bzqBx5oIgh1ER28vlE21QvDLSANDTaOKGNx+adqxhi/Nq3QkHycGknB0i60McBuQE9ksU6ZDFSBvS6JGFlCa31TyqyUy0Cdk9N6HFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742050699; c=relaxed/simple;
	bh=nZMJlngEiotXw2FTtCXnq1VSwlgSDbVBsuztBbtsXLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWv2bAyjrsHS4UdA6MHJ1rdt40PRLiRgTI5ZuNNOysNqeVS5w6d1g9dCgJLr/l8ABk24sucq1UG6BkrZEgzdZCY9x0sNM48/i3/DiMKfPT5vecMf0uoIU2Xs3EvgKHlvwGdj6ial9lzYxaBVRkA7AiwCvoRmxBqr8xQ/OIJDPMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fBqPU3RP; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C339A.nat.pool.telekom.hu [37.76.51.154])
	by mail.mainlining.org (Postfix) with ESMTPSA id B389BBBAF3;
	Sat, 15 Mar 2025 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1742050694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3WiKNi0MIshObrUkPnMHrbIdV3GvCNsZBMA8goXVDc=;
	b=fBqPU3RPV4rvthOCaGGiy5pzxgOaeG1cQ+NnARMMIV2E4ByDLMxJWgtfsV+KaPwHuwLKgz
	TQ9e4weFLYEohlRIHHJYdxLmFVDiZNpbSHriKRE9SOcaLYCqDJadduHGOqk17tu3Zug6zA
	BH1KJKJoBxcT4jS0aPWgi8q4DSSaeEX2spmFmI7Y3TxhrMSfURxrsoTh8ih05mOz/t1LfZ
	quJs1X8lALMWPaAqvzTXBzahrN5SvvOjjy1RVp2fCLb9I6LmpUNfctCSwsHl1CEI+a4lhZ
	2h2tj8FVYugkXyDXfh/69Ql2/vHZxH+uj569eFOfuYfkHdut3gsKVPZFsRBZLQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 15 Mar 2025 15:57:37 +0100
Subject: [PATCH v4 3/6] dt-bindings: drm/msm/gpu: Document AON clock for
 A505/A506/A510
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250315-msm8937-v4-3-1f132e870a49@mainlining.org>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
In-Reply-To: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
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
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742050684; l=1421;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=JwsrQQ1h4foaqssnMVZ2dfrZxb+bgTSu50bLlQR5yv0=;
 b=R95OkuBWE2aqKQYC45Bs1ykhHrr7TL/Sh8gHz0z2X7KlHiKuBvBtJYZW9JzBcQ/fS2LfCrLx6
 kjbph3mEhkTDR7X8LBaLg8fdAt7Mvk46pY+en5o9RVnjiuvw7uMO1Rr
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


