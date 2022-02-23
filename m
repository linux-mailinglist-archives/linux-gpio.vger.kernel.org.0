Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C805F4C1441
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 14:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235016AbiBWNdC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 08:33:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240927AbiBWNdB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 08:33:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 945A1AB46E
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645623152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0hx0JlwQXca+CTPA0hZPWiVog1iyZLG1/dJmC1pA79Q=;
        b=Tdz+EGHPRFzcDXCuZ444Mb93xACeNUAgOtfWt1INoLf77GhX/bnQ2R0etzN+ZBmykrUL7x
        Gat4YtWoLuua9xGZ2OBkDFNBBZznDhrMA2CsB54/wcU0f6VySCnSwFGKH7XP4XHb2ifPHe
        h0e+dO4QT8E5JshkhTd7iWzsY/kk96M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-a0mjCXnoO7GzgAJ7NcgAoA-1; Wed, 23 Feb 2022 08:32:29 -0500
X-MC-Unique: a0mjCXnoO7GzgAJ7NcgAoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 464F010247A7;
        Wed, 23 Feb 2022 13:32:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 06708832A4;
        Wed, 23 Feb 2022 13:32:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: x86-android-tablets: Lenovo Yoga Tablet 2 830/1050 sound support
Date:   Wed, 23 Feb 2022 14:31:53 +0100
Message-Id: <20220223133153.730337-6-hdegoede@redhat.com>
In-Reply-To: <20220223133153.730337-1-hdegoede@redhat.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ACPI tables for the codec setup on the Lenovo Yoga Tablet 2 830/1050
miss 2 things compared to their Windows (Lenovo Yoga Tablet 2 1051)
counterparts:

1. There is no CLKE ACPI method to enable output of the 32KHz PMU clock on
   pin 6 of the SUS GPIO controller

2. The GPIOs used by the codec are not listed in the fwnode for the codec

Add pinctrl code to set the SUS6 pin mux manually and a gpio-lookup table
for the GPIOs to work around both issues.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index c3d2b30dbe26..f446be72e539 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -23,12 +23,15 @@
 #include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/machine.h>
 #include <linux/platform_data/lp855x.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/power/bq24190_charger.h>
 #include <linux/rmi.h>
 #include <linux/serdev.h>
+#include <linux/spi/spi.h>
 #include <linux/string.h>
 /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
 #include "../../gpio/gpiolib.h"
@@ -801,8 +804,22 @@ static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_int3496_gpios = {
 	},
 };
 
+#define LENOVO_YOGA_TAB2_830_1050_CODEC_NAME "spi-10WM5102:00"
+
+static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_codec_gpios = {
+	.dev_id = LENOVO_YOGA_TAB2_830_1050_CODEC_NAME,
+	.table = {
+		GPIO_LOOKUP("gpio_crystalcove", 3, "reset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:01", 23, "wlf,ldoena", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("arizona", 2, "wlf,spkvdd-ena", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("arizona", 4, "wlf,micd-pol", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
 	&lenovo_yoga_tab2_830_1050_int3496_gpios,
+	&lenovo_yoga_tab2_830_1050_codec_gpios,
 	NULL
 };
 
@@ -866,6 +883,49 @@ static int __init lenovo_yoga_tab2_830_1050_init_display(void)
 	return 0;
 }
 
+/* SUS (INT33FC:02) pin 6 needs to be configured as pmu_clk for the audio codec */
+static const struct pinctrl_map lenovo_yoga_tab2_830_1050_codec_pinctrl_map =
+	PIN_MAP_MUX_GROUP(LENOVO_YOGA_TAB2_830_1050_CODEC_NAME, "codec_32khz_clk",
+			  "INT33FC:02", "pmu_clk2_grp", "pmu_clk");
+
+static struct pinctrl *lenovo_yoga_tab2_830_1050_codec_pinctrl;
+
+static int __init lenovo_yoga_tab2_830_1050_init_codec(void)
+{
+	struct device *codec_dev;
+	struct pinctrl *pinctrl;
+	int ret;
+
+	codec_dev = bus_find_device_by_name(&spi_bus_type, NULL,
+					    LENOVO_YOGA_TAB2_830_1050_CODEC_NAME);
+	if (!codec_dev) {
+		pr_err("error cannot find %s device\n", LENOVO_YOGA_TAB2_830_1050_CODEC_NAME);
+		return -ENODEV;
+	}
+
+	ret = pinctrl_register_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map, 1);
+	if (ret)
+		goto err_put_device;
+
+	pinctrl = pinctrl_get_select(codec_dev, "codec_32khz_clk");
+	if (IS_ERR(pinctrl)) {
+		ret = dev_err_probe(codec_dev, PTR_ERR(pinctrl), "selecting codec_32khz_clk\n");
+		goto err_unregister_mappings;
+	}
+
+	/* We're done with the codec_dev now */
+	put_device(codec_dev);
+
+	lenovo_yoga_tab2_830_1050_codec_pinctrl = pinctrl;
+	return 0;
+
+err_unregister_mappings:
+	pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
+err_put_device:
+	put_device(codec_dev);
+	return ret;
+}
+
 /*
  * These tablet's DSDT does not set acpi_gbl_reduced_hardware, so acpi_power_off
  * gets used as pm_power_off handler. This causes "poweroff" on these tablets
@@ -886,6 +946,10 @@ static int __init lenovo_yoga_tab2_830_1050_init(void)
 	if (ret)
 		return ret;
 
+	ret = lenovo_yoga_tab2_830_1050_init_codec();
+	if (ret)
+		return ret;
+
 	pm_power_off = lenovo_yoga_tab2_830_1050_power_off;
 	return 0;
 }
@@ -893,6 +957,11 @@ static int __init lenovo_yoga_tab2_830_1050_init(void)
 static void lenovo_yoga_tab2_830_1050_exit(void)
 {
 	pm_power_off = NULL; /* Just turn poweroff into halt on module unload */
+
+	if (lenovo_yoga_tab2_830_1050_codec_pinctrl) {
+		pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
+		pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
+	}
 }
 
 /* Nextbook Ares 8 tablets have an Android factory img with everything hardcoded */
-- 
2.35.1

