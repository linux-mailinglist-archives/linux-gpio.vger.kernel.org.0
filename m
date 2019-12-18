Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DEE124974
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfLROZB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:25:01 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38390 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfLROZB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:25:01 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so2512755wrh.5
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UevLqnwsCMWQOHfK4E5vPmrMRuyZSBW7sL14SNKFuUA=;
        b=X1qspiIljkmtDgiobPWf4InN6yXTLjmfmmg6N6i4gjsX6ldUsMJxaWRE2tlM7VCpsn
         ZjKsabEoaG3xASFu08rzu0GHmh6YGeez2ZZd08Zrx4fnxWsm9kUFLLTjf1Jpi4Ga5Hhg
         sjP2P+WYg5lMjXLnBDBNLM7eqyZWGejbTQPzKvRKz/exjX77kT2ifI9Hqg7TXrlnoqZJ
         CAnugTGhrDgzqHV7V6S4aiyhp6gNndnW02RSmBqpwphjSA3mVct28G1XNT+4fhn4pQVw
         YIbKr2U7rS0G0EsJvvgC8onvkpEUR9bh4dmwoewJLA+l4sQuyBkJYsI2wFBLY/nFVh+w
         VWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UevLqnwsCMWQOHfK4E5vPmrMRuyZSBW7sL14SNKFuUA=;
        b=O8uLC44sPV8lhaib7Y8ORzJRbS92uHcPdH2XcG5cU6nHRx6eCUG5bI1P6YFV2UppLv
         cUJs/wP/WYXb1dN5RFLMySYCvB0fBq4G0oas4bcpSnnfMnU9WGiF7aqKkcFyaLQ3YtwN
         cxCnEF6TGvXXGt+GWrZqKhIaK7/DegQpO36XCP+L04/9EJ1V47/JnaySnZL6geJDfPb9
         1uZxSixhlWXKD9o9Pv3SdYipgMx/c0L9/s+S8St28MLxf60pcmBM3xMdDho2aoF1cFwi
         n/nvvX4jnawj93TF0+f06BZAYK85mFc05ShlNGDHKdYjriZ0RoG6jIO6SXTye7Fu1fcT
         TuNA==
X-Gm-Message-State: APjAAAWajxXTnbadahXo3HdqfCipEFk/O/9iPHwRTK3+UQwP8Mx7eE6W
        r+yaQU34Z4Q+cUBQeXfrgE0DVQ==
X-Google-Smtp-Source: APXvYqzMLd+KT2LNEdqTYRh6bq3pJaCRlSZPaT3vEJMhMDFlJsw9rgfz0HcNT2xq2DtqdeSK8TFvsA==
X-Received: by 2002:adf:f802:: with SMTP id s2mr3177696wrp.201.1576679099687;
        Wed, 18 Dec 2019 06:24:59 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id x11sm2889981wre.68.2019.12.18.06.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:24:59 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 1/7] core: use gpiod_line_event_get_fd() in gpiod_line_event_read()
Date:   Wed, 18 Dec 2019 15:24:43 +0100
Message-Id: <20191218142449.10957-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218142449.10957-1-brgl@bgdev.pl>
References: <20191218142449.10957-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can drop the redundant line state check if we directly call
gpiod_line_event_get_fd() from gpiod_line_event_read(). As opposed
to line_get_fd() it checks if the line was requested for events.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 lib/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/core.c b/lib/core.c
index b9fd6f4..89f5465 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -1012,12 +1012,9 @@ int gpiod_line_event_read(struct gpiod_line *line,
 {
 	int fd;
 
-	if (line->state != LINE_REQUESTED_EVENTS) {
-		errno = EPERM;
+	fd = gpiod_line_event_get_fd(line);
+	if (fd < 0)
 		return -1;
-	}
-
-	fd = line_get_fd(line);
 
 	return gpiod_line_event_read_fd(fd, event);
 }
-- 
2.23.0

