Return-Path: <linux-gpio+bounces-29611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0404CC2421
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 12:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58E20308D63D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 11:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2A0342511;
	Tue, 16 Dec 2025 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="PM3HT6vH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m15593.qiye.163.com (mail-m15593.qiye.163.com [101.71.155.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC91E34214A;
	Tue, 16 Dec 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765884371; cv=none; b=VhqWdl3fgkb7MAtj7WL/k+Cv5CDuXkhn/cB8t2kozJLmiNaJgBosHBdhWCQKdvOasnbM3UxHGOUbAmd7bK0VJLq4YP/SaJZ4Gsrj+fr647klWhQLPqsSQSHKvfFZtOf3BvNAt1vn3JvPxuRCci96e20S1pGvngR0Sp2OnZYSzoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765884371; c=relaxed/simple;
	bh=m/plNim/gii7MZeXB1iWYbf8A0/0L623zARDhWWk+pw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d6TO7FegQ4KrI+7NjqWyQcDPcPUJffRAtBTHB8R7Kn/jN7axkJtb6pZV7lgHkepJsrzuTOUMs6YMyVIklgBQw/glzbYO+9qPagwBMPpPqD5IQe52PzWW2WiYbLFGF3B11NBpAWbMlS8A6m1VQLFx9jTPxIKRiic6T62skA+QFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=PM3HT6vH; arc=none smtp.client-ip=101.71.155.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1f8a;
	Tue, 16 Dec 2025 19:20:54 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v3 0/7] pinctrl: rockchip: Add RK3506 and RV1126B pinctrl and RMIO support
Date: Tue, 16 Dec 2025 19:20:46 +0800
Message-Id: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e44a7f09d8kunm7ab62e1d2a7b102
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xCGVYfHhpPQ01MTUNDTRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PM3HT6vHKkrd+ZNtMf38L3ESv1LeBysidyL+GMMd2Wouwm5QLl8Fl1HG1+mFbEPzsqqWdHX4T18bVniz4uD4j3BNjt+G8KqByc9x7RXrKtYsBnqEUmq5N4SbuZJ85eTgdWvI9zFhwQRzw9suBIzC5zM5vLQvz0wIO+MiJMwNH1k=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4kLGH3W9CRPvlSHMuYo7bafMtREMUmy74t3ou4jJCw4=;
	h=date:mime-version:subject:message-id:from;

This series adds pinctrl support for the Rockchip RK3506 and RV1126B SoC,
and adds support for RMIO (Rockchip Matrix I/O).

The series includes:
- RK3506 pinctrl driver implementation
- RV1126B pinctrl driver implementation
- RMIO controller binding and driver support
- GPIO driver update to support new version GPIO

Note on grouping:
The RV1126B support patches are included in this series because the RV1126B
pinctrl driver implementation depends on the PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS
macro, which is introduced in the RK3506 support patches. Splitting these
patches into separate series would break the build for RV1126B if applied
independently.

Changes in v3:
- Drop already merged patches (rk3506 basic support).
- Remove unhelpful mappings in rockchip,rk3506-rmio.h
- Improve YAML schema: fix constraints and examples for RMIO.

Changes in v2:
- Added RV1126B pinctrl support (patches 3 and 4)
- Updated GPIO driver to support new version GPIO (patch 5)
- Added header file for RK3506 RMIO (patch 6)
- RMIO is now implemented as a separate pinctrl device (patches 7, 8)

Ye Zhang (7):
  pinctrl: rockchip: Add rk3506 pinctrl support
  dt-bindings: pinctrl: Add rv1126b pinctrl support
  pinctrl: rockchip: Add rv1126b pinctrl support
  arm64: dts: rockchip: rv1126b: Add pinconf and pinctrl dtsi for
    rv1126b
  gpio: rockchip: support new version GPIO
  dt-bindings: pinctrl: rockchip: Add RMIO controller binding
  pinctrl: rockchip: add rmio support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   10 +
 .../bindings/pinctrl/rockchip,rmio.yaml       |  106 +
 .../boot/dts/rockchip/rv1126b-pinconf.dtsi    |  660 ++++
 .../boot/dts/rockchip/rv1126b-pinctrl.dtsi    | 3218 +++++++++++++++++
 drivers/gpio/gpio-rockchip.c                  |    2 +
 drivers/pinctrl/pinctrl-rockchip.c            | 1192 +++++-
 drivers/pinctrl/pinctrl-rockchip.h            |   47 +
 .../pinctrl/rockchip,rk3506-rmio.h            |  109 +
 8 files changed, 5250 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rv1126b-pinconf.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rv1126b-pinctrl.dtsi
 create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

-- 
2.34.1


