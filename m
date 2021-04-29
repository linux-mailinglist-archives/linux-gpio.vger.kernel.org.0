Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3159036E82C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Apr 2021 11:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237770AbhD2Js2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Apr 2021 05:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhD2Js2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Apr 2021 05:48:28 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED501C06138B
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 02:47:41 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a4so66219273wrr.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Apr 2021 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2h0QVn/oL473IB8Q1NaktiOKDyPIbAgcnbg+Mk2qzbA=;
        b=CjQdbSl9SPxef22NMHAltRZKZ63HMZYxnkBD6HRx/TJKhuJOE/ejzQmTRArlKjZx8R
         O2NXl6J4WdG6orP/Xgg1WHbtXgtfRhIROFMETeh/6GsDQivqA/MdY/bNWaj7SjoXO+mB
         cyYi6LQPKgx3xIRQYmxOqNaWNnBiLx4mhRtOcjnKDiDFFmCCyiaJg8D5OUyhW6SMIzkG
         LIgO6fKfTkcVt7T+1TyOVRdvtybdihYLQMMMaLk3JWTfFanlTHFwo3tJx+epA1dhQN3r
         m76yAz6KbWZrPoR17J4KCpRTQrQ4z+UBGMxRAWUugxv0U3JQ7/ljaheGzuAi3FlsL3wb
         I6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2h0QVn/oL473IB8Q1NaktiOKDyPIbAgcnbg+Mk2qzbA=;
        b=sFy8CNVUNy3j/1eoe7q02aYHr9BAiaBPlY1mByDRzcnl4wOIPe7zUaSXy6sQRAlJuh
         +v2COkNd4RIwSH21cFtjVeBy0cApAvQ6ycslpsTVk/7c4RH7pYEN+e+SIG0+ydxiCRRl
         lBfWjVgiI43y0G9VQFv4D4oajIszJ9Iqwe3p3u/dCeLJkoqxBW41uKPF7gAnSE3+7/9G
         UqWRkLsK+8J9yLojBWJmtCSR7RYDF63pg9vcsOlZlNjqgeKPM5drXa6WD16OPxa1OXHW
         g8lZk1KKRYCb7wX85hSOaAvh3FCZCQYQhr/FWRwZbGZxQ55yHN1Dd1fb9deS46Aqh63y
         dnmA==
X-Gm-Message-State: AOAM530mjSQ7DzMMuZClm+BKIOvblpdeyQRo0fT49j+M4r3qHmMTw2Ie
        pf/NaXAVx4hcfHJkDYHh5HzmCg==
X-Google-Smtp-Source: ABdhPJwzbxsdxO31viLRA++o1eVQauZDTxPUXLwAqKkLKP7lQ4yNAHDszsuJLk7PmU79vuMzwYNtwA==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr27514431wrm.308.1619689660796;
        Thu, 29 Apr 2021 02:47:40 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id j22sm4101247wra.46.2021.04.29.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 02:47:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH 1/3] tests: remove gpiod_test_chip_num()
Date:   Thu, 29 Apr 2021 11:47:32 +0200
Message-Id: <20210429094734.9585-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210429094734.9585-1-brgl@bgdev.pl>
References: <20210429094734.9585-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function is no longer used, remove it.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 tests/gpiod-test.c | 12 ------------
 tests/gpiod-test.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index 2681278..ca5cdb3 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -149,18 +149,6 @@ const gchar *gpiod_test_chip_name(guint idx)
 	return name;
 }
 
-gint gpiod_test_chip_num(unsigned int idx)
-{
-	gint num;
-
-	num = gpio_mockup_chip_num(globals.mockup, idx);
-	if (num < 0)
-		g_error("unable to retrieve the chip number: %s",
-			g_strerror(errno));
-
-	return num;
-}
-
 gint gpiod_test_chip_get_value(guint chip_index, guint line_offset)
 {
 	gint ret;
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index a093f83..61735d9 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -80,7 +80,6 @@ enum {
 /* Wrappers around libgpiomockup helpers. */
 const gchar *gpiod_test_chip_path(guint idx);
 const gchar *gpiod_test_chip_name(guint idx);
-gint gpiod_test_chip_num(guint idx);
 gint gpiod_test_chip_get_value(guint chip_index, guint line_offset);
 void gpiod_test_chip_set_pull(guint chip_index, guint line_offset, gint pull);
 
-- 
2.30.1

