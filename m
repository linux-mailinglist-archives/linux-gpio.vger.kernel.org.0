Return-Path: <linux-gpio+bounces-14873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2A2A14492
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 23:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FAF27A3C61
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 22:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FA9241A06;
	Thu, 16 Jan 2025 22:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bdINEDh0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DDB2419F1;
	Thu, 16 Jan 2025 22:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067143; cv=none; b=NoezMl+UtnEtWcIRWFg/njsiVrLzKtasfNlP7tg20yDTHV+izBGYT2axej0R57C78OZAQsZ+7tZ9JGXNrQaT1HxwtoVAChyrVXE+zpf+3m9hV6ULkTHQd2rvfj3Mh/ogb7Ng834+7DdTyN40C9DyxWUrMKnZYcvFsh4+O7jcM1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067143; c=relaxed/simple;
	bh=WFcOZomIdAm5jBdPOLYhhDVvd6Yf3hFzQUylsmqNUgI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oE8vRJdv7zc4IjfMh6MaUx+6WC6/SJhkanSzX4iI5AK+H2H3f52/ZYY1ynNe9EZ3XMiMhwBkt53oEuTMMqaX7YZPG8/Zc0gQPh+JfuGotP/tl3MUAuOlYGRYY55xFk1VftIsuXrR898IzfTYX2Zn/qgSU7rffBFyxwP22qYVTHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bdINEDh0; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMcegc089820
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 16:38:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737067120;
	bh=TUbE14IDlWKMVA+cxVc8KZoTV/1NgL5VoCWU1bfECKk=;
	h=From:To:CC:Subject:Date;
	b=bdINEDh0y7Jh3VsfuTQQDfd0NldEZtYikyMwAA1i4ko3NqxaaaSRuGHa0ybuFrB0S
	 Y7prECVZnKs7jrlR6Ha8YA7rZnRgfV45gmiKR/WRn00z4NBAhRFxrxwbjk3zzEylek
	 ASZdeRNiTTsG34MdhZVIzoEN4HIkiOoLFlnetX9k=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMceSp089598
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 16:38:40 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 16:38:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 16:38:40 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMcebR024854;
	Thu, 16 Jan 2025 16:38:40 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 0/1] Add TI TPS65215 PMIC GPIO Support
Date: Thu, 16 Jan 2025 16:38:39 -0600
Message-ID: <20250116223840.430054-1-s-ramamoorthy@ti.com>
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

TPS65214 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65215 and TPS65219. The series 
introduces TPS65214 and adds the device to the multi-PMIC support driver.

This follow-up series is dependent on:
Commit 2c4fd76d13ec ("mfd: tps65214: Add support for TI TPS65214 PMIC")
Commit d23b7176df4a ("regulator: dt-bindings: Add TI TPS65214 PMIC bindings")

TPS65215 Driver Series:
GPIO: https://lore.kernel.org/all/20250113225530.124213-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20250113230750.124843-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20250113231018.125426-1-s-ramamoorthy@ti.com/
Input: https://lore.kernel.org/all/20241226220049.398794-1-s-ramamoorthy@ti.com/

TPS65219 Cleanup Series:
GPIO: https://lore.kernel.org/all/20241217204755.1011731-1-s-ramamoorthy@ti.com/
MFD: https://lore.kernel.org/all/20241217204935.1012106-1-s-ramamoorthy@ti.com/
Reg: https://lore.kernel.org/all/20241217204526.1010989-1-s-ramamoorthy@ti.com/

- TPS65214 is a Power Management IC with 3 Buck regulators and 2 LDOs.
- TPS65214 has 2 LDOS and 1 GPO, whereas TPS65219 has 4 LDOs and 2 GPOs.
- TPS65214's LDO1 maps to TPS65219's LDO3.
- A key difference between TPS65215 & TPS65214 are the LDO current and
  voltage output ranges and the configurable options available.
- The remaining features for both devices are the same.

TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30

AM62L + TPS65214 Test Logs:
https://gist.github.com/ramamoorthyhs/0793f7813332d94423ca1baee02f62c9

Shree Ramamoorthy (1):
  gpio: tps65214: Add support for TI TPS65214 PMIC

 drivers/gpio/gpio-tps65219.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.0


