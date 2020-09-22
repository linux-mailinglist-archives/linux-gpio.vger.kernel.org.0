Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838AF2738C4
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729224AbgIVCgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgIVCgm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:36:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81693C061755;
        Mon, 21 Sep 2020 19:36:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so761132pjd.3;
        Mon, 21 Sep 2020 19:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kWHc3jgW08KSnuQ458Tk3d6FpZor5WScIxTztRACI4E=;
        b=ZdM1/Gc1XiXAa/dzaCSsqzEmCR6fRqpG7oMw6/L2ld9MrCLyMGAD5lfSsS4kOU3EHI
         zzLwZzW49LqhsXIUsghwk0vtKUAm6Z9ZABp2grtpH6FO+/dFba0wDd2pKTP/Xm3cJiJ2
         UlvReX+6VOnGWyl70K8IWAQNiAuuJnNav+bLn3qA89df037909egfVPuHMF/inGKyXBu
         5+AlhEHwZg/5mpPi0bAqyQ9MhzQvCAz4o5DxQpzQ0XBE4cJHRLyxiSWWev9AR3ze+W1M
         Um4+8b1pqyClmtiMwM+Ma6JWsZFNLQ5k1CrFecjSmJs13tZjXFlMJhbjIVGbfiki3IZH
         9FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kWHc3jgW08KSnuQ458Tk3d6FpZor5WScIxTztRACI4E=;
        b=AV9+gga0Vq/CJLeHm4SGZS4DXZ7ZESnMywQiwm8FuHYIyx3Cf4STfDP2WWPPR5gNnf
         GR0iGVzIWgmW9llIeM02e0EP5/TgJHaJ0YxJ3SvUz9WeRNb7ytxdj2CHnDPNbKAmFmo7
         1anS+yUNSrkxAoyaMza6/nDEL1/iuV83t0NzXh6hnIk6pVXIQRoV+zj6PV3CatZe/9BZ
         598yFXsdFJ0o9sytRMc+IVWJ96/gGQspy+IYjwJGSGs7d7SspOtl0qbO2Nxjm2dXbiCZ
         69PLJI4xmiHPnQqESPzZV+oj3c3hgspkQBri6k6RGo+cPZHOJHxso7KhYqBq2s+hATqy
         x+IQ==
X-Gm-Message-State: AOAM531ojayrHe+EIkNuvdD6Aus6ZNWuZEI0r9yHigoFt0mYP9BOPmaw
        czlMkiGsfIU7/XLAN/t7fWsptNQLpL1mOA==
X-Google-Smtp-Source: ABdhPJwVZMuh7n2+JWCt8W9YQzXsSBKsd9sX/9wk1dhg9i9c2+F86LwWb1lc/DNUMSdKL9hKZ6ajoQ==
X-Received: by 2002:a17:90b:364c:: with SMTP id nh12mr1837464pjb.182.1600742201632;
        Mon, 21 Sep 2020 19:36:41 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:36:41 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 15/20] tools: gpio: port gpio-watch to v2 uAPI
Date:   Tue, 22 Sep 2020 10:31:46 +0800
Message-Id: <20200922023151.387447-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-watch tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
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

