Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F4A182C9A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 10:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgCLJkS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 05:40:18 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34036 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLJkS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 05:40:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id z15so6516178wrl.1;
        Thu, 12 Mar 2020 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIZqiO3olanBqpb8V00tr6xlu/aKR3WtYKMWSraEapQ=;
        b=kjYPWyyWUUxkfuBZcUJPLcIVx7QylnuWHIRi+umPxZ6/c0nPYq8TuurW35PpZmufNQ
         5CeFyqpJorb9S0Pj0Z5nItcDT+Uw0O34flWw1cnSaicZ+Llo4lJpU5gMKoKf0leVTP+x
         Zsq5DeHoJNvtauMDMAyfSfjON5vgNH7c4K3WSHdbq7mM1kLDUfb5D4Gh2JVk57WGjbee
         FkEWbdAskJ9XHi3EwCVYMPph4iCIN43IXr1ssQeYgFZ1RjjuVkj1L4L0FHZ9OXWGzpsu
         mikgnPMZ4zt0VOpb4s90Et3BebiDEKjR0UNCOkRcs3rjO3gJvCHZsaqGCDQ1SBsSwpb7
         xjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIZqiO3olanBqpb8V00tr6xlu/aKR3WtYKMWSraEapQ=;
        b=nqEOyknTC2HvvXfF4xS7LQCIBWpQrPuopWRlGr5IFH1yJDqco50PMejrH/w/o+JYyG
         rmsgRLKAJQTwWEYRrcCj4LuuA9w8HBhECIpkrmkTTP1IGhiTJNDYAA57JD221WclzIed
         zylF8aNQhwcQnE1oVfigrEcHZrSSImpY9r0/INIhLak/e/NbvVvAFxA5fHfjH5K+ZZam
         /yfH9vbXtOCNnsdXkhIMMTYR58oJfLQMF/je5Zho+U4A4+J+bafr9+Zf3zxfNN8rhCtL
         3Wk/uJotxjcfNZla1QJVuxWYbXLauPJo0J+VxflwsDLE9PDnyPzk+9uzmjK7IdNoCqT9
         PfXg==
X-Gm-Message-State: ANhLgQ3fNxk0eKcnzK+/EAlAIUitzrABVoo4w+cg6T/zxmDo1wC0tJhx
        LIbTBlKQvlSuHoP6uK2+cIg=
X-Google-Smtp-Source: ADFU+vv1kWRpUSYA1uOmPu+2xRuwtW9nWXk0R1u+yB/fY+6QpohYYxzMi5WjWNP9IskY8c5Fg538Ng==
X-Received: by 2002:adf:b1d2:: with SMTP id r18mr9637346wra.86.1584006016105;
        Thu, 12 Mar 2020 02:40:16 -0700 (PDT)
Received: from localhost.localdomain ([37.58.58.231])
        by smtp.gmail.com with ESMTPSA id c26sm11604589wmb.8.2020.03.12.02.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 02:40:15 -0700 (PDT)
From:   Gabriel Ravier <gabravier@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gabriel Ravier <gabravier@gmail.com>
Subject: [PATCH] gpio-hammer: Avoid potential overflow in main
Date:   Thu, 12 Mar 2020 10:40:08 +0100
Message-Id: <20200312094008.1833929-1-gabravier@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If '-o' was used more than 64 times in a single invocation of gpio-hammer,
this could lead to an overflow of the 'lines' array. This commit fixes
this by avoiding the overflow and giving a proper diagnostic back to the
user

Signed-off-by: Gabriel Ravier <gabravier@gmail.com>
---
 tools/gpio/gpio-hammer.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 0e0060a6e..273d33847 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -77,7 +77,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 
 		fprintf(stdout, "[%c] ", swirr[j]);
 		j++;
-		if (j == sizeof(swirr)-1)
+		if (j == sizeof(swirr) - 1)
 			j = 0;
 
 		fprintf(stdout, "[");
@@ -135,7 +135,14 @@ int main(int argc, char **argv)
 			device_name = optarg;
 			break;
 		case 'o':
-			lines[i] = strtoul(optarg, NULL, 10);
+			/*
+			 * Avoid overflow. Do not immediately error, we want to
+			 * be able to accurately report on the amount of times
+			 *'-o' was given to give an accurate error message
+			 */
+			if (i < GPIOHANDLES_MAX)
+				lines[i] = strtoul(optarg, NULL, 10);
+
 			i++;
 			break;
 		case '?':
@@ -143,6 +150,14 @@ int main(int argc, char **argv)
 			return -1;
 		}
 	}
+
+	if (i >= GPIOHANDLES_MAX) {
+		fprintf(stderr,
+			"Only %d occurences of '-o' are allowed, %d were found\n",
+			GPIOHANDLES_MAX, i + 1);
+		return -1;
+	}
+
 	nlines = i;
 
 	if (!device_name || !nlines) {
-- 
2.24.1

