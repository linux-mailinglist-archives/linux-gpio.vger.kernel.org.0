Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53CA25E7FE
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgIENkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgIENj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:39:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB92C061245;
        Sat,  5 Sep 2020 06:39:28 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h2so2438939plr.0;
        Sat, 05 Sep 2020 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=FBVXWILJHJXGzfdOP1/hZMGC2H0rtftEiYrz9wHLNPddzSoDDXcShXFDlqxDetz+8f
         CwmY08Fud7QjpO/i8nQSxxkgBKXGtTmfyabwgkpilArocv4iEfilsPPSCemgUgKA61vr
         XFH5LSCGl9gSJcHKZl3zBaoNvcIqFyJxHmDIlL8p4LKVLuPXyn2KvUFWAvJZc1MNaiyt
         KTMqHioashpkoR8zLS49CpSBisEjPCWQ1pJf8ATbNrkYzL5rX1W342hHUD6Vpj9kW3+b
         5kH1sFq3W+XyB1wRYPnScZl+1mOjTpPtnOTetDk5tmtwa2FVW8YRmZ+0B/InuzDc/faY
         h6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=YJvv2XJ8qSrhGM+vOz510wNhGQV0y0d4WJksaEjoANwfE+jqYc8pxpMv0yFkNoyhBQ
         powDD8eMcvGw/rP2H6EVNShedU55IRipKlDeWtiXJIdkkEuYoEnJQhF5PX/8wEBBgtG1
         OGRwN1JQqYiEJ1bVlluWPubat41Vk3BvnhknalXftxMRsXk5XXuc0UnVN2Ebn4v4rPIE
         EZicw8uzLV7qO2LkKfU4ROAxot3yAk8wBO2Co6w/5mSSnHpEIUWT5zoIoQvK4g1f+w+R
         7sjKccyyMmYW3Fw7QbMfoyz/Tjyb33zvMJoYLDH2pT25pkd9j/YpX5E9La3z8tWgXfPJ
         BoCw==
X-Gm-Message-State: AOAM531Sj76tZ2/n/C31V2HtHC5CnKmQO4k2Zg+3171BG4vVe456cOij
        WTPUJ8EYWul0NDTVjfe8wE0vnpBM24s=
X-Google-Smtp-Source: ABdhPJw3sUVEMa+u5ufVpjI5tKWqAYWar89+nTtRvffmOR0Hoxm2n4IOgm/6bSxCRUA1NDaVBQ8d3w==
X-Received: by 2002:a17:90a:8909:: with SMTP id u9mr12742503pjn.119.1599313167931;
        Sat, 05 Sep 2020 06:39:27 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:39:27 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 20/20] tools: gpio: add debounce support to gpio-event-mon
Date:   Sat,  5 Sep 2020 21:35:49 +0800
Message-Id: <20200905133549.24606-21-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for debouncing monitored lines to gpio-event-mon.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index e50bb107ea3a..bd5ea3cc6e85 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -148,11 +148,12 @@ void print_usage(void)
 		"  -s         Set line as open source\n"
 		"  -r         Listen for rising edges\n"
 		"  -f         Listen for falling edges\n"
+		"  -b <n>     Debounce the line with period n microseconds\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
 		"\n"
 		"Example:\n"
-		"gpio-event-mon -n gpiochip0 -o 4 -r -f\n"
+		"gpio-event-mon -n gpiochip0 -o 4 -r -f -b 10000\n"
 	);
 }
 
@@ -167,11 +168,12 @@ int main(int argc, char **argv)
 	unsigned int num_lines = 0;
 	unsigned int loops = 0;
 	struct gpio_v2_line_config config;
-	int c;
+	int c, attr, i;
+	unsigned long debounce_period = 0;
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIO_V2_LINE_FLAG_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrf?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -187,6 +189,9 @@ int main(int argc, char **argv)
 			lines[num_lines] = strtoul(optarg, NULL, 10);
 			num_lines++;
 			break;
+		case 'b':
+			debounce_period = strtoul(optarg, NULL, 10);
+			break;
 		case 'd':
 			config.flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 			break;
@@ -205,6 +210,15 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (debounce_period) {
+		attr = config.num_attrs;
+		config.num_attrs++;
+		for (i = 0; i < num_lines; i++)
+			gpiotools_set_bit(&config.attrs[attr].mask, i);
+		config.attrs[attr].attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		config.attrs[attr].attr.debounce_period = debounce_period;
+	}
+
 	if (!device_name || num_lines == 0) {
 		print_usage();
 		return -1;
-- 
2.28.0

