Return-Path: <linux-gpio+bounces-29921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B4CDF97C
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73A70300C6CF
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC54313E21;
	Sat, 27 Dec 2025 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="iZSar4ym"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155100.qiye.163.com (mail-m155100.qiye.163.com [101.71.155.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382831328F;
	Sat, 27 Dec 2025 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837130; cv=none; b=lAVpqCiWgyU3zq09FqNItjsS0TTg5mk8wDbm8zZI9ECYxJRAN1qmTDOY7muAKDgWUg50cg8j/igzI+JXVZfbt0qFj7sdav/HZsB/mTSVznbgODsgu/BILdcAQ27IGaCgqQpJ5xNA2/d3ubR7j5jFv2s2Ya2pjQ8wo0kSLh1h2aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837130; c=relaxed/simple;
	bh=tZ5ejdYJsW3ohkgc69SM1Yfihtea5gCoJDv9UKWX1tU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rDJSighAKTE9B5a/Jd6ReH9/ocebfkNWprDlAEkJmQLtJF7hCuZscAt2BhNrR/jvQNRJrlnbRMHs3YdhAw+XMJwPcd6awu+2La0ha2o7W9OxdM0Yu4n5o0SJzqtOX1m2B3zYy51/oVJIfS9LBASdJpMXJEaM5chtMzHqZMy5PjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=iZSar4ym; arc=none smtp.client-ip=101.71.155.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ebf64df3;
	Sat, 27 Dec 2025 19:49:59 +0800 (GMT+08:00)
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
Subject: [PATCH v4 0/7] pinctrl: rockchip: Add RK3506 and RV1126B pinctrl and RMIO support
Date: Sat, 27 Dec 2025 19:49:50 +0800
Message-Id: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5fa4e03509d8kunm85cc97d2e30872
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5JS1ZCT0hJSRlLSxoeQ09WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=iZSar4ymSjyHwz3MeShOijNn1bq6sIzFgQe1hAVsA8K8rzzaW3c8mKcMtiBOKTJrSXlyvo85sbu0PzSjEKJINiBE2PBGok12UNre4UkdtlRe2vxUG2GKz4gzJxw48yg/fYxVrpijXrOY8REoB+KiKKl7G8PMQASWDl9GkC1837Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dV28SK6+Gm42e/jjqz4QnjJtKhxGLkRJ5zgDMZyozSI=;
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

Changes in v4:
- Remove rockchip,rmio.yaml and drop the separate RMIO child node.
- Remove rockchip,rk3506-rmio.h
- Refactor RK3506 RMIO implementation:
  - RMIO is now handled as a separate list within the pin group, allowing
    flexible mapping (e.g., multiple RMIO configs per group).
  - The driver now retrieves the RMIO regmap via a syscon phandle defined
    in the pinctrl node.
- Add RK3506 pinctrl and rmio DTS to match the new RMIO binding format.

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
  dt-bindings: pinctrl: Add rv1126b pinctrl support
  pinctrl: rockchip: Add rv1126b pinctrl support
  arm64: dts: rockchip: rv1126b: Add pinconf and pinctrl dtsi for
    rv1126b
  gpio: rockchip: support new version GPIO
  dt-bindings: pinctrl: rockchip: Add rk3506 rmio support
  pinctrl: rockchip: Add RK3506 RMIO support
  ARM: dts: rockchip: rk3506: Add pinctrl and rmio dtsi for rk3506

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |    25 +
 .../dts/rockchip/rk3506-pinctrl-rmio.dtsi     | 25162 ++++++++++++++++
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi |  1795 ++
 .../boot/dts/rockchip/rv1126b-pinconf.dtsi    |   660 +
 .../boot/dts/rockchip/rv1126b-pinctrl.dtsi    |  3218 ++
 drivers/gpio/gpio-rockchip.c                  |     2 +
 drivers/pinctrl/pinctrl-rockchip.c            |   282 +-
 drivers/pinctrl/pinctrl-rockchip.h            |    20 +
 8 files changed, 31160 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl-rmio.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rv1126b-pinconf.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rv1126b-pinctrl.dtsi

-- 
2.34.1


