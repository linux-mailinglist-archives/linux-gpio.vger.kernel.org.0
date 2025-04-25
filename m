Return-Path: <linux-gpio+bounces-19326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD4A9D30F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 22:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67AF31B654E9
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 20:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A9622424E;
	Fri, 25 Apr 2025 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xnx/i1KQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB13A223702;
	Fri, 25 Apr 2025 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613236; cv=none; b=faHannKgYvtVgbDeb6Ig2lFrPgyJhXdG4qCRKuLEEBKxanfSuMX6LKAW244ZRUDRVDJSQKRE6An8+pfEDhUYNtUCX1wpvsFpcXU4RbnyD4xbBSBMH5LzxRPJUTDdTwQjQqRmf269ZPOWiW/INDoBUXZaTUsXjOYAtSEURaLXEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613236; c=relaxed/simple;
	bh=vTY4Da8XQHQWu/EAc4ok6OF85Ra9zVsYZMLVGRxA/s8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sJY4fqZL+0G9M1oML4YLbLVRHKdg5ke0hszbpPO9bU0OqR+fu+aY9bkTyDOl10Nyxm83G3YcA8JIjYMJRpwvrIMm0kP1UD7clEHqvCXEAzQY8XZzlEhcBSkredZvIpEZR2XeWs8R4be0XBuWhjwjqAId1JJt0aRHhiBP9q4Q62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xnx/i1KQ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKXGcv3022327
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745613196;
	bh=wSqo/AfVwSvR8bpJlcA+g4qgnYxVFikAnloTUt+XYa8=;
	h=From:To:CC:Subject:Date;
	b=xnx/i1KQLfRVsFIOEY0a+wVUscsRRta6cmsvqTQCi198BPognBol7LVC1uakVcRzo
	 ZK452FvIfXYIOgcCm9GPhGoHa/yTIrMi29aqw1oe1K+fyTNZ/xME62kJO9Idbwd9ZJ
	 Hux17+te+8HAuLzJ8TYhcTMRrMPk94ckf2iuL6tc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKXGPO048882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:33:16 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:33:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:33:15 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKXFbV054212;
	Fri, 25 Apr 2025 15:33:15 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v4 0/3] Add TI TPS65215 PMIC GPIO Support
Date: Fri, 25 Apr 2025 15:33:12 -0500
Message-ID: <20250425203315.71497-1-s-ramamoorthy@ti.com>
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

Rebase patch series for 6.16 cycle. The related MFD series was integrated 
in mainline during 6.15 cycle [0].

TPS65215 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65219. The series introduces
TPS65215 and restructures the existing driver to support multiple devices.

- Both TPS65215 and TPS65219 have 3 Buck regulators.
- TPS65215 has 2 LDOs, whereas TPS65219 has 4 LDOs.
- TPS65215 and TPS65219's LDO1 are the same.
- TPS65215's LDO2 maps to TPS65219's LDO3.
- TPS65215 has 1 GPO, whereas TPS65219 has 2 GPOs.
- The remaining features are the same.

TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

AM62L + TPS65215 Test Logs:
https://gist.github.com/ramamoorthyhs/7560eca6110fafc77b51894fa2c0fd22

---
Change Log:
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

Shree Ramamoorthy (3):
  gpio: tps65219: Add TPS65215 to platform_device_id table
  gpio: tps65219: Update GPIO0_IDX macro prefix
  gpio: tps65219: Add support for varying gpio/offset values

 drivers/gpio/gpio-tps65219.c | 56 +++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 14 deletions(-)

-- 
2.43.0


