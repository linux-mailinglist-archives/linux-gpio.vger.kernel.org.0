Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760C9204860
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732407AbgFWEDk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732442AbgFWEDj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:39 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA77C061573;
        Mon, 22 Jun 2020 21:03:39 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r18so9240289pgk.11;
        Mon, 22 Jun 2020 21:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N2WsCEt9jJAwnHoKd4TNitmUSkbY341ZWHQD48mSWyg=;
        b=R2xAZ/QYxThBsAuu3SofmnSF1N0eTB0XqcdiXEcbgftnqNKRU0dd6FvI08T5kjU1Lz
         s//KWI92XCajbjW9EAvAOhzu7FpAbh+8frmoGTY0P54FjGFyg4FzwNx7542KJBteB7iG
         mQO3LoRz2tPpBofCkN3a9065d9wYNvsT9jk7NkaAIP6NUYoBrVw81TZRQtRNguXNJPVJ
         7kiUViPYVTJEaPkR5cFMmszshEi/UcPPgu9SATdikCZ7HMaG9Jg6ISdQs7l+QTfnGOnj
         AolQTy3kKZRVaoR1hBsSOFmav9pzzGp0zbO6SaNL0Xy9YHAjoj5XFBJwTKktihsiBsbg
         TNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N2WsCEt9jJAwnHoKd4TNitmUSkbY341ZWHQD48mSWyg=;
        b=C5VQuWgyl9UqZjipkEzw7I8Biu/CeagLHaFWLpgtFr/LcIUKEbPtB8pmQwq+Uycay8
         6fhsDy2WpGFVKpT4CTl8Ken2lPB4HRSPmfj+xTfyv944HPXzTB+UJO6sz2jx260vzmZJ
         MCYu7hYz2mo6e8arnTd5Dx3VJUAwGpDl4BQ6EcFHhA1UJ6VQqyO9g6U3uH/R/1zlvXUH
         fWtyq5Hj7h0Y6Qyj8aZ/wnMfcak0oDQbgXuCpU1CAedbyZC7PlHraz6KQ1xamZ7aMmRL
         RBHgQSwD3Zi097fqZHuuNYqv4SfFJwcQDLFPLDe49U6i0jlu631aq/dSIIkL/th3J+9w
         a4xQ==
X-Gm-Message-State: AOAM5326BUSRsaGpCDTGbW9OCwyWh7QkMYTUkK0OcQaa+cQvvxAkoGbq
        bSwZVP5GNB4/GzPZkH1JgwagVjlYmzI=
X-Google-Smtp-Source: ABdhPJw/r9O+wa/6w+7Y3gQrjrBPnzQQ7sg5E25CY8+QIIuETDerxxup+QGXkia3D+703ZXcjqHGNg==
X-Received: by 2002:aa7:8bc6:: with SMTP id s6mr22854545pfd.260.1592885018659;
        Mon, 22 Jun 2020 21:03:38 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:03:38 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 22/22] tools: gpio: support monitoring multiple lines
Date:   Tue, 23 Jun 2020 12:01:07 +0800
Message-Id: <20200623040107.22270-23-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend gpio-event-mon to support monitoring multiple lines.
This would require multiple lineevent requests to implement using uAPI V1,
but can be performed with a single line request using uAPI V2.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 tools/gpio/gpio-event-mon.c | 41 ++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index ec90e44389dc..ed1adb8247c6 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -26,7 +26,8 @@
 #include "gpio-utils.h"
 
 int monitor_device(const char *device_name,
-		   unsigned int line,
+		   unsigned int *lines,
+		   unsigned int num_lines,
 		   struct gpioline_config *config,
 		   unsigned int loops)
 {
@@ -47,7 +48,7 @@ int monitor_device(const char *device_name,
 		goto exit_free_name;
 	}
 
-	ret = gpiotools_request_line(device_name, &line, 1, config,
+	ret = gpiotools_request_line(device_name, lines, num_lines, config,
 				     "gpio-event-mon");
 	if (ret < 0)
 		goto exit_device_close;
@@ -63,9 +64,23 @@ int monitor_device(const char *device_name,
 		goto exit_line_close;
 	}
 
-	fprintf(stdout, "Monitoring line %d on %s\n", line, device_name);
-	fprintf(stdout, "Initial line value: %d\n",
-		gpiotools_test_bit(values.bitmap, 0));
+	if (num_lines == 1) {
+		fprintf(stdout, "Monitoring line %d on %s\n", lines[0], device_name);
+		fprintf(stdout, "Initial line value: %d\n",
+			gpiotools_test_bit(values.bitmap, 0));
+	} else {
+		fprintf(stdout, "Monitoring lines %d", lines[0]);
+		for (i = 1; i < num_lines - 1; i++)
+			fprintf(stdout, ", %d", lines[i]);
+		fprintf(stdout, " and %d on %s\n", lines[i], device_name);
+		fprintf(stdout, "Initial line values: %d",
+			gpiotools_test_bit(values.bitmap, 0));
+		for (i = 1; i < num_lines - 1; i++)
+			fprintf(stdout, ", %d",
+				gpiotools_test_bit(values.bitmap, i));
+		fprintf(stdout, " and %d\n",
+			gpiotools_test_bit(values.bitmap, i));
+	}
 
 	while (1) {
 		struct gpioline_event event;
@@ -124,7 +139,7 @@ void print_usage(void)
 	fprintf(stderr, "Usage: gpio-event-mon [options]...\n"
 		"Listen to events on GPIO lines, 0->1 1->0\n"
 		"  -n <name>  Listen on GPIOs on a named device (must be stated)\n"
-		"  -o <n>     Offset to monitor\n"
+		"  -o <n>     Offset of line to monitor (may be repeated)\n"
 		"  -d         Set line as open drain\n"
 		"  -s         Set line as open source\n"
 		"  -r         Listen for rising edges\n"
@@ -141,7 +156,8 @@ void print_usage(void)
 int main(int argc, char **argv)
 {
 	const char *device_name = NULL;
-	unsigned int line = -1;
+	unsigned int lines[GPIOLINES_MAX];
+	unsigned int num_lines = 0;
 	unsigned int loops = 0;
 	struct gpioline_config config;
 	int c;
@@ -158,7 +174,12 @@ int main(int argc, char **argv)
 			device_name = optarg;
 			break;
 		case 'o':
-			line = strtoul(optarg, NULL, 10);
+			if (num_lines >= GPIOLINES_MAX) {
+				print_usage();
+				return -1;
+			}
+			lines[num_lines] = strtoul(optarg, NULL, 10);
+			num_lines++;
 			break;
 		case 'b':
 			config.flags |= GPIOLINE_FLAG_V2_DEBOUNCE;
@@ -184,7 +205,7 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (!device_name || line == -1) {
+	if (!device_name || num_lines == 0) {
 		print_usage();
 		return -1;
 	}
@@ -193,5 +214,5 @@ int main(int argc, char **argv)
 		       "falling edges\n");
 		config.edge_detection = GPIOLINE_EDGE_BOTH;
 	}
-	return monitor_device(device_name, line, &config, loops);
+	return monitor_device(device_name, lines, num_lines, &config, loops);
 }
-- 
2.27.0

