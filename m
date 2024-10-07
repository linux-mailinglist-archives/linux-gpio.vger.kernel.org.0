Return-Path: <linux-gpio+bounces-10977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7862B993366
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA8311C236CD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D501F1DBB1D;
	Mon,  7 Oct 2024 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="jGvYOe5A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA841DA0F1;
	Mon,  7 Oct 2024 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318961; cv=none; b=SDi4VIW1Cqm1HC1JtIgqzUQTRZ4PIK+AehIHnFiFlNN/LQx6HlwhKYGX/mTXV4j9Q8hAMoH9d9v9LnYHxWVjRIJfreMy8Ym0zyLu7+mZwCxnxjqUCPxafFTsarJPAieGNtCgmNlCPu5LWcokfBHsrzZLsNDDeF43nX93TVCsRaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318961; c=relaxed/simple;
	bh=H4EtT+HCyJJiH5ULRPWfwetZm4DNjajIw7ek0MxBUrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBnCSSppE1wLjUQsOp3reCYvvPORq2W1Svap3p947jYzuQJC9ZMQ6MGft8CNFrqZ0AfsLfPw/Svpu6ZufKNvJLxgTWLuFCIL4mY0glAdxEaxGnUKvKs5Jv8UZdCUE31M588M9kVxJUvfg+mE+8MESi1rvDeWwH7IZgMAKUnDS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=jGvYOe5A; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0CF8A23F5B;
	Mon,  7 Oct 2024 18:35:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXfyCf6pQ-gt; Mon,  7 Oct 2024 18:35:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728318954;
	bh=H4EtT+HCyJJiH5ULRPWfwetZm4DNjajIw7ek0MxBUrY=;
	h=From:To:Cc:Subject:Date;
	b=jGvYOe5AIGKUenYzh6OpG101lN82Ob9Hyq+CQYcF1OffCz81+/f0qmzpKyaZoNURV
	 dPwVXIjRNl+Zxl4U973xkspHqDZIKRtQwSFONMuszYpXj41TYkVqqvIXCNCAiVMUMh
	 qZexMmor5b2QpeY8+6W2RpmjVqgjEyKOfypaiG4qIdlRvqe6zXaTkU5d04RC64l98f
	 M/6GRWs6CQM9ok1SkzysNUe+DvPo/rHpumr0bDnyFzo6QFPA3i9VcPKnktb9PAdtuv
	 jH+lxf7AwkoY+MclN8IugLpfJmhpjl8micjIhwbpqU6oULd1d0mJnQPHitcNuVWxEg
	 LcsSXGc3Sg0rg==
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
Subject: [PATCH v6 0/5] Initial Support for Linksys EA9350 V3 (linksys-jamaica)
Date: Tue,  8 Oct 2024 00:34:09 +0800
Message-ID: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
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
Changes in v6:
  - Fix the subject in the cover letter (I messed that up in v5)
  - Fix line wrap issue as Dmitry Baryshkov pointed out
  - Mention the 64-bit variant in the commit message and the comment
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
 .../boot/dts/qcom/ipq5018-linksys-jamaica.dts | 109 ++++++++++++++++++
 drivers/clk/qcom/Kconfig                      |   2 +-
 drivers/pinctrl/qcom/Kconfig.msm              |   2 +-
 7 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts

-- 
2.46.2


