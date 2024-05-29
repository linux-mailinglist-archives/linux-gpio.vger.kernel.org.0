Return-Path: <linux-gpio+bounces-6813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1820E8D32F7
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 11:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9908B24039
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72B016D304;
	Wed, 29 May 2024 09:29:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C168F169AE6
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974987; cv=none; b=t9gt65Inb3gOgpYFIj5i9sqzaduLIXPJsRsDjn44Oh8uXwvnpLL2TGZDxEmuduNn1Yt5ClAs159fvHIBNpYidWlWmiYqvyFgQJE66xw3t8gem2pe41Fsg4OxJBtv/YoF/HsPkB7TRQuyvF2SfW41bLoB+Juvj40iCaqN09QVwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974987; c=relaxed/simple;
	bh=QyuN3vISd+DA2AWJ6hBlRZkAmE02Tdzp480T8yTS3Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DL3wXSn9s9PNwPiho28iOeSMmicvgeRG18VShs1VW3EOdsbkx0Ngb0365aXDhhMV+GWwZdxf+XxhTzaS+4Euhw59E2nDoKu1V5cUTwutZbMvRiErW64kLO6+m8UXZuuYkdtg8Ud/qUkgW9XCvK1/72U/M3vT4U7sKk7horCoGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by andre.telenet-ops.be with bizsmtp
	id UxVg2C00T3VPV9V01xVgq9; Wed, 29 May 2024 11:29:43 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFbt-00GHKa-Vo;
	Wed, 29 May 2024 11:29:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFcq-008wRr-Bz;
	Wed, 29 May 2024 11:29:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/8] Add R-Car fuse support
Date: Wed, 29 May 2024 11:29:29 +0200
Message-Id: <cover.1716974502.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

R-Car Gen3/Gen4 SoCs contain fuses indicating hardware support or
hardware parameters.  Unfortunately the various SoCs require different
mechanisms to read the state of the fuses:
  - On R-Car Gen3, the fuse monitor registers are in the middle of the
    Pin Function Controller (PFC) register block,
  - On R-Car V3U and S4-8, the E-FUSE non-volatile memory is accessible
    through a separate register block in the PFC,
  - On R-Car V4H and V4M, the E-FUSE non-volatile memory is accessible
    through the second register block of OTP_MEM.

This patch series adds support for all 3 variants.  It provides an
in-kernel API to read the fuses' states, as well as userspace access
through the nvmem subsystem and sysfs:
  - R-Car Gen3:    /sys/bus/platform/devices/rcar_fuse/fuse/nvmem
  - R-Car V3U/S4:  /sys/bus/platform/devices/e6078800.fuse/fuse/nvmem 
  - R-Car V4H/V4M: /sys/bus/platform/devices/e61be000.otp/fuse/nvmem 

This has been tested on R-Car H3 ES2.0, M3-W and M3-W+, M3-N, V3M, V3H
and V3H2, D3, E3, V3U, S4-8 ES1.0 and ES1.2, V4H, and V4M.

For SoCs where E-FUSE is accessed through the PFC, it is not clear from
the documentation if any PFC module clock needs to be enabled for fuse
access.  According to experiments on R-Car S4-8, the module clock and
reset only impact the GPIO functionality of the PFC, not the pinmux or
fuse monitor functionalities.  So perhaps the clock/power-domains/resets
properties should be dropped from the DT bindings and DTS, as well as
the Runtime PM handling from the driver?

Changes compared to v1[1]:
  - Drop RFC state and broaden audience,
  - Fix typo in one-line summary,
  - Add Reviewed-by.

Thanks for your comments!

[1] https://lore.kernel.org/r/cover.1714642390.git.geert+renesas@glider.be

Geert Uytterhoeven (8):
  dt-bindings: fuse: Document R-Car E-FUSE / PFC
  dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
  soc: renesas: Add R-Car fuse driver
  pinctrl: renesas: Add R-Car Gen3 fuse support
  arm64: dts: renesas: r8a779a0: Add E-FUSE node
  arm64: dts: renesas: r8a779f0: Add E-FUSE node
  arm64: dts: renesas: r8a779g0: Add OTP_MEM node
  arm64: dts: renesas: r8a779h0: Add OTP_MEM node

 .../bindings/fuse/renesas,rcar-efuse.yaml     |  55 +++++
 .../bindings/fuse/renesas,rcar-otp.yaml       |  38 ++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |   8 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |   8 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   5 +
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |   5 +
 drivers/pinctrl/renesas/core.c                |  18 ++
 drivers/pinctrl/renesas/pfc-r8a77951.c        |   2 +
 drivers/pinctrl/renesas/pfc-r8a7796.c         |   4 +
 drivers/pinctrl/renesas/pfc-r8a77965.c        |   2 +
 drivers/pinctrl/renesas/pfc-r8a77970.c        |   2 +
 drivers/pinctrl/renesas/pfc-r8a77980.c        |  14 +-
 drivers/pinctrl/renesas/pfc-r8a77990.c        |   2 +
 drivers/pinctrl/renesas/pfc-r8a77995.c        |   2 +
 drivers/pinctrl/renesas/sh_pfc.h              |   4 +-
 drivers/soc/renesas/Kconfig                   |   8 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rcar-fuse.c               | 201 ++++++++++++++++++
 include/linux/platform_data/rcar_fuse.h       |  11 +
 include/linux/soc/renesas/rcar-fuse.h         |  41 ++++
 20 files changed, 429 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
 create mode 100644 drivers/soc/renesas/rcar-fuse.c
 create mode 100644 include/linux/platform_data/rcar_fuse.h
 create mode 100644 include/linux/soc/renesas/rcar-fuse.h

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

