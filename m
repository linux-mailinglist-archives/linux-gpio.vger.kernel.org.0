Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C377673949
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 14:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjASNDZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 08:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjASNCr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 08:02:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F5E798D6
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 05:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674133294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+dLAU60oJknLewfDfFx5obiNR/Z8PUeaEXH5HKtHn1E=;
        b=E9ae3MKemZ47V7fO1d8r0qUhBzhzeLvi1JxyOAAMmjB9czM/oqE4jH4/ac9PpK9gE8z80T
        CL33t/gpZs6L5woLijdTevhgIs+Uk6s+QiTtdDRCPBJLTU4Y12XgkfltA/omMYA0VmfaF8
        QYgDghM4GkXh7jo8ueZJ1oiNdcR8m6k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-Kg5R9GDhO6K8l2s4NpbMBw-1; Thu, 19 Jan 2023 08:01:31 -0500
X-MC-Unique: Kg5R9GDhO6K8l2s4NpbMBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EE6218A6470;
        Thu, 19 Jan 2023 13:01:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E766A1415108;
        Thu, 19 Jan 2023 13:01:26 +0000 (UTC)
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
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 05/11] [RFC] leds: led-class: Add devicetree support to led_get()
Date:   Thu, 19 Jan 2023 14:00:47 +0100
Message-Id: <20230119130053.111344-6-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-1-hdegoede@redhat.com>
References: <20230119130053.111344-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Turn of_led_get() into a more generic __of_led_get() helper function,
which can lookup LEDs in devicetree by either name or index.

And use this new helper to add devicetree support to the generic
(non devicetree specific) [devm_]led_get() function.

This uses the standard devicetree pattern of adding a -names string array
to map names to the indexes for an array of resources.

Note the new led-names property for LED consumers is not added
to the devicetree documentation because there seems to be no
documentation for the leds property itself to extend it with this.
It seems that how LED consumers should be described is not documented
at all ATM.

This patch is marked as RFC because of both the missing devicetree
documentation and because there are no devicetree users of
the generic [devm_]led_get() function for now.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 6dff57c41e96..22f658c750d1 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -234,19 +234,18 @@ static struct led_classdev *led_module_get(struct device *led_dev)
 	return led_cdev;
 }
 
-/**
- * of_led_get() - request a LED device via the LED framework
- * @np: device node to get the LED device from
- * @index: the index of the LED
- *
- * Returns the LED device parsed from the phandle specified in the "leds"
- * property of a device tree node or a negative error-code on failure.
- */
-struct led_classdev *of_led_get(struct device_node *np, int index)
+static struct led_classdev *__of_led_get(struct device_node *np, int index,
+					 const char *name)
 {
 	struct device *led_dev;
 	struct device_node *led_node;
 
+	/*
+	 * For named LEDs, first look up the name in the "led-names" property.
+	 * If it cannot be found, then of_parse_phandle() will propagate the error.
+	 */
+	if (name)
+		index = of_property_match_string(np, "led-names", name);
 	led_node = of_parse_phandle(np, "leds", index);
 	if (!led_node)
 		return ERR_PTR(-ENOENT);
@@ -256,6 +255,19 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
 
 	return led_module_get(led_dev);
 }
+
+/**
+ * of_led_get() - request a LED device via the LED framework
+ * @np: device node to get the LED device from
+ * @index: the index of the LED
+ *
+ * Returns the LED device parsed from the phandle specified in the "leds"
+ * property of a device tree node or a negative error-code on failure.
+ */
+struct led_classdev *of_led_get(struct device_node *np, int index)
+{
+	return __of_led_get(np, index, NULL);
+}
 EXPORT_SYMBOL_GPL(of_led_get);
 
 /**
@@ -329,9 +341,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
 struct led_classdev *led_get(struct device *dev, char *function)
 {
 	struct led_lookup_data *lookup;
+	struct led_classdev *led_cdev;
 	const char *led_name = NULL;
 	struct device *led_dev;
 
+	if (dev->of_node) {
+		led_cdev = __of_led_get(dev->of_node, -1, function);
+		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
+			return led_cdev;
+	}
+
 	mutex_lock(&leds_lookup_lock);
 	list_for_each_entry(lookup, &leds_lookup_list, list) {
 		if (!strcmp(lookup->consumer_dev_name, dev_name(dev)) &&
-- 
2.39.0

