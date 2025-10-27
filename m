Return-Path: <linux-gpio+bounces-27676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B1C0E058
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79217189C0B0
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48BE2D77F5;
	Mon, 27 Oct 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="kHzZfJeq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D9829AB02;
	Mon, 27 Oct 2025 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571716; cv=none; b=brGIhRpKcyMs5QMOkNiwMlHmLQ7O+X/RYNZrmyPE2MrkH8XBwpwpp/RMQdL/obdnNloE/Ndyq7Tx0Dy1ag5fWsqhOSej5z7oVsT05ciVmhhRNt9BFrxiJoSe8VN+jv5msLlv1XYn7/ic/bUxjsnSvUyUyy8xMY6izPBRqV1quZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571716; c=relaxed/simple;
	bh=YjBDF/wx7NN4L1PBVliWqmKWyk7U+JcPjYG87YopiaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAu9B20n1i/llHHHDViqmcuI6ko7QGwYlyHd8mhKQlQ0odOhz5FaqG/vyu34ezKnNph+1+pkCtDiFRjpxKuRXIAne958Hm+IAdD1/24ilQKJf07q8I5z/npamBxq4V5ZsmRqRZVvTUQu89A1WO2D2IfGE0fjGFwEQChSDUA8gzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=kHzZfJeq; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 12DDC6078A;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761571706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f1kY+fBa9dU4TqUw2YdISaAyQViHpP6uEOBBRMAaqh4=;
	b=kHzZfJeqi6kxY1PtuPPOrDzx6NyR9siEcJhx/gwE693U7eJnrjJlEVKjsh34FfX2R3lE2N
	BZtlTH6mXH02Qxvrm+4RR+nFpDrS6YRyAVui12l+TOsXz5dcnmb//lHFL4C6598Ol/b0Uv
	g8dBoFcfZ5MAJ70OZKhz1zfFTEjwS3k=
Received: from frank-u24.. (fttx-pool-217.61.159.158.bambit.de [217.61.159.158])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id D08E31226C0;
	Mon, 27 Oct 2025 13:28:25 +0000 (UTC)
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
Subject: [PATCH v1 0/6] Add Bananapi R4 Pro support
Date: Mon, 27 Oct 2025 14:28:10 +0100
Message-ID: <20251027132817.212534-1-linux@fw-web.de>
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

Frank Wunderlich (6):
  dt-bindings: pinctrl: mt7988: allow gpio-hogs
  dt-bindings: arm: mediatek: add BPI-R4 Pro board
  arm64: dts: mediatek: mt7988a: Add label for ssusb0
  arm64: dts: mt7988: Add devicetree for BananaPi R4 Pro
  arm64: dts: mediatek: mt7988a-bpi-r4-pro: add PCIe overlays
  arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays

 .../devicetree/bindings/arm/mediatek.yaml     |   6 +
 .../pinctrl/mediatek,mt7988-pinctrl.yaml      |   5 +
 arch/arm64/boot/dts/mediatek/Makefile         |   8 +
 .../mt7988a-bananapi-bpi-r4-pro-4e.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-8x.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-cn15.dtso     |  20 +
 .../mt7988a-bananapi-bpi-r4-pro-cn18.dtso     |  20 +
 .../mt7988a-bananapi-bpi-r4-pro-emmc.dtso     |  33 ++
 .../mt7988a-bananapi-bpi-r4-pro-sd.dtso       |  31 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 559 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |   2 +-
 11 files changed, 715 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi

-- 
2.43.0


