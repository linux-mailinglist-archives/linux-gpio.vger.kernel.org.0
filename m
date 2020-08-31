Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D582D257241
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgHaDYB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgHaDX7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:23:59 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4BAC061573;
        Sun, 30 Aug 2020 20:23:59 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id j11so2361415plk.9;
        Sun, 30 Aug 2020 20:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=TL7V4LojCV9AdG4FSJRXpEgng1qDns4dtZ2SuklwRniakzhDwDXeW3YgYDpvC3hzZI
         ruBGwCuMZE9gMzWjgbvcDQa7MewRD9HerwM4FfN9jRZ2hXxuo/r2YWjYB1hXNwmm/pKx
         2qrErvy83LnbZ4KawAKxOkFuj1YBAdlhYroApyHSGxvSSwi7GuABgLkA4GyETwad2y8+
         xQWEPdxMyM+E7w13BLkBkFT4BbG4AkLcY+dOblN+64ypdReM7odiZdj5c9t3dFL2l7RD
         lgWQGmiq5H+8+iQrXgp6scaePPZbHmhM8Nx9W3boZyuoK8UgqV8nTIeLYiSePpwgZP5w
         n/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=qPfpshix+1AEfaWOmAbA3wvnDl9TkkuVtb4LGV+/8rf61f8gjOrEpTnfA98+DYQeie
         /fNX6cM3EU6Xa0hNASvB3Jd2CUrrbzh2Z6WhtMsnF2iGkWljP6zCXwFL9wLoUrn1dJB8
         OtJYvPj8JpJdmSWZMb9YjsKyvmLbCdV/bncIUAC+WGD2dbjlq57Koxj8X8MoPy9P76Lk
         MuRjzY+uAkXFUFjibIjGsZgJRWtsvE0F5YmivxxxldeJYjAONoJVEfIAMGwGM1Nnr0F5
         JBc7Uoi0JqyCOL0/5vBw4NT35d1e/cjtVUALXMhDhRgnEB3bbvvjEHm7zVJ+Z8ZLcoQZ
         CiGw==
X-Gm-Message-State: AOAM531+4OIQM+pdnchwZYkmzGMoezJjBgJyytxDzECEQDa15y39j0Gd
        29JhhR5PSZ9R9l5VZKzaLDttBC6YqVk=
X-Google-Smtp-Source: ABdhPJySJ0G7Xc558Srlx3+eMGy6Z+pc1Ms6bzQP9SrwdMJbAvqdZU6RyyryjpzC414dXLCQyYn18A==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr7084806plt.137.1598844238570;
        Sun, 30 Aug 2020 20:23:58 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:23:57 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 15/20] tools: gpio: port gpio-watch to v2 uAPI
Date:   Mon, 31 Aug 2020 11:20:01 +0800
Message-Id: <20200831032006.1019978-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
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

