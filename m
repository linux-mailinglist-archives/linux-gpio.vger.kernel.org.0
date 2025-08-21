Return-Path: <linux-gpio+bounces-24685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B667B2E996
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 02:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C329B683F6B
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 00:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC2F1E3DDE;
	Thu, 21 Aug 2025 00:45:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F561B4F0E;
	Thu, 21 Aug 2025 00:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755737144; cv=none; b=aj8Oao9yQUiq6xHa8GNRwdenNzhVIoz+0UkSOYcFIqtKWhcK74Lepn7UUtmGv3G/jLLPWhvEnuYvlcKsq/gnBU/1b8JanBKzHFQXHWXzsUgNUZ9nt+pqq9+S5mvaZtvZJlsZchf69+XCdVvnLnhxrXeCW9+NL3e9efu8w0P2KjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755737144; c=relaxed/simple;
	bh=AFXvlAwoLU5z3YJfxR7cTbix0/9LPU19KpOFnjR4sNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ne5cic/Gf01rj36r7FtWuxCEqz6+YU/0jfOf/CNRS6b4ubRbY/PrEwGVs3Z7uEyipFccOI1bdogBnF+HfOVQoEnFD7gh1cDL7L/ZyHAY/mOMcNk37a2uI8h+WgMBiUgRaSp3wz0f12t1POpWEkEeWwgnexWwKyblkwee8yNBR6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A454212FC;
	Wed, 20 Aug 2025 17:45:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEA5B3F63F;
	Wed, 20 Aug 2025 17:45:38 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu, 21 Aug 2025 01:42:23 +0100
Message-ID: <20250821004232.8134-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the pinctrl and GPIO IP in the new
Allwinner A733 SoC.
With all our abstractions and data structure driven code, life could
have been so easy, but Allwinner decided to change the layout of the
MMIO register frame, which requires all kinds of special handling and
code changes here and there. Hopefully this new layout (which admittedly
looks more future proof) will stay around for a while, but I am not
holding my breath on this.

In summary, the changes are:
- Each GPIO bank now occupies 128 bytes instead of just 36 or 48.
- PortA (not implemented on the A733) starts at offset 0x80, not at 0.
- The non-bank specific registers are moved into this gap at the
  beginning.
- There are two new registers per bank, to set or clear bits in the GPIO
  data register, to allow for single-write, lockless GPIO settings.
- The drive level register is moved (to make room for the set/clr regs).
- The IRQ registers are moved into the now bigger respective bank control
  registers part, instead of being grouped separately, as before.

The series follows the usual pattern of refactoring first, to prepare
for the new MMIO frame layout (patches 1-4), then using the changed code
to enable support for this new generation, in patch 5/9.
Patch 6/9 adds support for the one new feature of this SoC's pinctrl IP,
the lockless GPIO settings feature.
Patch 7/9 adds the new DT bindings, patch 8/9 enables the secondary
controller, which curiously is not using the new layout, but looks very
similar to the secondary A523 pin controller.
The final patch 9/9 then adds the driver stub file, which just describes
the GPIO bank configuration and lists the two quirk bits that engage the
code changes added for the new layout.

Based on v6.17-rc1.

I am marking this as RFC, as I don't have suitable hardware for testing.
Also I am not 100% convinced the IRQ number to pin mapping, as needed by
the new IRQ register location, works correctly.
Please have a look, check whether the changes look sane, and test it if
you have access to hardware.

A branch (together with the AXP318W PMIC code) is available at:
https://github.com/apritzel/linux/commits/a733-rfc

Cheers,
Andre

Andre Przywara (9):
  pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
  pinctrl: sunxi: pass down flags to pinctrl routines
  pinctrl: sunxi: only use PortK special handling on A523
  pinctrl: sunxi: refactor IRQ register accessors
  pinctrl: sunxi: support A733 generation MMIO register layout
  pinctrl: sunxi: add support for set/clear regs
  dt-bindings: pinctrl: add compatible for Allwinner A733
  pinctrl: sunxi: a523-r: add a733-r compatible string
  pinctrl: sunxi: Add support for the Allwinner A733

 .../allwinner,sun55i-a523-pinctrl.yaml        |  6 +-
 drivers/pinctrl/sunxi/Kconfig                 |  5 ++
 drivers/pinctrl/sunxi/Makefile                |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c |  3 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   | 51 +++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 85 +++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 76 +++++++++++------
 9 files changed, 169 insertions(+), 62 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c

-- 
2.46.3


