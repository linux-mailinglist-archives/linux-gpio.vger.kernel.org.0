Return-Path: <linux-gpio+bounces-16126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D682A3838E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 530FF172E67
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 12:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5331621B905;
	Mon, 17 Feb 2025 12:58:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF152F5B;
	Mon, 17 Feb 2025 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797107; cv=none; b=HGZzMWOBDk4HAt7cDQD/ryLYjfrd+AtSUq2Xw9uaURQnULcBvA7QkXGX3Z/dzRa+folAuftl54Etcm9fZweNJWzDEfWxuc/j9zZMcJZHLp0wkZkL16Em0FisogX9AT9FzY3/yqdOAE8j0LPmhrjVeQCGqsBQXD2S7ULbAf31F1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797107; c=relaxed/simple;
	bh=q1aOfZVqMDouNDrWuVaUzkfmmvEdkbfTZjyFQLgn1Sw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hEyGlt9LYciEl/MfgV5Nn1pAmze3M8D5HHhHgBh450W3rFGBXfILCZcvusgGIxCutO6e2DL+aB/UGHmZ/Kf4jIC9O2CkmLn2JVNMoszFwm6srj4pkkmlaoDN2r7RGGyMGqqD6TY5xn2mfki8jnQF1SZg8nGv7AX4B4hfdVVGnXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 78B4A343069;
	Mon, 17 Feb 2025 12:58:18 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v5 0/5] riscv: spacemit: add gpio support for K1 SoC
Date: Mon, 17 Feb 2025 20:57:43 +0800
Message-Id: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEcys2cC/2XPQW6DMBAF0Ksgr+tqZmxsnFXvUXUB9phYVXACF
 LWKuHsdolZBWf6R3tefq5h4TDyJQ3UVIy9pSnkooX6phD+2Q88yhZIFAWloqJGg5CfK/pyyNNh
 FR9GBIi8KOI8c0/dW9v5xzyNfvkrnfD+Krp1Y+nw6pflQqWApGFBtbC2V7hqQHVjDHAwy1AqVc
 hwbces6pmnO48+2c8GtbJvkQD9OWlCCNGCJO2bfMrz1PMw5v+ax33oW+rdI6HaWiqVGax0DEfr
 wZNWDpXpn1c3arrOd1hgMPVn9Z8ubhDtbPpDaaPSu9oBO7+y6rr9SpKuxpQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3376; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=q1aOfZVqMDouNDrWuVaUzkfmmvEdkbfTZjyFQLgn1Sw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJW6w/KgwwZgBNmPAPOycUH2Qxkc+3vi3ZaP
 JSoRcMNBXyJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyVl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WEhEACLcAfqpL5B6tHAOl
 U14SGmtOnMlrgKiBr4fNU2zuSjN604606hKfN8LRHBk+6KMdrix0adaP9K0Ik7f9IrSAf56/Grm
 gBti9Cz4M2DD020XPJC1KkftX9YGozwz0J7/PHkTCMel2ydfCbauBl7jIH1f7MvscDFwRDchQ3Y
 W6a+bgC0+tJBUP76FaL5uGaHaRknoSTCJMSluILFRTCnMAKG3R4Z+qFYPxDvEs1BDC+ip+xL8w9
 2qsxh6d42BHtFrHxtBrRPNsf2O67d8Bon1P3uk1e7WMltFjExyNOJhYiPYmzRWPxStrPinBmTKu
 g/6u00SoRYWoAH3jvUmVEVgpk2md8X8qU2mrof611Ou7ctYGtXWTFPc5EAv7YmBPjULYlDkk8Xe
 6QyybGmNKX1cahNNn5Z2cqGjvGxHe02j0hLUSGXPgZ+COKuWZ7NfRP+JfzZtbOU6wBEs2Q03ZY1
 jCSjISoyAqD2e5LsJ/wceOaWvGdGNU4CJJYVqHzZYZNaJwMucL4wAApMBXKSe9E5HfaQWd7w44a
 Xi4dYmAhnm1ta0/lfqh/l+lZAEhxT+byyPBKd5QXQLrPiKemIx+Ei1bwzVdgzIMOJOKMZ0vOx1E
 gZSSWY/v7ogbrSAy+aPbbk6l4TYjRO740JhbVhZt1okVQ698A5llZd15h45/mt6nQffg==
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

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
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
      gpio: of: support to add custom add pin range function
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  81 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 +
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 376 +++++++++++++++++++++
 drivers/gpio/gpiolib-of.c                          |   5 +-
 include/linux/gpio/driver.h                        |   7 +
 9 files changed, 506 insertions(+), 1 deletion(-)
---
base-commit: 3d72d603afa72082501e9076eed61e0531339ef8
change-id: 20240828-03-k1-gpio-61bf92f9032c

Best regards,
-- 
Yixun Lan


