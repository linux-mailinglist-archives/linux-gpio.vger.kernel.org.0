Return-Path: <linux-gpio+bounces-8121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED6492B60F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 13:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79618284B2B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 11:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91A2156F45;
	Tue,  9 Jul 2024 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="hXXnOM5p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D531208B0;
	Tue,  9 Jul 2024 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522912; cv=none; b=bxEx3xo29k9EMy6ob5yNWcbXBi+Bv2ufGNhNnhs26jrbXD+6787MZrnLHbx46Jy6kcmH59v1blhTfVzicPtqrFBRsXXf6pw5IBjW1l8wzMoYTpiubW/Z7KnWV7rWSinHFBvezHSwWk9V9Wa7ya5X0Rbq6uLJlEGlcQ5w5ngWO0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522912; c=relaxed/simple;
	bh=8EmcdkkE0oYTAYdtdr5zNdvUUpmSvtRnsxWuk/O4hkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vb1amhtyFVdyItfGkc2oXKzjomOMCwcBqPnYvGoY4UhPdl2XL7RuZAK/Z5hJsAOXthKl43Nao1ws90FE3FumjzEfCfIZk4Px6K2ojRaFxLNGqf7D0DRjXpwVudr8OxJ/T1i12fSRZz0EV2dMTABGGJ0tCr+lEcKZ3kRA+TqHxw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=hXXnOM5p; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
From: Huang-Huang Bao <i@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1720522497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f/I3Vjm8cEq2ZeTlVvfzwsec4AJR5wa4TlSZ79HvmRk=;
	b=hXXnOM5pURRKMcaz1BuylPpxtLsSgiW29cfj5UI9EfWqUgfbHBWDipLEsXQxkHZajqgq/9
	/z4O6xvH/jZiofPvAKDzi4j0wC1RJUypDGeIuo3XKhOH7aBM2SB5RLnfffkwTiQ7VA0i8q
	N58KAUdO386ccj+s9wqtXiJNkAc72PA=
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Kojedzinszky <richard@kojedz.in>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang-Huang Bao <i@eh5.me>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: rockchip: correct RK3328 iomux width flag for GPIO2-B pins
Date: Tue,  9 Jul 2024 18:54:28 +0800
Message-ID: <20240709105428.1176375-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The base iomux offsets for each GPIO pin line are accumulatively
calculated based off iomux width flag in rockchip_pinctrl_get_soc_data.
If the iomux width flag is one of IOMUX_WIDTH_4BIT, IOMUX_WIDTH_3BIT or
IOMUX_WIDTH_2BIT, the base offset for next pin line would increase by 8
bytes, otherwise it would increase by 4 bytes.

Despite most of GPIO2-B iomux have 2-bit data width, which can be fit
into 4 bytes space with write mask, it actually take 8 bytes width for
whole GPIO2-B line.

Commit e8448a6c817c ("pinctrl: rockchip: fix pinmux bits for RK3328
GPIO2-B pins") wrongly set iomux width flag to 0, causing all base
iomux offset for line after GPIO2-B to be calculated wrong. Fix the
iomux width flag to IOMUX_WIDTH_2BIT so the offset after GPIO2-B is
correctly increased by 8, matching the actual width of GPIO2-B iomux.

Fixes: e8448a6c817c ("pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins")
Cc: stable@vger.kernel.org
Reported-by: Richard Kojedzinszky <richard@kojedz.in>
Closes: https://lore.kernel.org/linux-rockchip/4f29b743202397d60edfb3c725537415@kojedz.in/
Tested-by: Richard Kojedzinszky <richard@kojedz.in>
Signed-off-by: Huang-Huang Bao <i@eh5.me>
---

I have double checked the iomux offsets in debug message match iomux
register definitions in "GRF Register Description" section in RK3328
TRM[1].

[1]: https://opensource.rock-chips.com/images/9/97/Rockchip_RK3328TRM_V1.1-Part1-20170321.pdf

Kernel pinctrl debug message with dyndbg="file pinctrl-rockchip.c +p":
  rockchip-pinctrl pinctrl: bank 0, iomux 0 has iom_offset 0x0 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 0, iomux 1 has iom_offset 0x4 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 0, iomux 2 has iom_offset 0x8 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 0, iomux 3 has iom_offset 0xc drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 1, iomux 0 has iom_offset 0x10 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 1, iomux 1 has iom_offset 0x14 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 1, iomux 2 has iom_offset 0x18 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 1, iomux 3 has iom_offset 0x1c drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 2, iomux 0 has iom_offset 0x20 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 2, iomux 1 has iom_offset 0x24 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 2, iomux 2 has iom_offset 0x2c drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 2, iomux 3 has iom_offset 0x34 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 3, iomux 0 has iom_offset 0x38 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 3, iomux 1 has iom_offset 0x40 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 3, iomux 2 has iom_offset 0x48 drv_offset 0x0
  rockchip-pinctrl pinctrl: bank 3, iomux 3 has iom_offset 0x4c drv_offset 0x0

The "Closes" links to test report from original reporter with original
issue contained, which was not delivered to any mailing list thus not
available on the web.

Added CC stable as the problematic e8448a6c817c fixed by this patch was
recently merged to stable kernels.

Sorry for the inconvenience caused,
Huang-Huang

 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 3f56991f5b89..f6da91941fbd 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3813,7 +3813,7 @@ static struct rockchip_pin_bank rk3328_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
 	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
 	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
-			     0,
+			     IOMUX_WIDTH_2BIT,
 			     IOMUX_WIDTH_3BIT,
 			     0),
 	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",

base-commit: 4376e966ecb78c520b0faf239d118ecfab42a119
--
2.45.2

