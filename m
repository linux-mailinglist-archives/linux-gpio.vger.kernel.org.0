Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA3067394F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 14:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjASND3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 08:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjASNDB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 08:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85702798C6
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 05:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674133302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ga2PGVX0PPBs2vzCz8Ez+avx29WM7urpa7gn/akoUYg=;
        b=LKOgbkccubJ/WKjNXB7GpDwLvoT0EJik1WP74kyGgqyZPg6ueXL8tjq4mWC7LI4JVnMBdL
        /XzqUsqSC4hqJJT3hDPnJN7GdKBIDI1XXb+8HA42YyJYuWbUMdULI/Ae8al0qvT2DcDz7Q
        QzkEv8S7o8P1t1Ffh+VdZDGqbVFlw30=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636--Z7FW677MS6ZUQHoTu-klQ-1; Thu, 19 Jan 2023 08:01:39 -0500
X-MC-Unique: -Z7FW677MS6ZUQHoTu-klQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 955B21C0A594;
        Thu, 19 Jan 2023 13:01:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B5E7E14152F6;
        Thu, 19 Jan 2023 13:01:34 +0000 (UTC)
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
Subject: [PATCH v4 07/11] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
Date:   Thu, 19 Jan 2023 14:00:49 +0100
Message-Id: <20230119130053.111344-8-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-1-hdegoede@redhat.com>
References: <20230119130053.111344-1-hdegoede@redhat.com>
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

Make v4l2_async_register_subdev_sensor() try to get a privacy LED
associated with the sensor and extend the call_s_stream() wrapper to
enable/disable the privacy LED if found.

This makes the core handle privacy LED control, rather then having to
duplicate this code in all the sensor drivers.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4 (requested by Laurent Pinchart):
- Move the led_get() call to v4l2_async_register_subdev_sensor() and
  make errors other then -ENOENT fail the register() call.
- Move the led_disable_sysfs() call to be done at led_get() time, instead
  of only disabling the sysfs interface when the sensor is streaming.
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++++++++++++++
 include/media/v4l2-subdev.h           |  3 +++
 3 files changed, 36 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index c8a2264262bc..cfac1e2ae501 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -16,6 +16,7 @@
  */
 #include <linux/acpi.h>
 #include <linux/kernel.h>
+#include <linux/leds.h>
 #include <linux/mm.h>
 #include <linux/of.h>
 #include <linux/property.h>
@@ -1295,6 +1296,20 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 	if (WARN_ON(!sd->dev))
 		return -ENODEV;
 
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+	sd->privacy_led = led_get(sd->dev, "privacy-led");
+	if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
+		return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led), "getting privacy LED\n");
+
+	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
+		mutex_lock(&sd->privacy_led->led_access);
+		led_sysfs_disable(sd->privacy_led);
+		led_trigger_remove(sd->privacy_led);
+		led_set_brightness(sd->privacy_led, 0);
+		mutex_unlock(&sd->privacy_led->led_access);
+	}
+#endif
+
 	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
 	if (!notifier)
 		return -ENOMEM;
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4988a25bd8f4..f33e943aab3f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/ioctl.h>
+#include <linux/leds.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -322,6 +323,14 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	int ret;
 
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
+		if (enable)
+			led_set_brightness(sd->privacy_led, sd->privacy_led->max_brightness);
+		else
+			led_set_brightness(sd->privacy_led, 0);
+	}
+#endif
 	ret = sd->ops->video->s_stream(sd, enable);
 
 	if (!enable && ret < 0) {
@@ -1050,6 +1059,14 @@ EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
 
 void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 {
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
+		mutex_lock(&sd->privacy_led->led_access);
+		led_sysfs_enable(sd->privacy_led);
+		mutex_unlock(&sd->privacy_led->led_access);
+		led_put(sd->privacy_led);
+	}
+#endif
 	__v4l2_subdev_state_free(sd->active_state);
 	sd->active_state = NULL;
 }
@@ -1090,6 +1107,7 @@ void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
 	sd->grp_id = 0;
 	sd->dev_priv = NULL;
 	sd->host_priv = NULL;
+	sd->privacy_led = NULL;
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	sd->entity.name = sd->name;
 	sd->entity.obj_type = MEDIA_ENTITY_TYPE_V4L2_SUBDEV;
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b15fa9930f30..0547313f98cc 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -38,6 +38,7 @@ struct v4l2_subdev;
 struct v4l2_subdev_fh;
 struct tuner_setup;
 struct v4l2_mbus_frame_desc;
+struct led_classdev;
 
 /**
  * struct v4l2_decode_vbi_line - used to decode_vbi_line
@@ -982,6 +983,8 @@ struct v4l2_subdev {
 	 * appropriate functions.
 	 */
 
+	struct led_classdev *privacy_led;
+
 	/*
 	 * TODO: active_state should most likely be changed from a pointer to an
 	 * embedded field. For the time being it's kept as a pointer to more
-- 
2.39.0

