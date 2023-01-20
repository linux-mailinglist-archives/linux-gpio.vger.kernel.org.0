Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A21A6753AD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 12:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbjATLrq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 06:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjATLro (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 06:47:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44C1AED80
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 03:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674215161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eMy2u3fS8UlwWS+/xo+vJepWt/qH7+/2b1RLoZSn4uU=;
        b=iTBX9G9qDoGDs1bZe18/1wbXG/GCSsC4q4w4u952bBOeucvWrnAw8Ed3kba4AqTZzOqLeT
        j0RtLfHjGAKPe2nJ3fGKCbq7FHWcEBtOXw2nY/W4kg/68CHNcYY5M3QnPW8kw6ddZ2OMgh
        4Tbq9cSZ0l5ijxm5YGiVFJVtrKCozlk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-XN4TBbSaNgyh0dyB5D4tag-1; Fri, 20 Jan 2023 06:45:59 -0500
X-MC-Unique: XN4TBbSaNgyh0dyB5D4tag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B51B29AB3FF;
        Fri, 20 Jan 2023 11:45:58 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.101])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0B339140EBF6;
        Fri, 20 Jan 2023 11:45:55 +0000 (UTC)
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
Subject: [PATCH v5 06/11] media: v4l2-core: Built async and fwnode code into videodev.ko
Date:   Fri, 20 Jan 2023 12:45:19 +0100
Message-Id: <20230120114524.408368-7-hdegoede@redhat.com>
In-Reply-To: <20230120114524.408368-1-hdegoede@redhat.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
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

Currently the videodev.ko code may be builtin while e.g. v4l2-fwnode.ko
is build as a module.

This makes it hard to add code depending on other subsystems spanning
both videodev.ko and v4l2-fwnode.ko. Specifically this block adding code
depending on the LED subsystem.

This is made even harder because CONFIG_V4L2_FWNODE is selected,
not depended on so it itself cannot depend on another subsystem without
editing all the Kconfig symbols selecting it to also list the dependency
and there are many of such symbols.

Adding a "select LED_CLASS if NEW_LEDS" to CONFIG_V4L2_FWNODE leads
to Kconfig erroring out with "error: recursive dependency detected!".

To fix this dependency mess, change the V4L2_FWNODE and V4L2_ASYNC
(which V4L2_FWNODE selects) Kconfig symbols from tristate to bools and
link their code into videodev.ko instead of making them separate modules.

This will allow using IS_REACHABLE(LED_CLASS) for the new LED integration
code without needing to worry that it expands to 0 in some places and
1 in other places because some of the code being builtin vs modular.

On x86_64 this leads to the following size changes for videodev.ko

[hans@shalem linux]$ size drivers/media/v4l2-core/videodev.ko

Before:
   text	   data	    bss	    dec	    hex	filename
 218206	  14395	   2448	 235049	  39629 drivers/media/v4l2-core/videodev.ko
After:
   text	   data	    bss	    dec	    hex	filename
 243213	  17615	   2456	 263284	  40474	drivers/media/v4l2-core/videodev.ko

So (as expected) there is some increase in size here, but it
really is not that much.

And the uncompressed no-debuginfo .ko file disk-usage actually shrinks
by 17 KiB (comparing the slightly larger videodev.ko against the
3 original modules) and loading time will also be better.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
- Add a new v4l2-dev-priv.h for the async debugfs prototypes and add
  static inline wrappers there when CONFIG_V4L2_ASYNC is not enabled

Changes in v4:
- New patch in v4 of this patch-set
---
 drivers/media/v4l2-core/Kconfig         |  4 ++--
 drivers/media/v4l2-core/Makefile        |  4 ++--
 drivers/media/v4l2-core/v4l2-async.c    | 17 ++++-------------
 drivers/media/v4l2-core/v4l2-dev-priv.h | 19 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-dev.c      |  8 ++++++++
 drivers/media/v4l2-core/v4l2-fwnode.c   |  6 ------
 6 files changed, 35 insertions(+), 23 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-dev-priv.h

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 348559bc2468..73574d946010 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -68,11 +68,11 @@ config V4L2_FLASH_LED_CLASS
 	  When in doubt, say N.
 
 config V4L2_FWNODE
