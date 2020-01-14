Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E28A913ACF0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 16:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgANPDB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 10:03:01 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44071 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728984AbgANPDA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 10:03:00 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so12492704wrm.11
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 07:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HIqjqYnUNYC6xaFfZJXPmBMgwbD3vdDEMlsV0H3SJ/M=;
        b=J1SA/EVXpekAUyQtQL9GA9mqROIbfPpkW2dVRKXu7EoIolIojcPxdnUis5zZ2jjfkP
         /iNE42kjv311m4HWlgCaIxzvQN+o2Ew56lWvyScq5D6nhkMXBctcLaKcJHTWkKCIhjWK
         H4fVZlbDix9InRhQ8uWkjj4H/zo1B0mcxbJOV654w+KOxY4Jfr22ZLhdW9gw3CMESFgg
         oYolVqoi5klUmBlN9VrzoodLh+i2kumyEfCaLam1pwS8nmwACNz9QzeahS8e2hzwm0ER
         GjxnIKakA6oO0iymakRbrfWQ8772gAyf9HfGUwuwZo6kXrbNHU93lpI5ER7eyEcnhqQU
         cjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HIqjqYnUNYC6xaFfZJXPmBMgwbD3vdDEMlsV0H3SJ/M=;
        b=oosCid/cdPiKTYQdqhMJTgibV3in0h6vWM6HAXA8zFbcZdMRAJJ1wOjLJIJ5Myywfc
         ++3K22JEaCdqmvg87hc5sYsfWaC3jQPwIDPzQekB6qMPebmChcfom+am8gl5v6ptsCh6
         Igjy7N5IGHKsCNBYfpaPt0yMYNcIJgIuGsd7ypYxp0t6GHbUKEjM3yTzBftBEyGURzec
         6CzonhGdgKlgmwGVw1UcFGrMU29uRoxiQn15s32IsEpVJGn9y8Cel+VPEbmHBIggDogr
         DfWLhJ6Lq5AP4eR5srqqU0RnI9IKPi+waGhGLG64UEOxDoUrEZh0Fcfdnhw5NP/2nSd8
         idCA==
X-Gm-Message-State: APjAAAV8mAX6f5/8OWq8qOFEF6I+zxyu3mpkuyJWO3ZvOBCe6/2ec+nD
        cWLWdBj/Dke4YY16woofCVROZA==
X-Google-Smtp-Source: APXvYqzQYZXZmnCuYM9hZZtxSNdRMUvX/Yf4k/r6u64zSyCjXNZDZGHB7BnEJM7mRRzhv8OqBBSLqw==
X-Received: by 2002:adf:e6d2:: with SMTP id y18mr26535796wrm.262.1579014179025;
        Tue, 14 Jan 2020 07:02:59 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id i10sm20311539wru.16.2020.01.14.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 07:02:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/2] gpio: mockup: sort headers alphabetically
Date:   Tue, 14 Jan 2020 16:02:53 +0100
Message-Id: <20200114150253.28716-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200114150253.28716-1-brgl@bgdev.pl>
References: <20200114150253.28716-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

For consistency and easier maintenance: sort the headers alphabetically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 5f81f087103f..7d343bea784a 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -7,18 +7,18 @@
  * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
  */
 
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/gpio/driver.h>
+#include <linux/debugfs.h>
 #include <linux/gpio/consumer.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
-#include <linux/debugfs.h>
-#include <linux/uaccess.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
 
 #include "gpiolib.h"
 
-- 
2.23.0

