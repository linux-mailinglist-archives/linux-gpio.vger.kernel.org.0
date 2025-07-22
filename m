Return-Path: <linux-gpio+bounces-23643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B095DB0E34C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0A9A1C81D91
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 18:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218E027FD49;
	Tue, 22 Jul 2025 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tlpPZB7h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC0F2E36FD;
	Tue, 22 Jul 2025 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753208204; cv=none; b=GrAazg8HnBb4Uluz/rqgI+QJSbO3cegmt1uLBu6hDn6vSmfuDEfDyzu5aXKLzlLr49XTHRCHUhiZHRxaS4sD/hKOsiNUb88Ucby712SoGJpwF5b9qiqFzaJl+n0KnU6cObiQ818AkrQRM3L8a1LdQsTdO4kFWlyPWosZcfSnp+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753208204; c=relaxed/simple;
	bh=yYhnTAytvNts36U9MU9mMadjyIJdDSP8w+NcbKfeFac=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f69Og8RvlQD5eLliBAgV06yio1Hy0Og9EothXzHSU0Gt9VEZGvpJW2bCgzULKlZmido4WMSV/d+Rv6NxhHcKmBDDRiO1GxRJ6IVlAe/cFjqmqwj6uzVxZVBx4ZsP7hmcct4Ljb/vDJDq2C9sgPWgT+pXkwF+alsIdgH3Zp9pOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tlpPZB7h; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56MIGA2Z1094695;
	Tue, 22 Jul 2025 13:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753208170;
	bh=5mLVBcGhypc3o7eMZU6QxazR7I//J4ShA/r2z2JUB7A=;
	h=From:To:CC:Subject:Date;
	b=tlpPZB7haon6KcwM8tDPop+ZZLx2hhvEw0oxYsiFOkmCfrP0Z9E+H6U5QzzJJ2P1A
	 PouepdXxEYsok6MsCdSchr85Sc7fIST8E+tkgXnacZIN2BAKjatCUfgO1/1lmAqGeV
	 g36/DR+4kMGiBjZnGkPUQ8ZWJ6Gn5PY0Vl9TokRo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56MIGAlr1205367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 22 Jul 2025 13:16:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 22
 Jul 2025 13:16:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 22 Jul 2025 13:16:09 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56MIG9iE1439422;
	Tue, 22 Jul 2025 13:16:09 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <jcormier@criticallink.com>,
        <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v8 0/2] Add TI TPS65214 PMIC GPIO Support
Date: Tue, 22 Jul 2025 13:16:07 -0500
Message-ID: <20250722181609.1541739-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The related MFD series was integrated in mainline during 6.15 cycle [0].

TPS65214 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65219. The series introduces
TPS65214 and restructures the existing driver to support multiple devices.

TPS65215's GPIO specs are the same as TPS65219, so the "tps65219-gpio"
compatible string is assigned to two devices in the TPS65219 MFD driver.
No additional support is required in the GPIO driver for TPS65215.

- TPS65214 has 1 GPIO & 1 GPO, whereas TPS65219/TPS65215 both have 1 GPIO &
  2 GPOs.
- TPS65214' GPIO direction can be changed with register GENERAL_CONFIG and
  bit GPIO_CONFIG during device operation.
- TPS65219's MULTI_DEVICE_ENABLE bit in register MFP_1_CFG maps to
  TPS65214's GPIO_VSEL_CONFIG bit.

TPS65214 Datasheet: https://www.ti.com/lit/gpn/TPS65214
TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

Tested on Jon Cormier's AM62x platform with TPS65219.
GPIO offsets remained consistent and functional.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Tested-by: Jonathan Cormier <jcormier@criticallink.com>
---
Change Log:
v7 -> v8:
- Rebase series on top of gpio/for-next branch
- .set_rv update was taken care of in another patch:
  https://lore.kernel.org/all/20250702-gpiochip-set-rv-gpio-round3-v1-11-0d23be74f71d@linaro.org/
v6 -> v7:
- Update _set() to return an int because of set_rv() variant
- Fix comment format
- Consolidate dev_err call to one line
- Remove unused variable (dev) from tps65219_gpio_set
v5 -> v6:
- Add Jon Cormier Reviewed-by and Tested-by tags
- Add test info from Jon C. to cover letter
- Change copyright to include 2022 & 2025
- Use set_rv() variant instead of deprecated set()
v4 -> v5:
- Consolidate from 3 to 2 patches
- Add specific TPS65215 info to Patch 1 comments + commit message
- Remove chip_data struct
- Add separate dev-specific template_chip structs
- Add dev-specific change_direction functions + assignment in probe
- Add PMIC GPIO mapping explanation in comments for future users
- Add TPS65214 GPIO0 direction mask macro
- Rename _GPIO0_OFFSET in patch 1, in addition to _IDX macro
- Update cover letter + add TPS65214 datasheet link
v3 -> v4:
- Update cover letter
- Rebase for 6.16 cycle
v2 -> v3:
- Correct gpio_chip.ngpio line to use .offset field
- Remove unnecessary newlines
v1 -> v2:
- have any PMIC lists be in alpha-numeric order: TPS65215, then TPS65219
- remove comma after terminator
- Add driver prefix to chip_data struct
---
[0]:
https://lore.kernel.org/all/173928615760.2233464.12306998726512431222.b4-ty@kernel.org/

Shree Ramamoorthy (2):
  gpio: tps65219: Update _IDX & _OFFSET macro prefix
  gpio: tps65219: Add support for TI TPS65214 PMIC

 drivers/gpio/gpio-tps65219.c | 115 ++++++++++++++++++++++++++++++-----
 1 file changed, 101 insertions(+), 14 deletions(-)

-- 
2.43.0


