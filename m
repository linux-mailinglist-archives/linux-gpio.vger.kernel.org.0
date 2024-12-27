Return-Path: <linux-gpio+bounces-14287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E01789FD44D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 14:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B7691602B2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 13:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE691F37AB;
	Fri, 27 Dec 2024 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="oiMun6aA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DC1F2C38
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735304490; cv=none; b=YWClu83SqndzMGy1C/DH/RRBXzGIXYgFXzjlVvjX8fEAbyT28KmSJcqyVgyia9RLVUl3XH0nRIZtuOy7xukI9EQKC1hFf1/5L/2dtUmLWqs2KcdeL0KmEY5VKuRHtOakvplR2x40mew+nFm48i6gcbocEDbIQnxfxLorJbjKaOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735304490; c=relaxed/simple;
	bh=s6pgeYhBovYKLxAfzogU3RAM9N8F/zvXTKruRhJeLms=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t7g8y2BvjrSgvV2od8Gg2GbriRciSE+U0jYK6lGRGqfi0HhvyqDLj2wPe34+NRHNeFlH63HMgRPtgic3BJoSRzkJaA7zNLSALkTPJzS8+qE0cSMSUDrrkp9O5mi5pX0Kg9Dia31iGKNG3gpdYUwXvL9qjWsZItpHbzOjUT7tvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=oiMun6aA; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
	by cmsmtp with ESMTPS
	id R46ot0ajdrKrbR9y3tXKCY; Fri, 27 Dec 2024 13:01:27 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9xztlei5ENo2R9y1tIr0k; Fri, 27 Dec 2024 13:01:25 +0000
X-Authority-Analysis: v=2.4 cv=ROK1HZi+ c=1 sm=1 tr=0 ts=676ea525
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=vU9dKmh3AAAA:8 a=RKcyukLPUNyM5a_w4rQA:9 a=QEXdDO2ut3YA:10
 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Qi3UoCUDEqcy6/oiO96EhEgtnu7BnyUeV/rid1HTKPw=; b=oiMun6aAJKc2QS/GfxGw3ZpAbo
	eqt4pnCoOOcSOcaeI0P6kujVagUlispeJfo87tz4QroK92xHf66VXCikwKNVeRRM362Wq7OxeQoeh
	E1yTCzQbqlNCXfqwKn42U7JkHmZ6L8OX8yGF9tvVz7DJi0D1oePsEPivLWatej12oSvjcE2D9TY3L
	p260RycW0eU3fbz5AvZgfhR3/FedkFVYbVQXVm8DnYC11xpiJ293WKam4I6AtGakz9LXeMuFU3Rk8
	5INQdz4uTivaF1TZ3eEW8hz/0OVnZszBiih27bwu+VVWDJ45H4d0OMHK5VDE143g5utDRMNzf7Ztq
	rk5F7Umg==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9xq-002EaQ-22;
	Fri, 27 Dec 2024 18:31:14 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Subject: [PATCH RESEND 00/22] Add support for A100/A133 display
Date: Fri, 27 Dec 2024 18:30:49 +0530
Message-Id: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304468; l=4037;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=s6pgeYhBovYKLxAfzogU3RAM9N8F/zvXTKruRhJeLms=;
 b=rUdWVAf2EzUVnilFnmP394/5gRG3wuQ4qZKiArbTwORd7JREQHwjrpu+VM2LSswVY088RCvTX
 WqUG9bY0lJXCf7KJwRg9jmbIdsLD9nBHg6tLQw1PtNvmCAY0Mhmq7SE
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9xq-002EaQ-22
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 10
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI5lKk+jhylsmcX1aGJVuYwQknZOHjxfRZ9MKb4zHztx04H++xZUOW1wEZWMp2MefP3MzbH4xsWNOomcHjrF6YCCxB5NX8W9f9wJ8YcDtADXma/3oNyt
 hEduTut4d5yACGkAc7q0QbiDRt8MYR4y7eoLnRsLmdrvZsDhzCxt2E29CGEZvn4D48AZ0tIEYsr61hsTvk4AhGgl3Ap/MvZOZTQ=

This series depends on [1] for the eMMC/MMC controller to work and
[2] (lined up for 6.14) which adds support for the sram nodes and
display engine extends it's usage. Idea of this series to get initial
feedback and adjust, which will be rebased for 6.14 once [2] is merged.

This patch series adds support for A133 display pipeline based on
LVDS. dt-bindigs are organized in the start and later with code
changes.

PHY is shared between DSI and LVDS, so to control the PHY specific
to DSI/LVDS, phy_ops set_mode is introduced. To enable the DSI
using set_mode, analog control register MIPI Enable is used, which
may not be available for A31 (shares the same driver).

Otherwise, A133 also got hidden independent display engine i.e
mixer + tcon top to handle parallel display. But this patch series
adds only support for the 1 mixer which is documented.

[1]: https://lore.kernel.org/linux-sunxi/20241109003739.3440904-1-masterr3c0rd@epochal.quest/
[2]: https://lore.kernel.org/linux-sunxi/20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest/

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
Parthiban Nallathambi (22):
      dt-bindings: iommu: sun50i: remove resets from required property
      dt-bindings: display: sunxi: Add a100/a133 display engine compatibles
      dt-bindings: clock: sun8i de2 clock: Add PLL com clock
      dt-bindings: clock: sun8i de2 clock: Add a100/a133 compatible
      dt-bindings: display: sun4i: add phy property
      dt-bindings: display: sun4i: add a100/a133 tcon lcd
      dt-bindings: vendor-prefixes: Shenzhen Baijie Technology
      dt-bindings: arm: sunxi: document Szbaijie A133 helper board
      iommu: sun50i: make reset control optional
      pinctrl: sunxi: add missed lvds pins for a100/a133
      drm/sun4i: Add support for a100/a133 display engine
      drm/sun4i: Add support for a100/a133 mixer
      drm/sun4i: make tcon top tv0 optional
      drm/sun4i: add a100/a133 tcon top quirks
      clk: sunxi-ng: sun8i-de2: add pll-com clock support
      clk: sunxi-ng: sun8i-de2: Add support for a100/a133
      phy: allwinner: phy-sun6i-mipi-dphy: add LVDS support
      drm/sun4i: tcon: add a100/a133 lcd controller support
      arm64: dts: allwinner: a100: add iommu
      clk: sunxi-ng: add missing pll-com binding
      arm64: dts: allwinner: a100: add display pipeline
      arm64: dts: allwinner: a133: add szbaijie helper board

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   6 +
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml        |   6 +
 .../allwinner,sun4i-a10-display-engine.yaml        |   2 +
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml |   7 +
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml    |   1 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml      |  17 ++
 .../bindings/iommu/allwinner,sun50i-h6-iommu.yaml  |   1 -
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 165 ++++++++++++++++++
 .../dts/allwinner/sun50i-a133-helper-board.dts     | 129 ++++++++++++++
 .../dts/allwinner/sun50i-a133-helper-core.dtsi     | 190 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               |  23 ++-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  23 +++
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  13 ++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c             |  42 +++--
 drivers/iommu/sun50i-iommu.c                       |   2 +-
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c        |  23 ++-
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c        |  12 ++
 include/dt-bindings/clock/sun50i-a100-ccu.h        |   1 +
 21 files changed, 645 insertions(+), 22 deletions(-)
---
base-commit: 6c086b91df8c6619239c6d6d6cbf6ae50da6c110
change-id: 20241126-a133-display-support-ab43af32180a

Best regards,
-- 
Parthiban Nallathambi <parthiban@linumiz.com>


