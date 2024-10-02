Return-Path: <linux-gpio+bounces-10727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FAC98DEEC
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9B41C24C8E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21A41D0B93;
	Wed,  2 Oct 2024 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="DCQQJL/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953201D095D;
	Wed,  2 Oct 2024 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882755; cv=none; b=rjhCM7fg3mCw2ch+FMqixyDZsTaSlESpYvpYhIGodmK9s/PSv2UsXsgRpGC1Rs0lQHkvTI0Ih5FtlUcLmyZJ8Ty/MhCjcNYZlxjHOK0JUFrbDd/YpIdoTyx7UY+OeLtW0vR2O9e9qKrSVHd36dFSs9UDNHKExHGyN5qmnYOVPuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882755; c=relaxed/simple;
	bh=EHuti5/ucjdAYfMdR6yKtYB58metlbUVWQyTrXJjrD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sPvvhVl9Q41xJaocbioigGrTqIZzRVXXsqG4fhBIyC6oO6eTya+2/GlAi+3r2NIRM5cCHygGsFkNsPm+MSqjbx3Ivr+HUoiDurgN0JHogHLqpCOkO/vTldKcKjSAcF9cveuRVItTnjCcEoEQzh3GAvlwQt7mz4hfkelpcvlZOkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=DCQQJL/s; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6823323D44;
	Wed,  2 Oct 2024 17:25:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfUC1PlS7uLf; Wed,  2 Oct 2024 17:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727882749;
	bh=EHuti5/ucjdAYfMdR6yKtYB58metlbUVWQyTrXJjrD0=;
	h=From:To:Cc:Subject:Date;
	b=DCQQJL/sVy7uOh/nnJZIgPlIcqGBEfdlPzQKU1LIC7p04U+UAYZcrC9Q+Sq1U1cqm
	 a52y/W2xS5dOlu4yCpw6zCuBIUQ/bP71gGAzWXRoav84W4IIKOyRkcFGj+WC7adnoY
	 8HZvKbwRMAJuSa206Fs+YINJ4IVEgy7auNQbvM4BmdSdrUEQFp/0FiWWMFwjj1VOC1
	 CCjH9Yn6rCpGE6MHsEMh2+ZNJSu0NRmj66GxhwZHGY0+xT5/kyJ19HjmBuw1UO6fzI
	 q9QMHRjz5SDzoBAlViAfVwa8dQ7rPla1Ex7sziFFQTGKGH6YrNgTMC4nBJuCZCa4Em
	 ctMU/aggDH1Wg==
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
Subject: [PATCH v3 0/5] Initial Support for Linksys EA9350 V3 (linksys-jamaica)
Date: Wed,  2 Oct 2024 23:24:14 +0800
Message-ID: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
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


