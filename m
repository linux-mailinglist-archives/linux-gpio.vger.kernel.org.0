Return-Path: <linux-gpio+bounces-16439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0780A410FB
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 19:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B23477A55B0
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 18:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E498189912;
	Sun, 23 Feb 2025 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="L5U9B+/d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B508177104;
	Sun, 23 Feb 2025 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740337131; cv=none; b=fY+aF1kwSEBqYCT+BXuKEsDbqEhI5BtVxWlMhGkBJR2sSmQc/2FCXpfhFDuc5NpcnlhjffvERaBEFfIVP3UzMmWE1GK8LjqDsRbYEc+TKY8U02YwU+DLkwQTTFjSy/nOsx4h4EGBHdbX2NP1uaidztKIOEgHZcad+IIpHTXKzUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740337131; c=relaxed/simple;
	bh=T/i0wd7pY9AM9U2Gjkvm6/4Px9O+/PKhiATyW2/HyO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7kTkX3vy1MnF5NHUYjMSxRlPH/i1j3fTsNRAzyLyrqJtlHXRB2W6NqV8s7v07qi4WqCws7uqOoFQEFur1s7iifyB+imOK9gAchl1D4KFZwY0pQ+HNpEs7tdTTly/Cnnd5sGG5NoHdzLGoTFoOCSdG1rvZePIHsGloYUnza05x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=L5U9B+/d; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id 4A0A1BBAA8;
	Sun, 23 Feb 2025 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740337122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zaXf5MCmGpuyyWzfFp16biEz+9yDLux8KpdR9j4m6Jo=;
	b=L5U9B+/dapPQYi4n0ioQ37XJFWPJh304l4WLy0WPkbM4lbSZMcSDJnpVlrmkpR3FGCb+Fz
	utf7zFSz5qpCh7pH4mbN/Ea2j1gtjaFacnDjr3pquRU52Ut7xrjtnNPYBjsWmmAR3rGJYP
	K/R0kvtq07edKKr0dybTkkjmFVQizi+sfZbQiVr/ztmIVS+JOqmEx/ekKVHEmqTEqaaV6i
	vDvNFz7Blov2tY/wBJCHTOU8raH8/g7T0HzIA66z22mYxzUBovhNvp7tHnx+222vefSDgz
	4eTsAcxU7bz99gruVQbFB3z7+JDRV0sH+RIAr0skgEOR1uBi0q2373L4sI8qSw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/8] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Sun, 23 Feb 2025 19:57:45 +0100
Message-Id: <20250223-msm8937-v2-0-b99722363ed3@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKlvu2cC/z3MQQrCMBCF4auUWRtJpmhaV95DuijJpB0wiSQSl
 JK7Gwu6/B+Pb4NMiSnDpdsgUeHMMbTAQwdmncNCgm1rQIkniUoKn/0w9logDuSkNT2ZEdr7kcj
 xa5duU+uV8zOm9w4X9V1/hvobRQkptEVN9qydlsPVzxzuHDgsx5gWmGqtHwxwOV2jAAAA
X-Change-ID: 20250210-msm8937-228ef0dc3ec9
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
 Daniil Titov <daniilt971@gmail.com>, Dang Huynh <danct12@riseup.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740337120; l=2490;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=T/i0wd7pY9AM9U2Gjkvm6/4Px9O+/PKhiATyW2/HyO4=;
 b=Ja7IFMF2IgPzZfg01b6Q//9RwjfYAB1g/J8vWC2E37bbxEosbYVQPXM1amALNgJ8YjTAFL0jd
 irC6xuog25IAJd2mbAInnQW9h3f7PIEcTclZrYKQSNHWoc2BrCZWPST
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

This patch series add initial support for MSM8937 SoC
and Xiaomi Redmi 3S (land).

The series is extending the MSM8917 gcc and pinctrl drivers
because they are sibling SoCs.
MSM8937 have 4 more A53 cores and have one more dsi port then
MSM8917.
It implements little-big architecture and uses Adreno 505.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- drop applied patches
- drop gcc schema commits infavor of a new schema for gcc-msm8937
- document always on clock for adreno 505/506/510
- msm8937:
  - set cache size
  - rename cpu labels
  - fix style issues addressed by review
- msm8937-xiaom-land:
  - remove unused serial0 alias
  - remove regulator-always-on from pm8937_l6
  - add blue indicator led for aw2013
- Link to v1: https://lore.kernel.org/r/20250211-msm8937-v1-0-7d27ed67f708@mainlining.org

---
Adam Skladowski (1):
      dt-bindings: drm/msm/gpu: Document AON clock for A505/A506/A510

Barnabás Czémán (4):
      dt-bindings: clock: qcom: Add MSM8937 Global Clock Controller
      dt-bindings: iommu: qcom,iommu: Add MSM8937 IOMMU to SMMUv1 compatibles
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Dang Huynh (2):
      pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
      arm64: dts: qcom: Add initial support for MSM8937

Daniil Titov (1):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8937

 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 .../bindings/clock/qcom,gcc-msm8937.yaml           |   73 +
 .../devicetree/bindings/display/msm/gpu.yaml       |    6 +-
 .../devicetree/bindings/iommu/qcom,iommu.yaml      |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  408 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2149 ++++++++++++++++++++
 drivers/clk/qcom/Kconfig                           |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
 drivers/pinctrl/qcom/Kconfig.msm                   |    4 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c             |    8 +-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   17 +
 12 files changed, 3285 insertions(+), 12 deletions(-)
---
base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
change-id: 20250210-msm8937-228ef0dc3ec9

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


