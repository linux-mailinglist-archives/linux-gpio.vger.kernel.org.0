Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7901833B9
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgCLOue (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:50:34 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39468 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgCLOue (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:50:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id f7so6651569wml.4;
        Thu, 12 Mar 2020 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHZkXHpRcWeTU1239EHZ2Ly4RecY9yEad1dwpk6VHw8=;
        b=syE3p4O0jn/1GAsJX/jw5OA79C1I/g+qpiUG80axtmdid0Xqdc2cGeHRbfprQbCZcC
         gohq/Rogk0uqknpp30s7QLQoEyziguK64nwTsAoVhAhEr3Cx3cFCe+Jz02XpQJKVQfzQ
         aUy1vi+ClscneXPqH0xiXzSTjQzaynDlv6nokRZbaf3zSgY6yIU94BNmKIOsyeDUNBWd
         Nkiwro+2jyGXpbKKtuCc5eb4oLgtEqNPuUaqlZt23+BS0LlHYkVvywVkNPDtvRlL4qBE
         7DlxgJ2mVV7CgueiwnAs9VLEAQvdTTIfipcIxhJcK+kj2xIxvEE6kmZufOKPeK76plWh
         THhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHZkXHpRcWeTU1239EHZ2Ly4RecY9yEad1dwpk6VHw8=;
        b=saO3tWhQDOlE0HK/NkB1OZRIf/K9NoLO/sP7QDFjXXfMhjnm4+3QDJKlIJU5IWS5Nv
         WFqMcR5nxu9lm+bDtUkEqUJZJhJvZi2UjHKPZ5WWvgUdDHHMeEJCHAtX3BuiCPY76ATj
         d/TrCguq7krdOqzNXBbnODbkZTFbKVGc+xdbiX8ZSW5xx/3+Pya4Ex1ddpYDSFGWm1qd
         618lYsjQOvvury5ZY6w4ie5pTPvRtqQrwFGe5ZfLA7+5c11paEEvR3nQ5djLrjt+UfuB
         mTSl0ben2eH0maHZYi0IZD+mnf7S5d4dPMYoXcDZ+OoPbM+xOYWJwY9cjQyaQMuaPnWv
         ohaw==
X-Gm-Message-State: ANhLgQ2EpRj8DdttSRnaI12EQGLnZVokJAFDrFTH3RVlGnwgl+d+3OuX
        nDORn2QqsC3wPvMdM8W/c/0=
X-Google-Smtp-Source: ADFU+vu1i61CDVjIXv0NxfkpzzXUjxSYL93X+mqAVwWtcSMqoPXYR/sMd4zZBYI1dYaU1iy9PGcv5w==
X-Received: by 2002:a05:600c:286:: with SMTP id 6mr5367770wmk.56.1584024632141;
        Thu, 12 Mar 2020 07:50:32 -0700 (PDT)
Received: from gabrielDell.schule.local ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id f127sm13068727wma.4.2020.03.12.07.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 07:50:31 -0700 (PDT)
From:   Gabriel Ravier <gabravier@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gabriel Ravier <gabravier@gmail.com>
Subject: [PATCH v3] gpio-hammer: Avoid potential overflow in main
Date:   Thu, 12 Mar 2020 15:50:21 +0100
Message-Id: <20200312145020.1848727-1-gabravier@gmail.com>
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
 tools/gpio/gpio-hammer.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 0e0060a6e..083399d27 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -135,7 +135,14 @@ int main(int argc, char **argv)
 			device_name = optarg;
 			break;
 		case 'o':
-			lines[i] = strtoul(optarg, NULL, 10);
+			/*
+			 * Avoid overflow. Do not immediately error, we want to
+			 * be able to accurately report on the amount of times
+			 * '-o' was given to give an accurate error message
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

