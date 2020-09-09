Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A418D262D2E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgIIKbZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729692AbgIIK2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:28:37 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB92C061573;
        Wed,  9 Sep 2020 03:28:37 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so1743222pfc.12;
        Wed, 09 Sep 2020 03:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=nkPEtTaoaUXyOcYh2AMf6RHJtua9jh6I26lcVKqx4CdrZ7n3k3xw+GZ2Ii2oldAFi9
         O3qx6eeS61FMQwD1KmA/en+eX8gX+ekeu76S45z0LmT8yKkaU9rlUCi14D+yBdBtUjHy
         2OVgdpqLrku9F1/66OdBlD13a2wE4Z7kllktRbp/2pFqj38GTEFeRhCaomIi22KkWfZn
         u6/J2xUoONGZMgjxc3kF9N4p+QYC0Cct8LGetMoidjQ1pKwzc/awK5e1UAjG7HeRAkKS
         88MzN7vYmqoNHxxSWjzUF95KbadKkfUo8rLXRu/DJ/zuFyEshPFEseW3Umy8ICwHEfe8
         ml4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=IdXM4y31ko1DmezK3Ah+niOAUFKpemVgD4vutrhAYps5QPcaB5FhqLlw4a5xIeIJtF
         P2UqessZ9qYDEjukKdTe2FDgXcDjL7jxDQQ0v6IzM4rm7wFtkK81NpeH7UyQo6nWkezd
         Mze0WB4BYEzpG6u+DDmHyF8R8RuMwsPjYGbWCzw9/Ppp1utGwffLKoWoZ4yuh88nn8Ws
         EPgK6NSuBw1c8Ro0RsiPth8A1ARb2b6eNnixpIjHyxvFcjQHKzmWwZu5+6eCxkYrI8Ws
         LywIBjohAXAuyDLR6+Hvk8Fl9LKWbbkevMS3I4BkJWF6627FIYlHAHoV5/BVzR4TidIl
         pN5w==
X-Gm-Message-State: AOAM533qP0ZZUOySC8dlLikAa+2B61bmgwn8BZ69lEVXpX6ZJJHP/Xx1
        eAzRtHNcwZHws2ZnW0/ZDCNawDm7rm0=
X-Google-Smtp-Source: ABdhPJyZq677fgfr9cGfmTxPlvQ8PiCjQr6YekoDBb2ys9fYv4QfAJQEQvjyctUcND9K7VV+ctiHXQ==
X-Received: by 2002:a63:1848:: with SMTP id 8mr110111pgy.347.1599647317012;
        Wed, 09 Sep 2020 03:28:37 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:36 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 15/20] tools: gpio: port gpio-watch to v2 uAPI
Date:   Wed,  9 Sep 2020 18:26:35 +0800
Message-Id: <20200909102640.1657622-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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

