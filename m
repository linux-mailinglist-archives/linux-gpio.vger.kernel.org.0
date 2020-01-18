Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAA1E141710
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 11:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgARKxb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 05:53:31 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36523 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbgARKxb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 05:53:31 -0500
Received: by mail-pg1-f194.google.com with SMTP id k3so12972623pgc.3;
        Sat, 18 Jan 2020 02:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cvf9Z00ABjd5lUk64l+9yaVPvJO8yX8K2hg04kUeIGY=;
        b=NGORnijwqclwE0DljZwE2ahbwmtqS7aYEzuFsWrGjpUrBEKbZcj6FTSRPSkXIPA4jh
         3Puppftqo46UXJRtkEQhgKdTb354zSAOObwe5SqVqmTx9B7CPN5zW7o3MgoMBa6fQ3g6
         n29lP9el05iXfEUeOiS4RjjyCkv5in8wnYDp20d2zI8uberTGD7kA0tMLpjbUaQdemG5
         0sQmr7aStdBa3MBhyl9htanFcLeAUX0s50OEpIu1/svS9ohUOZDlT/LKEt/TQ3+TBn+Q
         RhFLtHtzLlKJ1aGzpdmE/JgaNJ50f3Rly6cX8Qs/tqRQxoWoyQ2L0raqHFAW1X7fQpxb
         JBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cvf9Z00ABjd5lUk64l+9yaVPvJO8yX8K2hg04kUeIGY=;
        b=rHbXwOwm51/c4HbpnlNyumnZRrr+IKD3l1UCcYU3LFZ3NCrg6dKDlQjO6JTK8QFve0
         PKVlkHPXMqznSSqVPZdR1Y/9L0CUM/Ah6YOzzha+9UDtnRGFnGiauLYVrIxUH9dIISGP
         W8Ko5yGxVY9k+LzNGpL/VEEdlfieRXZPqkmozRG2PfW4FlSSGOYTSWrccHs5Z/En8VfI
         RnkJv29qO1aU83Q/u8OgjXNRfYc5sETbj4WUZY/03Ss7AL0gH5lBQObKIRJGLnUYnQAC
         xF7q9HEEwzGtbLwwETPrbUYZfV/i9ztSIY0fqVb65/7Op8x+ZzDwkrVtqO/AQm+aVVNi
         3RLg==
X-Gm-Message-State: APjAAAUWO409drdywisJCFOMV0k0Hl9DeANozoAhb9c1XMLFIWy4Wxh4
        dLpB5g6O9pO2w8K6ICZAL7s+ThXJl+0ukA==
X-Google-Smtp-Source: APXvYqzbBQTgciy+UHgzE3b/iQQrxrptWHgt5ehrszyhzNh3vmEzB1NqUG0LrGUITXflSceHK/JMiA==
X-Received: by 2002:aa7:9edd:: with SMTP id r29mr7458632pfq.14.1579344810316;
        Sat, 18 Jan 2020 02:53:30 -0800 (PST)
Received: from localhost.localdomain ([183.82.121.105])
        by smtp.gmail.com with ESMTPSA id a1sm32043258pfo.68.2020.01.18.02.53.27
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Jan 2020 02:53:29 -0800 (PST)
From:   sachin agarwal <asachin591@gmail.com>
X-Google-Original-From: sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, asachin591@gmail.com
Subject: [PATCH 2/4] GPIO: aspeed-sgpio: fixed a typo
Date:   Sat, 18 Jan 2020 16:23:19 +0530
Message-Id: <20200118105319.68637-1-sachinagarwal@sachins-MacBook-2.local>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sachin agarwal <asachin591@gmail.com>

we had written "SPGIO" rather than "SGPIO".

Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 8319812593e3..d16645c1d8d9 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -391,7 +391,7 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 
 	gpio->irq = rc;
 
-	/* Disable IRQ and clear Interrupt status registers for all SPGIO Pins. */
+	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
 	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
 		bank =  &aspeed_sgpio_banks[i];
 		/* disable irq enable bits */
-- 
2.24.1

