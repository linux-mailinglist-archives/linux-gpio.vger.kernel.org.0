Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43FCF1F14FF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 11:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgFHJG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 05:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbgFHJG6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 05:06:58 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1A8C08C5C5
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 02:06:58 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t18so16522935wru.6
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 02:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z9SWAsOWdF+HEBnF7t8itSpv+G3Fr+B1K5OCBmpX0uA=;
        b=HvuuHtJi7o963xDCD4aH4pWKSurgHXW3aAoc9N/McCnPfa9AQIzzcZfmtSEtGsHXSu
         hX4B1KXmw+ECUsLq3U/E/wK3DK8rJj2QawNj/UMOfBeffvl5+0iRpNlf6Mvs9t9sOj7f
         14ZWM0JFXL6yC7kghXVoR4cZxac0ky2/VsjzOEE7motqWHCv0pKqsIEvNQS1KfahXo5n
         nvOcvPlgW0CmD+UyQ50oZ5AdiU0sbirTwhzTt/NzDKY6fvAe1VUzctNml4n7nyqFvmYO
         LV16BLPn2dljz/rUvDKuoxdQACBPkisjov28k8cXKcmU4PSR4/dKbyAoE542MZjODrbq
         wLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z9SWAsOWdF+HEBnF7t8itSpv+G3Fr+B1K5OCBmpX0uA=;
        b=H5ZrdM2A4/413rVEZO1IOxkwU2VOlqIe1H+vExyupNVIBj2eEQpalv2VitGiTvYot+
         1M7PDu/vEQXcO9laa2bMXMqZ28t+nZ7jWc/zTX/9niS4R5X4xTQeOHVUgu5bMN7S6Saz
         sX+TXT6Cx2bnWDYcYoVnU/QKx/wxk4+wDO+xjPqiWTvMYENZclPbMZVSSxmBOCPY3VaU
         PoPJtgF5KSCm9SZSuWY8Heo4A5br3JWcPTSRq4QY4a6dbWNLGVV0XDNLa4K5tdWa1FYs
         wMvoMvkA4QIWOybCNzhX1cKUbKduQCi1vDNTPDdewOGPOAtnFIlXM0mb3StxoC10dGXr
         CH1A==
X-Gm-Message-State: AOAM532ynrgttj06RHXxtvOgv8/IkBGp2OeDNZTlmDj4/5+xK4tOgGXR
        qbVGvm3FMNZAIhTbSClTrcQK4t2OeYI=
X-Google-Smtp-Source: ABdhPJzfc9++THruVVl9uZQn8GgLoHdSjo8F8uTOnVY93AqW3kU5QZF7LvRPg+BEQrvd6VCXuRDoJw==
X-Received: by 2002:adf:e9cb:: with SMTP id l11mr21698132wrn.86.1591607216656;
        Mon, 08 Jun 2020 02:06:56 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000f89b400cc883edd44ec4519.ipv6.abo.wanadoo.fr. [2a01:cb00:f89:b400:cc88:3edd:44ec:4519])
        by smtp.gmail.com with ESMTPSA id f9sm15378727wrf.74.2020.06.08.02.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:06:56 -0700 (PDT)
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     linux-gpio@vger.kernel.org
Cc:     Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [libgpiod][PATCH 2/3] tools-common: fix build for Android
Date:   Mon,  8 Jun 2020 11:06:51 +0200
Message-Id: <20200608090652.805516-3-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

program_invocation_name doesn't exist in Android, getprogname() should
be used instead.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

I couldn't an equivalent to program_invocation_short_name, so the
program is now using program_invocation_name all the time, hope it's ok.

Regards,
Gary
---
 tools/tools-common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 12bde20..1d7fc2c 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -21,7 +21,11 @@
 
 const char *get_progname(void)
 {
+#if defined __ANDROID__
+	return getprogname();
+#else
 	return program_invocation_name;
+#endif
 }
 
 void die(const char *fmt, ...)
@@ -29,7 +33,7 @@ void die(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", get_progname());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, "\n");
 	va_end(va);
@@ -42,7 +46,7 @@ void die_perror(const char *fmt, ...)
 	va_list va;
 
 	va_start(va, fmt);
-	fprintf(stderr, "%s: ", program_invocation_name);
+	fprintf(stderr, "%s: ", get_progname());
 	vfprintf(stderr, fmt, va);
 	fprintf(stderr, ": %s\n", strerror(errno));
 	va_end(va);
@@ -53,7 +57,7 @@ void die_perror(const char *fmt, ...)
 void print_version(void)
 {
 	printf("%s (libgpiod) v%s\n",
-	       program_invocation_short_name, gpiod_version_string());
+	       get_progname(), gpiod_version_string());
 	printf("Copyright (C) 2017-2018 Bartosz Golaszewski\n");
 	printf("License: LGPLv2.1\n");
 	printf("This is free software: you are free to change and redistribute it.\n");
-- 
2.26.2

