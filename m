Return-Path: <linux-gpio+bounces-16595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93485A451A9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 01:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7C1A3A606A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 00:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C481E148FE6;
	Wed, 26 Feb 2025 00:42:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181B1383A5;
	Wed, 26 Feb 2025 00:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740530533; cv=none; b=f7hgIp0set51F55HYK3TKazTN5CpzlfHhrpProVLGPVz3GWSTEsxvtwjPn+Ue64Af8mlza1PNcBqDpIsPASDctWKD+304uWXEDr1Vl+b+UcJ5+7KlWZNVZ8Yhh/sqpCZRUSXBLGR+Sgh4rKg1OGIPwdnT+2yK2MJ03ywfkK5BF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740530533; c=relaxed/simple;
	bh=UWPU2G9kLDNS6nKvBYXIylw9swDhkp6TjVyIYMZ2kAA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XegQiI1VWZlSjoEM2FCnReDzPVLjNmeQAJj8vMuBSKPYZhu4n0LyZwPzTjYTvrQ/KgEjoZF2+lck8zlr2Lqub/2wjeEg3ptSI7/UTTy+BFf2VWcv6dKry6EolAo29XdUbaaa9jRIE5kkZOYJq0+Td0zsnDUkn7y5fSC3vnxRtn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 42D0B343295;
	Wed, 26 Feb 2025 00:42:04 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
Date: Wed, 26 Feb 2025 08:41:16 +0800
Message-Id: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACxjvmcC/2XQTU7DMBAF4KtUXmNkj/+z4h6IRWyP04hSFyeNQ
 FXvjpMKSJTlWPqe38yNDFh6HEhzuJGCUz/0+VwH83Qg4dieO6R9rDMBBpJZsJQJ+s5pd+kz1dw
 nB8kxAYFUcCmY+q8l7PXtMRf8vNbM8fFIfDsgDfnjox+bg4gGomaiTa2Bmq0YR8eMRoyaI1OCC
 +EwWbLu0hxqE8WAm0eHMr8PNOVrCXg6UaustW0E7mLbTILMPY79MObyvew48aXIso5jcr3OxCm
 jmhlAjxhaZC8dnsecn3PplpwJ/iyvH2wsVAtWSpkiAA9xZ8XKgtpYMVvjvfFS8qhhZ+WvrScCv
 rF1Ayq15MGpwLiTO6v+7Xy0tVVLZy0wCDRem53VKwtiY3W10QPKNiImHjb2fr//AGAAuDhZAgA
 A
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4477; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=UWPU2G9kLDNS6nKvBYXIylw9swDhkp6TjVyIYMZ2kAA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnvmNMqLtiu2OxpFDZQX22A2YH993qpWDZMZ81I
 xst+pizDOCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ75jTF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277ZsND/9S2mioO4CNFsRhPU
 ucm7rw+lbP1rfXfp8FFlSa2Ot6SOvKNE4PoPpiOSymGsbgx1/DWV/LPPvo6sT9bam+n6y81iCmz
 rV/y/SOm5zfhubkwid5Gv2ix3vZeXTJF8sQ5UsN0KdxBp+1JgR1idnbCtg8B2mS7OEoLdTbFGry
 NqAOdsJUur1K1dB9K63nfN6gxBoqVtMq2mWnjRucKk8+a0/K/5eBSMuzWt4WklxmUj8R+3sCrOp
 jaAi4gAJSmZpwdmKJAJ3ZyQOq5FG+DUTrkKAtR5pQwGVqhH+xye6pKTuHT8+HnB3AnKFFaRyxkx
 roW7tptC38IPpUQhJmdNwgoPqqZd0izS7Xvud9DpRstwSgdUDMct4ff6Vgl9ZZq3D8HFHBqSZMC
 Ja8/SlDSQZPBl72+RfDvtURavZR4aqiHq9Tp4c/DGjN4LD2FnviKMeHeT8OZbx3G//8zKn0Gf7N
 Yc0u1L1SaxZLueV8TnxS02Y6ehY6IAahLhQAMtwOq0mZHs3K4/TJHyaDzNfsiLylFS54YPVc5hg
 YbHmSJcAoIdaPw4IfmCK24gCDQjcoOyqY2bsm8m/56ySxWv3uHDaT9Saf9mhLqFA8u4evxWJCH3
 o8r6TDtQoULiWFS+JUPq2R8fEU+NutsO1vYFSfZHbzqD1w7YTbO1rsB8LPX/2bJBj1Vg==
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

One problem is still not resolved, the interrupt cells parsing isn't correct.
but it works if request gpio irq via gpiod_get() + gpiod_to_irq()

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Link: https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org [4]
Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [5]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
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
Yixun Lan (4):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  79 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 ++
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 277 +++++++++++++++++++++
 7 files changed, 394 insertions(+)
---
base-commit: 3d72d603afa72082501e9076eed61e0531339ef8
change-id: 20240828-03-k1-gpio-61bf92f9032c
prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7

Best regards,
-- 
Yixun Lan


