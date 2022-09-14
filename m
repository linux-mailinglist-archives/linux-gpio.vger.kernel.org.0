Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB7B5B9145
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 01:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiINX6u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 19:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiINX6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 19:58:36 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF828983A
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 16:58:14 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id d8so10597168iof.11
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 16:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=weBnQ0QpP5GmpITHPCxwi39XWMtQ1xxsLUWjH8IbvVA=;
        b=NCI1qH9jveKDXncAk6HScGzcKJxjHGgdLhM/38URe/NK1PwO0347geW9jGEWRPuan3
         Nyk55gqLYsWaNnaTiesN09/mWhoHvWdVenY9SPt012t/Bto5qLlXRAihjvRZG5oznkdn
         weFqe3hRGlRjOdkxJcZMkNc9v9047Eh5ss25I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=weBnQ0QpP5GmpITHPCxwi39XWMtQ1xxsLUWjH8IbvVA=;
        b=5Cqk6p4dxhjjw8XOpxtKQfebs7/RrlbudWUHAF9AVGI7DFdzsW2+PGb1FP0kMWseSU
         wP4E9iwXuVDCMkv7fuwh3at+F/VpVOHfvHQkZ9KwdogVFFi+tDvcIE6bLGWRk7OC1P0b
         2Ytm6QKfPsKS78Wdbu04BQ4tZhCMs5h0QGD2GY9OvPfF5Ho1DPIn8RK4huBkIgstWNoV
         cuECKQo0AJY/J2WNJH8Of44GB8LxbITRJZ/cwzuxr1XBY3iP9X1VKFZu+Q+C0bf4i8T/
         Z9Lesj0Q1cUq88LlTYl+5OOLPFJIt1Brl28/wGWnbajqPgJSWDHAERYOZ/J/mJH2GPTJ
         hHFQ==
X-Gm-Message-State: ACgBeo3kVS3jnLEVcME5GgPNJqArCJLPbZS1Nkjrck6Npej9AWgLvN2t
        SMRW7WpAnbANHDFiigOjnBd44g==
X-Google-Smtp-Source: AA6agR62n7lPldjnhqzxv1tCULUdyRzyhbSrXdbJarDbGnR8SVPVcFSEfRE3+kA1tw4NIwP6SHeL5Q==
X-Received: by 2002:a6b:e60f:0:b0:6a1:75d7:271e with SMTP id g15-20020a6be60f000000b006a175d7271emr5783978ioh.79.1663199894205;
        Wed, 14 Sep 2022 16:58:14 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id a14-20020a027a0e000000b0034c0e8829c0sm353721jac.0.2022.09.14.16.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 16:58:13 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     jingle.wu@emc.com.tw, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, mario.limonciello@amd.com,
        hdegoede@redhat.com, linus.walleij@linaro.org, timvp@google.com,
        dmitry.torokhov@gmail.com, Raul E Rangel <rrangel@chromium.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/13] gpiolib: acpi: Add wake_capable variants of acpi_dev_gpio_irq_get
Date:   Wed, 14 Sep 2022 17:57:53 -0600
Message-Id: <20220914155914.v3.5.I4ff95ba7e884a486d7814ee888bf864be2ebdef4@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220914235801.1731478-1-rrangel@chromium.org>
References: <20220914235801.1731478-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ACPI spec defines the SharedAndWake and ExclusiveAndWake share type
keywords. This is an indication that the GPIO IRQ can also be used as a
wake source. This change exposes the wake_capable bit so drivers can
correctly enable wake functionality instead of making an assumption.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

Changes in v3:
- Kept `acpi_dev_gpio_irq_get_by` unchanged to avoid having to touch
  unrelated drivers.
- Converted wake_capable parameter to bool.

Changes in v2:
- Fixed call site in mlxbf_gige_probe

 drivers/gpio/gpiolib-acpi.c | 17 ++++++++++++++---
 drivers/gpio/gpiolib-acpi.h |  2 ++
 include/linux/acpi.h        | 22 ++++++++++++++++++----
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 9be1376f9a627f..c703f095993a2c 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -741,6 +741,8 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
 		lookup->info.pin_config = agpio->pin_config;
 		lookup->info.debounce = agpio->debounce_timeout;
 		lookup->info.gpioint = gpioint;
