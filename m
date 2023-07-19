Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C72759E68
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 21:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjGSTVL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 15:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjGSTVJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 15:21:09 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E3C199A
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:07 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b74310566cso114967731fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689794466; x=1690399266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m19EQo5etSidZKXJ+Gl1lEYk7Z3MuIHM1vz96l3RVZ4=;
        b=uppUOq2Sag8mEHq5g2wnoP46dHFUH94fWmaN+YcvngPxb9kZr6oNxg4ImkNxKvOWDd
         cwmUP4IXQntQxhJSYeNT04xSrL681oAs2fOLTJgJJ0YXpjSF3ObV+i1i3vtzuVopn5Tn
         piwtaHjuqyPk4gNanC+++FQwTRGBMLxWjNhCZUu6f23bC35oHZiCqS1EGG2PkLFeeMb+
         vsiO2VutD6jO0ePFB8O2rkUlabLQ2XWE/na+6GnLBL1MtOlRr5S/OWf1S5ZysmmhRfFC
         uJ+tPcGsXWoFKIN9LGq/3DunFgrcxq7rMhnuLqSZfzEfozq8hUzYcPnACYWcci5X3wps
         hd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794466; x=1690399266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m19EQo5etSidZKXJ+Gl1lEYk7Z3MuIHM1vz96l3RVZ4=;
        b=IduGj6m7FjEpl7NW3OHIX1ABbbJQTOZiuP5cbrC9qGmL+Cpkx99IUxwsR7aHZNZIyH
         HmFJ018kmgEtpoaz+sS9I/hA5tJg+HdSDG2d2eUIOXqwiWI9xBS8HHtbrpSmX0kN3kG0
         dcvMSIhIcL+/C/i0oLlMPg9MsStD64RX3UUhW3HlzasG50Sz88XcBCasueAZx+G0iGJC
         vP+MJgDi2LiABYCfhYvDJ76n9uUjGsUiNryy3bxG3RHWM/okZWAB2yqouV1bW11660R0
         Zl2BXjM4IEdJfObaJXpm52qgTG5HpddUv57qAXCzClZTHxXIS7boExwhSZZwfQjc3rB2
         qKiw==
X-Gm-Message-State: ABy/qLZPIEnDKlr4DywiH9TlN6Hq9KqfmaYASROFWdlceH3/LrB9rrwO
        buc24EA5ZyIV7VnYzVwMXfGbp7sYJ4+q1VoXCVA=
X-Google-Smtp-Source: APBJJlE2frtMNKk9U6QuCNCiSWpDfGecH8dSQIV+LEjBAJqKevMZxH8ngUWmAcAypYwfZbPW+gWUjA==
X-Received: by 2002:a2e:9c4e:0:b0:2b9:4805:a039 with SMTP id t14-20020a2e9c4e000000b002b94805a039mr498873ljj.51.1689794465698;
        Wed, 19 Jul 2023 12:21:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f884:f48d:2867:5c1d])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c11ce00b003fbc0a49b57sm2373454wmi.6.2023.07.19.12.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:21:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 1/5] core: provide gpiod_line_request_get_chip_path()
Date:   Wed, 19 Jul 2023 21:20:53 +0200
Message-Id: <20230719192057.172560-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719192057.172560-1-brgl@bgdev.pl>
References: <20230719192057.172560-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While we can get the list of requested offsets from a line-request object,
this information lacks context if we don't provide any data about the GPIO
chip the request was made on. Add a helper allowing users to get the path
to the character device used to create the parent chip.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/gpiod.h    |  9 +++++++++
 lib/chip.c         |  2 +-
 lib/internal.h     |  3 ++-
 lib/line-request.c | 20 +++++++++++++++++++-
 4 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 3c13783..61f8ef1 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1007,6 +1007,15 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
  */
 void gpiod_line_request_release(struct gpiod_line_request *request);
 
+/**
+ * @brief Get the path to the chip this request was made on.
+ * @param request Line request object.
+ * @return Path to the GPIO chip device. The returned pointer is valid for the
+ * lifetime of the request object and must not be freed by the caller.
+ */
+const char *
+gpiod_line_request_get_chip_path(struct gpiod_line_request *request);
+
 /**
  * @brief Get the number of lines in the request.
  * @param request Line request object.
diff --git a/lib/chip.c b/lib/chip.c
index 7d4d21e..e94d750 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -237,7 +237,7 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 	if (ret < 0)
 		return NULL;
 
-	request = gpiod_line_request_from_uapi(&uapi_req);
+	request = gpiod_line_request_from_uapi(&uapi_req, chip->path);
 	if (!request) {
 		close(uapi_req.fd);
 		return NULL;
diff --git a/lib/internal.h b/lib/internal.h
index ef9b17e..e9ada42 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -26,7 +26,8 @@ void gpiod_request_config_to_uapi(struct gpiod_request_config *config,
 int gpiod_line_config_to_uapi(struct gpiod_line_config *config,
 			      struct gpio_v2_line_request *uapi_cfg);
 struct gpiod_line_request *
-gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req);
+gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req,
+			     const char *chip_path);
 int gpiod_edge_event_buffer_read_fd(int fd,
 				    struct gpiod_edge_event_buffer *buffer,
 				    size_t max_events);
diff --git a/lib/line-request.c b/lib/line-request.c
index e536355..99cbe2c 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -13,13 +13,15 @@
 #include "internal.h"
 
 struct gpiod_line_request {
+	char *chip_path;
 	unsigned int offsets[GPIO_V2_LINES_MAX];
 	size_t num_lines;
 	int fd;
 };
 
 struct gpiod_line_request *
-gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req)
+gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req,
+			     const char *chip_path)
 {
 	struct gpiod_line_request *request;
 
@@ -28,6 +30,13 @@ gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req)
 		return NULL;
 
 	memset(request, 0, sizeof(*request));
+
+	request->chip_path = strdup(chip_path);
+	if (!request->chip_path) {
+		free(request);
+		return NULL;
+	}
+
 	request->fd = uapi_req->fd;
 	request->num_lines = uapi_req->num_lines;
 	memcpy(request->offsets, uapi_req->offsets,
@@ -42,9 +51,18 @@ GPIOD_API void gpiod_line_request_release(struct gpiod_line_request *request)
 		return;
 
 	close(request->fd);
+	free(request->chip_path);
 	free(request);
 }
 
+GPIOD_API const char *
+gpiod_line_request_get_chip_path(struct gpiod_line_request *request)
+{
+	assert(request);
+
+	return request->chip_path;
+}
+
 GPIOD_API size_t
 gpiod_line_request_get_num_requested_lines(struct gpiod_line_request *request)
 {
-- 
2.39.2