-	tristate
+	bool
 	select V4L2_ASYNC
 
 config V4L2_ASYNC
-	tristate
+	bool
 
 # Used by drivers that need Videobuf modules
 config VIDEOBUF_GEN
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 41d91bd10cf2..8c5a1ab8d939 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -15,7 +15,9 @@ videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
+videodev-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
 videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
+videodev-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
 videodev-$(CONFIG_SPI) += v4l2-spi.o
 videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
@@ -24,9 +26,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
 
-obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
-obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
 obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2f1b718a9189..024d6b82b50a 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -11,7 +11,6 @@
 #include <linux/i2c.h>
 #include <linux/list.h>
 #include <linux/mm.h>
-#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -24,6 +23,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#include "v4l2-dev-priv.h"
+
 static int v4l2_async_nf_call_bound(struct v4l2_async_notifier *n,
 				    struct v4l2_subdev *subdev,
 				    struct v4l2_async_subdev *asd)
@@ -900,25 +901,15 @@ DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
 
 static struct dentry *v4l2_async_debugfs_dir;
 
-static int __init v4l2_async_init(void)
+void __init v4l2_async_debugfs_init(void)
 {
 	v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
 	debugfs_create_file("pending_async_subdevices", 0444,
 			    v4l2_async_debugfs_dir, NULL,
 			    &pending_subdevs_fops);
-
-	return 0;
 }
 
-static void __exit v4l2_async_exit(void)
+void __exit v4l2_async_debugfs_exit(void)
 {
 	debugfs_remove_recursive(v4l2_async_debugfs_dir);
 }
-
-subsys_initcall(v4l2_async_init);
-module_exit(v4l2_async_exit);
-
-MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
-MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
-MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
-MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-dev-priv.h b/drivers/media/v4l2-core/v4l2-dev-priv.h
new file mode 100644
index 000000000000..b5b1ee78be20
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-dev-priv.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Video capture interface for Linux version 2 private header.
+ *
+ * Copyright (C) 2023 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#ifndef _V4L2_DEV_PRIV_H_
+#define _V4L2_DEV_PRIV_H_
+
+#if IS_ENABLED(CONFIG_V4L2_ASYNC)
+void v4l2_async_debugfs_init(void);
+void v4l2_async_debugfs_exit(void);
+#else
+static inline void v4l2_async_debugfs_init(void) {}
+static inline void v4l2_async_debugfs_exit(void) {}
+#endif
+
+#endif
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 397d553177fa..10ba2e4196a6 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -31,6 +31,8 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 
+#include "v4l2-dev-priv.h"
+
 #define VIDEO_NUM_DEVICES	256
 #define VIDEO_NAME              "video4linux"
 
@@ -1190,6 +1192,7 @@ static int __init videodev_init(void)
 		return -EIO;
 	}
 
+	v4l2_async_debugfs_init();
 	return 0;
 }
 
@@ -1197,6 +1200,7 @@ static void __exit videodev_exit(void)
 {
 	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
 
+	v4l2_async_debugfs_exit();
 	class_unregister(&video_class);
 	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
 }
@@ -1205,6 +1209,10 @@ subsys_initcall(videodev_init);
 module_exit(videodev_exit)
 
 MODULE_AUTHOR("Alan Cox, Mauro Carvalho Chehab <mchehab@kernel.org>, Bill Dirks, Justin Schoeman, Gerd Knorr");
+MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
+MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
+MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
+MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
 MODULE_DESCRIPTION("Video4Linux2 core driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_CHARDEV_MAJOR(VIDEO_MAJOR);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 3d9533c1b202..c8a2264262bc 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -17,7 +17,6 @@
 #include <linux/acpi.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -1328,8 +1327,3 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
-MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
-MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
-- 
2.39.0

