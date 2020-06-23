Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E62204834
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731721AbgFWEB4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWEBz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:01:55 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66B5C061573;
        Mon, 22 Jun 2020 21:01:55 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d8so8545752plo.12;
        Mon, 22 Jun 2020 21:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gHLb50G5e2pCElPlrPr5xB1B2mW9vBXBIXyEarFFgSw=;
        b=trwXrChUn/HxDFQEwkgQW6x9YUmSJS/eO1lHLxDB1e/QUU6nfN4DG9vbVOBjkt4id1
         6nKZMRtsj3E+vk6sgaV8of3HZZubaHAo4cKnafbsH+6XSYROIby0l0t4j5f3q44VzmrC
         8tni5qN1EIvyYSZtu4h5lhGgppXama43TPnOnZlJgJkQ+HBmBYSr/mfw6dg6wr3lKl+A
         4mGhDT3g5XSbqXDFKnFBP9MbgAtSAEI2Pm5XtC4WVAyBsn43tCwKeJJ53ZII8oA+sO9Q
         1YwciQbGdhSUaLaW+xWJXILesphguFGaTiHQ8hzGzFluNMeActAKmPCzcEJdhf4v26BT
         EMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gHLb50G5e2pCElPlrPr5xB1B2mW9vBXBIXyEarFFgSw=;
        b=itSms/6aAEhOyRDwS5dqS0wI0Thfj2DjM6EKWzwt+ewMMRPlG9jWdSCPD18bTZWVtu
         Inw+PPJWI9ETgBglP/6Z9gaycibAXa0tIQnpPwU8OKydGqeM4ut6YFbKX2IQiewfQCZA
         7tT6A/cOEk/7iFiDBt9HnSAC/1h3s39BeFCFK7nS4yszsKeXBlyvjU6VXNPeC27jOiPM
         LsHAv8pEGUXnY8RgnQJc94HZ6XJQ5AJyYmXqFZ/VcI3yTROUgLYcHnU98yP65sGFjCPa
         fVIjdco9WeGm7XVSCUDgyjqDliEixrrLx9by1/yYI6ZjSgv5wabrCSHjcECUJGOo3qsT
         MnLQ==
X-Gm-Message-State: AOAM530GKCO76WSHlmzrMTUT4XdMcViEs0PdImEsn5C0LGh7yMV955rR
        911cd4+tdD3o0yCQ/UG1epO9tkUMPmg=
X-Google-Smtp-Source: ABdhPJznuryS9NeE4AdMBJDt6A6aUy1fyO5eaYYzFt9hcX2e9CdSqojoK+ZjGhNcop9U/aoVY32oPw==
X-Received: by 2002:a17:90b:2391:: with SMTP id mr17mr20236833pjb.220.1592884914979;
        Mon, 22 Jun 2020 21:01:54 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:01:54 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 02/22] gpiolib: cdev: sort includes
Date:   Tue, 23 Jun 2020 12:00:47 +0800
Message-Id: <20200623040107.22270-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
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

