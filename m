Return-Path: <linux-gpio+bounces-24741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9EB2F839
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3717170817
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E999530E0E1;
	Thu, 21 Aug 2025 12:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="a3KCQnSx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F22E22B8
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780022; cv=none; b=Jp3zmdWmnhoygk9GVj1Qzslzi9cVKDS4+4cTtwaQ5lUTPuJxtMzs07+mzhsS6+I/+DcJ02ki104e7JAUNeSl2uyWkeQ+csTzsbn8TpJnPv4YWH27vfWLwK3jPL8reWi4g2cvMoIx/XdjdFzovd/+KsZ35vck+mj3YxAepIM+qPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780022; c=relaxed/simple;
	bh=82DYYFSD3CqYTDlbWjJBZXlaFDd1dthPCW2ILUPcqOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=YNueJ8yJrAvKQu3CE6h+SVxD5RCjCXBwsm63d7cCLUdyBrnQelE2/frx734+N24BeUeszjxs+qE2OEGqJo18Za9ayOHiateGYQY1ojSH5uaWavScgQ88y5dlMN2Q10ZIkAK8b9POzkLDeztaTqCcteXPJjOSnNMc6EljMHGv3O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=a3KCQnSx; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250821124017epoutp01b0c5b4d70e0d895ba8b14a0bdfff6778~dyJ_rkq9y2072220722epoutp01g
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250821124017epoutp01b0c5b4d70e0d895ba8b14a0bdfff6778~dyJ_rkq9y2072220722epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780017;
	bh=rjvs5YIYigeX5S8OtQBGKC14I/wskjTtDwVHz/NFJLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3KCQnSxdRLGwIqtF64kFn9hVo9I+a/JNFyuc1rixVGBUjhYhxNCeYZ9CZ3RHWOkA
	 dpojnUBbhdtFYhT9EQMMykrksUMailRz4vlQknWEqnGzjtqB0o/pPZzekBVVyogr50
	 fJJsxP35vsP8V7te4MAgs/tOhswRER8oTWRBZd2E=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250821124016epcas5p1dbce6fcdb5debccef4b219cc53e1cb71~dyJ9kbk0i0508905089epcas5p1e;
	Thu, 21 Aug 2025 12:40:16 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c72wH4xvgz6B9m6; Thu, 21 Aug
	2025 12:40:15 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa~dyJ7RtKgX2595625956epcas5p1E;
	Thu, 21 Aug 2025 12:40:14 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124009epsmtip274fefd0605f3013be9921b57f147c42f~dyJ2gSu4O2624826248epsmtip2I;
	Thu, 21 Aug 2025 12:40:08 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v2 00/10] Add support for the Axis ARTPEC-8 SoC
Date: Thu, 21 Aug 2025 18:02:44 +0530
Message-ID: <20250821123310.94089-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<CGME20250821124014epcas5p12bacab10aac378f8d011fe7d2e04c8fa@epcas5p1.samsung.com>

Add basic support for the Axis ARTPEC-8 SoC which contains
quad-core Cortex-A53 CPU and other several IPs. This SoC is an
Axis-designed chipset used in surveillance camera products such as
the AXIS Q1656-LE and AXIS Q3538-LVE.

This ARTPEC-8 SoC has a variety of Samsung-specific IP blocks and
Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.

List of Samsung-provided IPs:
- UART
- Ethernet (Vendor: Synopsys)
- SDIO
- SPI
- HSI2C
- I2S
- CMU (Clock Management Unit)
- Pinctrl (GPIO)
- PCIe (Vendor: Synopsys)
- USB (Vendor: Synopsys)

List of Axis-provided IPs:
- VIP (Image Sensor Processing IP)
- VPP (Video Post Processing)
- GPU
- CDC (Video Encoder)

This patch series includes below changes:
- CMU (Clock Management Unit) driver and its bindings
- GPIO pinctrl configuration and its bindings
- Basic Device Tree for ARTPEC-8 SoC and boards

The patch series has been tested on the ARTPEC-8 EVB with
Linux v6.15-rc5 and intended to be merged via the `arm-soc` tree.

---
Changes in v2:
- Update SoB sections in all patches
- Update the copyright year to 2025
- Add CMU abbreviation description
- Merge dt-bindings patch 01 and 02 into single patch
- Modify yaml file to fit coding style in CMU
- Modify clock-names
- Reorder config macros to fit coding style
- Remove the unused macro in clock driver code
- Squash all clock driver patches (4 to 10) into single patch
- Split yaml conversion patch translation and add ARTPEC-8 SoC
- Remove "clock-frequency" property from cpu node in dtsi
- Remove the "status" property in dts and dtsi
- Reorder the DTS and pin nodes to follow the alphabetical and DTS coding style
- Change items property in axis.yaml
- Move dts files to exynos folder
- Removed ARCH_ARTPEC8 from platform Kconfig
- Add pattern in MAINTAINER file
- Merge dtsi and pinctrl dtsi file
- Split board dts file

Link to v1: https://lore.kernel.org/all/20250710002047.1573841-1-ksk4725@coasia.com/
NOTE: The first version has been sent by Coasia.
      After that, it has been agreed between Coasia and Samsung that Samsung will take
      ownership of upstreaming ARTPEC-8 and ARTPEC-9 platforms.
---

Hakyeong Kim (3):
  dt-bindings: clock: Add ARTPEC-8 clock controller
  clk: samsung: Add clock PLL support for ARTPEC-8 SoC
  clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC

Ravi Patel (1):
  dt-bindings: arm: Convert Axis board/soc bindings to json-schema

SeonGu Kang (3):
  dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
  pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
  arm64: dts: axis: Add ARTPEC-8 Grizzly dts support

SungMin Park (3):
  dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
  arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support
  arm64: defconfig: Enable Axis ARTPEC SoC

 .../devicetree/bindings/arm/axis.txt          |   13 -
 .../devicetree/bindings/arm/axis.yaml         |   36 +
 .../bindings/clock/axis,artpec8-clock.yaml    |  213 ++++
 .../bindings/pinctrl/samsung,pinctrl.yaml     |    1 +
 MAINTAINERS                                   |   12 +
 arch/arm64/Kconfig.platforms                  |    7 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/axis/Makefile      |    4 +
 .../boot/dts/exynos/axis/artpec-pinctrl.h     |   36 +
 .../boot/dts/exynos/axis/artpec8-grizzly.dts  |   35 +
 .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi |  120 ++
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi  |  244 ++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-artpec8.c             | 1044 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |  128 +-
 drivers/clk/samsung/clk-pll.h                 |    2 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |   50 +
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 include/dt-bindings/clock/axis,artpec8-clk.h  |  169 +++
 22 files changed, 2116 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axis.txt
 create mode 100644 Documentation/devicetree/bindings/arm/axis.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/axis/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
 create mode 100644 drivers/clk/samsung/clk-artpec8.c
 create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h

--
2.49.0


