Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6740667EFAA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 21:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjA0UjM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 15:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbjA0UjK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 15:39:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA42993EB
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 12:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674851868;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xT+sMb53YKOY8Wu0RJ8DpPc3Z6j34v11O/P+urbWZ3o=;
        b=b8YLsStkj3zeQd7BdKsG1vjiMVqyu6Xm6YJXQTxlaxJqW5RSOyrux/aOCjKI6BPZYcGEN1
        w8qaV5eNdxI35JgFP+cPWIcFQ0XLUW4b4qNy+Ubsp6s9K2W119/UomgqEfplOPeCsArbQq
        5TfDtECorspqiky8Ypti4bMfCSt5z1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-c0UUVRjtM-G4j9FEx979tg-1; Fri, 27 Jan 2023 15:37:43 -0500
X-MC-Unique: c0UUVRjtM-G4j9FEx979tg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A82688B783;
        Fri, 27 Jan 2023 20:37:43 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C5D1B492C14;
        Fri, 27 Jan 2023 20:37:39 +0000 (UTC)
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
Subject: [PATCH v6 2/5] platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
Date:   Fri, 27 Jan 2023 21:37:26 +0100
Message-Id: <20230127203729.10205-3-hdegoede@redhat.com>
In-Reply-To: <20230127203729.10205-1-hdegoede@redhat.com>
References: <20230127203729.10205-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a helper function to map the type returned by the _DSM
method to a function name + the default polarity for that function.

And fold the INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN
cases into a single generic case.

This is a preparation patch for further GPIO mapping changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Add break to default case

Changes in v2:
- Make the helper function doing the type -> function mapping,
  also return a default polarity for the function.
---
 drivers/platform/x86/intel/int3472/discrete.c | 45 +++++++++++++++----
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index c42c3faa2c32..708d51f9b41d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -188,6 +188,36 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
 	return 0;
 }
 
+static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
+{
+	switch (type) {
+	case INT3472_GPIO_TYPE_RESET:
+		*func = "reset";
+		*polarity = GPIO_ACTIVE_LOW;
+		break;
+	case INT3472_GPIO_TYPE_POWERDOWN:
+		*func = "powerdown";
+		*polarity = GPIO_ACTIVE_LOW;
+		break;
+	case INT3472_GPIO_TYPE_CLK_ENABLE:
+		*func = "clk-enable";
+		*polarity = GPIO_ACTIVE_HIGH;
+		break;
+	case INT3472_GPIO_TYPE_PRIVACY_LED:
+		*func = "privacy-led";
+		*polarity = GPIO_ACTIVE_HIGH;
+		break;
+	case INT3472_GPIO_TYPE_POWER_ENABLE:
+		*func = "power-enable";
+		*polarity = GPIO_ACTIVE_HIGH;
+		break;
+	default:
+		*func = "unknown";
+		*polarity = GPIO_ACTIVE_HIGH;
+		break;
+	}
+}
+
 /**
  * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
  * @ares: A pointer to a &struct acpi_resource
@@ -227,6 +257,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	struct acpi_resource_gpio *agpio;
 	union acpi_object *obj;
 	const char *err_msg;
+	const char *func;
+	u32 polarity;
 	int ret;
 	u8 type;
 
@@ -250,19 +282,14 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = obj->integer.value & 0xff;
 
+	int3472_get_func_and_polarity(type, &func, &polarity);
+
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
-		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, "reset",
-						     GPIO_ACTIVE_LOW);
-		if (ret)
-			err_msg = "Failed to map reset pin to sensor\n";
-
-		break;
 	case INT3472_GPIO_TYPE_POWERDOWN:
-		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, "powerdown",
-						     GPIO_ACTIVE_LOW);
+		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
 		if (ret)
-			err_msg = "Failed to map powerdown pin to sensor\n";
+			err_msg = "Failed to map GPIO pin to sensor\n";
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-- 
2.39.1

