Return-Path: <linux-gpio+bounces-28146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB05C3799F
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 20:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D80331885E58
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 19:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560FE3446DB;
	Wed,  5 Nov 2025 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="xTYs1Z8j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD70320CD1;
	Wed,  5 Nov 2025 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372764; cv=none; b=B4FSbjv3Oe48SthJHKUKZhTlYRXgjAdCzbSom9Zkjj6dq+Fve0oYD27i+h1VAzAZE3IyYgDezNFgl7BpiiXiIyYfi6KTbgUoxPE8VLv/lzUMrsD4qChHc4f3cqaGnxsoMAAEVHj51/iN00plHMxtgB9UdHdTsWRkUQjkAOkemYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372764; c=relaxed/simple;
	bh=hhTWL807dgjqF+hcdbkl/5iAPXjQhCBQIpD0yAJ1Jr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dk5M7GMcg7UAJ9+IdMc+gfbOfMQkDVrfNOBkViP20upk1vSSaRCVi8bKT+GzU/gASDOdsaxG2fWcQJpvUzxeKpD/DatHOGzV0LZCWNQ7Tgtd0XMC8Z8PY/F0Gtlx/rrmjeaiEw6KR+efpXzXIGO269vAvMwXVX/qnf+Z+QahFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=xTYs1Z8j; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id C59E1100877;
	Wed,  5 Nov 2025 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762372246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g2Ea0DWfLKHagtb+f2EQs/oSvtV0KXKnH9D3lP+qtqk=;
	b=xTYs1Z8jGMhlYKjYZQ2WnHMLz+Tmqzj0EF8hZELlrO8PIzmRT04cW9lps9/jyWKMEPrJDY
	phLmJmthaXRFro8YH9nDbUxRqpxcAwDW5zfOVJYzmy9Zo8tL+iY3EeerVw5hO3sBP2/u2k
	9tazsIXtvHaDyv3S1vaFEyxvbP1+928=
Received: from frank-u24.. (fttx-pool-194.15.81.38.bambit.de [194.15.81.38])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 8E2581226DD;
	Wed,  5 Nov 2025 19:50:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/5] Add Bananapi R4 Pro support
Date: Wed,  5 Nov 2025 20:50:00 +0100
Message-ID: <20251105195007.199229-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

BananaPi R4 Pro is a MT7988A based board which exists in 2 different
hardware versions:

- 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
- 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys

common parts:

- MediaTek MT7988A Quad-core Arm Corex-A73,1.8GHz processor
- 8GB eMMC flash
- 256MB SPI-NAND Flash
- Micro SD card slot
- 1x 10G SFP+ WAN
- 1x 10G SFP+ LAN
- 4x 2.5G RJ45 LAN (MxL86252C)
- 1x 1G RJ45 LAN (MT7988 internal switch)
- 2x miniPCIe slots with PCIe3.0 2lane interface for Wi-Fi NIC
- 2x M.2 M-KEY slots with PCIe3.0 1lane interface for NVME SSD
- 3x M.2 B-KEY slots with USB3.2 for 5G Module (PCIe shared with key-m)
- 1x USB3.2 slot
- 1x USB2.0 slot
- 1x USB TypeC Debug Console
- 2x13 PIN Header for expanding application

official product information:
https://docs.banana-pi.org/en/BPI-R4_Pro/BananaPi_BPI-R4_Pro

The PCIe is per default in key-m state and can be changed to key-b with
the pcie-overlays.

changes:
v2:
- dropped "dt-bindings: arm: mediatek: add BPI-R4 Pro board" which was
  applied from v1
- added new patch "disable 2.5G phy and enable at board layer"
- squashed "mt7988a: Add label for ssusb0" to r4pro dts commit
- some updates after angelos review to the r4pro dts commit
  - fixed buck4 and ldo displayed voltage (cannot be controlled by software)
    to match schematic
  - reorder fan after eth node (alphanumeric)
  - reorder spi-tx after spi-rx (alphanumeric)
  - follow reg first, then others also for spi-nand partitions
  - drop 2pg5 phy disabling node (due to new patch disabling by default)
  - change order of pinctrl (first number than names)
  - fix commit prefix (mediatek was missing)

Frank Wunderlich (5):
  dt-bindings: pinctrl: mt7988: allow gpio-hogs
  arm64: dts: mediatek: mt7988: disable 2.5G phy and enable at board
    layer
  arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro
  arm64: dts: mediatek: mt7988a-bpi-r4-pro: add PCIe overlays
  arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays

 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |   5 +
 arch/arm64/boot/dts/mediatek/Makefile         |   8 +
 .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |   1 +
 .../mt7988a-bananapi-bpi-r4-pro-4e.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-8x.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-cn15.dtso     |  20 +
 .../mt7988a-bananapi-bpi-r4-pro-cn18.dtso     |  20 +
 .../mt7988a-bananapi-bpi-r4-pro-emmc.dtso     |  33 ++
 .../mt7988a-bananapi-bpi-r4-pro-sd.dtso       |  31 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 534 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   3 +-
 11 files changed, 686 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi

-- 
2.43.0


