Return-Path: <linux-gpio+bounces-16455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7FA412DC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 02:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42747188737E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 01:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BC919ABA3;
	Mon, 24 Feb 2025 01:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="vUWC3Dgv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F1802;
	Mon, 24 Feb 2025 01:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740362189; cv=none; b=cLBd0nPaeO+q85pDO3z94i11C9AOAApeDMQBlyefh8FTP0SD6pKS0H1o7vV7x/bqpS1X5iCWIBajd4zn8ughaPxgG7VKvB2fjS2DlCf3f3ZrxR1e/GObiw8/+7K2scGuDtjYSYzIm68C8xUeaRVPpMuY7kfXU7xrJfxSgENZJd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740362189; c=relaxed/simple;
	bh=39Uf86IT8UF4N2Vx5vcprNQTR3BbrL/jvdHL965ABuc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TS0mGr6lcZv09CdlsqaCZ0xBzC8MhYo3xkFEIlk27ns4pjPYQt7mMQ+ZQoPcjSZIZfaIo/PAOVIULxEapoKm45JXFHz1ZiKwU5wgALvv7G6/bHqxgo7KlRbCVjlDyPWkBUP3nG/McKdKZRadMYHRhlJ2wQ+6nOktl1QD0xMLMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=vUWC3Dgv; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
	by mail.mainlining.org (Postfix) with ESMTPSA id E0D92BBAA8;
	Mon, 24 Feb 2025 01:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1740362183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EeWF7qvyGL3cKqaH36H4ZYKJfxDKcwMXmA2Q9/6WF7o=;
	b=vUWC3Dgvz/Qcmo7z5YOqSE1Px0lihfOQEyxwThU7Cyyg+EpT6I9/12w8DAy3wLIxnIlByT
	dEAn3vUHyUxzxqI0L4Cpnw9GKulPB6eV0kSXyJ0T1Oqyt4vLQXXcGqQjKCCCKqpJmlpmRW
	4sex6Bugyomo629RS2SKA9/+x1H2q235gO6+MbXVO7ncHD/UFWqI0Ntcx15eWUaPOLIJ4j
	ocaZO3MX80T6egu07ywBpGty1siY4zbT6sBXYZZPyAdOZwFpRkqw3kcEHwVNARz+wSEn5Z
	3RMqKrAQzeXHtY4ohwUvfDG6msepI7u5v1UbBYhfCGaWJVHyxSNpHLr8IjnUVQ==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v3 0/8] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Mon, 24 Feb 2025 02:56:15 +0100
Message-Id: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL/Ru2cC/2WMywqDMBBFf0Vm3ZRkQo3pqv9RurBm1IEaJSmhR
 fz3RqEP6PJc7jkzRApMEY7FDIESRx59Br0roOlr35FglxlQ4kGikmKIQ2W1EYgVtdI1mhoL+T0
 Favmxlc6XzD3H+xieWzipdX031KeRlJDCODTkStMaWZ2Gmv2NPftuP4YO1lDCHxn1V8YsX601e
 Sw1Of0nL8vyArnkN8XgAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740362181; l=2642;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=39Uf86IT8UF4N2Vx5vcprNQTR3BbrL/jvdHL965ABuc=;
 b=DGnjk8uWs3nhnJlH5Lm9Ib3OhsX7hivrg8dhP+ylonwxTUz9rpRv0ZMBprDyQYkpcBnRYbInp
 aVHI0g3q0b0C5X4+XvdwlSByVYHddozxk3iuzr08JpnLubW3HzP6veA
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
Changes in v3:
- Fix qcom,gcc-msm8937 dtbinding example 
- Link to v2: https://lore.kernel.org/r/20250223-msm8937-v2-0-b99722363ed3@mainlining.org

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


