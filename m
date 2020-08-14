Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDBD2443CE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgHNDFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgHNDFa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:05:30 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93336C061757;
        Thu, 13 Aug 2020 20:05:30 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mw10so3724066pjb.2;
        Thu, 13 Aug 2020 20:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=KMT3hLOnIPHPNEjufFg2tJXaP9TD/ikiCUL+mQs2ID7x30F7h2YGnsXH91+iH2cFpo
         4PeAZMms5SzYYPgy0CQIcpGMuZcNQo+5TobMBzU2DRfMs5XICHHPzDQwv34gZ6T8+kz+
         5NiMppfkG3BvNbQglXzNJDfrwNI9HBzRuPkiLzN8aIhRjifix6EkxD+wOlP+nXKK0rk6
         1h9aYD5H4vlREkGjIRcwsSzkWpOfApYMMoOmkjPbkA/uMf6bllP3x3j0GoMfAkYhvm4y
         kT0bP5o4pwQgszO8mxO4S5WZzw1egYnNvGuwHzrn7dniJKt+atLJqlPFfB6MManUUj8j
         fUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=kHiz5o1hGqbiOo7y75jyEXddJydBZxmK8ryPCcTw/M5eScRbY36ezmjhb4R7JwWLE8
         IFqSF14EKlSwxgsYCfbhml4mJ1hzWkK/ou5VWKJXBPtVhiUZbYoimoXf0zmE4/ENEnMg
         hOXwESLBngVniEEJesd8Dfl1bVMMYljbAYyq685tYgh6rsG2ooOL02QHekk7ZvNKCcma
         BQiaykMkcruXBCPYXSIYkos9dYcWB4uCTV3hYskkr1unfrfRHBoPf6/A3W77V3/jQc/B
         KYzACWhAPBAwZ6JeIvrbyaIefpTbtMuQoqJPX4gRyKvZHb3TUqxCvueutVgL3LXr/5sT
         vugw==
X-Gm-Message-State: AOAM5328rg6DRFqM95lYWc3+y3K/Lj4o3NPOTueJ6+V9dtz4NF9Tpk3Y
        AE7H5+QuwPadxoCJ3yLKASHJdWVE
X-Google-Smtp-Source: ABdhPJx7GdIPAYY61wAq5RgXhu0Tp/ZJIeUr1CljB4P5dzrRTLoEIuwHFY2XGeebaRtWjpQa0hDJXg==
X-Received: by 2002:a17:902:9a81:: with SMTP id w1mr618349plp.186.1597374329752;
        Thu, 13 Aug 2020 20:05:29 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:05:29 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 15/20] tools: gpio: port gpio-watch to v2 uAPI
Date:   Fri, 14 Aug 2020 11:02:52 +0800
Message-Id: <20200814030257.135463-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-watch tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-watch.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
index 5cea24fddfa7..6f048350a27e 100644
--- a/tools/gpio/gpio-watch.c
+++ b/tools/gpio/gpio-watch.c
@@ -21,8 +21,8 @@
 
 int main(int argc, char **argv)
 {
-	struct gpioline_info_changed chg;
-	struct gpioline_info req;
+	struct gpio_v2_line_info_changed chg;
+	struct gpio_v2_line_info req;
 	struct pollfd pfd;
 	int fd, i, j, ret;
 	char *event, *end;
@@ -40,11 +40,11 @@ int main(int argc, char **argv)
 	for (i = 0, j = 2; i < argc - 2; i++, j++) {
 		memset(&req, 0, sizeof(req));
 
-		req.line_offset = strtoul(argv[j], &end, 0);
+		req.offset = strtoul(argv[j], &end, 0);
 		if (*end != '\0')
 			goto err_usage;
 
-		ret = ioctl(fd, GPIO_GET_LINEINFO_WATCH_IOCTL, &req);
+		ret = ioctl(fd, GPIO_V2_GET_LINEINFO_WATCH_IOCTL, &req);
 		if (ret) {
 			perror("unable to set up line watch");
 			return EXIT_FAILURE;
@@ -71,13 +71,13 @@ int main(int argc, char **argv)
 			}
 
 			switch (chg.event_type) {
-			case GPIOLINE_CHANGED_REQUESTED:
+			case GPIO_V2_LINE_CHANGED_REQUESTED:
 				event = "requested";
 				break;
-			case GPIOLINE_CHANGED_RELEASED:
+			case GPIO_V2_LINE_CHANGED_RELEASED:
 				event = "released";
 				break;
-			case GPIOLINE_CHANGED_CONFIG:
+			case GPIO_V2_LINE_CHANGED_CONFIG:
 				event = "config changed";
 				break;
 			default:
@@ -87,7 +87,7 @@ int main(int argc, char **argv)
 			}
 
 			printf("line %u: %s at %llu\n",
-			       chg.info.line_offset, event, chg.timestamp);
+			       chg.info.offset, event, chg.timestamp);
 		}
 	}
 
-- 
2.28.0

