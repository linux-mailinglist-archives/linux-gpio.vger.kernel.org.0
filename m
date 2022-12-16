Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4B964EA79
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 12:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiLPLbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 06:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbiLPLbL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 06:31:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991295D699
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 03:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671190226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YzlAdBtWQtdtcO1KtNG8PUbN7RwO8aij9ZOIXs05rjQ=;
        b=Ptv2PnYXO+2OxwJY41qNX0yUGILJXoxRxhO6XDmfLLIwDrSublcx0NgblorSiVF9UnSp0C
        pnNn7mzX7O9GvPYGNY/reHoNfsewGNdJgW+qvOfd4H0EK0uzA8OVH83dvBAtYP+MPuvDP5
        XJfB/lff2yllBFOorKg0FCAtmjgDMDo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-NUqsAS-xO_SNkRDDG49iJQ-1; Fri, 16 Dec 2022 06:30:23 -0500
X-MC-Unique: NUqsAS-xO_SNkRDDG49iJQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60D4183D5BB;
        Fri, 16 Dec 2022 11:30:22 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A27E9400F58;
        Fri, 16 Dec 2022 11:30:18 +0000 (UTC)
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
Subject: [PATCH v3 01/11] leds: led-class: Add missing put_device() to led_put()
Date:   Fri, 16 Dec 2022 12:30:03 +0100
Message-Id: <20221216113013.126881-2-hdegoede@redhat.com>
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

led_put() is used to "undo" a successful of_led_get() call,
of_led_get() uses class_find_device_by_of_node() which returns
a reference to the device which must be free-ed with put_device()
when the caller is done with it.

Add a put_device() call to led_put() to free the reference returned
by class_find_device_by_of_node().

And also add a put_device() in the error-exit case of try_module_get()
failing.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 6a8ea94834fa..7391d2cf1370 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -241,8 +241,10 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
 
 	led_cdev = dev_get_drvdata(led_dev);
 
-	if (!try_module_get(led_cdev->dev->parent->driver->owner))
+	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
+		put_device(led_cdev->dev);
 		return ERR_PTR(-ENODEV);
+	}
 
 	return led_cdev;
 }
@@ -255,6 +257,7 @@ EXPORT_SYMBOL_GPL(of_led_get);
 void led_put(struct led_classdev *led_cdev)
 {
 	module_put(led_cdev->dev->parent->driver->owner);
+	put_device(led_cdev->dev);
 }
 EXPORT_SYMBOL_GPL(led_put);
 
-- 
2.38.1

