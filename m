Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2112AD655
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 13:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgKJMeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 07:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730097AbgKJMeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 07:34:14 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C8DC0613D3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:14 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id b8so12488974wrn.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A7Q6GcsOlUvCk0TynHXF9lujyUa3NnBo8eWmuL6l7+w=;
        b=YNLSIvUUwisHGw+RC6XKvE+BhDiciuwkRe6AZRbgFVSha/tzd2j25GLZ2T+T6RxMTF
         YTBMINnyIe2dPa0bXmlQMk2aHLpiW0Dhsu+xstWxREuY5MEqP8nfhs3GzT2UxmnlARno
         IYzAjVXEC2cYy8kEawTGA+6iNvLUSirjsXi1++fg5XRVgo7MutwyAN999W83tZXrlh8j
         Jza/bDCHm5cuOxu4SVtPPWuYReecVYQHZOTx2qOHzHnWOtctcfK1/yeCmOCfWuYhCHi/
         quH9tZocCUuQJ5BL6HVB6DmiDoldTBxH+OTMmtS+pvRTYZ0Ohcoc9Arzrpu74ha2YMkw
         alwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A7Q6GcsOlUvCk0TynHXF9lujyUa3NnBo8eWmuL6l7+w=;
        b=cyNcwCw8dywYXFonzYr/kmi8EgEM0Y72sXFPczSb42EgUN74roHOS6YGq4OMwMu8Gu
         igIrEJjZE33CJjjxVYAec7jNUPQWusshKw+yJMqFSv5X4susOEdnnWFWR6E2+Gdo4orV
         TWMzCEIahTROEpgZJkrQyGn66AFxmkiWmxNQ1npZvdsvtEmiAqA9hh/+8xA7e/wQP+PE
         G9po6ays10xRr6FU1rzOG6UVFplx5rzKaSyun3+hRisS/NxzhSbHpUwq8LBpR5+v5OB/
         TJt8kmxMUL4yniHeeJMpJo2t52/BS/TYs+CpdfHoorI1auSRQbKh4Ny0P4uLEcOSYqMN
         Gs9Q==
X-Gm-Message-State: AOAM5314Hudov9Hdc89LTP2rXFj+3m4/fWICCQW5FsDJX0R6S1KX94/T
        sh3EAwzPHAmIY65JNHvz1dKsksrf3TLCQw==
X-Google-Smtp-Source: ABdhPJwn7B7uq4jKzi0eyC5tcY6YnHEsniitzEUttwi4qn76aOaWKYDvA4GVfPwskO/Pm04skEdoZQ==
X-Received: by 2002:adf:fec6:: with SMTP id q6mr3805845wrs.168.1605011652952;
        Tue, 10 Nov 2020 04:34:12 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id s8sm12942217wrn.33.2020.11.10.04.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 04:34:12 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 1/7] gpio: exar: add a newline after the copyright notice
Date:   Tue, 10 Nov 2020 13:34:00 +0100
Message-Id: <20201110123406.3261-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110123406.3261-1-brgl@bgdev.pl>
References: <20201110123406.3261-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

It's customary to have a newline between the copyright header and the
includes. Add one to gpio-exar.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-exar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index b1accfba017d..4202dd363a11 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2015 Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
  */
+
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
-- 
2.29.1

