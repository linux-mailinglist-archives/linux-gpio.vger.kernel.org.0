Return-Path: <linux-gpio+bounces-24579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED1B2D02B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 01:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11E5F7208A3
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 23:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9071E272E51;
	Tue, 19 Aug 2025 23:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="n2guvqGo";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="5qHUoDTg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7313326FA58;
	Tue, 19 Aug 2025 23:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646738; cv=none; b=jZQj9HoCjvLwkyFao8pguL163rOkTMKiGYQnCkwkjHkPFJlc/GSD1ij0WC/dIcXqN/7PqMrQMD7u7v1cjd7w5Z5+nyeNMX8xaZkY4DOMGJCA0VO7F5sC2uR9r0+EBlp34fd46tmTtbGwVZa9V/ISle+CthxMtcBKnw9f/Pdw32o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646738; c=relaxed/simple;
	bh=gPKnGnK5W7HEK0sHmqtti9jpZR9ebsmqij0kJEgnkBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJHU5pnLaU5M3+NOWwBM7oo4lJXxvm37u66VKDjznSWmCeeMFuUgr0HfkwHJ9/5ghZLq+/bXnpZNxye+OdKi4TeP3UYlM+EcnAB6WSnIX2ho46tRqWsQ8htp8vQsfx8miEZeaN1XGmZe75fKqp1Fs6o6RT8GzaJ4oEIbvp19gJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=n2guvqGo; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=5qHUoDTg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1755646726; bh=K9ZKUwooLjx52q/ZtM98T33
	7bMeJAJ4XytjUaP6r4lc=; b=n2guvqGokAxMzzoDEjTisvl8FxYHPMf8kNQdgKEKiPKDR5av88
	AC6OETKK8xbk1BO74KkioZflxONx/ymILIamZCA2mR/BiQMUsAo7BVODgjKA18QngnjXpMvrFaD
	QlB0A0pYDaVbpngfsZtkJxKE0ZfJIf5qBtmOA2DwnWGUvxkQ0e+XDzCWJdcJ6bA9vuTb3NJWGox
	HwKI/GubKGawsbaikZtyQavSNMlpVLhkQJ6aKC0BFm/MS8W/sz1I1c/Ny6vCp5BycKFAQA8ZxSo
	f3gbqandbj6ET7+XS1LRAKANxU5PKwvaZkR1yblPXsd+ajydr0vCRL62Mj7kPsG5y6g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1755646726; bh=K9ZKUwooLjx52q/ZtM98T33
	7bMeJAJ4XytjUaP6r4lc=; b=5qHUoDTg3FLIyRxXe5XrWUojy5TLPPeCMgxetOJZBwbhA3dASj
	nH83CH8oHBKu+011L722v0po9FEJPyuD74DA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 20 Aug 2025 01:37:49 +0200
Subject: [PATCH v6 5/6] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250820-msm8937-v6-5-b090b2acb67e@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755646705; l=1178;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=gPKnGnK5W7HEK0sHmqtti9jpZR9ebsmqij0kJEgnkBg=;
 b=JidHmyw6f8QMdA3+bDYt5vOS/LEpTeFaJ0xaBNQ7ITPeJMPewbCqm4ht/6JAvTaVSdecYVpDi
 sM8iPDvdOVPDRODoPijfCVmqaN9W3kkscX5MltGaMHX6zrslcoTvaG0
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
index 55e5eb75af8905c93e6604d54d516585f70a8e29..16e003ef0e1892cf8b1d2e5c581358e344b46349 100644
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
               - motorola,potter
@@ -1153,6 +1158,7 @@ allOf:
               - qcom,apq8094
               - qcom,apq8096
               - qcom,msm8917
+              - qcom,msm8937
               - qcom,msm8939
               - qcom,msm8953
               - qcom,msm8956

-- 
2.50.1


