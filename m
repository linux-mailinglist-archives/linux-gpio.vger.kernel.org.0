Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAE7183362
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgCLOl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:41:58 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41374 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgCLOl6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:41:58 -0400
Received: by mail-wr1-f67.google.com with SMTP id s14so7814707wrt.8;
        Thu, 12 Mar 2020 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gncaKHlGYMiKjX4sUuFMWjZl82hyQMZIVGetmMWGMr4=;
        b=ObuVaSHSHRk2Hrq4XpimsPWCcjNXTvsyH7O8FGmhyNND/wlELZmS67Dh9m5M0JPmDo
         4OVYQ2PclxxWjRwPl0QX5RnMML962Sxh1CH0vbph8jOR4dFjT5zO2qdm72vKvmkgqyxJ
         FKNtULLgGzA009qznGjeQpagTfV7KJ/tSBE/LRniUAeakIZ6893NdN5/3Z9Fc2jp5Sil
         /bDAsVttmGd9LSNEfrQjU9pvCQ5vfuqo+Aj29Wi5gKkEFMpq1dlKaMQRZhvwR2xbQ0++
         KmtqLCfZ8xBFgSVmdzTZ28WKJHDHM1jgc4Hlm6D0/e9aVk6HWCpurfoKlAc+FbJLTqhh
         PH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gncaKHlGYMiKjX4sUuFMWjZl82hyQMZIVGetmMWGMr4=;
        b=a6X9Ed4rF6ZhjAERFPhohsP5qIfzpWf2D1cThj1lhFAf5yafwDJCQ/KtjtTNA8trtQ
         4PioIDm8gN+8sHvZQlYrIRDvNtYJo3mT1Jw3rJiyp3/6GSHxNIalYBbkzbO1hyPYjCEZ
         4O5f9y/WjnJDLRtcTh3m+25kNCYu4pi7+VCcujfgn/6vARGmNO3rtpryhcHgcvr3quQn
         uVHoWUxepSkTfH0sN0+pgX2mWoJVPmrlJIPAmG4imqFOd0owfq0cQZ6pLZK6Lw/Pbvsw
         pi2aziPc/EtDTMU6NuuijHHbfpoo57aUqrAXG23jwmd+ZhFzXXk4ZT2dmkIZR3fpgXpS
         RJOw==
X-Gm-Message-State: ANhLgQ25q7sbSK0yRF8QpVF0BzYLq/eGmSzNXa5yu/Or7tsuxdeqS6at
        puLUZ6du3BfP2tS9oJ9khAI=
X-Google-Smtp-Source: ADFU+vtj39tnigbG/Ug6Aihm/fRB/IG2KtNkoyhISRykNe3bOE8YUL2PAmieLwCZ829nAhrgBh9xqQ==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr11212418wrn.283.1584024116381;
        Thu, 12 Mar 2020 07:41:56 -0700 (PDT)
Received: from gabrielDell.schule.local ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id h15sm8960869wrw.97.2020.03.12.07.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 07:41:55 -0700 (PDT)
From:   Gabriel Ravier <gabravier@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gabriel Ravier <gabravier@gmail.com>
Subject: [PATCH v2] gpio-hammer: Avoid potential overflow in main
Date:   Thu, 12 Mar 2020 15:40:16 +0100
Message-Id: <20200312144015.1848245-1-gabravier@gmail.com>
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
index 0e0060a6e..d0be21af1 100644
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

