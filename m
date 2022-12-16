Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B50864EA84
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 12:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbiLPLb3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 06:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbiLPLb1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 06:31:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301285EDDA
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 03:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671190234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rk9JWI3pdKTiEQ8zZpPnUOz6T7PSRjpkXkbL3aNktvI=;
        b=Yq9RSaAYTN4wkTAAlNX+XSr5ReT/iEy5lckYQrOHdDZbsLb5qxB1oKtlNmsa3mOOFArJOs
        SM86NAYFGFGmJsL8iLceaau50rCecI+HgWTDDlOOaAOLhDP/8fXvXe7oqEelpLwiHsrUPC
        qJKRkFb9f68NuetTNo+eZOUPcbWmsvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-Cmph1bZaMqGdLDfi6iuMog-1; Fri, 16 Dec 2022 06:30:31 -0500
X-MC-Unique: Cmph1bZaMqGdLDfi6iuMog-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33CC93814597;
        Fri, 16 Dec 2022 11:30:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 64F65400F58;
        Fri, 16 Dec 2022 11:30:26 +0000 (UTC)
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
Subject: [PATCH v3 03/11] leds: led-class: Add __of_led_get() helper
Date:   Fri, 16 Dec 2022 12:30:05 +0100
Message-Id: <20221216113013.126881-4-hdegoede@redhat.com>
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

Turn of_led_get() into a more generic __of_led_get() helper function,
which can lookup LEDs in devicetree by either name or index.

This is a preparation patch for adding a generic (non devicetree specific)
led_get() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 5f40110bd260..1dd421ca56c1 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -232,19 +232,18 @@ static struct led_classdev *__led_get(struct device *led_dev)
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
+	 * For named LEDs, first look up the name in the "leds-names" property.
+	 * If it cannot be found, then of_parse_phandle() will propagate the error.
+	 */
+	if (name)
+		index = of_property_match_string(np, "leds-names", name);
 	led_node = of_parse_phandle(np, "leds", index);
 	if (!led_node)
 		return ERR_PTR(-ENOENT);
@@ -254,6 +253,19 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
 
 	return __led_get(led_dev);
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
-- 
2.38.1

