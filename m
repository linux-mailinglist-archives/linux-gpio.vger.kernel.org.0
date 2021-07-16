Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E363CB590
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 12:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbhGPKEV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 06:04:21 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:62523 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235911AbhGPKES (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 06:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429683; x=1657965683;
  h=from:to:cc:subject:date:message-id;
  bh=m1miCgAtNKc3nn2OMQtUNYsE5POmpRrmibH48qI+v4g=;
  b=bxbtOIq8G4WGLm7K8iTOc8vhyHbK6AMmnjJXhcnBLCHEh4u5X09wdERa
   KBei3534cBIRxUdKiuoDK+UzbAH4LqkbBQ23RuJuBi7L3wTl3aVJvyrDK
   nn0qmPZcxyNNwaK3VfDOgTB6pIavuCgoSSGU+t6q0IVw7n2POJqiTrg1I
   pvUlybZgwJzoPMoXZXCKV0teBC1Doa8mdTkkZKzBUpdCr0QoqLWi9YFjK
   1gz5I7ky0U/u/knVELtLotNkmixf+C9ydBdZRpLEyWDGBSeUOssMdtWkA
   ggIJU3nXfIZx8/HhK6fajB4XRlrSDsoNYy9sZnG/e7uPlrxWI0o5GFfeb
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492076"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jul 2021 12:01:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Jul 2021 12:01:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Jul 2021 12:01:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429679; x=1657965679;
  h=from:to:cc:subject:date:message-id;
  bh=m1miCgAtNKc3nn2OMQtUNYsE5POmpRrmibH48qI+v4g=;
  b=aO4wEPwQBuWDH/kTyKNS8Wizcs6TW6RWbprRDVxn9c5ihp/hrhtbAXFU
   qBE8gdR8Ii/pkYXkv0zbosE91MvqeCy1RAmYDYfFre2YHZG24l1wprgDE
   0MaPDP9utMB9db1aMq1aCeJkcF7Ea8LE7KHLVlTQ770K3PMzuubGrneId
   S5EUE4baysBfUdDlMgbwkiNCR+yV3RoVtnLziBsd0em8BGa5nWXo/eGYi
   P2ohzF+uebce+DM5SYv7A+tGuhGalzHL/Ud9umba0HhX1HNpTpSPi+yTt
   +wANK1345of7K7oFu3UTtZvHGYNIkXIvAsQi8u5KKMC3zV2SMN9mmaqao
   g==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492075"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 12:01:19 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id C759D280078;
        Fri, 16 Jul 2021 12:01:18 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 6/7] mfd: tqmx86: add support for TQ-Systems DMI IDs
Date:   Fri, 16 Jul 2021 12:00:52 +0200
Message-Id: <595d1697231e00629913d43799c0be89f9822734.1626429286.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Newer TQMx86 modules use TQ-Systems instead of TQ-Group as their vendor
ID.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2: new patch
v3: no changes

 drivers/mfd/tqmx86.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 9eb05b3ef573..58f35c8b5a45 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -271,6 +271,14 @@ static const struct dmi_system_id tqmx86_dmi_table[] __initconst = {
 		},
 		.callback = tqmx86_create_platform_device,
 	},
+	{
+		.ident = "TQMX86",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TQ-Systems"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TQMx"),
+		},
+		.callback = tqmx86_create_platform_device,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(dmi, tqmx86_dmi_table);
-- 
2.17.1

