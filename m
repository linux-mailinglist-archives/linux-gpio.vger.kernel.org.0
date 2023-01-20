Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB916753AE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 12:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjATLrr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 06:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjATLro (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 06:47:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79395AA7F1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 03:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674215157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bbe9z/QfPbRLjMmd2NdM01X6iKaiDeiCdG9jE+MnnFg=;
        b=ZzZDaQfJRqSF+yuDxr1CXJwBpSNw/umY4JDfpbczLGdedPHRsvLZq0ZWuS6FYfplP3o6ja
        o6qDFJ8Y/mviLIv+jr+kZU8+PpkZE8IJZyH1yT3/PjiQfHM8G26YGmvuatF2ZGW2zcPusJ
        uNpGcqo43Y/kHm2CYM0cMdZOf82c6Uw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-tbw3YMK6PTSyJA0Jihx4nQ-1; Fri, 20 Jan 2023 06:45:53 -0500
X-MC-Unique: tbw3YMK6PTSyJA0Jihx4nQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B040E85C064;
        Fri, 20 Jan 2023 11:45:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.101])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 49F30140EBF6;
        Fri, 20 Jan 2023 11:45:48 +0000 (UTC)
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
Subject: [PATCH v5 04/11] leds: led-class: Add generic [devm_]led_get()
Date:   Fri, 20 Jan 2023 12:45:17 +0100
Message-Id: <20230120114524.408368-5-hdegoede@redhat.com>
In-Reply-To: <20230120114524.408368-1-hdegoede@redhat.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a generic [devm_]led_get() method which can be used on both devicetree
and non devicetree platforms to get a LED classdev associated with
a specific function on a specific device, e.g. the privacy LED associated
with a specific camera sensor.

Note unlike of_led_get() this takes a string describing the function
rather then an index. This is done because e.g. camera sensors might
have a privacy LED, or a flash LED, or both and using an index
approach leaves it unclear what the function of index 0 is if there is
only 1 LED.

This uses a lookup-table mechanism for non devicetree platforms.
This allows the platform code to map specific LED class_dev-s to a specific
device,function combinations this way.

For devicetree platforms getting the LED by function-name could be made
to work using the standard devicetree pattern of adding a -names string
array to map names to the indexes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
- Rename lookup-table names to match those from the gpio and reset lookups:
  s/led_name/provider/
  s/consumer_dev_name/dev_id/
  s/consumer_function/con_id/

Changes in v4:
- Split out support for led_get() devicetree name-based lookup support
  into a separate RFC patch as there currently are no users for this
- Use kstrdup_const() / kfree_const() for the led_name
---
 drivers/leds/led-class.c | 84 ++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h     | 21 ++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4904d140a560..0c4b8d8d2b4f 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -23,6 +23,8 @@
 #include "leds.h"
 
 static struct class *leds_class;
+static DEFINE_MUTEX(leds_lookup_lock);
+static LIST_HEAD(leds_lookup_list);
 
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
@@ -317,6 +319,88 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_of_led_get);
 
+/**
+ * led_get() - request a LED device via the LED framework
+ * @dev: device for which to get the LED device
+ * @con_id: name of the LED from the device's point of view
+ *
+ * @return a pointer to a LED device or ERR_PTR(errno) on failure.
+ */
+struct led_classdev *led_get(struct device *dev, char *con_id)
+{
+	struct led_lookup_data *lookup;
+	const char *provider = NULL;
+	struct device *led_dev;
+
+	mutex_lock(&leds_lookup_lock);
+	list_for_each_entry(lookup, &leds_lookup_list, list) {
+		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
+		    !strcmp(lookup->con_id, con_id)) {
+			provider = kstrdup_const(lookup->provider, GFP_KERNEL);
+			break;
+		}
+	}
+	mutex_unlock(&leds_lookup_lock);
+
+	if (!provider)
+		return ERR_PTR(-ENOENT);
+
+	led_dev = class_find_device_by_name(leds_class, provider);
+	kfree_const(provider);
+
+	return led_module_get(led_dev);
+}
+EXPORT_SYMBOL_GPL(led_get);
+
+/**
+ * devm_led_get() - request a LED device via the LED framework
+ * @dev: device for which to get the LED device
+ * @con_id: name of the LED from the device's point of view
+ *
+ * The LED device returned from this function is automatically released
+ * on driver detach.
+ *
+ * @return a pointer to a LED device or ERR_PTR(errno) on failure.
+ */
+struct led_classdev *devm_led_get(struct device *dev, char *con_id)
+{
+	struct led_classdev *led;
+
+	led = led_get(dev, con_id);
+	if (IS_ERR(led))
+		return led;
+
+	return __devm_led_get(dev, led);
+}
+EXPORT_SYMBOL_GPL(devm_led_get);
+
+/**
+ * led_add_lookup() - Add a LED lookup table entry
+ * @led_lookup: the lookup table entry to add
+ *
+ * Add a LED lookup table entry. On systems without devicetree the lookup table
+ * is used by led_get() to find LEDs.
+ */
+void led_add_lookup(struct led_lookup_data *led_lookup)
+{
+	mutex_lock(&leds_lookup_lock);
+	list_add_tail(&led_lookup->list, &leds_lookup_list);
+	mutex_unlock(&leds_lookup_lock);
+}
+EXPORT_SYMBOL_GPL(led_add_lookup);
+
+/**
+ * led_remove_lookup() - Remove a LED lookup table entry
+ * @led_lookup: the lookup table entry to remove
+ */
+void led_remove_lookup(struct led_lookup_data *led_lookup)
+{
+	mutex_lock(&leds_lookup_lock);
+	list_del(&led_lookup->list);
+	mutex_unlock(&leds_lookup_lock);
+}
+EXPORT_SYMBOL_GPL(led_remove_lookup);
+
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index ba4861ec73d3..8d6767072ebf 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -39,6 +39,21 @@ enum led_default_state {
 	LEDS_DEFSTATE_KEEP	= 2,
 };
 
+/**
+ * struct led_lookup_data - represents a single LED lookup entry
+ *
+ * @list: internal list of all LED lookup entries
+ * @provider: name of led_classdev providing the LED
+ * @dev_id: name of the device associated with this LED
+ * @con_id: name of the LED from the device's point of view
+ */
+struct led_lookup_data {
+	struct list_head list;
+	const char *provider;
+	const char *dev_id;
+	const char *con_id;
+};
+
 struct led_init_data {
 	/* device fwnode handle */
 	struct fwnode_handle *fwnode;
@@ -211,6 +226,12 @@ void devm_led_classdev_unregister(struct device *parent,
 void led_classdev_suspend(struct led_classdev *led_cdev);
 void led_classdev_resume(struct led_classdev *led_cdev);
 
+void led_add_lookup(struct led_lookup_data *led_lookup);
+void led_remove_lookup(struct led_lookup_data *led_lookup);
+
+struct led_classdev *__must_check led_get(struct device *dev, char *con_id);
+struct led_classdev *__must_check devm_led_get(struct device *dev, char *con_id);
+
 extern struct led_classdev *of_led_get(struct device_node *np, int index);
 extern void led_put(struct led_classdev *led_cdev);
 struct led_classdev *__must_check devm_of_led_get(struct device *dev,
-- 
2.39.0

