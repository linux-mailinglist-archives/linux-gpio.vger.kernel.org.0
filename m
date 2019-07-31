Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3A37CAAD
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 19:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbfGaRiZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 13:38:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40088 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfGaRiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 13:38:25 -0400
Received: by mail-wr1-f67.google.com with SMTP id r1so70583643wrl.7
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 10:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2yhFAEkO6lMSQpCsgHEGq+cZiBtUUzEZmb1bOp5l+g=;
        b=H1X60bvibDXzul0sr+XrbN20SMSx+BKZMgDz272uYbZik5rYwc1bRz37siYS6KuUiO
         aLphZ+YJO9Hw4Y06r+XnJpFfxC5gu9x9qlFxGApWJtJ0qyMgwe7j+43rjMmr4lOPJw4A
         A2djUP7mhHXd1uIbDuS9loaoB3k5g8Q+GDvAXOdzI/xqROaXpzeTnAyS9926AxHhTwAv
         qE9PipwsNWbdCYoik9Dp7nG/g4kHrZsiRtpMgw/p7Lf3FyT7pLl6i6i7nIFwXS0LgFwP
         tUw4gz7uH5qvU5PK2KqUhW+IiJG4GjucWrOp4lSyNypfYtx3nlnS/iIaWjRYG9/nKA1m
         TbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2yhFAEkO6lMSQpCsgHEGq+cZiBtUUzEZmb1bOp5l+g=;
        b=SqTCc8YKUPHzd/PVg8JZbwEmunja83t7HcB221XXMzACCEJBTRa46gJzAe0xLLMhg+
         9J0Dr1euWA2il1ecbemMOdMq8mtq+gJ6kww8ozOIyNJ25tgtHQsvxLXJuyi9lFyn9oR1
         1TZtDRIXNjpearip0D/YtVMYKESJZLx7dYByG8Pb5rn4JqctchMH4l9jnY//ru2gmhRE
         L72zZ3ZJ9R3fD9KVILU1kkErZB7kCbFrlcE74i7Cuv+zf3yt4bDXgFNp/eeJxf40Qf7u
         bpUI3K6GkeYvI46TCGDWso1QfyR2wf87RGCm5RUAq7KhXUe5BOmp/dTgA0Rpa6XjjLY2
         iISw==
X-Gm-Message-State: APjAAAX2tK54vjOo8YJx9TRIjpch7H2s7tod26YMPO4S6za7wc7P5tn/
        Imak3ec9FJYNemKslxcmjo4=
X-Google-Smtp-Source: APXvYqyWReY2iqo4u8KqLw4+vbJh5k5sA6/WTKKrkhZk2zVPJxVK53IpVaN3rrZwtLq/+CUmq6HmJQ==
X-Received: by 2002:a5d:4206:: with SMTP id n6mr68723670wrq.110.1564594703336;
        Wed, 31 Jul 2019 10:38:23 -0700 (PDT)
Received: from localhost.localdomain ([141.226.31.91])
        by smtp.gmail.com with ESMTPSA id x11sm49016343wmi.26.2019.07.31.10.38.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 10:38:22 -0700 (PDT)
From:   Ramon Fried <rfried.dev@gmail.com>
To:     bgolaszewski@baylibre.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        Ramon Fried <rfried.dev@gmail.com>
Subject: [libgpiod] [PATCH v2] gpioinfo: mark kernel claimed lines as used
Date:   Wed, 31 Jul 2019 20:38:14 +0300
Message-Id: <20190731173814.3400-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case where the GPIOLINE_FLAG_KERNEL flag was set
and no consumer string is provided by the kernel,
the used column was still showing the pin as "unused"
Fix that by writing "kernel".

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v2:
  * Restructure for clarity
  * Print "kernel" if line is used by kernel.
  * Update commit message

 tools/gpioinfo.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index bb17262..ba0327b 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -119,8 +119,12 @@ static void list_lines(struct gpiod_chip *chip)
 		     : prinfo(&of, 12, "unnamed");
 		printf(" ");
 
-		consumer ? prinfo(&of, 12, "\"%s\"", consumer)
-			 : prinfo(&of, 12, "unused");
+		if (!gpiod_line_is_used(line))
+		      prinfo(&of, 12, "unused");
+		else
+			consumer ? prinfo(&of, 12, "\"%s\"", consumer)
+				: prinfo(&of, 12, "kernel");
+
 		printf(" ");
 
 		prinfo(&of, 8, "%s ", direction == GPIOD_LINE_DIRECTION_INPUT
-- 
2.22.0

