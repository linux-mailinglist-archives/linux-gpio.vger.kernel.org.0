Return-Path: <linux-gpio+bounces-11583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352C09A324F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 03:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE03F282905
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 01:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F6D5103F;
	Fri, 18 Oct 2024 01:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="IlGYfIws"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB6520E327;
	Fri, 18 Oct 2024 01:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729216611; cv=none; b=eL0/or+HRi97w+ZQ/pnIrPTfYpyAmifrV/EVZYVd/0mBWK0Arr7Yxj70AQRz+i3Jjs4CFtLjlE9QYyVt3DbTcHBejkdoICZP6sdd9b2zXz7XhCFuSVAD4/UhNuzYNV0AG3ww4wG/d7yPbxbzV1iM1KsQj9o/+5vc+q3DIM2dXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729216611; c=relaxed/simple;
	bh=gwGyk4FcoeapPZcnlkqwCNWJXlT9ayqMbwyWuLCMg3k=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=EcGlkDB2K2IxCt+WHjkJ48pK+w+9MsjjICPIeHTqT/iMd7u8Qf54IH7sX3Z3bKL6t6ZkR7vaKYPNxDmTXytC6z/Yr6S+nNT428kDofbY8WPuUUe4tLU4/ZN6InXVGe0dgZTLFW+uuPgHMk8LPdQtvWH3vcSIB08io46s3wEdkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=IlGYfIws; arc=none smtp.client-ip=207.54.90.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729216611; x=1760752611;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gwGyk4FcoeapPZcnlkqwCNWJXlT9ayqMbwyWuLCMg3k=;
  b=IlGYfIwsgimrPiBQfpwMAf1CBcaZ3HhAywQb3Ghike4VWLg0g3rRSLjk
   VdOlM3VVrqNhJ/yERIZwcFjbEqO0l/+nvPpa59/s0SHc5Dehuhw4EmEM3
   14YHFHAYSt5180bL1BLghHd6vM0Z+P47vBmx18nhwTSiiiKpi2ZnNq2sl
   vl4PTPzikAcsR1gkqq9klr5o19gw8+jNvI/MdbQ+KnVhb/7EYhxFqFKx0
   rVcNLyDIIjgdVZ97skkeOFU86/+XkkXZ6kI7MGpqUOxfLy+JATuz1oeIM
   NW850RkodA6X4T+4ktujagSd1fI0CBtszW/uAzN0XbZGRU8z5qANzHzkP
   A==;
X-CSE-ConnectionGUID: GaHOcwmtRtWl3TjfYZzuxw==
X-CSE-MsgGUID: nHKlLQmhQNm4S2wds2dQCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="177185225"
X-IronPort-AV: E=Sophos;i="6.11,212,1725289200"; 
   d="scan'208";a="177185225"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 10:56:48 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD166C9440;
	Fri, 18 Oct 2024 10:56:44 +0900 (JST)
Received: from yto-om3.fujitsu.com (yto-om3.o.css.fujitsu.com [10.128.89.164])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 35C26CFBBF;
	Fri, 18 Oct 2024 10:56:44 +0900 (JST)
Received: from sm-x86-mem01.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om3.fujitsu.com (Postfix) with ESMTP id EC84640057419;
	Fri, 18 Oct 2024 10:56:43 +0900 (JST)
From: Yoshihiro Furudera <fj5100bi@fujitsu.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yoshihiro Furudera <fj5100bi@fujitsu.com>
Subject: [PATCH] gpio: dwapb: Add ACPI HID for DWAPB GPIO controller on Fujitsu MONAKA
Date: Fri, 18 Oct 2024 01:56:40 +0000
Message-Id: <20241018015640.2924794-1-fj5100bi@fujitsu.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

This patch enables DWAPB GPIO controller support on Fujitsu MONAKA.

Signed-off-by: Yoshihiro Furudera <fj5100bi@fujitsu.com>
---
 drivers/gpio/gpio-dwapb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 798235791f70..6113ab1bc8de 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -694,6 +694,7 @@ static const struct acpi_device_id dwapb_acpi_match[] = {
 	{"HISI0181", GPIO_REG_OFFSET_V1},
 	{"APMC0D07", GPIO_REG_OFFSET_V1},
 	{"APMC0D81", GPIO_REG_OFFSET_V2},
+	{"FUJI200A", GPIO_REG_OFFSET_V1},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dwapb_acpi_match);
-- 
2.34.1


