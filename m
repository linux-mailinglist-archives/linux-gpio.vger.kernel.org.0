Return-Path: <linux-gpio+bounces-15774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29572A318C2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 23:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EDFA18882DA
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 22:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588CB26A0BE;
	Tue, 11 Feb 2025 22:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HMRhqZW2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B212641CE;
	Tue, 11 Feb 2025 22:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313498; cv=none; b=nTLmdbcDAucWWXCEBJwfPLfPcp8n4uY88NEYS5E4dxdKOUu/zN5CaDiFX48vSxhtcB/4MeUjd2l7lG6qfE4/V66vBeohErz3Qq6V7vPIU8t/ixFkDk6Uger1hPvozvAz75jCt5u4s1gwU6dPbVukETfXWeiT365M0PZ7p7VK4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313498; c=relaxed/simple;
	bh=5/bBkjGSiUyr0eyYTgTn6gVjdqK5S7jACaykAWc9lMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NhqYyCwZbirgKqplA91kq28EeO8ImJJY2+2oBbQjj8Upj5ata+avbWbPd1SHNOe2YcxFWc09yPoNTjovTA3CVMreZq/F6p7Q8q62ZM1VDSkdCSjuUnkjA7Cq2oDP0gue8hZuEMQdWmH1gDqVl0Bseol2zP4vrG1suiQ4FWAqCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HMRhqZW2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C21CD.nat.pool.telekom.hu [37.76.33.205])
	by mail.mainlining.org (Postfix) with ESMTPSA id E83CEE4533;
	Tue, 11 Feb 2025 22:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739313486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iRA0rHhLejRTEHRY4py3J1wkqXCHBw6TYqdVvKcsqOc=;
	b=HMRhqZW2bFbB3Q+a+V7tlkp1a8wbScExvcJGnyHov6/S0HdY6D63TUne51JjmrO5xBPZLi
	VOGNEZ0f1Kjqbh1HPo2N+SVkt9IRVCNdMx9S7+NbxamVitYTRqV4dJFgyrronZsxowuaI4
	WKShPEIBmKZiiTYxag2CmZ6KtJ0kzJ58o3N9hP08+ZbWtoZ6c1trHWCLmWk02wvZQhb5HR
	ZGLMi1tY1bIgD6ssTid+XIqppegzmOlcU1YTNhtdFdE7Pq4sA+rrauDuTS+QAked6USmkD
	RITJtymkN+HNIU4Q+zzMF4AP7dkCaJUxyuJJn31hkrcSLSFrG+2vkQKRJ3llTg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 00/10] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Tue, 11 Feb 2025 23:37:44 +0100
Message-Id: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADnRq2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MD3dziXAtLY3NdIyOL1DSDlGTj1GRLJaDqgqLUtMwKsEnRsbW1ABk
 AALlZAAAA
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
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>, Dang Huynh <danct12@riseup.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739313484; l=2210;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=5/bBkjGSiUyr0eyYTgTn6gVjdqK5S7jACaykAWc9lMg=;
 b=mWTVmtj6I7bjnCl5io/j6l8G4RjSRRckn3ZyBcZbZoaR/xKWQU56znHHgQPNTJdKVM8aYV3Ve
 o4dp4lyKed6Btxv5UAMSn2GmHfsYbmmWEBG5+TxOR6T+0bKWIYSYDMe
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
Barnabás Czémán (5):
      dt-bindings: mfd: qcom,tcsr: Add compatible for MSM8937
      dt-bindings: nvmem: Add compatible for MS8937
      dt-bindings: iommu: qcom,iommu: Add MSM8937 IOMMU to SMMUv1 compatibles
      dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      arm64: dts: qcom: Add Xiaomi Redmi 3S

Dang Huynh (2):
      pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
      arm64: dts: qcom: Add initial support for MSM8937

Daniil Titov (3):
      dt-bindings: clock: gcc-msm8917: Split to separate schema
      dt-bindings: clock: Add MSM8937 Global Clock controller compatible
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8937

 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 .../bindings/clock/qcom,gcc-msm8909.yaml           |   10 +-
 .../bindings/clock/qcom,gcc-msm8917.yaml           |   74 +
 .../devicetree/bindings/iommu/qcom,iommu.yaml      |    1 +
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |    1 +
 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |  402 ++++
 arch/arm64/boot/dts/qcom/msm8937.dtsi              | 2145 ++++++++++++++++++++
 drivers/clk/qcom/Kconfig                           |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  617 +++++-
 drivers/pinctrl/qcom/Kconfig.msm                   |    4 +-
 drivers/pinctrl/qcom/pinctrl-msm8917.c             |    8 +-
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |   17 +
 14 files changed, 3277 insertions(+), 17 deletions(-)
---
base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
change-id: 20250210-msm8937-228ef0dc3ec9

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


