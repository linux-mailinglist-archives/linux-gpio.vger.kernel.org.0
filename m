Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB71D4C143E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 14:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240546AbiBWNcs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 08:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240571AbiBWNcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 08:32:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 38F9CAB469
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 05:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645623138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PAqqX72HBe86K7c5b94tydFPHMYguSDqrmVUhzmUyn0=;
        b=ZqMYwI9/bl3vAQprPyqxMvHrwpIP46vpGGQbjKd4vila0q0yUOGwpHhm4E15camNW2cIpA
        TjJbMS0AhJ30oeGfwyv68ZWVRg14B8y24U2gQuWnvVRhjGW76MzYFAsWJSVYSlGQt2EeD8
        x9gkMvtGQbUNSwfdh4ZtwrGqoiGUbbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-PPH4Ch_FOGyepQmScYgHqg-1; Wed, 23 Feb 2022 08:32:15 -0500
X-MC-Unique: PPH4Ch_FOGyepQmScYgHqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B10FE800422;
        Wed, 23 Feb 2022 13:32:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C355832B4;
        Wed, 23 Feb 2022 13:32:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: x86-android-tablets: Workaround Lenovo Yoga Tablet 2 830/1050 poweroff hang
Date:   Wed, 23 Feb 2022 14:31:52 +0100
Message-Id: <20220223133153.730337-5-hdegoede@redhat.com>
In-Reply-To: <20220223133153.730337-1-hdegoede@redhat.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These tablets' DSDT does not set acpi_gbl_reduced_hardware, so
acpi_power_off gets used as pm_power_off handler. This causes "poweroff"
on these tablets to hang hard. Requiring pressing the powerbutton for
30 seconds *twice* followed by a normal 3 second press to recover.

Avoid this by overriding the global pm_power_off handler to do
an EFI poweroff instead.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 89972723f546..c3d2b30dbe26 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -12,6 +12,7 @@
 
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/efi.h>
 #include <linux/gpio_keys.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -24,6 +25,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_data/lp855x.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/power/bq24190_charger.h>
 #include <linux/rmi.h>
 #include <linux/serdev.h>
@@ -817,6 +819,7 @@ static struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
 	.init = lenovo_yoga_tab2_830_1050_init,
+	.exit = lenovo_yoga_tab2_830_1050_exit,
 };
 
 /*
@@ -863,6 +866,18 @@ static int __init lenovo_yoga_tab2_830_1050_init_display(void)
 	return 0;
 }
 
+/*
+ * These tablet's DSDT does not set acpi_gbl_reduced_hardware, so acpi_power_off
+ * gets used as pm_power_off handler. This causes "poweroff" on these tablets
+ * to hang hard. Requiring pressing the powerbutton for 30 seconds *twice*
+ * followed by a normal 3 second press to recover. Avoid this by doing an EFI
+ * poweroff instead.
+ */
+static void lenovo_yoga_tab2_830_1050_power_off(void)
+{
+	efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
+}
+
 static int __init lenovo_yoga_tab2_830_1050_init(void)
 {
 	int ret;
@@ -871,9 +886,15 @@ static int __init lenovo_yoga_tab2_830_1050_init(void)
 	if (ret)
 		return ret;
 
+	pm_power_off = lenovo_yoga_tab2_830_1050_power_off;
 	return 0;
 }
 
+static void lenovo_yoga_tab2_830_1050_exit(void)
+{
+	pm_power_off = NULL; /* Just turn poweroff into halt on module unload */
+}
+
 /* Nextbook Ares 8 tablets have an Android factory img with everything hardcoded */
 static const char * const nextbook_ares8_accel_mount_matrix[] = {
 	"0", "-1", "0",
-- 
2.35.1

