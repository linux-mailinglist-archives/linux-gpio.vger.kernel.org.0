Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364A223FE8D
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Aug 2020 15:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgHIN2M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Aug 2020 09:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgHIN2L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Aug 2020 09:28:11 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB25C061756;
        Sun,  9 Aug 2020 06:28:11 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x6so3439068pgx.12;
        Sun, 09 Aug 2020 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=NLzytDvk7e3IFdRRH9He4ucBUq/gJBsZ5qjPWWibdb1MfGRPca7DJwH9ty7kw4aEZf
         5ZZjc8vnKRKM8fTrJ3SFD1cPd7SZ4W5GIelKI3FxDDVk0Kbk0pz7LaiS8EzkRc5eIokf
         wkZ9ikNhpN1shIszAo5UOVmya2/V3cbNiWTdh5hgIwernkWWpNUUPyJS1mwQu5tC8Bn1
         S3FPZn4EKO5lDS3bCb3gNDf5ZYuncSahFN6QEoGn0ww73bwcAPDrYsoARC31Kr2ycGkS
         oRZ7UfU1pG2FZh10vAX9Rk0YWYUTZdNBPUmdc7G9o71SUA5JMLHRqZHRXAgyzpcw0KmA
         qM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=C1/sRleAaBXyxJg6SNgMG4VH3u60wdLZmyfHP5kcthGqL2Iqs0SW7y2VMeD0DCXIRx
         XJM9vYmVZR5zIC1KdYLqxu2GhvVIJw9aOFv3urm8K8RmYjoKbreQJtGLUL1IQoywHkBH
         9ySQZFjoQSQRpTWuKciTvImTLvcBznH/r3H7+NOHnMfq3D7QVTZcfb7+3Qs+UPZVURRw
         gy+1BThQLou1/SAE4Hdi58uTY1HL2IsGe+FEu53miU22adqfb+iB0NXSp9zqdK8BzCmx
         yhxlc62oT5XSh5CeLCBN7N3WH4NPC29bja0E+3Y1Uwk/weJqafFaN/gv2OsZDZiqJT58
         mJKA==
X-Gm-Message-State: AOAM530f1Z7PXbkDgXHfK6OZE7wMVydISjsZ2F27TRrhjv7u7XOiMpJc
        Tje4eL9ObJ/d2lGGl6K80MSb/hCh
X-Google-Smtp-Source: ABdhPJwyrw+9WQ33uwO74GP2k5JsZS8rNn13zo1THGlGYBNPbsQCvetv+4xtO+7HxMlHqYG7r8hHyg==
X-Received: by 2002:aa7:8a4d:: with SMTP id n13mr23175412pfa.143.1596979690802;
        Sun, 09 Aug 2020 06:28:10 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id j10sm9127414pff.171.2020.08.09.06.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 06:28:10 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3 18/18] tools: gpio: add debounce support to gpio-event-mon
Date:   Sun,  9 Aug 2020 21:25:29 +0800
Message-Id: <20200809132529.264312-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809132529.264312-1-warthog618@gmail.com>
References: <20200809132529.264312-1-warthog618@gmail.com>
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

