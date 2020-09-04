Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476F925DE37
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgIDPsK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgIDPrW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:47:22 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF7AC0619E6
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:55 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a17so7192084wrn.6
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tgjkBfCojYl8siMBzz1X6XLsrb4li1UKkVtYrxRpS88=;
        b=v5An7xgobEzUsXohY/9CcZLrbXYebSARl253UlqT4OjDvpHs0nlnxnvVFgF6WcLkJS
         xra4c5MT5F+bQ0Sdeb+WScl0S9QrtaP9RpDAKh3mJDHWFk33bq9NV0v8Ytnt5G8bJaoM
         OvAxPx4OI31i2vwJMOX+Tg8jqlFX5asZiIFC1Y4O8bKM+sYbd3EZ0czWSDTgAtJrLHNB
         MtQebZdcQwqp6H5y+8v8Y05PiwEQkAAhifAogt1PAgV4XK/XBEpRu2totaKRwM+U/wFj
         X2js1Lpmq31ut70bi4SWrIjyzKhKpzyfIqYSNF823NrjP3k5wlRwA262C9vq4fEAfR9e
         jCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tgjkBfCojYl8siMBzz1X6XLsrb4li1UKkVtYrxRpS88=;
        b=a8fOxfzpgtwC1voDwB5wdGbONaK6b7/DTJ7aQl3KISvZNaPSNViWkwUZ9Br9GDvyBL
         K0zDCFkLgavMpjkhx7tlzyCtfbcIs2G96w97kMHehCu9uKUSibcdtc1tinrc3/3nt/a5
         +f/q00+HWoxkVX+fx2Z/C2IKttVe8iwhUmlM6WKLsUINh2zmgOuAuB8ZaAekKHHk5XRA
         IGWjqCoOLneUsq/ZSh42X62/XEOKgLWWRjWwVLIcOk6nJmTKxrozPf7nbCYXkEkwoVws
         BP6ZacZ6FLnKLROR0KxEfBqjhcQ6JOSDvPSaxKoAKXTido4MNZnlMGSiPzwfHrdwH7N+
         LIbw==
X-Gm-Message-State: AOAM5301l7QpksLy1MrbK8O7rbK4U3YDWidgnmsVdNxzDK51o4rJ4v4Y
        4D3KglxFpTe16qCSbD6JtRcQog==
X-Google-Smtp-Source: ABdhPJxoEZmE7Lp6gNfO9fs5XvWgmx2zMirJWKxaSR6g8MfJUjKjK4YQqTkezGJLvB2fzJSBJYuHnQ==
X-Received: by 2002:a5d:6a45:: with SMTP id t5mr8954332wrw.58.1599234414568;
        Fri, 04 Sep 2020 08:46:54 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 20/23] gpio: mockup: add a lock for dummy device list
Date:   Fri,  4 Sep 2020 17:45:44 +0200
Message-Id: <20200904154547.3836-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We'll soon add the possibility to create chips dynamically over debugfs
attributes. Since multiple threads will be able to create devices at
once: add a mutex to protect the device list.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index bc4609e047ef..1353239dc315 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -517,6 +517,7 @@ struct gpio_mockup_device {
 };
 
 static LIST_HEAD(gpio_mockup_devices);
+static DEFINE_MUTEX(gpio_mockup_devices_lock);
 
 static void gpio_mockup_unregister_one_device(struct gpio_mockup_device *dev)
 {
@@ -534,10 +535,14 @@ static void gpio_mockup_unregister_devices(void)
 	struct gpio_mockup_device *mockup_dev;
 	struct list_head *curr, *next;
 
+	mutex_lock(&gpio_mockup_devices_lock);
+
 	list_for_each_safe(curr, next, &gpio_mockup_devices) {
 		mockup_dev = list_entry(curr, struct gpio_mockup_device, list);
 		gpio_mockup_unregister_one_device(mockup_dev);
 	}
+
+	mutex_unlock(&gpio_mockup_devices_lock);
 }
 
 static __init char **gpio_mockup_make_line_names(const char *label,
@@ -588,7 +593,9 @@ static int __init gpio_mockup_register_device(struct property_entry *properties)
 		return PTR_ERR(mockup_dev->pdev);
 	}
 
+	mutex_lock(&gpio_mockup_devices_lock);
 	list_add(&mockup_dev->list, &gpio_mockup_devices);
+	mutex_unlock(&gpio_mockup_devices_lock);
 
 	return 0;
 }
-- 
2.26.1

