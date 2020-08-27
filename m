Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CAB254666
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgH0OF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbgH0OEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:04:21 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65E3C0619C7;
        Thu, 27 Aug 2020 07:03:41 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g29so2422615pgl.2;
        Thu, 27 Aug 2020 07:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=VoR6tt84zLXjyu1g76/nMxTcuqWYBpv1/t4SevALg59qHWTSskUXgUXFLsg9CNGGse
         +V9BBRagon9lXBR9Q7w/nzSnXXPxfr2IcCvlwyt97rZVhxOU+jwP6i4qATzheSTSy3G7
         PtDq4FfBh7c1OOgGPMiaubiw54m0kfWWBV3lnkGIsvFI4i99+Q0eI7vhyuQ0QXmIDMEC
         F+QiTsyf9NSb7zkLBxsbdrpgKeijNcTkElHOPUdrOn6ycJO59b8QDdQzSfkfeSxXVBtx
         gXGrHXkr51/ijBiptBS6ezjgPj56om6D6fwgP5AD8ydt3DFgjHuzNN8aevwhJ5H6YNAt
         KrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=fXy4lrGWoAaZp+/I36I60aeRPBNLztEspvQpG430L7aZZj3xmmn3uxm7ovSEaHjoZ9
         t+NvMEC9cehJzP/VlNv4/RdSpvf9T9YQS9+HRZv/hWK457PzEgYSpmelDZdiQPPNgcuD
         KCiMkXYDKqM7TuaMvnbT/3xFLvkaD4Xyl56sTidvk4VQhDh3YKUlFg4VI93ScuZqW1jl
         DIWuD3amaShlO8QZrYnvfF8mGRSmtSb9wo4tB/BxGtPal5ojAWBBkkSRnZmSNwAwm6bO
         TLn0cQbaJRQAk99xT0BYF3ENRTxtbLc9PUSgjw2SbobmRfp6OzQUB1hoxa0vux2SWO4G
         TV9w==
X-Gm-Message-State: AOAM533HQOKzhTE463cx83Vg9mLjFd09CRWtr2VmIbmvIZ080rn2t8ih
        p9QExXjL41BE6AAHIYyyHfNdJsEvyV4=
X-Google-Smtp-Source: ABdhPJyJ/ZgY7b2VbYL/BPBj3JPSkbnWBQ8Z9sDUnv9kTvMszM5VRKCaJ1X5lNlS6vUENRLqRPBbig==
X-Received: by 2002:a17:902:c284:: with SMTP id i4mr16226956pld.287.1598537020709;
        Thu, 27 Aug 2020 07:03:40 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:03:40 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 15/20] tools: gpio: port gpio-watch to v2 uAPI
Date:   Thu, 27 Aug 2020 22:00:15 +0800
Message-Id: <20200827140020.159627-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
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

