Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 887B525466A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 16:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgH0OFl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 10:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgH0OFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 10:05:38 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF48C0619C9;
        Thu, 27 Aug 2020 07:04:30 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ds1so2684952pjb.1;
        Thu, 27 Aug 2020 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=LguBKEDZg38nhsfY5gDkB5eMqQtPWYgd4SzXcMfIlffnaaoFXePM7C2c5R9jFADrvR
         00OcpCBfsiI0K4EnkIQSzYpgSceMIZz5Fl7A3Pk1XTalnXRadOtWztDcNxJ3kntWIzBO
         TKmxeUq8fVwV6iEpnna8RQWpxS242Jy4KWBlf37uFH+CVoY9/YbFK8ffS3qfvV04iaid
         KNDUyko1S6d3r9x2RVNBuVr16CX6jplQMCN8OFZCxHI+Z589/EQw4M3BGM/HdHgdQik8
         J8QbwAqSMLemWNL5JqagCzB5dRmyci++9gfnZ9JNbCU7b767CJRVNpLdT5g69F+ID9a3
         /0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=nTpYRrJV5F14OYwDYXccrlAiugLgV6dxfRo00agEcXCAJvZJtFmVLAB1Vh6c+QdQL2
         RvcT25uPFbNhdVFDhhNn9oinHKQjwabBc3RvctG2l7Rpvvx2ZkMXyJ4OAHmEyDt2rOey
         T0RLQbU5cvXxNIxaM///MFRmoNePX2PNC2GN6hb/5w/wrTp5lYhIBXCsMIrfQkkow1aU
         fw+wZShj6IqegRugv4SxiSPPfc6k3wW4V9KR5za1AzF9bRk5JcYTD7b1oZ7vjxvttTAY
         s4/bm2kiFVxv1JxUZoIUHuSemij0JDYBf+kDq2onjpC9lYthhVNnH2VcX14wSnvhAzta
         YwXA==
X-Gm-Message-State: AOAM531Kj7F4qQtPI0alspUrwbR76+yVx7SorbH7Qm08VGutEQki0MIC
        m5zTeODSIDMbdIXE/4EjsOMaza9GMxk=
X-Google-Smtp-Source: ABdhPJyFtzqBQBD/y88ysYIZXMsxWHe8lc0Zf/s1dX5c7sBXfH4LHmi4gDDsJtL1iJmKfcfaptFIrw==
X-Received: by 2002:a17:90a:c253:: with SMTP id d19mr4892302pjx.113.1598537068544;
        Thu, 27 Aug 2020 07:04:28 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id fs12sm2371092pjb.21.2020.08.27.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 07:04:27 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v5 20/20] tools: gpio: add debounce support to gpio-event-mon
Date:   Thu, 27 Aug 2020 22:00:20 +0800
Message-Id: <20200827140020.159627-21-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827140020.159627-1-warthog618@gmail.com>
References: <20200827140020.159627-1-warthog618@gmail.com>
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

