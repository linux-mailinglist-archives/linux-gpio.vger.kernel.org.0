Return-Path: <linux-gpio+bounces-29317-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB92CAA137
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 06:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 510F0304DEBC
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 05:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC98274B23;
	Sat,  6 Dec 2025 05:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="NaovzkR4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973193.qiye.163.com (mail-m1973193.qiye.163.com [220.197.31.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06691A9B58;
	Sat,  6 Dec 2025 05:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764998128; cv=none; b=G0D1ZDPAg+9QyrZdt0nuRUlKiZaBdtQXNRlr6sVPcrqwJ17+E0yd64IsN0Ig4U4g8OhU5fuXD0iDpKtAtjhDBAa8LXbTxO3/8dLaHBH+a5DDJBhw+I5GWVD7wS9gLt2m+uNEXt4VpX6nu+pY/SHJhOwfbc7Y0nXDRoxsfd3yajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764998128; c=relaxed/simple;
	bh=HhreHijEduC+uDBxm57Nre7RXctTR/3w9qDn3NM9caU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UNlBul8CPd8ic/jgFMhPkyrh69z2OtRKfEH0O9KhS3JJ6PBmReDTgEY1h+YnQVEiOIHQmpiMoPOpLO7HoFsJQ6MUUevOor/6MEPFC+GyQMGrfZZ6kij0L8M/N3N87nRtzdZW3mVZq0efxbibwCUo2sZ4Oqja3fhUC0AeVjElAfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=NaovzkR4; arc=none smtp.client-ip=220.197.31.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2c3493adc;
	Sat, 6 Dec 2025 13:10:05 +0800 (GMT+08:00)
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
Subject: [PATCH v2 0/8] pinctrl: rockchip: Add RK3506 and RV1126B pinctrl and RMIO support
Date: Sat,  6 Dec 2025 13:09:56 +0800
Message-Id: <20251206051004.402991-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9af21133e609d8kunm8b6279c54ed7196
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkkaSFYeSUhNSkIaTBhKTBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NaovzkR4KMrY9nx/tVOzTiX/RH+8mefCfW5jw2qi3dA1MEoxVNdpbqcCswYn8ct8MSN7gT7eulnpNT88uT/NwaBzqmpWrG5QDzvH2rSiYWKmC08o9WbblWsRELqy3vGREPNpliVUkSfF0hCZ/IUJ+JpwvF3z5QBMdVK5qVIhyrU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=iD8eYq5ib5hN+a0GTaQhiJrNeylujhiGQE5LdxAwJmw=;
	h=date:mime-version:subject:message-id:from;

This series adds pinctrl support for the Rockchip RK3506 and RV1126B SoC,
and adds support for RMIO (Rockchip Matrix I/O).

The series includes:
- RK3506 pinctrl driver implementation
- RV1126B pinctrl driver implementation
- RMIO controller binding and driver support
- GPIO driver update to support new version GPIO

Changes in v2:
- Added RV1126B pinctrl support (patches 3 and 4)
- Updated GPIO driver to support new version GPIO (patch 5)
- Added header file for RK3506 RMIO (patch 6)
- RMIO is now implemented as a separate pinctrl device (patches 7, 8)

Ye Zhang (8):
  dt-bindings: pinctrl: Add rk3506 pinctrl support
  pinctrl: rockchip: Add rk3506 pinctrl support
  dt-bindings: pinctrl: Add rv1126b pinctrl support
  pinctrl: rockchip: Add rv1126b pinctrl support
  gpio: rockchip: support new version GPIO
  dt-bindings: pinctrl: Add header for Rockchip RK3506 RMIO
  dt-bindings: pinctrl: rockchip: Add RMIO controller binding
  pinctrl: rockchip: add rmio support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   11 +
 .../bindings/pinctrl/rockchip,rmio.yaml       |  130 ++
 drivers/gpio/gpio-rockchip.c                  |    2 +
 drivers/pinctrl/pinctrl-rockchip.c            | 1188 +++++++++++++++--
 drivers/pinctrl/pinctrl-rockchip.h            |   47 +
 .../pinctrl/rockchip,rk3506-rmio.h            |  143 ++
 6 files changed, 1427 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml
 create mode 100644 include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

-- 
2.34.1


