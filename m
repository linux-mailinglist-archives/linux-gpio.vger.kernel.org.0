Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8C664EA8B
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 12:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbiLPLbg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 06:31:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbiLPLbf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 06:31:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B687A167FE
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 03:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671190243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TPZAvcSWa7ZoNFdQlUVFBketRAGJW/SHrz8gHWtEsVk=;
        b=VrlgS7LLkm5CSpZV9K+X4XMag7D7RgXF7ALKRax3R4Serex6hEr+29CqxVuLk8EGeKjfBV
        N4fSDRAZcnpDbSkYcqu3wY201onvDev9DV87zUo8eFwsiry4Yoze9uk1zYSKfNW4ewhvGB
        UjhaZzxdyyUXBjlMCPaZPGLdEIAFOmw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633--hl6y3gGP2q5TlEBpBCLwQ-1; Fri, 16 Dec 2022 06:30:41 -0500
X-MC-Unique: -hl6y3gGP2q5TlEBpBCLwQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E25BA3814595;
        Fri, 16 Dec 2022 11:30:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B3A3C400F58;
        Fri, 16 Dec 2022 11:30:37 +0000 (UTC)
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
Subject: [PATCH v3 06/11] v4l: subdev: Make the v4l2-subdev core code enable/disable the privacy LED if present
Date:   Fri, 16 Dec 2022 12:30:08 +0100
Message-Id: <20221216113013.126881-7-hdegoede@redhat.com>
In-Reply-To: <20221216113013.126881-1-hdegoede@redhat.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend the call_s_stream() wrapper to enable/disable sensor privacy LEDs
for sensors with a privacy LED, rather then having to duplicate this code
in all the sensor drivers.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  3 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4988a25bd8f4..7344f6cd58b7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -318,10 +318,44 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
 
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+#include <linux/leds.h>
+
+static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable)
+{
+	if (!sd->dev)
+		return;
+
+	/* Try to get privacy-led once, at first s_stream() */
+	if (!sd->privacy_led)
+		sd->privacy_led = led_get(sd->dev, "privacy-led");
+
+	if (IS_ERR(sd->privacy_led))
+		return;
+
+	mutex_lock(&sd->privacy_led->led_access);
+
+	if (enable) {
+		led_sysfs_disable(sd->privacy_led);
+		led_trigger_remove(sd->privacy_led);
+		led_set_brightness(sd->privacy_led, sd->privacy_led->max_brightness);
+	} else {
+		led_set_brightness(sd->privacy_led, 0);
+		led_sysfs_enable(sd->privacy_led);
+	}
+
+	mutex_unlock(&sd->privacy_led->led_access);
+}
+#else
+static void call_s_stream_update_pled(struct v4l2_subdev *sd, int enable) {}
+#endif
+
 static int call_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	int ret;
 
+	call_s_stream_update_pled(sd, enable);
+
 	ret = sd->ops->video->s_stream(sd, enable);
 
 	if (!enable && ret < 0) {
@@ -1050,6 +1084,11 @@ EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
 
 void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 {
+#if IS_REACHABLE(CONFIG_LEDS_CLASS)
+	if (!IS_ERR_OR_NULL(sd->privacy_led))
+		led_put(sd->privacy_led);
+#endif
+
 	__v4l2_subdev_state_free(sd->active_state);
 	sd->active_state = NULL;
 }
@@ -1090,6 +1129,7 @@ void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
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
2.38.1

