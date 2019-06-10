Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 776DE3BA80
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbfFJRLc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:11:32 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57586 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387415AbfFJRLc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:11:32 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBPLZ056820;
        Mon, 10 Jun 2019 12:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186685;
        bh=D2I3+AEazuZDhIiJtTZewtdd+cu8+rlLH2evSAkj3Tw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JWXZpp6NRv6TcJ8/UZOsqrxcN9z3o32GylrygV/NicsPJDfJHRZnz0MENPuek84//
         B9Zj8tHn+2822bu96Limhiyg9oDC36K1zynp/Zqk2hGwW+e5dlbfdkzrbuxwJ4bmtK
         h2ZQO7DWm3ncxNjgzvRDx1S1HDEdLPGuzGwnbnE8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHBPhw010006
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:11:25 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:11:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:11:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHBO7l050474;
        Mon, 10 Jun 2019 12:11:24 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Russell King <rmk@arm.linux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH-next 02/20] gpio: gpio-omap: fix lack of irqstatus_raw0 for OMAP4
Date:   Mon, 10 Jun 2019 20:10:45 +0300
Message-ID: <20190610171103.30903-3-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610171103.30903-1-grygorii.strashko@ti.com>
References: <20190610171103.30903-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>

Commit 384ebe1c2849 ("gpio/omap: Add DT support to GPIO driver") added
the register definition tables to the gpio-omap driver. Subsequently to
that commit, commit 4e962e8998cc ("gpio/omap: remove cpu_is_omapxxxx()
checks from *_runtime_resume()") added definitions for irqstatus_raw*
registers to the legacy OMAP4 definitions, but missed the DT
definitions.

This causes an unintentional change of behaviour for the 1.101 errata
workaround on OMAP4 platforms. Fix this oversight.

Fixes: 4e962e8998cc ("gpio/omap: remove cpu_is_omapxxxx() checks from *_runtime_resume()")
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 2c6d46396834..44b214e5cefb 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1457,6 +1457,8 @@ static struct omap_gpio_reg_offs omap4_gpio_regs = {
 	.clr_dataout =		OMAP4_GPIO_CLEARDATAOUT,
 	.irqstatus =		OMAP4_GPIO_IRQSTATUS0,
 	.irqstatus2 =		OMAP4_GPIO_IRQSTATUS1,
+	.irqstatus_raw0 =	OMAP4_GPIO_IRQSTATUSRAW0,
+	.irqstatus_raw1 =	OMAP4_GPIO_IRQSTATUSRAW1,
 	.irqenable =		OMAP4_GPIO_IRQSTATUSSET0,
 	.irqenable2 =		OMAP4_GPIO_IRQSTATUSSET1,
 	.set_irqenable =	OMAP4_GPIO_IRQSTATUSSET0,
-- 
2.17.1

