Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535F827A4E3
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgI1AcX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1AcX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:32:23 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3123DC0613CE;
        Sun, 27 Sep 2020 17:32:23 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id v14so2566255pjd.4;
        Sun, 27 Sep 2020 17:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=orI2XdPNMcc9fk0dBNQocsoJ4tDxFbu6pi0+98Ky68Y=;
        b=aB+u4b0IizAbMXWGxnjGw9NoznuYjPDynjcZQl0ZJHjEL7lAag84A06BYgIcc0wNIW
         ThGb97ZyS1I7iQXhO3IY82dT+R3+N+lAabZWELHasKPtFlJRPB9tNePCHcTBQ3WAQduX
         f+V31uqJ87oufgIGDB0FAr8rSSWnWdgiq4uGDqCwQW+k9YlKSusPlED2CogQFhCypShv
         sxNtXS8k7m6Y0zIdTuNSmPPFdHMFX0Ri3+/CCIlMi5OPsqTmm528MgXbfeMXYLqd2Em6
         Nd+MYo0X2GzeQA9WOziWhp6z97BrdvryCDg4JjOWfywjVdYvjc9200sCaa36AVLM1y7Z
         u8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=orI2XdPNMcc9fk0dBNQocsoJ4tDxFbu6pi0+98Ky68Y=;
        b=OXWjbqhkhMilNZHxOCrYkbiFdpkvic1XMDd8TxOC60rwPSQRLEYPoDhyCaEIhq8y1I
         Nhj2l6v4Acx/jPgdeE3bsQG8S3jIVlnz3GO7Ki+f4JnHPuwOx4c6x8cu4xpAUL+BAJ71
         ymbFSEZBHwdy9xa++mgq9MVVH4GHsMRN+3Rt6LLfn4+vdJuGIFppL5VaojCmK139A5mL
         PMGCg8acxbCrAOCKGpSqXkFHhJghPFxxUbZYit8lE8g/x1kms2QZku9YM6Gh1G4XvIjQ
         VQm58dGSuUpV1ZuLfGY31yFoC6QGAtfCEM/SMM7YKO/1j8KDYrjRycgMVIdP33iuUn5d
         DKaw==
X-Gm-Message-State: AOAM530UKtHCZETYdXVTnKSpqV/veXWKidjkOQGYUwxCzEaM8Zz341Oj
        95JZeTcNZFpDE8kgbxM+fjKGWB7F4xVorg==
X-Google-Smtp-Source: ABdhPJzo94Q6KL67/oOAwVreZ2P/nxuMceGKv0M5Amc3y3deBIrdJJDlZHMPfsAYh1ak/G2SPz9Cgg==
X-Received: by 2002:a17:90b:889:: with SMTP id bj9mr7215964pjb.101.1601253142317;
        Sun, 27 Sep 2020 17:32:22 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:32:21 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 20/20] tools: gpio: add debounce support to gpio-event-mon
Date:   Mon, 28 Sep 2020 08:28:07 +0800
Message-Id: <20200928002807.12146-21-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for debouncing monitored lines to gpio-event-mon.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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

