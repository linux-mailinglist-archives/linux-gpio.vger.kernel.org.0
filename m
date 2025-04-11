Return-Path: <linux-gpio+bounces-18721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6086A86932
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 01:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29D0118949D4
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 23:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3505E2BEC2A;
	Fri, 11 Apr 2025 23:32:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1DC1EFF9F;
	Fri, 11 Apr 2025 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414334; cv=none; b=h/35US7BKg2bJaa/iaXDshjheGM/nESjTaH+3yUfb8l1XoNU+AhJmpJgMKUpnxDRcAavoc9L1JVUEHZ1BbssXNOTuAc53/kqyH1szCPpWzU83ocomVH3QuXgXW4Vd0EWopmlswdJz7ddP9ngQe6G1w7Us5FAnnYVy54075OytNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414334; c=relaxed/simple;
	bh=tTzOu/qOPiuxlaKSmt+fjkB9ogmKirxMdHhZ/YuH0pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DR9ArdidcnIeZUdp0YgrUxNF4M4e3JX2RCmYVX+3SryYdkbKyg2FweM9e9cJEO0pr8JzTfewxdD2HNlfqS4vxb/xO1zOkkTlXJWPS3UvHfHvD+lSw2TOWT+GaP1MYkYVJGsR82BsaGBV74atwuwTgZd+f06j9Cgka3R7FE5MXwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8D81A343217;
	Fri, 11 Apr 2025 23:32:05 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v8 0/5] riscv: spacemit: add gpio support for K1 SoC
Date: Sat, 12 Apr 2025 07:31:27 +0800
Message-Id: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+m+WcC/2XPTU7DMBAF4KtUXmPkGU8cuyvugVj4Z5JaqE1JQ
 gSqcnfcVECiLJ+l783zTQzcZx7E8XATPU95yN2lBPt0EPHkLy3LnEoWqJCURSuVlu8g22vupIH
 QOGyc0hhFAdeem/y1lL2+PXLPH5+lc3w8iuAHlrE7n/N4PCjfYGMCQyC0oG0VDNgYrPHJkeHES
 VnnoxX3rlMexq7/XnZOsJQtk5yi9aQJpJJG1ciBOXpWLy1fxq577vp26ZnwzwKC21gsFi0RNQk
 RYtpZvbJYbay+2zqEOhBBMriz9GsrVQ5vbPmBJEMQXRUVONrZ6t8i1BtbLZuN5qi5DqbeWbOyq
 DfWFJsCMvnE3EDc2XptzcaWFTIwWRfJG+XCxs7z/AMW/D4GWQIAAA==
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5118; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=tTzOu/qOPiuxlaKSmt+fjkB9ogmKirxMdHhZ/YuH0pk=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZh6GBQ+daLPl1arSZPkAkS5q/c/IZy64T2A
 csCo2UBb8GJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mmYV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UMqD/42g06a10nxi1PbS2
 mfucplIsWBrNBpuDrbZ2R3BekO32v0lVDQnx//klWFjxUK1WtB4keHZZISsdfWEOOzQOEZwKXPg
 zZwOnbhqZzCKcUiHvVm2z076CP6KDy7zvM3NT5us6l185hqobBLoie9vKWyt9NpqclmUvNOdLcK
 D7q18Pc9NBTZsMkutVniqsL8q4IDpJL4KPbmp3X1N7e6uX8Mk2ZmK85Zh92mXM8inQ+uYQURKre
 8USh2IbeD424G2hpoNcPq++GBIkTZJsOYQFGAvdrI78UFPVDzPcqooPITtArQBoVjPHYxMk2oiZ
 BhdPT8h2tqHTztVcA9hUNFM2l48xypu/2RpLhMM7pfO4bHy1z/JSqMgihQmAOmloMAE9akMuN66
 McLoHXV97qn7/pMA/QTCv0KpRn7TExiMZiWUESsDawoeJCMbLtIyDzyrzLRK2eASpZz1cfLyzSN
 u+bPBNZ5yoDAUpaS17lqIiUMBJeMSqCf6kiOtPDQ5j5wVuX0QH6BLa71QdB04TUHI7pyqZKJykQ
 f5G8Kw+3I1p4UKdaf+DK2Ff6il+/yU8WaSsoYbUpZzT4csOI36095CVx0lTTn/TOCkHrrHd3QE3
 3vPfnbAKipgnsdTJeItVMYZcH7jn7wxjGkwDf4fD7N4NcPjSz+8rZ1xDoiiS+ZQMiQkg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The gpio controller of K1 support basic GPIO functions,