+		lookup->info.wake_capable = agpio->wake_capable ==
+					    ACPI_WAKE_CAPABLE;
 
 		/*
 		 * Polarity and triggering are only specified for GpioInt
@@ -987,10 +989,12 @@ struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
 }
 
 /**
- * acpi_dev_gpio_irq_get_by() - Find GpioInt and translate it to Linux IRQ number
+ * acpi_dev_gpio_irq_wake_get_by() - Find GpioInt and translate it to Linux IRQ
+ *                                   number
  * @adev: pointer to a ACPI device to get IRQ from
  * @name: optional name of GpioInt resource
  * @index: index of GpioInt resource (starting from %0)
+ * @wake_capable: Set to true if the IRQ is wake capable
  *
  * If the device has one or more GpioInt resources, this function can be
  * used to translate from the GPIO offset in the resource to the Linux IRQ
@@ -1002,9 +1006,13 @@ struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
  * The function takes optional @name parameter. If the resource has a property
  * name, then only those will be taken into account.
  *
+ * The GPIO is considered wake capable if the GpioInt resource specifies
+ * SharedAndWake or ExclusiveAndWake.
+ *
  * Return: Linux IRQ number (> %0) on success, negative errno on failure.
  */
-int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index)
+int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name,
+				  int index, bool *wake_capable)
 {
 	int idx, i;
 	unsigned int irq_flags;
@@ -1061,13 +1069,16 @@ int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int ind
 				dev_dbg(&adev->dev, "IRQ %d already in use\n", irq);
 			}
 
+			if (wake_capable)
+				*wake_capable = info.wake_capable;
+
 			return irq;
 		}
 
 	}
 	return -ENOENT;
 }
-EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_get_by);
+EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_wake_get_by);
 
 static acpi_status
 acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
index e476558d947136..1ac6816839dbce 100644
--- a/drivers/gpio/gpiolib-acpi.h
+++ b/drivers/gpio/gpiolib-acpi.h
@@ -18,6 +18,7 @@ struct acpi_device;
  * @pin_config: pin bias as provided by ACPI
  * @polarity: interrupt polarity as provided by ACPI
  * @triggering: triggering type as provided by ACPI
+ * @wake_capable: wake capability as provided by ACPI
  * @debounce: debounce timeout as provided by ACPI
  * @quirks: Linux specific quirks as provided by struct acpi_gpio_mapping
  */
@@ -28,6 +29,7 @@ struct acpi_gpio_info {
 	int pin_config;
 	int polarity;
 	int triggering;
+	bool wake_capable;
 	unsigned int debounce;
 	unsigned int quirks;
 };
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 6f64b2f3dc5479..d3121cef6cc3bc 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1202,7 +1202,8 @@ bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 				struct acpi_resource_gpio **agpio);
 bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
 			       struct acpi_resource_gpio **agpio);
-int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index);
+int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name,
+				  int index, bool *wake_capable);
 #else
 static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
 					      struct acpi_resource_gpio **agpio)
@@ -1214,16 +1215,29 @@ static inline bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
 {
 	return false;
 }
-static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev,
-					   const char *name, int index)
+static inline int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev,
+						const char *name, int index,
+						bool *wake_capable)
 {
 	return -ENXIO;
 }
 #endif
 
+static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev,
+					   const char *name, int index)
+{
+	return acpi_dev_gpio_irq_wake_get_by(adev, name, index, NULL);
+}
+
 static inline int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 {
-	return acpi_dev_gpio_irq_get_by(adev, NULL, index);
+	return acpi_dev_gpio_irq_wake_get_by(adev, NULL, index, NULL);
+}
+
+static inline int acpi_dev_gpio_irq_wake_get(struct acpi_device *adev,
+					     int index, bool *wake_capable)
+{
+	return acpi_dev_gpio_irq_wake_get_by(adev, NULL, index, wake_capable);
 }
 
 /* Device properties */
-- 
2.37.3.968.ga6b4b080e4-goog

