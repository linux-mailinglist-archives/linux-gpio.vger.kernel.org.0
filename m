Return-Path: <linux-gpio+bounces-14245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 258CC9FCE48
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 22:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3EF1188309D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 21:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40341B392E;
	Thu, 26 Dec 2024 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q5kr6RRl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD0C196D8F;
	Thu, 26 Dec 2024 21:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250365; cv=none; b=M+ZQy6WApaA3dg1uYuLR4OY1PFvRIC9YrdUhWly956eNHGuXrObeDZyFi5Ze7hGvqy9KrrVCL2oJc2r9xdMiyAVe6VdybaxSqjBg9HOI72bYcagRQEi9ZEY14UxGP4THCygKNhaWkTe0GMB7Ljfh46CeadSFbfTDplkCMM+K0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250365; c=relaxed/simple;
	bh=aCyWU7dgj20LJxHT2uDSfxV/WHVg95baLNnYOfkC2YQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DvRLtJpqQuy4/QwSlHUQ1IBxhsPPc/JMxUa2d2DdsYkmxjBim1vj8ejkw/2OioLnF8hDXg7/F5UhXyXUolsX8I5wdkhRr+ocxhHNN0DFckCuTibfFR8jsU9xH3/3k7rErTgaGlfwxU9U7gg06KZH4blYumFKUuqf8WhCxQYZ4YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=q5kr6RRl; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLwxcN1038857
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 15:58:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250339;
	bh=lOdAOlyPdWp6aSl+WMFjj0k9NMoUlu7nVnALh1LaXWI=;
	h=From:To:CC:Subject:Date;
	b=q5kr6RRlbZwEInh+bprX/63KeJFExg1uu71jOg/E2gQGnEKlJOe4+cY7Jfz5ZXqN5
	 99moqzu1CAQXNVRPoQhPFs6cX3ug8HAgIIUY6VDaVh9RPAAzvEWxskiQEZ3GbZVjF0
	 6Z6J9L6QWN+Odi1gjgwj102i5Tk9/+dSYVgXxebk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLwxNu015280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:58:59 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:58:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:58:59 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLww5v056047;
	Thu, 26 Dec 2024 15:58:59 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 0/3] Add TI TPS65215 PMIC GPIO Support
Date: Thu, 26 Dec 2024 15:58:55 -0600
Message-ID: <20241226215858.397054-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Happy Holidays!

TPS65215 is a Power Management Integrated Circuit (PMIC) that has
significant register map overlap with TPS65219. The series introduces
TPS65215 and restructures the existing driver to support multiple devices.

This follow-up series is dependent on:
Commit 91462d209aaf ("regulator: dt-bindings: Add TI TPS65215 PMIC bindings")
Commit 30fafb69994a ("mfd: tps65215: Add support for TI TPS65215 PMIC")
Commit 07c9c92bd47f ("mfd: tps65215: Remove regmap_read check")

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

Shree Ramamoorthy (3):
  gpio: tps65215: Add TPS65215 to platform_device_id table
  gpio: tps65215: Update GPIO0_IDX macro prefix
  gpio tps65215: Add support for varying gpio/offset values

 drivers/gpio/gpio-tps65219.c | 54 +++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 13 deletions(-)

-- 
2.34.1


