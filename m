Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814706753B1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 12:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjATLrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 06:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbjATLrr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 06:47:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203D3B1ED3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 03:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674215163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WytM6xEtYXdX+NiB5mmZLyyo4HWXAGfnPyDw4X9ERkk=;
        b=e5OyY3GUJUK5Vs+zjaULijKTRHQIGBJc4+p7zg++g58DsyFml2h0wc1+UVDWZdURCpU1vd
        DUfVoUDv6pSpjYGtCCu3/xrpZiSZ5Twl+ceSL90CZiMJxI6nh7KDIaP0T1iJiZrRy0frSH
        vzhKBSyKQ3e1Cgn/j9RRFVVWfu8Em5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-Z5RTCvFaOFS3WGfoHAG2vQ-1; Fri, 20 Jan 2023 06:45:56 -0500
X-MC-Unique: Z5RTCvFaOFS3WGfoHAG2vQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5ACE85C06A;
        Fri, 20 Jan 2023 11:45:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.101])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 01FD4140EBF6;
        Fri, 20 Jan 2023 11:45:52 +0000 (UTC)
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
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5 05/11] [RFC] leds: led-class: Add devicetree support to led_get()
Date:   Fri, 20 Jan 2023 12:45:18 +0100
Message-Id: <20230120114524.408368-6-hdegoede@redhat.com>
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

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 0c4b8d8d2b4f..2f3af6e30208 100644
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
 struct led_classdev *led_get(struct device *dev, char *con_id)
 {
 	struct led_lookup_data *lookup;
+	struct led_classdev *led_cdev;
 	const char *provider = NULL;
 	struct device *led_dev;
 
+	if (dev->of_node) {
+		led_cdev = __of_led_get(dev->of_node, -1, con_id);
+		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
+			return led_cdev;
+	}
+
 	mutex_lock(&leds_lookup_lock);
 	list_for_each_entry(lookup, &leds_lookup_list, list) {
 		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
-- 
2.39.0

