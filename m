Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A23F67EFA9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 21:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjA0UjL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 15:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231859AbjA0UjJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 15:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197B623667
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 12:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674851875;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/Eatjz1jd+uKOH6b+oljcryC+7K4jHwcQ7pqcNcXCQ8=;
        b=VDy0ZTFrVteq7ff4Mj1BV9npdAQX/4suaBPLi2ZzQJho42BHz8Avjg9mnuu8BqV7BEybn7
        l536MSt2SqPKtHa2o8wkV9ZDsimr5XrHHv8bKt8CQ/sbkuJ6v9qlCny5/NW2mb/8OqV97u
        TAiPnWG80gUHGPw9LQ7e5t4ZP8PMFRc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-bX2zL63KMzehiiJU6bK1Gg-1; Fri, 27 Jan 2023 15:37:50 -0500
X-MC-Unique: bX2zL63KMzehiiJU6bK1Gg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B3953806703;
        Fri, 27 Jan 2023 20:37:49 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BBD62492C14;
        Fri, 27 Jan 2023 20:37:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v6 4/5] platform/x86: int3472/discrete: Move GPIO request to skl_int3472_register_clock()
Date:   Fri, 27 Jan 2023 21:37:28 +0100
Message-Id: <20230127203729.10205-5-hdegoede@redhat.com>
In-Reply-To: <20230127203729.10205-1-hdegoede@redhat.com>
References: <20230127203729.10205-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Move the requesting of the clk-enable GPIO to skl_int3472_register_clock()
(and move the gpiod_put to unregister).

This mirrors the GPIO handling in skl_int3472_register_regulator() and
allows removing skl_int3472_map_gpio_to_clk() from discrete.c.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 28 +++++++++++++++--
 drivers/platform/x86/intel/int3472/common.h   |  3 +-
 drivers/platform/x86/intel/int3472/discrete.c | 30 ++-----------------
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index e3b597d93388..626e5e86f4e0 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -86,18 +86,34 @@ static const struct clk_ops skl_int3472_clock_ops = {
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
+	if (IS_ERR(int3472->clock.ena_gpio))
+		return dev_err_probe(int3472->dev, PTR_ERR(int3472->clock.ena_gpio),
+				     "getting clk-enable GPIO\n");
+
+	/* Ensure the pin is in output mode and non-active state */
+	gpiod_direction_output(int3472->clock.ena_gpio, 0);
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
 
@@ -123,14 +139,20 @@ int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
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
index 82dc37e08882..0d4fa7d00b5f 100644
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
index 38b1372e0745..b7752c2b798d 100644
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
@@ -154,24 +152,6 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
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
-	/* Ensure the pin is in output mode and non-active state */
-	gpiod_direction_output(int3472->clock.ena_gpio, 0);
-
-	return skl_int3472_register_clock(int3472);
-}
-
 static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
 {
 	switch (type) {
@@ -277,9 +257,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-		ret = skl_int3472_map_gpio_to_clk(int3472, agpio);
+		ret = skl_int3472_register_clock(int3472, agpio);
 		if (ret)
-			err_msg = "Failed to map GPIO to clock\n";
+			err_msg = "Failed to register clock\n";
 
 		break;
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
@@ -342,11 +322,7 @@ static int skl_int3472_discrete_remove(struct platform_device *pdev)
 
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
2.39.1

