Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9DB67EFA6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 21:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbjA0UjJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 15:39:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjA0UjI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 15:39:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7B8525E
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 12:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674851867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FvC+mJVTxeLB/xxKqNlLzusxS+FDnbgqyFtuEzpY61Y=;
        b=CaYuQ4l/DtHxsSsrF1Scb/tzjBQzaFDrDpTOPcjcBu3pmM91H8Z4i1rZxFY4HdV11g8NnU
        zSKnj0uHBd9gVDjSnmhJNwHTxjAOSgB5bT5b+ElebB0wDv18KMZls2FS8bkx0G9GJ6Cwh3
        Lbylvy8YGgKL9+A6LSImEwrGSWZB3CM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-Cm0Wo-fJPVejEqV3kXS4wA-1; Fri, 27 Jan 2023 15:37:41 -0500
X-MC-Unique: Cm0Wo-fJPVejEqV3kXS4wA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6626C88B776;
        Fri, 27 Jan 2023 20:37:39 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DF3F0492C14;
        Fri, 27 Jan 2023 20:37:35 +0000 (UTC)
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
Subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
Date:   Fri, 27 Jan 2023 21:37:25 +0100
Message-Id: <20230127203729.10205-2-hdegoede@redhat.com>
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

Make v4l2_async_register_subdev_sensor() try to get a privacy LED
associated with the sensor and extend the call_s_stream() wrapper to
enable/disable the privacy LED if found.

This makes the core handle privacy LED control, rather then having to
duplicate this code in all the sensor drivers.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v6:
- Add v4l2_subdev_privacy_led_get()/_put() helpers
- At least the _put helper is necessary for cleanup on errors later on in
  v4l2_async_register_subdev_sensor()
- This puts all the LED related coded into a single file (v4l2-subdev.c)
  removing the need to build the async + fwnode code into videodev.ko,
  so that patch is dropped
- Move the (non-error-exit) cleanup from v4l2_subdev_cleanup() to
   v4l2_async_unregister_subdev()

Changes in v4 (requested by Laurent Pinchart):
- Move the led_get() call to v4l2_async_register_subdev_sensor() and
  make errors other then -ENOENT fail the register() call.
- Move the led_disable_sysfs() call to be done at led_get() time, instead
  of only disabling the sysfs interface when the sensor is streaming.
---
 drivers/media/v4l2-core/v4l2-async.c       |  4 ++
 drivers/media/v4l2-core/v4l2-fwnode.c      |  7 ++++
 drivers/media/v4l2-core/v4l2-subdev-priv.h | 14 +++++++
 drivers/media/v4l2-core/v4l2-subdev.c      | 44 ++++++++++++++++++++++
 include/media/v4l2-subdev.h                |  3 ++
 5 files changed, 72 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-subdev-priv.h

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2f1b718a9189..d7e9ffc7aa23 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -24,6 +24,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#include "v4l2-subdev-priv.h"
+
 static int v4l2_async_nf_call_bound(struct v4l2_async_notifier *n,
 				    struct v4l2_subdev *subdev,
 				    struct v4l2_async_subdev *asd)
@@ -822,6 +824,8 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 	if (!sd->async_list.next)
 		return;
 
+	v4l2_subdev_put_privacy_led(sd);
+
 	mutex_lock(&list_lock);
 
 	__v4l2_async_nf_unregister(sd->subdev_notifier);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 3d9533c1b202..049c2f2001ea 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -28,6 +28,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#include "v4l2-subdev-priv.h"
+
 static const struct v4l2_fwnode_bus_conv {
 	enum v4l2_fwnode_bus_type fwnode_bus_type;
 	enum v4l2_mbus_type mbus_type;
@@ -1302,6 +1304,10 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 
 	v4l2_async_nf_init(notifier);
 
+	ret = v4l2_subdev_get_privacy_led(sd);
+	if (ret < 0)
+		goto out_cleanup;
+
 	ret = v4l2_async_nf_parse_fwnode_sensor(sd->dev, notifier);
 	if (ret < 0)
 		goto out_cleanup;
@@ -1322,6 +1328,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 	v4l2_async_nf_unregister(notifier);
 
 out_cleanup:
+	v4l2_subdev_put_privacy_led(sd);
 	v4l2_async_nf_cleanup(notifier);
 	kfree(notifier);
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev-priv.h b/drivers/media/v4l2-core/v4l2-subdev-priv.h
new file mode 100644
index 000000000000..52391d6d8ab7
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-subdev-priv.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * V4L2 sub-device pivate header.
+ *
+ * Copyright (C) 2023 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#ifndef _V4L2_SUBDEV_PRIV_H_
+#define _V4L2_SUBDEV_PRIV_H_
+
+int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd);
+void v4l2_subdev_put_privacy_led(struct v4l2_subdev *sd);
+
+#endif
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4988a25bd8f4..9fd183628285 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/ioctl.h>
+#include <linux/leds.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -23,6 +24,8 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-event.h>
 
+#include "v4l2-subdev-priv.h"
+
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
@@ -322,6 +325,14 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -1090,6 +1101,7 @@ void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
 	sd->grp_id = 0;
 	sd->dev_priv = NULL;
 	sd->host_priv = NULL;
+	sd->privacy_led = NULL;
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	sd->entity.name = sd->name;
 	sd->entity.obj_type = MEDIA_ENTITY_TYPE_V4L2_SUBDEV;
@@ -1105,3 +1117,35 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
+
+int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
+{
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
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_privacy_led);
+
+void v4l2_subdev_put_privacy_led(struct v4l2_subdev *sd)
+{
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
+		mutex_lock(&sd->privacy_led->led_access);
+		led_sysfs_enable(sd->privacy_led);
+		mutex_unlock(&sd->privacy_led->led_access);
+		led_put(sd->privacy_led);
+	}
+#endif
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_put_privacy_led);
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
2.39.1

