Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCAF217E07
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgGHESl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHESk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:18:40 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD726C061755;
        Tue,  7 Jul 2020 21:18:40 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d194so17666004pga.13;
        Tue, 07 Jul 2020 21:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/D5E3cS0RmePhKJO9DGn6sJY2opyEZuHh1r/5q4p1OE=;
        b=eN0r4mI442nvwpWb+yUcsVR+M38RzTgbWMX6KTKlASMvoyvYUzkUeFpRqqgH4zI2mm
         RwvWy0jOJDwv13MVZ73lHcgZLOq4cLCL+4q4hFdk1ol4uRTvTjcFpH/kMMw/ymdX4c2/
         GeNMTsndCGhvmSX7vR7/GSj2CuD3uK6O/zqpWnYh24dQNmJUoOgJ5bOmNjR1S/cm4KUm
         7lsB8LTVnzGmkOD85MEDwSEfMKAuCoLpx4xgwC+bgyeBy/RZO7iamlq3Ajb4eDSR3M1t
         nrHW+p7D9Q9oJTAXucL5bHcAdDBL2QXW6aW5sR8T6fGIJGCndM4INIhXY6jw+g7fXJF1
         BImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/D5E3cS0RmePhKJO9DGn6sJY2opyEZuHh1r/5q4p1OE=;
        b=J5gtN7jfDxWndNEX6aJHQAbqZHf/IKwoxTIqQ7PFMC2GptkaTerv8XKyLS8k5Yg8u3
         VXolqK+2pMceXujY4i5x3trWIUtVEB4Iocd3qowFOMNCmK2L7C9PYgeEPv0Ny7l/ZHYn
         fDTPokQid33KKxGcIdUQ95cfDA2cS4FYghTtAJZISv6AkfM/2YJBv8jXUBq2NvOgKMJr
         bW3v96Rw0/bdDXb07OSc6M+JmAcvkCyQPZRnMVy+HnHZxUpEJ191bk2kQW83yTKy3CGg
         WUcJx23m+7pfWRfqodv4GtyLZz03SUe19NZiThOWCbVwi4tg/ET2cr5cDfQvwLcUAmCW
         tSrg==
X-Gm-Message-State: AOAM5314WaONbVzcn/UX4N6qC09yltnJM8RD7lwBIONlXp9cAR1YFZ06
        0DdnQlEg3DBHzK74DsdJUbyepYs2
X-Google-Smtp-Source: ABdhPJztRtdgQXlEYOMH2tZhj6L/YevkbKOq6Y+dmGQIUB2HEorSEWiMyjaH0QMq6Z7K1BtjPvWl6g==
X-Received: by 2002:a63:371c:: with SMTP id e28mr47124671pga.114.1594181919877;
        Tue, 07 Jul 2020 21:18:39 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:18:39 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 02/17] gpiolib: cdev: sort includes
Date:   Wed,  8 Jul 2020 12:15:45 +0800
Message-Id: <20200708041600.768775-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sort the includes of gpiolib-cdev.c to make it easier to identify if a
module is included and to avoid duplication.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b8b872724628..55a9b7b44304 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1,24 +1,24 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/anon_inodes.h>
 #include <linux/bitmap.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/interrupt.h>
-#include <linux/irqreturn.h>
-#include <linux/spinlock.h>
+#include <linux/cdev.h>
+#include <linux/compat.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/file.h>
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/cdev.h>
-#include <linux/uaccess.h>
-#include <linux/compat.h>
-#include <linux/anon_inodes.h>
-#include <linux/file.h>
+#include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/kernel.h>
 #include <linux/kfifo.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
+#include <linux/spinlock.h>
 #include <linux/timekeeping.h>
+#include <linux/uaccess.h>
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
-- 
2.27.0

