Return-Path: <linux-gpio+bounces-10739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 071BC98E0D2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 18:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 391EB1C2301A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23761D12EF;
	Wed,  2 Oct 2024 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="ffZ/TfAi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F351D0F73;
	Wed,  2 Oct 2024 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727886593; cv=none; b=GLMbtR3OORBE5Ntyhaxh38SV4tWmFroJF3Vnj3PMg9oOpEkZrT4WU558qB1TFCLOxC4JjngZgKNtb10KUSbZma34q48vxtsM2PjoN4KBceZ4d0aY+SXyp67w3E4i8SnNCIGxyi4D4FCwZvFc1hgTjwiqYm/N/P6HuMywBqQKEzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727886593; c=relaxed/simple;
	bh=BmIGw0/l7/TucawwoIL2fBJxTv8uSyuGa1qanUUCp1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liL2BMtRAaDQUAT//s3QtzZ5QDOaHoKYM+mwBXvKAerDudTlQrpP2Ymzk5xOOYAMTvYC/p2D3b/0uhHEhTJSXx97jeW1tFdLBCyFU+0rkaG4e+M/SxscuJD5dOXCptQo4hIgH0Wiws3ydWaxIlrfljV936Bvo47K9DKTXL8NhAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=ffZ/TfAi; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0A56323BB1;
	Wed,  2 Oct 2024 18:29:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qraWhkxdlmyX; Wed,  2 Oct 2024 18:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727886587;
	bh=BmIGw0/l7/TucawwoIL2fBJxTv8uSyuGa1qanUUCp1M=;
	h=From:To:Cc:Subject:Date;
	b=ffZ/TfAirN8LL9XBrQZ2HMJPIOfOTnT1yC9fou/DHXLI3orUiV+4pH9REYcEANTXX
	 DCe/hzPez1q4MHIyLtrwBZKyWO1BdnCkJBTxcjcoIa8DZdSm/qvVoRRtEiUHMjYxoU
	 F1gP2qrAoXzii/yXf9wtdvqQ1QOkYUGNH1Vyw65nkUbJImEgcNcGjCia2mfRq2bdI0
	 Yq4XY6t28mXOjYgAOEEoxRLAGlKPafyCEOkNXCVtevD1J/Zvisj2vvBgpHwbhT2rP7
	 mp2Bz5rBUI43sq6S/Ml2GSa4ElGjzg49f4YeLSSeN12p/rcximMLWzQjrf8jOCNl3E
	 ics84Lpq1kx/g==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 0/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64
Date: Thu,  3 Oct 2024 00:28:07 +0800
Message-ID: <20241002162812.31606-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree source for Linksys EA9350 V3 which is a WiFi router based on the IPQ5018 SoC.

As of now , only the UART,USB,USB LED,buttons is working.The front PWM LED require the IPQ PWM driver.Therefore the PWM LED isn't configed in the tree.

Also The original firmware from Linksys can only boot ARM32 kernels.

As of now There seems to be no way to boot ARM64 kernels on those device.

However, it is possible to use this device tree by compiling an ARM32 kernel instead.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v4:
  - drop all fake tags as Krzysztof Kozlowski pointed out
  - Link to v3: https://lore.kernel.org/linux-arm-msm/20241002152419.30364-1-exxxxkc@getgoogleoff.me/T/#t
Changes in v3:
  - Add 2 commit that I forgot to send in v1/2.
  - Link to v2: https://lore.kernel.org/linux-arm-msm/20241002132302.31608-1-exxxxkc@getgoogleoff.me/T/#t
Changes in v2:
  - reorder the properties in the tree to follow the
    usual order pointed out by Krzysztof Kozlowski
  - Add the missing word to the cover letter
  - Link to v1: https://lore.kernel.org/linux-arm-msm/20241002120804.25068-1-exxxxkc@getgoogleoff.me/T/#t
---
Karl Chan (5):
  dt-bindings: arm: qcom: add Linksys EA9350 V3
  arm64: dts: qcom: add Linksys EA9350 V3
  clk: qcom: ipq5018: allow it to be bulid on arm32
  pinctrl: qcom: ipq5018: allow it to be bulid on arm32
  arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm/boot/dts/qcom/Makefile               |   1 +
 .../dts/qcom/qcom-ipq5018-linksys-jamaica.dts |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/ipq5018-linksys-jamaica.dts | 107 ++++++++++++++++++
 drivers/clk/qcom/Kconfig                      |   2 +-
 drivers/pinctrl/qcom/Kconfig.msm              |   2 +-
 7 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts

-- 
2.46.1


