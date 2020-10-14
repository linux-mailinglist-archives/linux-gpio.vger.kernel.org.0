Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A1928DC1D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbgJNIy5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730227AbgJNIyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:54:36 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC12C04587C;
        Tue, 13 Oct 2020 23:28:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gm14so937884pjb.2;
        Tue, 13 Oct 2020 23:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=35fYZ5fGVbU2fwG24QMeC4xi8klfAcZjjBgE7NnhZ48=;
        b=UXTnFIN402DofdlUoP3lZgVnS07qgE/1JmV3gXt/DcPJ6p5jzg+hocGgooraLMjKZu
         CSn33zWBJjzTKjkb2EfgQPFFXKrAGDQD0xqIBbG/ugwfdSyflkssXYhkfeK5SYisqcH7
         EGotqag8Kquygod5qL3i7DPzo+KdITmM/lc6SJ6vEOjWBzcVYmrmM3pNoI9ARgLVxNOh
         AinLGFw7l0oLwe8z5k+pFc0/6SSbKLwqwkY9ptEUYvcbQjy+jG6lZM/p7T15XhduTvUM
         nit9CgeuLr41CIOfm9xCs1NVILxSuPyActl11q25aNyNfNRF233MxkGvxz0EKvDUbMxh
         cipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=35fYZ5fGVbU2fwG24QMeC4xi8klfAcZjjBgE7NnhZ48=;
        b=e8/QQbELh+SnXadSpSAKVHTEDnvqeGstX3zf2nhXoxmiUoq3ZEDLXeBlxwOGstSxFj
         Rrui4MMTnFZPKY6Bwd+shWjuekQcsIgGjpVTXi0/ZXv2fuMfWMfcSSYEkLTuhIZYdsK0
         /WvLLug05IK1j+bvN/L0pegGB8uLun67XA5c6qsRUT0t0tm7HE94bzRWf5JxRGXJDLu+
         Pa6S7bogY1/OPGsbhAKSOmkKb2iZ39SGZ7fMhqrbuB1FDEGiLqmmLieHS0dlCOxq7WAh
         qCQEqT7nBwuXTOXSZcytO8/riz2rDmzruWp3g8C28pZRnq5I0+Gf2RTf/TQO4R3nQNr5
         qIKg==
X-Gm-Message-State: AOAM531dE4HruzfYm7NwFyr8/aJuM3/D6HvgytR2ZGhh1JIBz2KxzNDW
        t3S9n8f0TSTYkl/xw50JG/p3MFm3py8Iyw==
X-Google-Smtp-Source: ABdhPJx3fiLDRyLDNGvEu5y7yTCa9HZD5ToUhUqx6xLlgQLLXoOQLPRs1AnYLQxwgM8SNt5bQI0NFA==
X-Received: by 2002:a17:90b:11d1:: with SMTP id gv17mr1999839pjb.3.1602656909918;
        Tue, 13 Oct 2020 23:28:29 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id q24sm1803266pgb.12.2020.10.13.23.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 23:28:29 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 3/3] tools: gpio: add option to report wall-clock time to gpio-event-mon
Date:   Wed, 14 Oct 2020 14:27:40 +0800
Message-Id: <20201014062740.78977-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014062740.78977-1-warthog618@gmail.com>
References: <20201014062740.78977-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for selecting the realtime clock for events.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 90c3155f05b1..cacd66ad7926 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -148,6 +148,7 @@ void print_usage(void)
 		"  -s         Set line as open source\n"
 		"  -r         Listen for rising edges\n"
 		"  -f         Listen for falling edges\n"
+		"  -w         Report the wall-clock time for events\n"
 		"  -b <n>     Debounce the line with period n microseconds\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
@@ -173,7 +174,7 @@ int main(int argc, char **argv)
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIO_V2_LINE_FLAG_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:b:dsrf?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrfw?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -204,6 +205,9 @@ int main(int argc, char **argv)
 		case 'f':
 			config.flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 			break;
+		case 'w':
+			config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
+			break;
 		case '?':
 			print_usage();
 			return -1;
-- 
2.28.0

