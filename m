Return-Path: <linux-gpio+bounces-17206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B4A55B34
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 00:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91B21889B32
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 23:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4D227E1A6;
	Thu,  6 Mar 2025 23:58:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC5D200BB2;
	Thu,  6 Mar 2025 23:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305519; cv=none; b=Gc2bK0SoQUjYq2Akemx+RSHhHSPINELX4c6fRPLNydhINj4dgwEUHyEg8q+/hOiSRl7VxHIDMO4jO4F0AXme6xifPxnEvfffKAe+0l7+OE+mr6dfciNOqHe+e5R7cJ5LHgRnj83WV25pNOR/e7j9EloDSEDksGQ9Ejx11eYPQng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305519; c=relaxed/simple;
	bh=UlwhL4IbOzjVCfiEuTleJhadOK/7RXehR63c0lmXxUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3ox2q3Na9KGdfWiMRchsqD2sw671xRLt36eBoTKlWdoopLFXvp6sGkJpyFIZi2IooGCyTvLXXR44S8cYl4qaXZ5wxEj4f+0ZFdSO3SeuINoZTiBGU2tcMipEsBWKsDfdKKwdugmqt6TfBAZSsRCftOoDcb4oLd/Lnao5AWRtkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06F27169E;
	Thu,  6 Mar 2025 15:58:49 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D3D33F673;
	Thu,  6 Mar 2025 15:58:34 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/8] pinctrl: sunxi: Add Allwinner A523 support
Date: Thu,  6 Mar 2025 23:58:19 +0000
Message-ID: <20250306235827.4895-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is the fourth drop of the series introducing pinctrl support for the
Allwinner A523 family of SoCs (comprising A523, A527, T527, H728). [1]
This time only a small fix, spotted by Jernej, thanks for that. Also
adding the new tags. Changelog below.

==============
The first four patches extend the sunxi pinctrl core code to deal with
some specialities of the new SoC: it uses every of the 11 possible banks
except the first one, which required some register remapping. The first
patch here is some cleanup, which we should take regardless, I think,
since it fixes some hack we introduced with the D1 support.

The main feature is actually patch 5, which introduces a new way to
express the required pinmux values for each function/pin pair. 
Traditionally, we dumped a rather large table of data into the (single
image!) kernel for that, but this approach now puts that value into
the DT, and builds the table at runtime. This patch was posted twice
before [2][3], the last time LinusW seemed to be fine with the idea,
just complained about the abuse of the generic pinmux property. I changed
that to allwinner,pinmux now.

The rest of the patches are the usual suspects: the two files for the
two pinctrl instances of the new SoC (now very small), and the DT
binding.

Based on v6.14-rc1. Please have a look, review and test!

Cheers,
Andre

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3
[2] https://patchwork.ozlabs.org/project/linux-gpio/cover/20171113012523.2328-1-andre.przywara@arm.com/
[3] https://lore.kernel.org/linux-arm-kernel/20221110014255.20711-1-andre.przywara@arm.com/

Changelog v3 .. v4:
- fix mixed up POW_MOD_SEL registers
- add review tags (with thanks!)

Changelog v2 .. v3:
- rename POW_MOD_SEL symbol
- drop CCU binding header inclusion in DT binding example
- add review tags (with thanks!)

Changelog v1 .. v2:
- rebased on v6.14-rc1
- extend regulator array to cover PortK as well
- increase number of pins in A523 PortJ from 18 to 28
- extend comment for new pinctrl DT code
- move DT binding into separate yaml file
- Add Jernej's Reviewed-by (with thanks!)


Andre Przywara (8):
  pinctrl: sunxi: refactor pinctrl variants into flags
  pinctrl: sunxi: increase number of GPIO bank regulators
  pinctrl: sunxi: move bank K register offset
  pinctrl: sunxi: support moved power configuration registers
  pinctrl: sunxi: allow reading mux values from DT
  dt-bindings: pinctrl: add compatible for Allwinner A523/T527
  pinctrl: sunxi: Add support for the Allwinner A523
  pinctrl: sunxi: Add support for the secondary A523 GPIO ports

 .../allwinner,sun55i-a523-pinctrl.yaml        | 175 ++++++++
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   3 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |   6 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  54 +++
 drivers/pinctrl/sunxi/pinctrl-sun5i.c         |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c     |   8 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c     |   7 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c      | 374 ++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |  54 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         |  47 ++-
 13 files changed, 758 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c

-- 
2.46.3


