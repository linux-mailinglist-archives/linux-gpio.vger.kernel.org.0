Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D33CD0FEC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 15:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731184AbfJINWr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 09:22:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55137 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729883AbfJINWr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 09:22:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id p7so2589425wmp.4
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7F96pWJHeSMlYdx4G9ZjnlaLCkvOK4Ullao3dee71uE=;
        b=N0BNwJf4aa/J+ji6F6IqMOUCqvEzeKt43pSjd05UfkukdDKtJhjza+1kUuya6aeZya
         TnVLCW4XniPTN8pY0lgIWYq94yJ/oGCpkOfwhMR89olzNR79MPDUUtweDPXXHfJIeCwf
         b35e/u8+a6BJlNm7oOzQ+FuVIL++dmG7XAbr626WeTOYqgaz1m8iruuGY7oF7qukLY0I
         Ao+szSXk5zY+S7LvLC8gI3/qOGz+ej6Wl64lRdSQhyThn/j8k3xiXIZu7ZygETEhMjqA
         nPsZnAUU2zWRmquUK1TM0/gmoztBpTm/CdJxvX/6chQlzbU8voS8pJ2xUc5F9srlwZOg
         pH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=7F96pWJHeSMlYdx4G9ZjnlaLCkvOK4Ullao3dee71uE=;
        b=RnEU8eUZGvnIXbUBJvCrKXV5/b9EpvybdhzgeyKzdjnCH+M4P043QtTHrEL2N4ijls
         3sRXiLBSEeT9xt6RLIxdJ1FcaCGhTLNrWXqhR248GgeJ18sbgZ4WkXo9Zqt6oFqYOTRp
         SAsXf/lgSBQxyw/dMlhQdrC0hV9M/jnqco6E6tzd8NSvLfX9oKLTOhIMkd3MgfKAZ+UY
         FuDc0vvk2E9p4eBeapkYlIN5aEbYevTjF3iHDLPuedPUxBCGKnnLs7Uhw/R9bTVaJhTk
         Ush+htveV6nUL9uVrc3G0mbC34C5N7datAY3nafksVtYE6zsVoIXXIlZFSDv9ZPPSwD6
         0qWA==
X-Gm-Message-State: APjAAAWHqPhUL3YWWM+ZQgMp6OhuGY+31HlKyGpYVMu/CDLiAuhoD9mc
        6yE40RAys8gpmDoB8ByMyl0=
X-Google-Smtp-Source: APXvYqwGCiS49phxvHcrZgNBDiqmWujEm/DWsCG9D0VAzr/2EmfOZQeDIY8dysGP9mq3orWvFBFliA==
X-Received: by 2002:a1c:1901:: with SMTP id 1mr2644689wmz.28.1570627365673;
        Wed, 09 Oct 2019 06:22:45 -0700 (PDT)
Received: from x1.fritz.box ([2001:16b8:5c80:ac01:2d69:222e:6eca:3415])
        by smtp.gmail.com with ESMTPSA id r65sm2818891wmr.9.2019.10.09.06.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 06:22:44 -0700 (PDT)
From:   Drew Fustini <drew@pdp7.com>
To:     brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        warthog618@gmail.com, Drew Fustini <drew@pdp7.com>
Subject: [PATCH] libgpoiod: add pull-up/pull-down flags for gpio lines
Date:   Wed,  9 Oct 2019 15:19:03 +0200
Message-Id: <20191009131901.16782-1-drew@pdp7.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pull-up and pull-down flags to libgpiod now that libgpio in the kernel
supports these flags for linehandle_create() and lineevent_create().

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 bindings/cxx/gpiod.hpp        |  4 ++++
 bindings/cxx/line_bulk.cpp    |  4 ++++
 bindings/python/gpiodmodule.c | 14 ++++++++++++++
 include/gpiod.h               |  4 ++++
 lib/core.c                    |  8 ++++++++
 5 files changed, 34 insertions(+)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 13b4d5b..0e53e89 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -233,6 +233,10 @@ struct line_request
 	/**< The line is an open-source port. */
 	GPIOD_API static const ::std::bitset<32> FLAG_OPEN_DRAIN;
 	/**< The line is an open-drain port. */
