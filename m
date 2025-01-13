Return-Path: <linux-gpio+bounces-14739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D04A0C4EE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 339EE1885321
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBA21F9F7A;
	Mon, 13 Jan 2025 22:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TOe6Hncq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9CD1F9F69;
	Mon, 13 Jan 2025 22:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736808966; cv=none; b=MUAY6hbk5KjX+ibhKdNHEigTVvX+sLUbWZ8hD0ZhBa4PyrEzq6J3Jif7FaYusBepEt9y50DSN+7WrS4CQURL+n4FkcgovkMW4Xr6D2MJpR7J8YQfVOfz6cHWeZ7BZ7DULGZl5+4TaFYQC9/NL/mS/DtERVg78F+/abc2iqlM+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736808966; c=relaxed/simple;
	bh=9b++gyDGyApMqv36bHYcg4dH8/jfrHn01weu+NGF730=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I6V7X8QS7eUVnYqN/95gYXhS2FqI5v8yjg6QJFrLs+FnG4RxS4NxT31rW+08dDlUJEFSj6nwkmOr9JHyu92kZC7PEXBQCX+5wgsdgnJenoeTcCu8ZZb2EUKgsMvQJvGGGKyanqWVQKToM3ic6tLR2Mc3go2n9C9747LAGeqVlsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TOe6Hncq; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMtVrh3586287
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:55:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736808931;
	bh=4kVod4nx9bYafYmN8pduPv731rkOBHnpAS3W1IfCqBA=;
	h=From:To:CC:Subject:Date;
	b=TOe6HncqG/GEtf8C8CcBY0tgdIezsvBk/WZeU7lxCZk52U3OAvlfVKAHu0Wyf7dog
	 GRTQa9jtlqDGVZRqZA+ibtD5pUNjTWvEWWyZwVJ8d4CjX6HoTBBG+og6oN1DdO/oxb
	 ioQQ4OuCznWLE8ie1PxLr0CMn6LvxOlpu3y4PfFk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMtVJp037814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 16:55:31 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 16:55:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 16:55:30 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DMtU54047817;
	Mon, 13 Jan 2025 16:55:30 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 0/3] Add TI TPS65215 PMIC GPIO Support
Date: Mon, 13 Jan 2025 16:55:27 -0600
Message-ID: <20250113225530.124213-1-s-ramamoorthy@ti.com>
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

TPS65215 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65219. The series introduces
TPS65215 and restructures the existing driver to support multiple devices.

This follow-up series is dependent on:
Commit f84464ec8190 ("regulator: dt-bindings: Add TI TPS65215 PMIC bindings")
Commit 8206c20f4c82 ("mfd: tps65215: Add support for TI TPS65215 PMIC")
Commit 0e0b7f00c111 ("mfd: tps65215: Remove regmap_read check")

TPS65219 Cleanup Series:
GPIO: https://lore.kernel.org/all/20241217204755.1011731-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20241217204935.1012106-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20241217204526.1010989-1-s-ramamoorthy@ti.com/

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
v2 -> v3:
- Correct gpio_chip.ngpio line to use .offset field
- Remove unnecessary newlines

v1 -> v2:
- have any PMIC lists be in alpha-numeric order: TPS65215, then TPS65219
- remove comma after terminator
- Add driver prefix to chip_data struct
---

Shree Ramamoorthy (3):
  gpio: tps65215: Add TPS65215 to platform_device_id table
  gpio: tps65215: Update GPIO0_IDX macro prefix
  gpio tps65215: Add support for varying gpio/offset values

 drivers/gpio/gpio-tps65219.c | 55 +++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

-- 
2.43.0


