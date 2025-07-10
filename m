Return-Path: <linux-gpio+bounces-23042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A830CAFF5AD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 02:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0DE63A80D0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 00:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3962B1D540;
	Thu, 10 Jul 2025 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="DYjoVkqB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B388F66
	for <linux-gpio@vger.kernel.org>; Thu, 10 Jul 2025 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106863; cv=none; b=fEWIPm2bwsFBMaKH5yq8hkSBdIGILi4C7i7mVaSlTzlUfJIfvqg3C1YMYVokRgkIOoL63ItAfSyEOtN6qW6g9xBLVWl1wgLylzl98+yLwH0ylTwGNm40EQJ0WNMNkQ3pgc55Qa/kHMYA27LSJjpiKSc+Mc3NXr3YLgQ13sbGDmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106863; c=relaxed/simple;
	bh=5TCqIKAAZraTPISadWHH3ICmjB1H6s6kj8mUhsQHdN4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bz4lMhdMeKxuNMCHvOVpx/r6o/8Z8uchOUa/DTGoFjTfTzCNFnH7A0oXk4IJYZeR37eVnuiPIwoxG5ATqw541hJAqMQH1qqXiNfVZTf1MjvfjwCGCdoY2XnYmVUTw3fLpWbGS+lGq3WuZdH2KyMhEy8TBK1b5oVoxqvkN3mVLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=DYjoVkqB; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106849; bh=5TCqIKAAZraTPISadWHH3ICmjB1H6s6kj8mUhsQHdN4=;
	l=3410; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DYjoVkqBmuQGkRBwZTGZHDjx9QRAz3kCc8AHXdSyuNrIOWvSGso8apc/shFMjuHNy
	 bU/6WB8K81rKKfOSU75Nkhf2KTDLsNzIpDQt+qxAzR6MbAmAld0dOq5hC+K8uZwb2h
	 k0mQfmGBOdlVRPFlYyNTt41E8XRcG9TS2KhAON78=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:49 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	ksk4725@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	smn1196@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	ravi.patel@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	SungMin Park <smn1196@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
Date: Thu, 10 Jul 2025 09:20:30 +0900
Message-Id: <20250710002047.1573841-1-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: SeonGu Kang <ksk4725@coasia.com>

Add basic support for the Axis ARTPEC-8 SoC.
This SoC contains four Cortex-A53 CPUs and other several IPs.

Patches 1 to 10 provide the support for the clock controller,
which is similar to other Samsung SoCs.

The remaining patches provide pinctrl support and
initial device tree support.

Hakyeong Kim (9):
  dt-bindings: clock: Add ARTPEC-8 CMU bindings
  clk: samsung: Add clock PLL support for ARTPEC-8 SoC
  clk: samsung: artpec-8: Add initial clock support
  clk: samsung: artpec-8: Add clock support for CMU_CMU block
  clk: samsung: artpec-8: Add clock support for CMU_BUS block
  clk: samsung: artpec-8: Add clock support for CMU_CORE block
  clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
  clk: samsung: artpec-8: Add clock support for CMU_FSYS block
  clk: samsung: artpec-8: Add clock support for CMU_PERI block

Ravi Patel (2):
  dt-bindings: clock: Add CMU bindings definitions for ARTPEC-8 platform
  dt-bindings: arm: Add Axis ARTPEC SoC platform

SeonGu Kang (3):
  dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
  pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
  arm64: dts: axis: Add initial pinctrl support

sungminpark (2):
  arm64: dts: axis: Add initial device tree support
  arm64: defconfig: Enable Axis ARTPEC SoC

 .../devicetree/bindings/arm/axis.txt          |  13 -
 .../devicetree/bindings/arm/axis.yaml         |  35 +
 .../bindings/clock/axis,artpec8-clock.yaml    | 224 +++++
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 MAINTAINERS                                   |  14 +
 arch/arm64/Kconfig.platforms                  |  13 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/axis/Makefile             |   4 +
 arch/arm64/boot/dts/axis/artpec-pinctrl.h     |  36 +
 arch/arm64/boot/dts/axis/artpec8-grizzly.dts  |  68 ++
 arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi | 373 ++++++++
 arch/arm64/boot/dts/axis/artpec8.dtsi         | 269 ++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/samsung/Kconfig                   |   8 +
 drivers/clk/samsung/Makefile                  |   1 +
 drivers/clk/samsung/clk-artpec8.c             | 890 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 | 129 ++-
 drivers/clk/samsung/clk-pll.h                 |   2 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  50 +
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 include/dt-bindings/clock/axis,artpec8-clk.h  | 122 +++
 23 files changed, 2254 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
 create mode 100644 arch/arm64/boot/dts/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/axis/artpec8-grizzly.dts
 create mode 100644 arch/arm64/boot/dts/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/axis/artpec8.dtsi
 create mode 100644 drivers/clk/samsung/clk-artpec8.c
 create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h

-- 
2.34.1