+	GPIOD_API static const ::std::bitset<32> FLAG_PULL_UP;
+	/**< The line is has a configurable pull-up resistor */
+	GPIOD_API static const ::std::bitset<32> FLAG_PULL_DOWN;
+	/**< The line is has a configurable pull-down resistor */
 
 	::std::string consumer;
 	/**< Consumer name to pass to the request. */
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index 8369930..7e583ba 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -14,6 +14,8 @@ namespace gpiod {
 const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW("001");
 const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE("010");
 const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN("100");
+const ::std::bitset<32> line_request::FLAG_PULL_UP("101");
+const ::std::bitset<32> line_request::FLAG_PULL_DOWN("111");
 
 namespace {
 
@@ -38,6 +40,8 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> reqflag_mapping = {
 	{ line_request::FLAG_ACTIVE_LOW,	GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, },
 	{ line_request::FLAG_OPEN_DRAIN,	GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN, },
 	{ line_request::FLAG_OPEN_SOURCE,	GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE, },
+	{ line_request::FLAG_PULL_UP,	GPIOD_LINE_REQUEST_FLAG_PULL_UP, },
+	{ line_request::FLAG_PULL_DOWN,	GPIOD_LINE_REQUEST_FLAG_PULL_DOWN, },
 };
 
 } /* namespace */
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 69edbbc..75f33ba 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -60,6 +60,8 @@ enum {
 	gpiod_LINE_REQ_FLAG_OPEN_DRAIN		= GPIOD_BIT(0),
 	gpiod_LINE_REQ_FLAG_OPEN_SOURCE		= GPIOD_BIT(1),
 	gpiod_LINE_REQ_FLAG_ACTIVE_LOW		= GPIOD_BIT(2),
+	gpiod_LINE_REQ_FLAG_PULL_UP		= GPIOD_BIT(3),
+	gpiod_LINE_REQ_FLAG_PULL_DOWN		= GPIOD_BIT(4),
 };
 
 enum {
@@ -1032,6 +1034,10 @@ static void gpiod_MakeRequestConfig(struct gpiod_line_request_config *conf,
 		conf->flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
 	if (flags & gpiod_LINE_REQ_FLAG_ACTIVE_LOW)
 		conf->flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+	if (flags & gpiod_LINE_REQ_FLAG_PULL_UP)
+		conf->flags |= GPIOD_LINE_REQUEST_FLAG_PULL_UP;
+	if (flags & gpiod_LINE_REQ_FLAG_PULL_DOWN)
+		conf->flags |= GPIOD_LINE_REQUEST_FLAG_PULL_DOWN;
 }
 
 PyDoc_STRVAR(gpiod_LineBulk_request_doc,
@@ -2396,6 +2402,14 @@ static gpiod_ModuleConst gpiod_ModuleConsts[] = {
 		.name = "LINE_REQ_FLAG_ACTIVE_LOW",
 		.value = gpiod_LINE_REQ_FLAG_ACTIVE_LOW,
 	},
+	{
+		.name = "LINE_REQ_FLAG_PULL_UP",
+		.value = gpiod_LINE_REQ_FLAG_PULL_UP,
+	},
+	{
+		.name = "LINE_REQ_FLAG_PULL_DOWN",
+		.value = gpiod_LINE_REQ_FLAG_PULL_DOWN,
+	},
 	{ }
 };
 
diff --git a/include/gpiod.h b/include/gpiod.h
index 9860ea8..0fe8abd 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -792,6 +792,10 @@ enum {
 	/**< The line is an open-source port. */
 	GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW	= GPIOD_BIT(2),
 	/**< The active state of the line is low (high is the default). */
+	GPIOD_LINE_REQUEST_FLAG_PULL_UP	= GPIOD_BIT(3),
+	/**< The line can be configured for pull-up resistor */
+	GPIOD_LINE_REQUEST_FLAG_PULL_DOWN	= GPIOD_BIT(4),
+	/**< The line can be configured for pull-down resistor */
 };
 
 /**
diff --git a/lib/core.c b/lib/core.c
index a04514e..f13c752 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -494,6 +494,10 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 		req.flags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
 	if (config->flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
 		req.flags |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
+	if (config->flags & GPIOD_LINE_REQUEST_FLAG_PULL_UP)
+		req.flags |= GPIOHANDLE_REQUEST_PULL_UP;
+	if (config->flags & GPIOD_LINE_REQUEST_FLAG_PULL_DOWN)
+		req.flags |= GPIOHANDLE_REQUEST_PULL_DOWN;
 
 	if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_INPUT)
 		req.flags |= GPIOHANDLE_REQUEST_INPUT;
@@ -556,6 +560,10 @@ static int line_request_event_single(struct gpiod_line *line,
 		req.handleflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
 	if (config->flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
 		req.handleflags |= GPIOHANDLE_REQUEST_ACTIVE_LOW;
+	if (config->flags & GPIOD_LINE_REQUEST_FLAG_PULL_UP)
+		req.handleflags |= GPIOHANDLE_REQUEST_PULL_UP;
+	if (config->flags & GPIOD_LINE_REQUEST_FLAG_PULL_DOWN)
+		req.handleflags |= GPIOHANDLE_REQUEST_PULL_DOWN;
 
 	if (config->request_type == GPIOD_LINE_REQUEST_EVENT_RISING_EDGE)
 		req.eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
-- 
2.20.1

