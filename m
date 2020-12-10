Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A282D5B9F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbgLJNYk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389212AbgLJNYd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:33 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD2EC06138C
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:32 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a3so5290550wmb.5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sK2jxvWkdTVnXUBLQ5zNss97LjUIZ0S7n5s/bEo52h4=;
        b=P1kGdjeii6uVNGTi6nUyuktsM/2iz3/1Qt1p17RvV46qaBmg8+Y6JuXwLG2hvo8mt6
         NPacQtkHZXf6r3iZyfK20oLOjBWmHpSmU5BgmAe6W4vl61EGVC2obUL+jeYif4q4YRfl
         h8gX4E+olzUCQy7h+qN1ljzwmfDKf7DDfu3tmpInzdGHEJnksCulyKx3hoGGxj/iRpXO
         5tLZeFQSKfuFhtCnRQ6n6uvepMw4Kkoh+rAfyku6VikGXDzv5D87jXTwu3CNUaHdBy8J
         be3sSzYaiLPKwAov9UXRUdEWembG3pPdCixPupfeN5x4bYnIzSOGLSqE6r+iBvTTPQ+N
         X0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sK2jxvWkdTVnXUBLQ5zNss97LjUIZ0S7n5s/bEo52h4=;
        b=WnMqFMsEHKKD6iKrShQbHuMq5C6zMfeMQRMmlHrj2lZvlm4XQybpBJGLjVe2lMC8Un
         wxjXScmBSkKYcZsXgC94kTQYSlY3YWhxWpgJLh9uNBadeXpDUWCHK0INUxvev8X4Ocvn
         TXQb60WnamZFBiFNE7nTcXnU69OtRZ3c5V3LL2C8JldHrlJJ0kqj/UsR/TKgV0cR73Fo
         t0G2fBtWp3QqAJqDK1H9rc8rDRNqTbk2EiB9GFS08pHlsGPasbGYJaC87prR8uVlhI38
         7wfNNvmHywC4cTNeg92fK0rHKqkbpwc3XXaq58+r9cbmMV4o+xjfnf8HNNw2Mbhykk7+
         sJBA==
X-Gm-Message-State: AOAM533teRSZ5t3dMr0o2jT3VJyxLQdJVtUvbI5WyezimIrofwTWzWiE
        XAXfNkiRAMJlq1Z5BC7OlqQFMg==
X-Google-Smtp-Source: ABdhPJwjhAJRbQyaYJBa0AFQ5adrYBXloh4HmHle39wET4q9I3NsJdlSue4Uva7aP6adriA0WVuITQ==
X-Received: by 2002:a05:600c:2188:: with SMTP id e8mr8333713wme.182.1607606610810;
        Thu, 10 Dec 2020 05:23:30 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:30 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 07/14] API: move gpiod_line_get_chip() to line attributes section
Date:   Thu, 10 Dec 2020 14:23:08 +0100
Message-Id: <20201210132315.5785-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This routine should logically be part of line attributes. Move it out
of the misc line section.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/gpiod.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index b28cc92..c6e0b65 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -431,6 +431,13 @@ bool gpiod_line_is_open_source(struct gpiod_line *line) GPIOD_API;
  */
 int gpiod_line_update(struct gpiod_line *line) GPIOD_API;
 
+/**
+ * @brief Get the handle to the GPIO chip controlling this line.
+ * @param line The GPIO line object.
+ * @return Pointer to the GPIO chip handle controlling this line.
+ */
+struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line) GPIOD_API;
+
 /**
  * @}
  *
@@ -1093,13 +1100,6 @@ struct gpiod_line *gpiod_line_find(const char *name) GPIOD_API;
  */
 void gpiod_line_close_chip(struct gpiod_line *line) GPIOD_API;
 
-/**
- * @brief Get the handle to the GPIO chip controlling this line.
- * @param line The GPIO line object.
- * @return Pointer to the GPIO chip handle controlling this line.
- */
-struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line) GPIOD_API;
-
 /**
  * @}
  *
-- 
2.29.1

