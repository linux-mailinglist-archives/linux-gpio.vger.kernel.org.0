Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5E625DE1E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgIDPrA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgIDPqr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 11:46:47 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB01C06123C
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 08:46:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so7227174wrm.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2020 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=21luy6X7MDo33702JiSjX8+ptN78cMUdDvCAknmXlNw=;
        b=ZEDEcIxOclm9rkbYpejxrNIf2E5BaNtltbEx7kL2MmvTjXkaO6NcxogFQaPWUTVU90
         RQCLCwd/0LeBvBHib8CSLZ6t0N3QMb9pIjEGew+/3FUx7nmAv9U1jw1QGsifrgj7RZz/
         BvxCb7fT6vR8yVfjeZ1cK4bgxVds+FqqAq0SqwC1YeYbevfwSlBCI23wJCoMB61VVWI+
         OMMY4pKIa6QlNrAheHEoiU+ozpVA1RJj07hzk4oeA+31wZzEmN0aoQgAip9RFc0XjC7l
         wZbRPvzHN5/YFjUV8Y9Q9UX0mrRaDx5MfQwrYwVOKbAIytZjQyAsHR3o/g0JEjUNHJNG
         x79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=21luy6X7MDo33702JiSjX8+ptN78cMUdDvCAknmXlNw=;
        b=CfUu7BfDyQ0v9ebTYZuDRqbvq8U4/0d3awB7Jzwu8eVNEa4GxIVoEA1XmdoxSyFQBv
         0GWIOC++BXPrAqZmqapfFt6RtJxIsgcnSwpcFEuaswlaWrR52jfK7mBWF0Aa1I+5+iuz
         dWCqJMMI8i1xaY5goCzCho37noyC0DIDB+R9l47YWYgC89B4LtGXpPaZAnLj37Y3JHwM
         dPjwfySliPRogPWP2D6PB45WkMO53I8cPyBC5DcTQkuZCLi2IPBV/ilr8zLMCH4+eMiT
         +2ugkVQsBVZX52T2eBwxZckDL32+9hmtURgpfEe5c7oglihnN/imi0DeVyJZqjykVqnk
         aRPQ==
X-Gm-Message-State: AOAM533bfK4tStP6DeQltIbugcd2RdSsvwoViTeFsFriNBFFHvmw8JIw
        BmINhD1XUMoD07dh4VrVUk4Q9g==
X-Google-Smtp-Source: ABdhPJwCyK6EASQNgZuAXwqjHkJs+DAdmBTT0auSRhh6ETOzmG9L8g4BM5hkjVixy9irlGFHNaRE7A==
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr8773344wrn.394.1599234399347;
        Fri, 04 Sep 2020 08:46:39 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 07/23] gpio: mockup: drop unneeded includes
Date:   Fri,  4 Sep 2020 17:45:31 +0200
Message-Id: <20200904154547.3836-8-brgl@bgdev.pl>
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

This module doesn't need gpio/consumer.h - it's a provider. It also
doesn't use any symbols from init.h so let's remove both includes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index bc345185db26..349782cdb4d7 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -8,9 +8,7 @@
  */
 
 #include <linux/debugfs.h>
-#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
-- 
2.26.1

