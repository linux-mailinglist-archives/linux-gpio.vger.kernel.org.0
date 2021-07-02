Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E115A3BA055
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbhGBM0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:26:44 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:42421 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232203AbhGBM0l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228649; x=1656764649;
  h=from:to:cc:subject:date:message-id;
  bh=BpioOeLEu+qJSb8YvKVoIV3l4TxE6atJJi2U9xpCr4k=;
  b=Bug4UWkjg8algbavwd6O/gqfLXf/pHxpxJwXrmVGUmBO7hxSSEyQ5TvD
   cJTKitPT9UnU0o/ok1oTZS8VDm6P4akTinIXIw8XySvOX1kzd6RbAN2cX
   ICWk/Z2qgYbZAJJeGHV7/Qh3Nkp5DWLv7AxtkvshrUBC/84SWE+4jsfP/
   vTTJgI0JDSkkx5utbhvf8j43XvLlnrGv9tmOlvR1zg4WiH7Y6NttsVuOF
   +4dIETML9dS7exa1DzyaOHZMUlqskxhAtG4cZXcHEyaEsptK521Fyov5a
   idpmw6OJCa2De0H4SbE1qfQQ0Y0LcO3OJA5v0NqUYhldFjFpIhBYzOSnX
   g==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252578"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 02 Jul 2021 14:24:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 02 Jul 2021 14:24:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228645; x=1656764645;
  h=from:to:cc:subject:date:message-id;
  bh=BpioOeLEu+qJSb8YvKVoIV3l4TxE6atJJi2U9xpCr4k=;
  b=c38PSFplvcL1/fv8MKvz2AgPtaeeuWs0nsFIAAFPLb9xLPTCl1qUHUIy
   5I57iV+zXUf0AIx4hfYG1Q1mT/oyg+reZTSDKmBF0iyni5wadDtl5mKQ7
   L+ey+PohCoGyDj80K4x9H1Sm5R7yJI+s9bJZuC3X7Qi2qyvqVwGswoCwz
   DD5/jAwW6oV73/sO0WjW1GRkpIDvqZF6hAMx/1B87ojLfMIRpsd4Dz1YY
   cgRL6cIFov3rhjFsa+jtrPkIGnsoVHeFJoWVAvhtYwqxXt0tJU3ytXWGS
   QI+KVtENgz4ocVA/SMEoQ+UGL+ffoCEntkiHqiFW2Lhd55FawJA+yx8N1
   g==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252577"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jul 2021 14:24:05 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 509FA280070;
        Fri,  2 Jul 2021 14:24:05 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 6/7] mfd: tqmx86: add support for TQ-Systems DMI IDs
Date:   Fri,  2 Jul 2021 14:23:52 +0200
Message-Id: <11bef2179e4745a4edcf579ff96185cb6987931d.1625227382.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Newer TQMx86 modules use TQ-Systems instead of TQ-Group as their vendor
ID.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: new patch

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

