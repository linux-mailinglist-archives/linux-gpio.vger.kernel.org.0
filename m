Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865E7638D7F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Nov 2022 16:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKYPdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Nov 2022 10:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKYPdE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Nov 2022 10:33:04 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752FC2528E
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2022 07:33:01 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id p16so3742400wmc.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2022 07:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdhY8dSfIHRpJ/W0A2WJrfMn7+PAB93k5IaJhxpKlZM=;
        b=DjXvbel7vNNzZLkFArDYsCqy/oiIAtcFqjCyaOcL6WqERexX5DnU/PBbmTG/GSyj3f
         Q/7pbwxOLldT09F4kHnelKFDMEFQNborkJAf9AYf1mT8hOpEHr8DG0y6JMEEZeksfkAt
         qWHpY85iUasRn0z06vW1SBmEXIRBaJds2SPs8zPRAu2js33fVz0SFdIbRFg4FCaUOMQc
         Y2wIH/SdGAATo0q+6Pml4niKxs7zKym4YlFzgJIzzPnZtFiFKKb0gZq6cGH5kAgSvgsQ
         cFN0jKYyQlNODbhOaCWtpOzetiTWNMV9DU9squ2JKIqjpWGXEqMPIyc/KVMAakOftKQE
         dyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdhY8dSfIHRpJ/W0A2WJrfMn7+PAB93k5IaJhxpKlZM=;
        b=XK4v3b9J8oJ/6td77uZu9uQmAVlnbB0McSVZzyxwhhF6t2vXakgvVQxZwc5Xli+bBN
         QsmkQyhgQ7AEjJu/0wpfmOskuUXb3W70lGs+PEbAN7EwHmGD7r8LvhG/LROn8O2FBTz+
         mDQyFrxSg5PKEe6FUZXrCiy34HfLh/RF2X3kE10X0isc6buspEm6sD0vufJcK1yuR1jA
         cwE0osKSAOz/QXuifVIoxHsqc3auTtQRPGEGojPWGt/Y6IbCsdi9rWsk3RtJl7pDoLP1
         TQvqncIz1g2Rq55PMmgpG5+xozmH4okconY7A7j1E2efpyCz8RWPF/9WBZ/uvXx0YkYo
         DtXw==
X-Gm-Message-State: ANoB5plDhRPMX7k+G95zI1/G9+f+RaBKoZLKxV+Bpbsw7lrCeZxlgDe9
        HpIndyQ6OltdO3Nih5vj4CCLZw==
X-Google-Smtp-Source: AA0mqf7u0NuOrULp5suF59qZYyLgW16/6bb9guWGp1Z0GtROaqu0HuI4QDtfng0LamY8GZb3FDBEsA==
X-Received: by 2002:a05:600c:3acd:b0:3cf:550e:d7a2 with SMTP id d13-20020a05600c3acd00b003cf550ed7a2mr20624038wms.97.1669390380255;
        Fri, 25 Nov 2022 07:33:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:febe:f1eb:8f01:12f8])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d4087000000b002366b17ca8bsm4539256wrp.108.2022.11.25.07.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:32:59 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: cdev: fix NULL-pointer dereferences
Date:   Fri, 25 Nov 2022 16:32:57 +0100
Message-Id: <20221125153257.528826-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are several places where we can crash the kernel by requesting
lines, unbinding the GPIO device, then calling any of the system calls
relevant to the GPIO character device's annonymous file descriptors:
ioctl(), read(), poll().

While I observed it with the GPIO simulator, it will also happen for any
of the GPIO devices that can be hot-unplugged - for instance any HID GPIO
expander (e.g. CP2112).

This affects both v1 and v2 uAPI.

Fix this by simply checking if the GPIO chip pointer is not NULL.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 0cb6b468f364..d5632742942a 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -201,6 +201,9 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 	unsigned int i;
 	int ret;
 
+	if (!lh->gdev->chip)
+		return -ENODEV;
+
 	switch (cmd) {
 	case GPIOHANDLE_GET_LINE_VALUES_IOCTL:
 		/* NOTE: It's okay to read values of output lines */
@@ -1384,6 +1387,9 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 	struct linereq *lr = file->private_data;
 	void __user *ip = (void __user *)arg;
 
+	if (!lr->gdev->chip)
+		return -ENODEV;
+
 	switch (cmd) {
 	case GPIO_V2_LINE_GET_VALUES_IOCTL:
 		return linereq_get_values(lr, ip);
@@ -1716,6 +1722,9 @@ static __poll_t lineevent_poll(struct file *file,
 	struct lineevent_state *le = file->private_data;
 	__poll_t events = 0;
 
+	if (!le->gdev->chip)
+		return -ENODEV;
+
 	poll_wait(file, &le->wait, wait);
 
 	if (!kfifo_is_empty_spinlocked_noirqsave(&le->events, &le->wait.lock))
@@ -1740,6 +1749,9 @@ static ssize_t lineevent_read(struct file *file,
 	ssize_t ge_size;
 	int ret;
 
+	if (!le->gdev->chip)
+		return -ENODEV;
+
 	/*
 	 * When compatible system call is being used the struct gpioevent_data,
 	 * in case of at least ia32, has different size due to the alignment
@@ -1821,6 +1833,9 @@ static long lineevent_ioctl(struct file *file, unsigned int cmd,
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
 
+	if (!le->gdev->chip)
+		return -ENODEV;
+
 	/*
 	 * We can get the value for an event line but not set it,
 	 * because it is input by definition.
-- 
2.37.2

