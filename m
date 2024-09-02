Return-Path: <linux-gpio+bounces-9553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 319429684AF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBB742819A5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331A613C9D4;
	Mon,  2 Sep 2024 10:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CeOU9zg6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D8A13C69E;
	Mon,  2 Sep 2024 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273029; cv=none; b=FIAyVslVfWLk1xmdFnSEppxwcD8k/3RU7Y1NPbhQDM0EDDVCS9xve2/m7EJWDHvcJ9vnxDS4dliCTSeKDgIp0yXLZbVbqSx4EO2GBScP/zqtqVQPLNNnQ+v4YxVsifSIra3237pnAiy0pzS6oFtcCVyDwwyyxAGVqwP0nMGRdZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273029; c=relaxed/simple;
	bh=rpA7J1nM0QACsHusBQvBRbXSrR2amF4wu8LDsXboP7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=maS1NdrV1gK5TJ6i1ydOYpjuN5z8QyesV1uJIu4g5KA/okad1y2vLZi6dL87HFk8y8xLK+oIGHUBD9pOCznzjN4M5/ug4QNKUqXPNo95Wnz+ljt5PgJKVHwdXOfa00qEVrXTPzOwS6kWRZKvi067a2htLpjYmh+x3wKpsYqI6U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CeOU9zg6; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 482AUMJW108783;
	Mon, 2 Sep 2024 05:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725273022;
	bh=/yZFYnusRfjE8Yez+opbdRl7DvWW7S1LXw8o+4wJc0o=;
	h=From:Date:Subject:To:CC;
	b=CeOU9zg6wE9IcatfTOnjEq1SFt938cI6L3MDJEMcsfM2IZWFzHv1dYMNcn3rqDzP4
	 quZn27fyvKAOQU/CKrILLIrPi/lzOKWJZA1puw4Fs+bchjwSlj9SXnwWqwvc1RAhKV
	 glkznHeAMjZnc8MRUIuwUR3PZhLV8Y++fj0UI8Rc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 482AUMZn099991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Sep 2024 05:30:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Sep 2024 05:30:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Sep 2024 05:30:22 -0500
Received: from [127.0.1.1] (lcpd911.dhcp.ti.com [172.24.227.68])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 482AUK4c029008;
	Mon, 2 Sep 2024 05:30:21 -0500
From: Dhruva Gole <d-gole@ti.com>
Date: Mon, 2 Sep 2024 16:00:02 +0530
Subject: [PATCH] gpio-syscon: fix excess struct member build warning
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240902-b4-gpio-fix-v1-1-49a997994fa5@ti.com>
X-B4-Tracking: v=1; b=H4sIAKmT1WYC/x2MQQqAIBAAvyJ7bkEXCewr0aFytb2oKEQg/T3pO
 AMzHRpX4QaL6lD5liY5DTCTgvPaU2QUPxhIk9VOEx4WY5GMQR40juxMFNjzAaMolYf+b+v2vh9
 hByE5XQAAAA==
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dhruva Gole
	<d-gole@ti.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725273020; l=917;
 i=d-gole@ti.com; s=20240902; h=from:subject:message-id;
 bh=rpA7J1nM0QACsHusBQvBRbXSrR2amF4wu8LDsXboP7M=;
 b=+eh+RvKcxfsO86iH/JSiGXGAhtff5zInxi4VuMyeq7eSWzn1g1S1/aU5neYONmgSxDOD8ClYz
 /NMPNZf7qwDDg2jTz9JUv43ePdMQ8rYl+nLr7h2QP9A2l8xQaB9g56J
X-Developer-Key: i=d-gole@ti.com; a=ed25519;
 pk=yOC9jqVaW3GN10oty8eZJ20dN4jcpE8JVoaODDmyZvA=
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Fix the build warning with W=1 flag,
"Excess struct member 'compatible' description in 'syscon_gpio_data' "
by removing the documentation for the non existent member.

Signed-off-by: Dhruva Gole <d-gole@ti.com>
---
 drivers/gpio/gpio-syscon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 3a90a3a1caea..5ab394ec81e6 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -23,7 +23,6 @@
 
 /**
  * struct syscon_gpio_data - Configuration for the device.
- * @compatible:		SYSCON driver compatible string.
  * @flags:		Set of GPIO_SYSCON_FEAT_ flags:
  *			GPIO_SYSCON_FEAT_IN:	GPIOs supports input,
  *			GPIO_SYSCON_FEAT_OUT:	GPIOs supports output,

---
base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
change-id: 20240902-b4-gpio-fix-1924622fedeb

Best regards,
-- 
Dhruva Gole <d-gole@ti.com>