which capable of enabling as input, output. It can also be used
as GPIO interrupt which able to detect rising edge, falling edge,
or both. There are four GPIO ports, each consisting of 32 pins and
has indepedent register sets, while still sharing IRQ line and clocks.
The GPIO controller request the two clock sources from APBC block.

Due to first three GPIO ports has interleave register settings, some
resources (IRQ, clock) are shared by all pins.

The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]

This patch series has been tested on Bananapi-F3 board,
with following GPIO cases passed:
 1) gpio input
 2) gpio output - set to high, low
 3) gpio interrupt - rising trigger, falling trigger, both edge trigger

This version should resolve DT related concern in V4, and register each bank as
indepedent gpio chip in driver, no more sub children gpio DT node needed.

Please notice in this version, the reset property is added, but optional.
as I see no need to activate it in driver, instead I suspect it may
break cases if bootloader did some prerequisite settings, so I'm leaving
it for future implementation if really necessary.

The DT part (patches 4, 5) has no clock property populated which result
some DT warnings, I will fix it and re-spin the DT part once clock driver merged,
so it's included here for completeness only, please ignore these warnings.

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Link: https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org [4]
Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [5]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v8:
- rebased to v6.15-rc1
- adjust dt-binding/code to request clocks
- add reset property
- call irq_domain_update_bus_token() to support threecells interrupt mode
- use devm_platform_ioremap_resource(), so drop "struct resource"
- fix Kconfig
  - select GPIO_GENERIC as calling bgpio_init()
  - change to tristate, make it possible to build as module
- adjust defconfig to enable gpio 
- Link to v7: https://lore.kernel.org/r/20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org

Changes in v7:
- dt-binding: fix 80 column, drop unneeded dependencies
- tested with patch v3 of "gpiolib: of: Handle threecell gpios" [5]
- collect review tags
- Link to v6: https://lore.kernel.org/r/20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org

Changes in v6:
- rebase to threecell gpio patch which proposed by LinusW at [4], 
  drop unneeded *xlate(), *add_pin_range() function
- add SPACEMIT prefix to macro
- adjust register comments
- drop 'index' member, instead calculate from offset
- add IRQCHIP_SKIP_SET_WAKE as gpio doesn't support irq wake up
- drop #ifdef CONFIG_OF_GPIO
- move interrupt mask disabling/enabling into irq_*mask()
- Link to v5: https://lore.kernel.org/r/20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org

Changes in v5:
- export add_pin_range() from gpio core, support to add custom version
- change to 3 gpio cells, model to <bank number>, <bank offset>, <gpio flag>
- fold children DT nodes into parent
- Link to v4: https://lore.kernel.org/r/20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org

Changes in v4:
- gpio: re-construct gpio as four independent ports, also leverage gpio mmio API
- gpio interrupt: convert to generic gpio irqchip
- Link to v3: https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org

Changes in v3:
- dt: drop ranges, interrupt-names property
- Link to v2: https://lore.kernel.org/r/20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org

Changes in v2:
- address dt-bindings comments, simplify example
- rebase to 6.13-rc3 
- Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org

---
Yixun Lan (5):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: defconfig: spacemit: enable gpio support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  96 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 ++
 arch/riscv/configs/defconfig                       |   1 +
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 293 +++++++++++++++++++++
 8 files changed, 429 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20240828-03-k1-gpio-61bf92f9032c

Best regards,
-- 
Yixun Lan


