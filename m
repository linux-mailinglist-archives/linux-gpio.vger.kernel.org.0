Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DA927A4D9
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgI1Abi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1Abh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:31:37 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF222C0613CE;
        Sun, 27 Sep 2020 17:31:37 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w7so7774721pfi.4;
        Sun, 27 Sep 2020 17:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y5UkbSjxhZvdiPNHlP+8FifgoxfV/pq/MvdPKMHbdhE=;
        b=aAnV3h12QXrdwTQaMRHXUp1aYSt4fjPIV+lvS3lJKmkh6qpXFqOQGUrMKyOggkUtxR
         iZFjzWPtok3jfKiHNbzZb0S68nZB08yeCCQ98nXnFJgTlA63h2jElx10quGP4qBMItZy
         agdXe4ARBZ/kKEFlp4gAxpkMsb2iuJUbvj14iPr320cSUxnnsiBCH32+jlWVd5m8PTxc
         5AUewgVyfeGCazo/5rPB0ImfmI6CQhUn2puehPLe5UU1Kxqd4QNJ6uXVXG/2qzrC09JA
         A0fjlIJ0Sy0d3HiikYHsy1HguDcJYs/cscdTIx+Ysv8eKm9Udvd7HhW95UIgMF2cbgNM
         rISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y5UkbSjxhZvdiPNHlP+8FifgoxfV/pq/MvdPKMHbdhE=;
        b=Eu9B03XlUsf+S3jxqHsoF2AX2B+ZpQuiJcftUg0UOY4IHBdGXT7flYrIrcOGMZmC75
         t96WA6UlfVTfghqGUDzsjmnbjglwbj8WaxkT4flhZGYPGoGfq78tHWPyJuMRvNAjZEbR
         BVvk+2StQfQI/D1sPRKHdThGQqsqzAOc7EZOnmKl51MoD2zegCsdSu0vvS/iIYi6M562
         D/4KlVJgJ4pw4PMkKoDVgi9AbVkSWRjm4K3XNxWWI2Wzo0jT403FFvt+Xp8aUcUi+y/F
         UBZQJ3oRVhptA14iV+PYdQZ/3aedW7uKe7QcvOq4CXyJRy56sgqHyA5yqNvDJWVLN4rl
         k0Jw==
X-Gm-Message-State: AOAM532NQj5pYmKD3aoePHbiDH9CVmrcUtrUlfEUduWpQYfFbBS6ZmjM
        H5vBzC+PGZ8eGv50Wsq5Rc2CfGgmJFKA5A==
X-Google-Smtp-Source: ABdhPJyBvJhd8kxwRMulvBLpAmgzvRUoG1GXFLWvVLPg9aMMtg389kJHnQMkmx2cKp4Me28+Hz7FjA==
X-Received: by 2002:a63:338e:: with SMTP id z136mr6939391pgz.122.1601253096894;
        Sun, 27 Sep 2020 17:31:36 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:31:36 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 15/20] tools: gpio: port gpio-watch to v2 uAPI
Date:   Mon, 28 Sep 2020 08:28:02 +0800
Message-Id: <20200928002807.12146-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-watch tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 tools/gpio/gpio-watch.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
index 5cea24fddfa7..f229ec62301b 100644
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
+			       chg.info.offset, event, chg.timestamp_ns);
 		}
 	}
 
-- 
2.28.0

