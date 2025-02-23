Return-Path: <linux-gpio+bounces-16431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22902A40E86
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 12:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 108A91894A09
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 11:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EFC1FCCF6;
	Sun, 23 Feb 2025 11:50:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7EB1FCCF7;
	Sun, 23 Feb 2025 11:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311417; cv=none; b=lYm9r/MRlls/I6LnN92HpjAFvgijeJRNit2jk0Lr76RHGPiXr9NsI9B19ssjQAOf2RHJLL7qBtYDje/PPyg/aeQUSmCS3DXfYoOne3vgiKhIQ6Z3ad4HBh6nTKUGzLq8PHlHOmpiOF/5wTaLkX1Iu+wccGr5ygHtW6xLYilUt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311417; c=relaxed/simple;
	bh=3eCCx4Y0IbvgrAHrne90VeddDkI4NvjGwcjNSwycqT4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ad5M5VTrm2xns686/OGy9aarCQAcqUmzq1kRhjXt6UgR/QhmR8NoteP/Qw5EiEL2DMgD9eZN/w3uwg/E44m1Zi7qwKEAXgvL1h65ocW4H/i/L3/SWXA8ObaZe7Cz++LwXdKIQexbzj81uqalcEO+4xxzbyGbrLqUkQMD5mhIRMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A2057342FA9;
	Sun, 23 Feb 2025 11:50:08 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 0/4] riscv: spacemit: add gpio support for K1 SoC
Date: Sun, 23 Feb 2025 19:49:31 +0800
Message-Id: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEsLu2cC/2XQTU7DMBAF4KtEXmNkj/+z4h6IRWxPUotSFyeNQ
 FXvjpMKSNTljPQ9v/GVjFgSjqRtrqTgnMaUT3XQTw0Jh+40IE2xzgQYSGbBUiboO6fDOWWque8
 d9I4JCKSCc8E+fa1hr2/3ueDnpWZO9yXx3Yg05I+PNLWNiAaiZqLrOwM1WzGOjhmNGDVHpgQXw
 mFvybZL29QmigE39w5l2Y+0z5cS8HikVllruwjcxa6dOVl6HNI45fK93lhXS5H1HMfk9pyZU0Y
 1M4AeMXTIXgY8TTk/5zKsOTP8WV4f2FmoFqyUso8APMQHKzYW1M6KxRrvjZeSRw0PVv7a+kXAd
 7ZeQKWWPDgVGHfywap/u3za1qq1sxYYBBqvzc7ebrcfzIYGQR0CAAA=
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4121; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=3eCCx4Y0IbvgrAHrne90VeddDkI4NvjGwcjNSwycqT4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnuwtfg/am9C+hwF64sZ4DvTz/KGpjKdI7T/+j8
 fmHkIKFwHaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7sLX18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Vs3D/sFNIBtvDd+LTxtWW
 Rlqz2AXrdu8ZGOu00/lzbbZOSPCb3Hw77q7VpEB1zp7ArGZ5NgFGZ5sMs8sH+p/BzltNXKC5vko
 XFOFxJDsXV989LiqtQGpqoODq8hpRG2pZ01uBC3y7iDSyLZwENwvCHZ1YptHo7OtQp5WReW1Uxz
 lBiKWhAtYr4TjgPIg5WcLcAohxQiNBb/czIyr1AhOa5npt7RlPr9gusRv6jdcmMZlkzu/1rIXHC
 +Rz3z6FYpiLILtjF3haAcVbZHSO4tOJtYtqslEQ8WUpoMLxF+WivRUG5dOr5lnJOuIswLy6TVf2
 rTgJVg/OjdEhvHKJxQqM15gTMNU2QDy1PqSTI81VETFMz2PLwIfYLNKyrqpQMZ8fwtysQU6jcFs
 Hc2WIZXknaZ5RwtC3gT8cfmBMzyFz6TG7+Mym4cltuSMHNzt/kjzw3xAN2H3BADO2qohn7dJR2R
 B/AhuQXdnKwwm/Qv0HC9MMrJ61fwHZh7clp8Q/SPl4pzQJ6HYz8k3l+QuXTQPyAw7wVyh74OF1L
 5NFATEI7ZFeIepQKLhmmIyJeEdS4KjCPUaQIjw1LqSkdoPq4pJbZ+dlQCug2cuaDQNJdtQYa1YN
 48+Lc11EflehFYmD3FF2lx6P5Nwm/nYBRUed2YwGHE+s2OKBxrPYKjMEbzmrSRdvKxGA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The gpio controller of K1 support basic GPIO functions,
which capable of enabling as input, output. It can also be used
as GPIO interrupt which able to detect rising edge, falling edge,
or both. There are four GPIO ports, each consisting of 32 pins and
has indepedent register sets, while still sharing IRQ line and clocks.

The GPIO controller request the clock source from APBC block,
In this series, I haven't added the clock support, but plan
to fix it after clock driver is merged.

Due to first three GPIO ports has interleave register settings, some
resources (IRQ, clock) are shared by all pins.

The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]

Note, this patch is rebased to v6.14-rc1.

This patch series has been tested on Bananapi-F3 board,
with following GPIO cases passed:
 1) gpio input
 2) gpio output - set to high, low
 3) gpio interrupt - rising trigger, falling trigger, both edge trigger

This version should resolve DT related concern in V4, and register each bank as
indepedent gpio chip in driver, no more sub children gpio DT node needed.

One problem is still not resolved, the interrupt cells parsing isn't corect.
but it works if request gpio irq via gpiod_get() + gpiod_to_irq()

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Link: https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org [4]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
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
Yixun Lan (4):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  81 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 ++
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 277 +++++++++++++++++++++
 7 files changed, 396 insertions(+)
---
base-commit: 3d72d603afa72082501e9076eed61e0531339ef8
change-id: 20240828-03-k1-gpio-61bf92f9032c
prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v1
prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
prerequisite-patch-id: a166abd76d3f29768856440830c081bf40511a98

Best regards,
-- 
Yixun Lan


