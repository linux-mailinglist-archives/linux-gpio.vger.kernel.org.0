Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5B564EA95
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 12:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbiLPLbq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 06:31:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiLPLbn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 06:31:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798FB5E094
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 03:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671190254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ucZDaECuZe/lFWW6Z/530BTwkympFWSoR7nDccMR+V8=;
        b=IBJnOIPS1mXm14ofndVeQZv7sj779GRkbcrwE65JgHLOlD/upqlTmq4R1xH02KR2bG2yj2
        tif6p1wdfGHXjOGMFtGaqzK2rqHtdw7fJ+/4FvA98QGeSI+t8NtFY3UJckeLzzrCz1ySM4
        ZNCeoTDCh/e6HGxeGIIYTRc/ba3oGC0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-EaGKl1k2PI2zkmfkuvBVZw-1; Fri, 16 Dec 2022 06:30:53 -0500
X-MC-Unique: EaGKl1k2PI2zkmfkuvBVZw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60AA71C07542;
        Fri, 16 Dec 2022 11:30:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8FBFC49BB6A;
        Fri, 16 Dec 2022 11:30:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 09/11] platform/x86: int3472/discrete: Move GPIO request to skl_int3472_register_clock()
Date:   Fri, 16 Dec 2022 12:30:11 +0100
Message-Id: <20221216113013.126881-10-hdegoede@redhat.com>
In-Reply-To: <20221216113013.126881-1-hdegoede@redhat.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the requesting of the clk-enable GPIO to skl_int3472_register_clock()
(and move the gpiod_put to unregister).

This mirrors the GPIO handling in skl_int3472_register_regulator() and
allows removing skl_int3472_map_gpio_to_clk() from discrete.c .

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 26 +++++++++++++++--
 drivers/platform/x86/intel/int3472/common.h   |  3 +-
 drivers/platform/x86/intel/int3472/discrete.c | 28 ++-----------------
 3 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index e61119b17677..4b4d77db44ce 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -86,18 +86,32 @@ static const struct clk_ops skl_int3472_clock_ops = {
 	.recalc_rate = skl_int3472_clk_recalc_rate,
 };
 
-int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
+int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
+			       struct acpi_resource_gpio *agpio)
 {
+	char *path = agpio->resource_source.string_ptr;
 	struct clk_init_data init = {
 		.ops = &skl_int3472_clock_ops,
 		.flags = CLK_GET_RATE_NOCACHE,
 	};
 	int ret;
 
+	if (int3472->clock.cl)
+		return -EBUSY;
+
+	int3472->clock.ena_gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
+							     "int3472,clk-enable");
+	if (IS_ERR(int3472->clock.ena_gpio)) {
+		ret = PTR_ERR(int3472->clock.ena_gpio);
+		return dev_err_probe(int3472->dev, ret, "getting regulator GPIO\n");
+	}
+
 	init.name = kasprintf(GFP_KERNEL, "%s-clk",
 			      acpi_dev_name(int3472->adev));
-	if (!init.name)
-		return -ENOMEM;
+	if (!init.name) {
+		ret = -ENOMEM;
+		goto out_put_gpio;
+	}
 
 	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
 
@@ -123,14 +137,20 @@ int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
 	clk_unregister(int3472->clock.clk);
 out_free_init_name:
 	kfree(init.name);
+out_put_gpio:
+	gpiod_put(int3472->clock.ena_gpio);
 
 	return ret;
 }
 
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 {
+	if (!int3472->clock.cl)
+		return;
+
 	clkdev_drop(int3472->clock.cl);
 	clk_unregister(int3472->clock.clk);
+	gpiod_put(int3472->clock.ena_gpio);
 }
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index e106bbfe8ffa..5ec89038ae07 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -121,7 +121,8 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
 					 struct acpi_device **sensor_adev_ret,
 					 const char **name_ret);
 
-int skl_int3472_register_clock(struct int3472_discrete_device *int3472);
+int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
+			       struct acpi_resource_gpio *agpio);
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 1a1e0b196bfa..b7752c2b798d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -2,8 +2,6 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
-#include <linux/clkdev.h>
-#include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
@@ -154,22 +152,6 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 	return 0;
 }
 
-static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
-				       struct acpi_resource_gpio *agpio)
-{
-	char *path = agpio->resource_source.string_ptr;
-	u16 pin = agpio->pin_table[0];
-	struct gpio_desc *gpio;
-
-	gpio = acpi_get_and_request_gpiod(path, pin, "int3472,clk-enable");
-	if (IS_ERR(gpio))
-		return (PTR_ERR(gpio));
-
-	int3472->clock.ena_gpio = gpio;
-
-	return skl_int3472_register_clock(int3472);
-}
-
 static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
 {
 	switch (type) {
@@ -275,9 +257,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-		ret = skl_int3472_map_gpio_to_clk(int3472, agpio);
+		ret = skl_int3472_register_clock(int3472, agpio);
 		if (ret)
-			err_msg = "Failed to map GPIO to clock\n";
+			err_msg = "Failed to register clock\n";
 
 		break;
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
@@ -340,11 +322,7 @@ static int skl_int3472_discrete_remove(struct platform_device *pdev)
 
 	gpiod_remove_lookup_table(&int3472->gpios);
 
-	if (int3472->clock.cl)
-		skl_int3472_unregister_clock(int3472);
-
-	gpiod_put(int3472->clock.ena_gpio);
-
+	skl_int3472_unregister_clock(int3472);
 	skl_int3472_unregister_pled(int3472);
 	skl_int3472_unregister_regulator(int3472);
 
-- 
2.38.1

