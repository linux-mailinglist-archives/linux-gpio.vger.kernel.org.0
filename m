Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B725D23FE83
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgHIN1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgHIN1j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:27:39 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176EDC061756;
        Sun,  9 Aug 2020 06:27:39 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id m8so3722960pfh.3;
        Sun, 09 Aug 2020 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=SM04bYm1sQ8ti5VUoB0jb/YZ0uJDZUaKNEyJKhNJXiXLWFcMg4kR73958ztLQvggdt
         OXVFI3hccWJCIYsTBNDSYIvedO8czWPP1PtlcE1GFXoZncgsioP3Qsw9zgeFIzuyRcOf
         URd6jNpVcpd++lU8aCeMP6WGcykGhUgc3E8dSm2TdkTJBhSaBpTXAFklCTfqLr4yP5xI
         6jie6BKhjMekoJZXtxojEWs6GM7wuo321gTUVsY4qHpjG2UmM1glUrdm4li/+WE4IEuO
         9t/LbI55I7EcjG0mb6BAAHlPI2Vw+xqN7qYZrSFfEekEMivvhQ3w2a5CjF0CKxzbtWeh
         YkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIt8SU895oGklP+2kcXOf7XSm/B7RkLFz7bfNOknIlU=;
        b=nK2klNnTrbtV729ybUZOeaRvOI7shV7GqNd1hrjqyiiL41nPzL4muYxdKsVqw/ZgMi
         gUL4LTQQ3bEiDO+9SbKPnYoNMtf5VrwedROW15Uows1ovlxGbQsOFw5O82I126eV4oVr
         h0Bgri25FMfyVfUF9Em12T7a0GtHgd0cJWV2DebRsGb7I3Z/epmdsa8hNoMmBlBkCN8B
         Hq/qSzXs1zN1q0sZ5f9NdRYJNC9M4egmzSdh/ejo5slU3yfzWFqaO8y5OvmkVTVcnfzc
         8D8Mbzaf9BeJ70qTvlU/pH36an64DA+WKl9RilWuhBDaxUGufqIQnrbYrm5cuQSGagxy
         yALg==
X-Gm-Message-State: AOAM530cajs9Kf4xGjnUK4euauP7oExb1PJOgVvDN8K9ISXvuWRy0enm
        eJNDP0afVc03HfOcOsWePI9it2ob
X-Google-Smtp-Source: ABdhPJzjiOe9/3+0vlNXLhdWESyJwHl7w3fAos9uoMKdy933Gb3ueP/oX0UXVJy5oKmMgxZsWEoFyw==
X-Received: by 2002:aa7:8e8d:: with SMTP id a13mr21799016pfr.250.1596979658236;
        Sun, 09 Aug 2020 06:27:38 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:27:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 13/18] tools: gpio: port gpio-watch to v2 uAPI
Date:   Sun,  9 Aug 2020 21:25:24 +0800
Message-Id: <20200809132529.264312-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
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

