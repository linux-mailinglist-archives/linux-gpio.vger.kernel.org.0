Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6C425E802
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgIENox (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbgIENjB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:39:01 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D13CC061263;
        Sat,  5 Sep 2020 06:38:45 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id o20so6146057pfp.11;
        Sat, 05 Sep 2020 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=vCI9nuIh/ZyX+ZZOs5S6EcWhoFxDgEq27lkoPSrh0fGqHz8gJUaSTghFLPm6FEx643
         S6M78ktCGAIl1gwall86ACUvkkVLM30k+3PEPeP8H3Mg7mTbskavXPYeZD0kju8VNVnN
         5XAE9o+GhN+HhEHWZRBcgEgqbYYU04XtT9gDmaLIDdV95IPqbL7YpKiIsgm+kVMqG3zF
         dWLU1ZJgZ+R10Se0Te+QD7d84wKJseR9gcEykq0GfmM2SOo8YA7sZrtPHf9bFHLSRQeX
         OSi9fP211lsNYDYnpzxYlYwihlS2oX6ymb12IuIyobHNKqNfkwnm9TqMhUF9q0W4znoy
         iKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=eKZ6YHHUdj2rsGvs2OzgsIAbaxw0yuGfTENb/f/OJpdGRU7YauKuaVVQRMPnI6PGqn
         cWs2UqQVNO1CwgLq7554uiMs/HkaSVyDSGXTC57gtC13MNVjRXd8xwEkC0ksI9Z2WJ59
         8ffppSGNeqQPJo7QxS/IRsh5p03feWnuAOTkuw7phrr/VQerPqAnuz97vGXH2zthdeEf
         fRDsoOHPu0BDlNvaYKb4aUID7i9ji8mZfOBK4384uA361f5eYTypoM+7LtdhZorzVlOW
         KssmXHw6SAKcoGI+Lkp7FV9NVFid4hvSR1tC5VAu9wC0XzLGIRR5JuZ1AxIugBq4o1ua
         5sBQ==
X-Gm-Message-State: AOAM532qR8A3F50q7TjBONU37m/BTAx8CiWeB/AY4gHWyUIWtBzjCrI9
        VYjQ9aoxl3v2cVDV7owj5gy5XVUc2bA=
X-Google-Smtp-Source: ABdhPJzoqWMWpss94rtyiz1AaZ9ClyX8Aa1I60n3hiBcLPDeS8MgIQiUIdNk/HsAF42NMb4Ifaeq0g==
X-Received: by 2002:a63:595a:: with SMTP id j26mr11227616pgm.406.1599313124738;
        Sat, 05 Sep 2020 06:38:44 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:38:44 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 15/20] tools: gpio: port gpio-watch to v2 uAPI
Date:   Sat,  5 Sep 2020 21:35:44 +0800
Message-Id: <20200905133549.24606-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
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

