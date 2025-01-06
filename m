Return-Path: <linux-gpio+bounces-14540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA73A02E2F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 17:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A3063A20E0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 16:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCD470824;
	Mon,  6 Jan 2025 16:48:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB8A8634A
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jan 2025 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182106; cv=none; b=BEv6iJOFnD9NtRQgPs5VsbUyvCI1dNd43ayFxc0QnAzH7U5L/XB1iDdKgWjf07SyXYmWHPjxYR3JfFMWrxone4LvoDrHalOuclm7S0FUawA6slD6e4uRMtERtc6Ds3fCXwLJyD2lWu2+smWkriDRiuF8bwBYswnOrQPuPo6nol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182106; c=relaxed/simple;
	bh=AOmk896rBr6SSsGaT1y+NvZGPZyMcfKIj8NYBRQRVkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lwE/Ms7sIcyekp7pbT5b1n+1YGcKXg6i1P7RBLHqGNKiCk3yD+sto2V3J1oQRR8Y/qi8Q+eD1jH94+inP3bjFjCf3bffDu/vElKE9+Hl8mHm663eCX/tbw9soCEwN4TfZY+6xeis0PuaMqmsIU37Bn/kwhh7ZAbDRf3dtfxDiEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4YRg2F3C0fz4x2cb
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2025 17:42:13 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by albert.telenet-ops.be with cmsmtp
	id xsi52D00T3AZZFy06si5tj; Mon, 06 Jan 2025 17:42:05 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqB0-00000008NU8-47Cc;
	Mon, 06 Jan 2025 17:42:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqB3-00000004Ya5-2SOW;
	Mon, 06 Jan 2025 17:42:05 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.14 (take two)
Date: Mon,  6 Jan 2025 17:42:04 +0100
Message-ID: <cover.1736181260.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 03fc60cd8e7b7e6f330d0a48c54545740addd9d8:

  pinctrl: renesas: rzg2l: Add audio clock pins on RZ/G3S (2024-12-20 10:58:46 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.14-tag2

for you to fetch changes up to 829356da700bbe07e13b4403997bf8c5aac64660:

  pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC (2025-01-03 21:09:19 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.14 (take two)

  - Add support for alpha-numerical port references on the RZ/V2H SoC,
  - Add support for the RZ/G3E (R9A09G047) Soc.

Note that this includes DT binding and binding definitions for the
RZ/G3E and RZ/V2H SoCs, which are shared by DT source files and drivers.

Thanks for pulling!
----------------------------------------------------------------
Biju Das (7):
      dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
      dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II EVK
      dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
      dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
      dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
      pinctrl: renesas: rzg2l: Update r9a09g057_variable_pin_cfg table
      pinctrl: renesas: rzg2l: Add support for RZ/G3E SoC

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag2' into renesas-pinctrl-for-v6.14
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag2' into renesas-pinctrl-for-v6.14

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |  15 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   7 +-
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  17 ++
 drivers/pinctrl/renesas/Kconfig                    |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 186 ++++++++++++++++++++-
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |  21 +++
 .../pinctrl/renesas,r9a09g047-pinctrl.h            |  41 +++++
 .../pinctrl/renesas,r9a09g057-pinctrl.h            |  31 ++++
 8 files changed, 305 insertions(+), 14 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

