Return-Path: <linux-gpio+bounces-25542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3CB42BE2
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 23:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89E95583593
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 21:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B548B2EB5B4;
	Wed,  3 Sep 2025 21:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kBn7qlht";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="P4/FBjTS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1592EB5B7;
	Wed,  3 Sep 2025 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756934854; cv=none; b=hBkU2BTFI9s++TfKxvfPhKw4soTZqPr5u8OCd1OFYTsoI+blp+vc0OHQfQ+mj4pjyOUzPRCO+4gXBo9wCQMZ3xq+JKAhpqeYv3b2/ERn9H2vCySbAEzA30OgJ8oef9RJf7p302OTqR4fI/ZRrLr+fvLyzaWg7NompNQvQHebaNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756934854; c=relaxed/simple;
	bh=jgIUA7S5MTzF8ypzpfsPU7vq9+59VLflT4M4H52qzJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EpTEudD7J9eELXS0Y9fAT74h/2Rn2gTBR+hu71idenMMvYoKYds1MmsNiPlZHom+hHplX4QQL5tOa29NmQZrKvJ5OYnIP1nBIk3k8Z3ABeq/avpDp5YqPfMFfZm3lacyRBV44uocH6gqr7AmZ3tjrrBrCLtH1miG58FtXClUoLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kBn7qlht; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=P4/FBjTS; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756933748; bh=pveUJp16MjRQhz6zhy7vbHY
	y0M547YSoVVCv8ehmvkk=; b=kBn7qlhtSf6LIjwYOcwA08celt7q22CMUzlRQ2ctDAIf2BBtf9
	vpTbDsh6msOIiX2DzF5QKs7/POJMjb/WzOkXkousGcCa0opJNYNp/NK0kSbwhukxOzO3CyrXkI9
	o2MVU3rmWF4Bfnx2AM20dbHdAMASNlCrP0pyJehJ74vQXMpo51DEo2OKsIc2IvL5A/XvZJmAnAd
	Z7rTmlGVPx73+SHPmMTcND8A6zEC7kKNrQpv/4inOD4zROwpZXO6Wx1Je2rz/0ekimu3O3zg3Cc
	2e3WSliUC4jdSAMTrkI/D+5MAHK/DJkIZRDRoEOueqWuU4TcVnYEeEO5IuilnNI8wIw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756933748; bh=pveUJp16MjRQhz6zhy7vbHY
	y0M547YSoVVCv8ehmvkk=; b=P4/FBjTSk1EzTgNgDd8HMGWaLMxZmALNtpHt0jVNItw6DymBQd
	b+nw04CVNBOKyR8JGc26v7iYUNT9/SB7zHCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 03 Sep 2025 23:08:23 +0200
Subject: [PATCH v9 3/7] dt-bindings: firmware: qcom,scm: Add MSM8937
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-msm8937-v9-3-a097c91c5801@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756933738; l=1435;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=jgIUA7S5MTzF8ypzpfsPU7vq9+59VLflT4M4H52qzJE=;
 b=VN0y4TBDLt6xNUw/0woes930ZX71+JEyxwIdi5f+QgbN7xkN1MXMSO4eFK8oCozcS5TMIIO/E
 oDVczbpirx6DH2D1PXdeCRPEYB/wcG5mwtj1aMqgigu/D6IWEiwPGGV
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add compatible for MSM8937.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index b913192219e40324c03f4ff1dce955881e7fb3d2..ef97faac7e47c1483f9758d2bb2a13f9c3664177 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,scm-msm8226
           - qcom,scm-msm8660
           - qcom,scm-msm8916
+          - qcom,scm-msm8937
           - qcom,scm-msm8953
           - qcom,scm-msm8960
           - qcom,scm-msm8974
@@ -134,6 +135,7 @@ allOf:
               - qcom,scm-msm8226
               - qcom,scm-msm8660
               - qcom,scm-msm8916
+              - qcom,scm-msm8937
               - qcom,scm-msm8953
               - qcom,scm-msm8960
               - qcom,scm-msm8974
@@ -177,6 +179,7 @@ allOf:
               - qcom,scm-mdm9607
               - qcom,scm-msm8226
               - qcom,scm-msm8916
+              - qcom,scm-msm8937
               - qcom,scm-msm8953
               - qcom,scm-msm8974
               - qcom,scm-msm8976

-- 
2.51.0


