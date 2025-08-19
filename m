Return-Path: <linux-gpio+bounces-24584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE6B2D03B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 01:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05B5D7A2937
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 23:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A583279787;
	Tue, 19 Aug 2025 23:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="muisPuBr";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="71eJ+Kto"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949AC26F2A9;
	Tue, 19 Aug 2025 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646770; cv=none; b=EUBCEqUqZa5ESzeH4Ad9mPzuACsgwhjwqDsyo0RKnaDpyYLWLEiym/T32pgNkHSa6+3jdPE4uCtfr2jx+UxDfQyrBJsPZtPI5BT08kEegnXVEF6UWp/wELFw4HL6qdJ44XVP5ph2YVfAOuKfOG0LiJdodiTA4p+woQkQd1o/xjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646770; c=relaxed/simple;
	bh=JZrmsmOLakGNiArgxLyorPY9EkM8UNZYC42Sd1HoK+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fSdMF9t/o75zdvpFjYAMGkFlg0H/55iWrdk6My+aZqdtZFFzDYsNkw9NPn0wJyXKfYXDg74BTDQG/DExxg7DWEJlG+mD0719LBoQ9L7DTAcSSr8cyLPZbZATLmEY7psfeI1mUUh6Uz15XMaYulL31BBxQTIyloLSEf0Pf7yZ2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=muisPuBr; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=71eJ+Kto; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1755646709; bh=kpY+Nl5vsHKrBlzLVtfhztv
	xRfiJB87Mxz4rJktiaKM=; b=muisPuBrVe+vTxyAJxMV9VlJHQIAVylsj9VYA0sMPCE1I9ABwn
	quKdRWCXg42jkf2W2TND5sqAoHtSNB9/Au40aj1M++fpDY+YJkjc7nhXUhoIvu60P9y33es7d28
	gnjGY3nNUnzHYK0QegBqvjlwQH3fFiAHNB025tiHK5eHPg7EpS7D5uB4+zlo6eo72oaux98uc73
	lM3gWSBW9pEwnmbc7KUT85ThBodLcdU9vZxOENT4GuGvde8svER3o2Iyymq3+MF6w35fBG7fDRl
	mWfMj3HxXRGsSBnUG3Uj9DCmN+gzEZv6t6uJ2/SEhN6ZRd2LliuLSJuE25IuI37421Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1755646709; bh=kpY+Nl5vsHKrBlzLVtfhztv
	xRfiJB87Mxz4rJktiaKM=; b=71eJ+Ktoi0+cuOKQEJAsAY9wJg/vc1Ft+dBXpiZdXKk161lxoG
	pivA4UqvSEGcJd16HT4nhP4nbZaVGppZlqDQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v6 0/6] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Wed, 20 Aug 2025 01:37:44 +0200
Message-Id: <20250820-msm8937-v6-0-b090b2acb67e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMgKpWgC/23PwWrEIBAG4FdZPNeio4naU9+j9JDVMTvQmEVL2
 GXJu9cstAaa4z/M9zPzYAUzYWFvpwfLuFChOdXQv5yYvwxpRE6hZgYCOgFS8KlM1inDASxGEbx
 C71jdvmaMdHs2fXzWfKHyPef7s3iR2/S3Q/51LJILbgIYDL2JRtj3aaD0RYnS+DrnkW1FC+wwq
 Iah4rNzpg57hUEdYrXHumFVcRiC8dKC9/58iHXDSnYN64pllArQGjFod4i7hjXsfu62s6OzxmG
 UOvzH67r+AHIgwaiXAQAA
X-Change-ID: 20250210-msm8937-228ef0dc3ec9
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniil Titov <daniilt971@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dang Huynh <danct12@riseup.net>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755646705; l=3529;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=JZrmsmOLakGNiArgxLyorPY9EkM8UNZYC42Sd1HoK+4=;
 b=PP8iWeu44PDXA5tIe8ikwR1WhFZxabycKfMF9ZAj0w4Zj4ROxeZNwa9PYnTYUghBJasw2fA64
 zgLA/zioHNcCQyArr6qrVuLJYTPtp5MLMYcszSy8RUh0w59c0m1+m3j
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
Changes in v6:
- msm8937:
  - Fix nodes ordering.
  - Format clocks, reg, dmas and -names properties.
  - Add gpu_speedbin.
- Describe A505 clocks.
- Link to v5: https://lore.kernel.org/r/20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org

Changes in v5:
- msm8937:
  - Remove wrongly defined idle-states.
  - Fix thermal zones.
  - Use the header with DSI phy clock IDs.
  - Fix the nodes order.
  - Fix the pinctrls style.
  - Follow gcc header changes.
- msm8937-xiaomi-land:
  - Remove headphone switch and speaker amplifier bindings.
  - Unify status property style.
- gcc bindings:
  - Expand MSM8953 gcc schema with MSM8937.
  - Add MSM8937 prefix for MSM8937 specific clocks.
- gcc:
  - Follow the bindings changes.
- Drop alwayson clock documentation it will be handled in another
  patchset.
- Link to v4: https://lore.kernel.org/r/20250315-msm8937-v4-0-1f132e870a49@mainlining.org

Changes in v4:
- Add missing rpmcc include for qcom,gcc-msm8937 dtbinding exmaple.
- msm8937: add missing space after s9-p1@230
- msm8937-xiaomi-land: replace LED_FUNCTION_INDICATOR to LED_FUNCTION_STATUS
- Remove applied patches
- Link to v3: https://lore.kernel.org/r/20250224-msm8937-v3-0-dad7c182cccb@mainlining.org

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
Barnabás Czémán (4):
      dt-bindings: clock: qcom: Add MSM8937 Global Clock Controller
      dt-bindings: display/msm/gpu: describe A505 clocks
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Dang Huynh (1):
      arm64: dts: qcom: Add initial support for MSM8937

Daniil Titov (1):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8937

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 .../bindings/clock/qcom,gcc-msm8953.yaml           |   11 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |    4 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  381 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2134 ++++++++++++++++++++
 drivers/clk/qcom/Kconfig                           |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   19 +
 9 files changed, 3168 insertions(+), 11 deletions(-)
---
base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
change-id: 20250210-msm8937-228ef0dc3ec9

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


