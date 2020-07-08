Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD359217E24
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgGHEUp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgGHEUp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:20:45 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281ECC061755;
        Tue,  7 Jul 2020 21:20:45 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d10so17636918pls.5;
        Tue, 07 Jul 2020 21:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jwf9HX2v4pIKa2lTAdU6rNePQ32bNm3wIaZRAoDNPmQ=;
        b=p9RqB/Qv885kHcaYGbK7MG7uE6IyTOksWJGE3636Yy8V7MXXoRhfzJLolZNffI+CnG
         LTP58eb2p39jAuMKyFItSHZbR6JVt6adTZJTMaQABAdoMjBNJs0xLK8e/V7FBlyaX1Ta
         s80axRCb5GupZ8XBCgB3W1wwSeglej6lURba3oWohYGR2/bRrb5XIjX+53j0L/l8HcrB
         RHvIAesM22bO+R85TeIHzuwEYgl18jjt2NyGya6p9SpWEBYixIMJMr9WB41MQhfK46aY
         yTHAJChdvS90kIDD+fL6obu6qwe18il8TIEg7wGr9xr984LczLnwNYauzEwrmDGQOW74
         i6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jwf9HX2v4pIKa2lTAdU6rNePQ32bNm3wIaZRAoDNPmQ=;
        b=GMZ1v7z256p/MAfsqXPRcx7GxCHlH7RROnsqJcNljVb4sW+jv5Um/xuogYteueMbg/
         5srnP/pka27knrDJLcE3YSh/qrZZfpErA3l1vvcMHAQ6ZM54jpuy45gYENFT/P73f5HW
         A2HUSE0qrDTEzZJxKirdxL4LMNJMX/YlTsKNUYtPbSXW6FIgwX8ZQExAOKShpqqxM9u7
         pl6MpaLJi25X47hU+gpho4wjY47q6DXbnXaKi65m/hzwJ2osWL5GuI722fok+8lY61Zu
         VDLnknzkdL7/MWanplR+z7Y4dulH/hsDjpWISST21uVH1AaRy+9CsAvFl41ioXyr73p2
         RA0g==
X-Gm-Message-State: AOAM531bqYD2K8VNQZSmm+y1GlEHpI7LWADMimUNi1Gqwb1MnVs4UCLZ
        JJmNPJY5LG7gZGRFfg07HThu/QvP
X-Google-Smtp-Source: ABdhPJzte7XvEIcqLv+9KrITWeS8yb08ygSJREBf8vTl3zcpZ0BxDAQhl3JjcuT10j0XE8yAtUzRSw==
X-Received: by 2002:a17:90a:3223:: with SMTP id k32mr7649348pjb.121.1594182043687;
        Tue, 07 Jul 2020 21:20:43 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:20:43 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 16/17] tools: gpio: fix spurious close warning in gpio-utils
Date:   Wed,  8 Jul 2020 12:15:59 +0800
Message-Id: <20200708041600.768775-17-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix bogus close warning that occurs when opening the character device
fails.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 06003789e7c7..16a5d9cb9da2 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -75,7 +75,7 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s, %s\n",
 			chrdev_name, strerror(errno));
-		goto exit_close_error;
+		goto exit_free_name;
 	}
 
 	for (i = 0; i < nlines; i++)
@@ -94,9 +94,9 @@ int gpiotools_request_linehandle(const char *device_name, unsigned int *lines,
 			"GPIO_GET_LINEHANDLE_IOCTL", ret, strerror(errno));
 	}
 
-exit_close_error:
 	if (close(fd) == -1)
 		perror("Failed to close GPIO character device file");
+exit_free_name:
 	free(chrdev_name);
 	return ret < 0 ? ret : req.fd;
 }
-- 
2.27.0

