Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7FF61569F2
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Feb 2020 12:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgBILQm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Feb 2020 06:16:42 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38953 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbgBILQm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Feb 2020 06:16:42 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so1637841plp.6;
        Sun, 09 Feb 2020 03:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dIPudl8OQY289uTgprmAdW0g9F4AJ/wsWNqSK68Qvs=;
        b=C2zxziFh4uF86MN2oZabCZw8tCvG83yPD3ow8XfrLs6Jvx61Ize4vBdYfXRKghAQB/
         jYGMfvDmadRLxkmWG+fjlaYaTf3hVR25dZFpSkgBoilyKPScrEzvpmPfZxF1muvjdR29
         OsUU1Pa41MMIbAAQNJewO0Tai3CMSgQ95MgoprJd21wblQSvgSmSEflNJaPuWzh0Y4F1
         4VK81R12r5DTM6mRN1w4fCVWKeyLUK6dJyuyFUZ8CYxBbDrQ7LU/aptg4AAqlbsAvbLu
         j5dIeIz3LahKyeHtSUYN4O8ay7keX4yEoRR5uW9+LZyOVX1KEB3WzxbWTgnGd6IA9ZHl
         +ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dIPudl8OQY289uTgprmAdW0g9F4AJ/wsWNqSK68Qvs=;
        b=s2+jk9Bld4xO1iEehWXrqxcHa8Zd88u9I5Gh9YjcyZ7DSkZvI6VxhYRgO2VnsmoOTP
         Sr6Z9x3MrMy4kA1iksVF16f9lJseehsTe6CKuBHF6bRdpQPZzpnirO56cZUZVcOt0KAb
         a1BHSiUC59whCS8RmJfX98xTqRHOYljGqEmtVDuqz7sA7KQX//E52xHxgoTvWkD8bJGr
         W6GH/H6KmgLyk/xq42j0KNhzjijs7ntDBs7SBCT6oD1V2Kp0OlxSQ33JqWNmAzfQFzfT
         dndgMYCIG9G/qFI+yHKpUZTp0s96lmwY1EIoTPlGJ7X3LXe9bsUdeUew0lqGIYCWb5fk
         RHOQ==
X-Gm-Message-State: APjAAAVCXSNeNlIdGWupQ5H54JMlz6sayjlW+auu619GLU/xaMi74+M5
        4wrIAzgDvC3efASw+vV7Nf8=
X-Google-Smtp-Source: APXvYqxKYKYoRUmgW9FGAembufjbjykileErhWYwvrQ8IP6j2cFFdw1JScCG0w8J7yTbebvMVg7X3A==
X-Received: by 2002:a17:902:6bcb:: with SMTP id m11mr8155238plt.10.1581247001918;
        Sun, 09 Feb 2020 03:16:41 -0800 (PST)
Received: from localhost.localdomain ([103.110.147.182])
        by smtp.gmail.com with ESMTPSA id j4sm8646108pfh.152.2020.02.09.03.16.38
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Feb 2020 03:16:41 -0800 (PST)
From:   sachin agarwal <asachin591@gmail.com>
X-Google-Original-From: sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy@kernel.org, sachin agarwal <asachin591@gmail.com>
Subject: [PATCH v2] gpio: ich: fix a typo
Date:   Sun,  9 Feb 2020 16:46:20 +0530
Message-Id: <20200209111620.97423-1-sachinagarwal@sachins-MacBook-2.local>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: sachin agarwal <asachin591@gmail.com>

We had written "Mangagment" rather than "Management".

Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
---
 drivers/gpio/gpio-ich.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 2f086d0aa1f4..9960bb8b0f5b 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -89,7 +89,7 @@ static struct {
 	struct device *dev;
 	struct gpio_chip chip;
 	struct resource *gpio_base;	/* GPIO IO base */
-	struct resource *pm_base;	/* Power Mangagment IO base */
+	struct resource *pm_base;	/* Power Management IO base */
 	struct ichx_desc *desc;	/* Pointer to chipset-specific description */
 	u32 orig_gpio_ctrl;	/* Orig CTRL value, used to restore on exit */
 	u8 use_gpio;		/* Which GPIO groups are usable */
-- 
2.24.1

