Return-Path: <linux-gpio+bounces-10754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198298E6D4
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 01:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9758282C3D
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 23:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC12E19EEBD;
	Wed,  2 Oct 2024 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="Yp4ZQmsf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8319E98F;
	Wed,  2 Oct 2024 23:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911779; cv=none; b=Eoy/Yqt1HellNiN9qAacGA3W9Kb55yGCpf0sCstbW1t9VXFLEvAfpDkomRgZxpVID+dqNBn626uyPPO+9SMbepGUYYbIf7IpAbzh5UcanWGWGzuVj4PydkXj3KP+PSwhivpaiTvMQ+pjwA2+0JBd6eIgX0uIPg98/L40WJmsmZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911779; c=relaxed/simple;
	bh=hutwE7z0RvvVxL28fwil+0xFabSiYSeg0uGG7im3XG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIC3A3QY/5+w0lm2AboIIPsju6MM3fvLlnH1u9EZ0mwwxaudm43NFmki6aiabS+qp+ydwk+v+XkTBBV1p4jF1fEXgO5ZWfBFqrsE8iiAugxBIcx65y7BrEL/6VDbnkvg7MK04YpUJbMGq5S0tqn4SMihdMf0RC5KJqnH1wqiUyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=Yp4ZQmsf; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C314F23CD5;
	Thu,  3 Oct 2024 01:29:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Knj2JwT4U8rU; Thu,  3 Oct 2024 01:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727911772;
	bh=hutwE7z0RvvVxL28fwil+0xFabSiYSeg0uGG7im3XG0=;
	h=From:To:Cc:Subject:Date;
	b=Yp4ZQmsf18RI3R3A2qxkngQji1Ea9CQKdmlCjUAo7Q6fL5ENZ/lj2pXLma0IX/fMm
	 52ZNpa2oOlTUHDBE4gogp8c+0CZa8QwLaoOL9Tgyx+hl8B+ua6aJXF57OPIgWezl1t
	 nKLwr+8+Knmi+SvQHg5rIo3s1LjOw0LAGhSesVCnsGMsD0EV5qP/20NbFgeqMS1l6W
	 NA91LtEHHZQ8vvFmV/lj9siw+bqrUlv8Hn0RLq1Qlf1uV7EVTbqgHuRWrGqWNul3GU
	 LU60/RH97IGb4XxmCrqNIVo9wxv4gZwwb2/5lTevxc8Lhgo1UdgmYvQUQTBDvhYJ/j
	 VF6dZnTlsaI4A==
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
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v5 0/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64
Date: Thu,  3 Oct 2024 07:27:59 +0800
Message-ID: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
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
---
Changes in v5:
  - drop all fake tags as Krzysztof Kozlowski pointed out
  - (It was my bad i thought i dropped all the tag but i missed one that
    in the cover letter)
  - Link to v4:
    https://lore.kernel.org/linux-arm-msm/20241002162812.31606-2-exxxxkc@getgoogleoff.me/T/#t
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


