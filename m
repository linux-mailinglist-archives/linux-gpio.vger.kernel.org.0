Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8C064EA9F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 12:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbiLPLcY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 06:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbiLPLbz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 06:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A974140B9
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 03:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671190263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y834GAxRKn5+OpUpqY+9Rv+UYa5f79tnm5XUB6lv/5M=;
        b=WFlGqJgF/mrru8oDf0QctpUHr7x9EnAeekWcRHJmjPK1z5BHWqQV896jIaZpltaPMBvK5s
        huXbGGV1p/lUrjuiUTACbTYmSVN+AUryco81nJ4n9qYKEI1F6mAHBlpNoOVa9kt6KAdQAF
        2Jf3PZal5OZUbz+8zWDfJGrhasB2IsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-Q2IFN6HvM-60Tv1M7plb9w-1; Fri, 16 Dec 2022 06:31:00 -0500
X-MC-Unique: Q2IFN6HvM-60Tv1M7plb9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DBE487B2A0;
        Fri, 16 Dec 2022 11:30:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 69AEA49BB6A;
        Fri, 16 Dec 2022 11:30:56 +0000 (UTC)
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
Subject: [PATCH v3 11/11] platform/x86: int3472/discrete: Get the polarity from the _DSM entry
Date:   Fri, 16 Dec 2022 12:30:13 +0100
Message-Id: <20221216113013.126881-12-hdegoede@redhat.com>
In-Reply-To: <20221216113013.126881-1-hdegoede@redhat.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to:
https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch

Bits 31-24 of the _DSM pin entry integer value codes the active-value,
that is the actual physical signal (0 or 1) which needs to be output on
the pin to turn the sensor chip on (to make it active).

So if bits 31-24 are 0 for a reset pin, then the actual value of the reset
pin needs to be 0 to take the chip out of reset. IOW in this case the reset
signal is active-high rather then the default active-low.

And if bits 31-24 are 0 for a clk-en pin then the actual value of the clk
pin needs to be 0 to enable the clk. So in this case the clk-en signal
is active-low rather then the default active-high.

IOW if bits 31-24 are 0 for a pin, then the default polarity of the pin
is inverted.

Add a check for this and also propagate this new polarity to the clock
registration.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/intel/int3472/clk_and_regulator.c  |  5 ++++-
 drivers/platform/x86/intel/int3472/common.h         |  2 +-
 drivers/platform/x86/intel/int3472/discrete.c       | 13 +++++++++++--
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 15a8bff645f7..2b81066b024e 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -87,7 +87,7 @@ static const struct clk_ops skl_int3472_clock_ops = {
 };
 
 int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
-			       struct acpi_resource_gpio *agpio)
+			       struct acpi_resource_gpio *agpio, u32 polarity)
 {
 	char *path = agpio->resource_source.string_ptr;
 	struct clk_init_data init = {
@@ -106,6 +106,9 @@ int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
 		return dev_err_probe(int3472->dev, ret, "getting regulator GPIO\n");
 	}
 
+	if (polarity == GPIO_ACTIVE_LOW)
+		gpiod_toggle_active_low(int3472->clock.ena_gpio);
+
 	/* Ensure the pin is in output mode and non-active state */
 	gpiod_direction_output(int3472->clock.ena_gpio, 0);
 
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 5ec89038ae07..4317c77e53d1 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -122,7 +122,7 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
 					 const char **name_ret);
 
 int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
-			       struct acpi_resource_gpio *agpio);
+			       struct acpi_resource_gpio *agpio, u32 polarity);
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b7752c2b798d..96963e30ab6c 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -220,11 +220,11 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	struct int3472_discrete_device *int3472 = data;
 	struct acpi_resource_gpio *agpio;
 	union acpi_object *obj;
+	u8 active_value, type;
 	const char *err_msg;
 	const char *func;
 	u32 polarity;
 	int ret;
-	u8 type;
 
 	if (!acpi_gpio_get_io_resource(ares, &agpio))
 		return 1;
@@ -248,6 +248,15 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	int3472_get_func_and_polarity(type, &func, &polarity);
 
+	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
+	active_value = obj->integer.value >> 24;
+	if (!active_value)
+		polarity ^= GPIO_ACTIVE_LOW;
+
+	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
+		agpio->resource_source.string_ptr, agpio->pin_table[0],
+		(polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
+
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
@@ -257,7 +266,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-		ret = skl_int3472_register_clock(int3472, agpio);
+		ret = skl_int3472_register_clock(int3472, agpio, polarity);
 		if (ret)
 			err_msg = "Failed to register clock\n";
 
-- 
2.38.1

