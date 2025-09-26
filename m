Return-Path: <linux-gpio+bounces-26627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F397BA439B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 16:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BBC33A72B9
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 14:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180B81DB154;
	Fri, 26 Sep 2025 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwJ+Xat9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E8D7E110;
	Fri, 26 Sep 2025 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897205; cv=none; b=lCk/80hIUIQUIBHoUA9Qh5ZnNxe/mVD90ZLY6s9LiXEshqD6yNSBLg/17wA9enb5VzydLSbF4TJJLDaxOcrp7/Z61IfPhOMpSF11JUIwy3zEe3xguyME4oSgrI/m2AMlsAVY/KEt4YliGe27euu3DdcPbLH0fLKtIZhXKrPvIco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897205; c=relaxed/simple;
	bh=HCyKHfvLAjQiCuThnkTvglrGD2e2PE527p78aHU/53w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QIv1rhqtrbCT3/ZSgtLIDu1I+losqrk+yojaZ29krHB0pkBdxXE+K7ton4GQcNVLpvw3m1KoUY9MB1ZSk9O4TFf3PDRCCL+UwM28IQWiAZzmJ9wtU5SzsDL9bOZ82VqhoDp2OQ0NevlGLHIsqGydqNsik36s8SU/ywpdqoCsPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwJ+Xat9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD943C4CEF7;
	Fri, 26 Sep 2025 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897205;
	bh=HCyKHfvLAjQiCuThnkTvglrGD2e2PE527p78aHU/53w=;
	h=From:To:Cc:Subject:Date:From;
	b=jwJ+Xat9Dou58aM+viTe/oJvAmYdvfv+S5OXOIFTB78OhFltPIB61bW6gQJQtLptW
	 +8hxgtAuYnAzSslHlYOtoNrlCTpafiCmGlZQqPVL8Crcylug8vqnaPjfCf2z97Iv52
	 QLJa3EvEeF/wDK+urufiKHvDLSGRuybszjFy5fGmf5Jnrm/pU+nrZy2aJ8IpV9pq9P
	 IOR9XhP5exMWfmbTgnUX6t74PS9s+XLxOM1DLXiyN4YAcWYqC0wm/T5/muLbr76RJQ
	 HNx4rTpK5EjUHyyxWFVhPOtGJTMapK8whYof37wNMUYf2+B+zy4PcKyXMTJqAZjPpQ
	 zSDEwXbVq7pww==
From: Conor Dooley <conor@kernel.org>
To: linus.walleij@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC 0/5] microchip mpfs/pic64gx pinctrl questions
Date: Fri, 26 Sep 2025 15:33:08 +0100
Message-ID: <20250926-manpower-glacial-e9756c82b427@spud>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3488; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tKRIZ4T6oHzke0pnRvt4sAwKIFFEcFj+sPJFqDpDKfE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBnXlqikGSyZrBXW6fI8dE6N6exNzCdm/s//Gns32tgyY GUnq05zRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYy5yUjwwseocNV6x/HqVex ub3PL0qc3972obMs6b4Q++JtK6qzmxgZtifvDg06zH+2trM2+dpb7apjeT82MK2MmeM79WZZYbs 2HwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus, or whoever else,

Working on some pinctrl drivers for my devices, and I had two questions,
so I am sending this as an RFC in the hopes of getting an answer before
progressing further with the third pin controller on the platform.

Firstly, both of the drivers I have produced so far have only pinmuxing
functions and no pincfg role - they only determine internal routing in
the SoC. I've got an identical dt_node_to_map implementation in both
drivers, as all they are doing is populating the pin and mux bit setting
from dt. I used what the recently added spacemit k1 was doing as a
guide, but removed the loop since there's no pincfg stuff that can
differ between pins. I notice there are generic implementations of
dt_node_to_map but I didn't get them to work. Have I missed a trick here
(either on the dt side, or in the driver) that would let me use a generic
function instead of having my own implementation, either in the driver
or in how I've set up the dt side?
I got to this point by partially writing the third driver first, based
on that spacemit k1 driver's approach, so I might've blinded myself to
the correct/simple approach to things as a result of having to handle
the pincfg stuff etc in dt_node_to_map there.

Secondly, particularly if there's not some neat way to simplify things
in dt_node_to_map, should I merge the two drivers, at least partially?
They're effectively only different in their pinctrl_pin_desc and how the
regmap is generated in probe (from a syscon regmap versus
regmap_init_mmio). I've kept the bindings apart, as despite similarity,
they're really only similar due to simplicity.

None of this is in any sort of final state, it's either WIP in and off
itself or depends on other stuff that's not yet accepted, so please
excuse any build warnings etc.

Cheers,
Conor.

CC: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org

Conor Dooley (5):
  dt-bindings: pinctrl: add polarfire soc iomux0 pinmux
  dt-bindings: pinctrl: add pic64gx "gpio2" pinmux
  pinctrl: add polarfire soc iomux0 pinmux driver
  pinctrl: add pic64gx "gpio2" pinmux driver
  riscv: dts: microchip: add pinctrl nodes for iomux0

 .../microchip,mpfs-pinctrl-iomux0.yaml        |  77 +++++
 .../microchip,pic64gx-pinctrl-gpio2.yaml      |  74 +++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |  17 +-
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  56 ++++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |   1 -
 .../boot/dts/microchip/mpfs-pinctrl.dtsi      | 117 ++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   9 +
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   2 +
 drivers/pinctrl/pinctrl-mpfs-iomux0.c         | 252 ++++++++++++++++
 drivers/pinctrl/pinctrl-pic64gx-gpio2.c       | 283 ++++++++++++++++++
 11 files changed, 900 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic64gx-pinctrl-gpio2.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/pinctrl-mpfs-iomux0.c
 create mode 100644 drivers/pinctrl/pinctrl-pic64gx-gpio2.c

-- 
2.47.3


