Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36C975B189
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjGTOsC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjGTOsB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:48:01 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BD010F5
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:00 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3159d75606dso715978f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864479; x=1690469279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T990pQBICrhmrrL7XRpnEuELQVcO3YU9HP2mAzxkw9s=;
        b=SIe5dCl3FOE9Dpg0DHlQ49yLGkl93TnoBlVILOpnVVXjKV9BnYRWDvHNKch0aysh8W
         h+ie7oGdkes+lQfqsbPWcK7xkA19SCt6sxSwofUD7ibEBqn01Eheo6OH+lmHY1BttIVu
         6tvDHe7AtcgR/NoEcp0lIEQlsd/0wRAPQWMc88kjRAG1uEelC5GvE7aD1Aa6tSlKCWPx
         tsIV870OonUPoZslRGzbh6fZikOjGWBkoTIQleDSVC0NwwTzN5l0QkHQPMF3V862EHA8
         PbU4UgfW28Qgh71H7QZNYLLrQxn3n0bRH26NUYY1E57LaJXJgSGwF1iy7dgPHHC5/lqW
         37fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864479; x=1690469279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T990pQBICrhmrrL7XRpnEuELQVcO3YU9HP2mAzxkw9s=;
        b=ixN97oCtQ92+d5zCdgZ35Yd5ELT7BfSkt+T+33btb3xnDPluFozRIKh7AwZpUYMPq4
         0PxMp55fQIPQqvqHBdOecD9prGKRJu5Jr7qyFeOjxdSG7PhsRL6KZMXJtNLGLPhvph7O
         pQXOpuCshEm/jjcC4TJ2egdSWvP0LuJ3IBe4YuvVkFUBztEHZIPZ4P6cTpr3yhGxvd2s
         eYN23bbUwGw6oeQ1TLUaD8qTZnD8mXtwj88IzlhtSC4hn/SyEINHgR8GkQUN+4DKBTF5
         s3q8rcyUTiynd0TzefAT6cZ1mzf/om06VMsfnlinmzSxU5b/hHLYvKk6PYTcfvrel+Fg
         IX4A==
X-Gm-Message-State: ABy/qLbC8uzzsYFKj4gFCLQP61cRidmsyPVnxKmMKJU9K6DhsQWHLzKr
        LOmr/eD7LmDG3/fuKw8xsjBGaQ==
X-Google-Smtp-Source: APBJJlFQisOjt6IswGPmqVEKHz4oEox+lUiESqRw2F0eUZ9URzHy/TygYIMspuNrgzpLmAX7Hq8CiA==
X-Received: by 2002:adf:e484:0:b0:314:1d7f:a69 with SMTP id i4-20020adfe484000000b003141d7f0a69mr2121327wrm.67.1689864479280;
        Thu, 20 Jul 2023 07:47:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bd83:c166:7e2d:3d74])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm1550906wrn.83.2023.07.20.07.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:47:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 1/5] core: provide gpiod_line_request_get_chip_name()
Date:   Thu, 20 Jul 2023 16:47:43 +0200
Message-Id: <20230720144747.73276-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720144747.73276-1-brgl@bgdev.pl>
References: <20230720144747.73276-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While we can get the list of requested offsets from a line-request object,
this information lacks context if we don't provide any data about the GPIO
chip the request was made on. Add a helper allowing users to get the name
of the parent chip.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/gpiod.h    |  9 +++++++++
 lib/chip.c         |  7 ++++++-
 lib/internal.h     |  3 ++-
 lib/line-request.c | 20 +++++++++++++++++++-
 4 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 3c13783..71ae798 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1007,6 +1007,15 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config);
  */
 void gpiod_line_request_release(struct gpiod_line_request *request);
 
+/**
+ * @brief Get the name of the chip this request was made on.
+ * @param request Line request object.
+ * @return Name the GPIO chip device. The returned pointer is valid for the
+ * lifetime of the request object and must not be freed by the caller.
+ */
+const char *
+gpiod_line_request_get_chip_name(struct gpiod_line_request *request);
+
 /**
  * @brief Get the number of lines in the request.
  * @param request Line request object.
diff --git a/lib/chip.c b/lib/chip.c
index 7d4d21e..7c05e53 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -215,6 +215,7 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 {
 	struct gpio_v2_line_request uapi_req;
 	struct gpiod_line_request *request;
+	struct gpiochip_info info;
 	int ret;
 
 	assert(chip);
@@ -233,11 +234,15 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 	if (ret)
 		return NULL;
 
+	ret = read_chip_info(chip->fd, &info);
+	if (ret < 0)
+		return NULL;
+
 	ret = ioctl(chip->fd, GPIO_V2_GET_LINE_IOCTL, &uapi_req);
 	if (ret < 0)
 		return NULL;
 
-	request = gpiod_line_request_from_uapi(&uapi_req);
+	request = gpiod_line_request_from_uapi(&uapi_req, info.name);
 	if (!request) {
 		close(uapi_req.fd);
 		return NULL;
diff --git a/lib/internal.h b/lib/internal.h
index ef9b17e..61d7aec 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -26,7 +26,8 @@ void gpiod_request_config_to_uapi(struct gpiod_request_config *config,
 int gpiod_line_config_to_uapi(struct gpiod_line_config *config,
 			      struct gpio_v2_line_request *uapi_cfg);
 struct gpiod_line_request *
-gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req);
+gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req,
+			     const char *chip_name);
 int gpiod_edge_event_buffer_read_fd(int fd,
 				    struct gpiod_edge_event_buffer *buffer,
 				    size_t max_events);
diff --git a/lib/line-request.c b/lib/line-request.c
index e536355..e867d91 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -13,13 +13,15 @@
 #include "internal.h"
 
 struct gpiod_line_request {
+	char *chip_name;
 	unsigned int offsets[GPIO_V2_LINES_MAX];
 	size_t num_lines;
 	int fd;
 };
 
 struct gpiod_line_request *
-gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req)
+gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req,
+			     const char *chip_name)
 {
 	struct gpiod_line_request *request;
 
@@ -28,6 +30,13 @@ gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req)
 		return NULL;
 
 	memset(request, 0, sizeof(*request));
+
+	request->chip_name = strdup(chip_name);
+	if (!request->chip_name) {
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
+	free(request->chip_name);
 	free(request);
 }
 
+GPIOD_API const char *
+gpiod_line_request_get_chip_name(struct gpiod_line_request *request)
+{
+	assert(request);
+
+	return request->chip_name;
+}
+
 GPIOD_API size_t
 gpiod_line_request_get_num_requested_lines(struct gpiod_line_request *request)
 {
-- 
2.39.2

