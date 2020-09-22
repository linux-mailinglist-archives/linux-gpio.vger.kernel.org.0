Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13AAA2738CF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgIVChW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgIVChV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:37:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AABC061755;
        Mon, 21 Sep 2020 19:37:21 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 5so48708pgf.5;
        Mon, 21 Sep 2020 19:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FLSHCCf5enX7zjaLNrpkT5P7VMlR5XRWe7+zB9Jv7VA=;
        b=C0BX0GJfGzsgkaJejNZLNheFPIdF7kybF42RqD31iIB0qcAZrG41hH+BJmkHUzFQKT
         OE0VDTEyflerCmsUVlM4Hl5JEGXNeV4ADFPsOvazdCTXvv2JVP82oiRNXUKBfSfNe5Yi
         WzWGJ7EOHCPNbrDiAd/fgn/i7RbrFeF4v9gWXewnb5WBcaq03BVyfHBF68JCVZcohUF9
         bWcX48M0sJnY0rVg7a6p6ijtDiJ259SKP12qLdWQCmlihFdxDeW0+jxwU1NEmKhdk8hH
         3m5639NW99aEw+UQxE/Wd4IgD68GN0V46f+Vvelr8qyigCbS5C97te5Mymmu6Vk7j6gv
         AGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FLSHCCf5enX7zjaLNrpkT5P7VMlR5XRWe7+zB9Jv7VA=;
        b=JO2S/Mi6R/447q/0g61sTVygrFTAZufN/kCc37P7VBv5KyNR0yQP43OlRvUdg6FQIj
         rIalW0PEQubCMLLOSNuRCc/Ayw8HirCX2BeXc4FNsq61sjqpjb10YcroYw0UI+GfyWPV
         9xEaqpDu49xBYPH66uYauIOPFsvXdvlfVq2gOo3sBfvyt4Kz5ZbcjiiUzDD16oDgkrfQ
         +DllFnoCF9D6MZlajHtjp9Zfl9qm7gnSsGliisbtsYyqcCWnM2KNSE5OGFJIhw5Tq1CI
         0F+Mr/J/GJf10FPIWkkzKl2oZU8qs17EZ4U2L2+72DNPYqBRVzZtz5SLSilwiumet0Ua
         3kpA==
X-Gm-Message-State: AOAM532Nsr9MhmC/JEC2uAHwNVUcDYUYKDSj/h9BEqZBVRFcpDu+0c3C
        5N75nnePu0GjK/6/I/nrqxG0C3vBWSQbhg==
X-Google-Smtp-Source: ABdhPJxEzkUQJ1R+oERonWpMWjjKC5JP8N8J6S5hkm1F0JAuAK5kkQiEupCvCYJ6nFMquhBRDauHlQ==
X-Received: by 2002:a63:3190:: with SMTP id x138mr1814518pgx.94.1600742240793;
        Mon, 21 Sep 2020 19:37:20 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:37:20 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 20/20] tools: gpio: add debounce support to gpio-event-mon
Date:   Tue, 22 Sep 2020 10:31:51 +0800
Message-Id: <20200922023151.387447-21-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for debouncing monitored lines to gpio-event-mon.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 0c34f18f511c..90c3155f05b1 100644
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
+	unsigned long debounce_period_us = 0;
 
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
+			debounce_period_us = strtoul(optarg, NULL, 10);
+			break;
 		case 'd':
 			config.flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 			break;
@@ -205,6 +210,15 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (debounce_period_us) {
+		attr = config.num_attrs;
+		config.num_attrs++;
+		for (i = 0; i < num_lines; i++)
+			gpiotools_set_bit(&config.attrs[attr].mask, i);
+		config.attrs[attr].attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		config.attrs[attr].attr.debounce_period_us = debounce_period_us;
+	}
+
 	if (!device_name || num_lines == 0) {
 		print_usage();
 		return -1;
-- 
2.28.0

