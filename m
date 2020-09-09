Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A8D262D28
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgIIK3n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729942AbgIIK3B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:29:01 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150CDC061573;
        Wed,  9 Sep 2020 03:29:01 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b124so1735466pfg.13;
        Wed, 09 Sep 2020 03:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=D0dROmJK5JNEWz6XnpG2UxU0Czt7CjrQi0W9ag56hfNt7ttM6fI42P45oQp/k7RqYw
         fIac3kaSh3MmEhrajc8Wag+D4jwn+Bzl39wgrsQMLNldOHJCywIYsKh2uH1Q+guTrXDK
         LR5jIJa2sgzAzhJd15uHb4tlLWIm8osAqbBknGmeFYEqFKetlJbsuJ3VQDTwf9RqMD9y
         ajjn6hMbYVvubSesTtuLaNxQTLWzg3YFii/lX4WcT5l8qVqfFkKcd1BNhRqeBo20jQ/k
         TZ1MsNC3zy/vb3dlCSZpIWNnq6aLiq5gESV2dMqVTKojm91W3SjJYB/yW0Vb7V+obozS
         fs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=UsIbHLfM+Y4OtIknZqSNjp3j9+qwlqYr3UoG3KTgVFXGOb1yHYfPJ9N/xyyRBBkXAi
         M1SqXkId0FEGWhBJPakQg/UCuHqnES33cSwANK0HBDSvpKmHh5RSHTiQ3X9dx+D4uyXT
         wfQLD5l3Qtc62q1MF4MySU8zrJQG1bn6LXVwPZpNkPSfwr0U8sH2ru32RVSG4k1A+FsH
         C9Lrimdm2pfRoULqC4ATsWPewm0VjY165Ty9khY7LvLFgLKpA8D5FRAndEY/bYkPVk7q
         Lv+qriM6C+xWQ842esTaGrCAGwW20tGgQFum3Y8JUhpEJWWBv2lDCsCcEMoA743Qo5ph
         1BNw==
X-Gm-Message-State: AOAM532gcNNVF8hELxSm4Tz5tYTs/dUVG55I8ljjV9uqix8j6SeNufdL
        Aw6aqG5QIFUqHzDqWDucKUfeCHKAKo4=
X-Google-Smtp-Source: ABdhPJwAUqpksnuSBZWncdvn/rBaVf87jJeX5Jz+OmNt8HD3RZ5HmOpjHWS0LgVsy0cothOHjdb1LA==
X-Received: by 2002:a17:902:fe97:b029:d0:cbe1:e745 with SMTP id x23-20020a170902fe97b02900d0cbe1e745mr338180plm.32.1599647340193;
        Wed, 09 Sep 2020 03:29:00 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:28:59 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 20/20] tools: gpio: add debounce support to gpio-event-mon
Date:   Wed,  9 Sep 2020 18:26:40 +0800
Message-Id: <20200909102640.1657622-21-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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

