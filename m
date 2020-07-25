Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28BE222D4BA
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgGYEW1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:26 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81949C0619D3;
        Fri, 24 Jul 2020 21:22:26 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id l6so5600541plt.7;
        Fri, 24 Jul 2020 21:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uTIB0t1lNlQllhy3fGaHJwrQZ6d0N6mq1EmCP1roew4=;
        b=TbKRG+JZr9b2luRzy5CaXoWSc8rr68lgkSc4SlEx2r4M2p+rI3mmBIpXqs25/07qrp
         Jo3H4YPWwdA/Xa6rMdKIoMThWG1VBApQIt0IMfb3B6PzarchXKEgDmqBXHZV6m+1kjjY
         0M7e+Ulck18jXY7uO17RLeLjgzdfFLS0y1WbEAoChrUVmfHMzZRDc6H1yBMQkTZ3h4b1
         L071m7E7sPtw9h2DaYoLPKgbMTh+qikDy73XNAMTDuhUxMZTsoVfuMJX3dpkEoU28HbP
         sKOmgzfL+gm+tmzEflNNtm///FUG5u+vR9gdsuHGAscaIubrMMwP5k2+JKuEgdZp9nOg
         qlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uTIB0t1lNlQllhy3fGaHJwrQZ6d0N6mq1EmCP1roew4=;
        b=L31uQB/0R2sJWDLJSefk78UjT361orP6mX41ZzK5LMiGK9BeMFnmCzK0dE7nWC/B0c
         XNgSAhX1r0SQyrpTxP7Vg/RINvDWRmWCWFuOlspUM1rqUKa2pFnxZg8SqUw2+2Sl9AT9
         ymq2zaE6gtYCgJ5VHawBM/DjdbOwex67JrQS753zy+aCC17kqWO762FvJLsooho/dja/
         El1fe+LrqzOYFXLwHwQz0Q5JmESQPN6QR9R7Y+Spmc70FxJ2g8nK1fl/JERrO5ep7K3u
         IotLC2Rkq5jMXABsYbBsx9VUqRkQHZAXVD6AyLxFNd97VxPUFwtTjMoDBuJQh/pHjvx3
         fTbA==
X-Gm-Message-State: AOAM531nX/788y+yd1Uv+qRg0bRhw7jc4sQbx28l6zefileEtn9udnpj
        GIvnd+3yQJYeUXM8AXequE79VHDL
X-Google-Smtp-Source: ABdhPJyVjuwiz1p/BupNpYYvFdbBv/mktFYkmroU/ZVA/Li6eRhVIhH8kqrj6DmCZ7nJzzmuxkMnRQ==
X-Received: by 2002:a17:902:9a47:: with SMTP id x7mr10788345plv.90.1595650945694;
        Fri, 24 Jul 2020 21:22:25 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:22:25 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 13/18] tools: gpio: port gpio-watch to v2 uAPI
Date:   Sat, 25 Jul 2020 12:19:50 +0800
Message-Id: <20200725041955.9985-14-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-watch tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-watch.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
index 5cea24fddfa7..0dd5a04ab250 100644
--- a/tools/gpio/gpio-watch.c
+++ b/tools/gpio/gpio-watch.c
@@ -21,8 +21,8 @@
 
 int main(int argc, char **argv)
 {
-	struct gpioline_info_changed chg;
-	struct gpioline_info req;
+	struct gpioline_info_changed_v2 chg;
+	struct gpioline_info_v2 req;
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
+		ret = ioctl(fd, GPIO_GET_LINEINFO_WATCH_V2_IOCTL, &req);
 		if (ret) {
 			perror("unable to set up line watch");
 			return EXIT_FAILURE;
@@ -87,7 +87,7 @@ int main(int argc, char **argv)
 			}
 
 			printf("line %u: %s at %llu\n",
-			       chg.info.line_offset, event, chg.timestamp);
+			       chg.info.offset, event, chg.timestamp);
 		}
 	}
 
-- 
2.27.0

