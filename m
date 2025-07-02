Return-Path: <linux-gpio+bounces-22659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A572AF5F18
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 18:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A950317E8E7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 16:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16DD30115A;
	Wed,  2 Jul 2025 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OFVq1j/s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A02F5301;
	Wed,  2 Jul 2025 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475001; cv=none; b=B+wGr2RYP7WxRlPAmn1jVbgh7r8+d4UxrN6IPidmfdBrNBjA8LFZVCMlLjN7EVG2mu0/IedNaUo9tw+SEimo5jWEFCJ3uZe9dkFPVABzjfD5kAf94JiilDGg13gCrP9l6azdfXYWN670WWUYINm5XDA3XsCH77ULNfQ5mTKR9oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475001; c=relaxed/simple;
	bh=KCfJ8jhu0SYLV1nBNl7a47jC35wRMQQG4JlHQemj4Ng=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S9KJWu7C8dWZz9k+wb9GYRGX0fGKLIBrDC+mh4p/+ugTP82qqNPg4TAWUwR1P0yyr8EEWtt8mqkL/+jIRCuTulW0v/PLNYF5RrgR2qm15i3dds1H/8PQ9Vg5FeBGZnytyepEjbPSKF+wtEu4HUkwc+ecpouXtRHk6vhmDRodm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OFVq1j/s; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 562GnRN93653967;
	Wed, 2 Jul 2025 11:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751474967;
	bh=6voHMaTmzsAIVMby00VUz7wlumfn8xCD0RgkHw8QEaI=;
	h=From:To:CC:Subject:Date;
	b=OFVq1j/sM7qelaK5FCuaF0wsJv7WRSCDDhBFbit++l6tzMzGyv8xdP3t8h48JHJlU
	 8Rm9kyIWquyPb25FXpSPM9+PSEMvDcvN2I+RIEtMsORo2vlNvVYv+c+UosYGLdiRBu
	 B4uRQkTsObvqq1pd9Ruhr1iM1TRwOf0su49z4KPE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 562GnRZo1020814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 2 Jul 2025 11:49:27 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 11:49:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 11:49:26 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 562GnQ5L3771376;
	Wed, 2 Jul 2025 11:49:26 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <jcormier@criticallink.com>
Subject: [PATCH v5 0/2] Add TI TPS65214 PMIC GPIO Support
Date: Wed, 2 Jul 2025 11:49:24 -0500
Message-ID: <20250702164926.2990958-1-s-ramamoorthy@ti.com>
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

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Tested-by: Jonathan Cormier <jcormier@criticallink.com>
---
Change Log:
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
[0]: https://lore.kernel.org/all/173928615760.2233464.12306998726512431222.b4-ty@kernel.org/

Shree Ramamoorthy (2):
  gpio: tps65219: Update _IDX & _OFFSET macro prefix
  gpio: tps65219: Add support for TI TPS65214 PMIC

 drivers/gpio/gpio-tps65219.c | 116 ++++++++++++++++++++++++++++++-----
 1 file changed, 102 insertions(+), 14 deletions(-)

-- 
2.43.0


