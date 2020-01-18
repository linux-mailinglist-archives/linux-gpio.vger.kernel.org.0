Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25E7E141708
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2020 11:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgARKvN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jan 2020 05:51:13 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:36982 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbgARKvN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jan 2020 05:51:13 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so4624018pjb.2;
        Sat, 18 Jan 2020 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emr470bczj6K1z356KFbyrt2rqIcsN0IuTkWig68YOw=;
        b=jdiUkF3rHMHnLcnIDduKIYHi4nZOwj6ejnhGtaVE68jODz/L4cEE0Z4Z0IeW9C6LGy
         0Spn9gGK48y2uoNiAnPEQVAQw1c6cBBIreOuRsTbzEOe3yIm0zYWKMLTrveAc5/yZHxX
         2j/QDX0PlBwDOGyrQ0zg8QW+PKsnDpS9AuQ7n2HKZNK5RxG6U+0UgyCzfnylxFZAekaC
         V+KjjCvno92yRKak2wRifZ+vU+kz9rhm4U1pngfxCt8KKz0XdSIvQtYi6g34v2HznLgU
         JPlPS4pbTNow81fDM/btnQ6VNTw7FwYBpBNgGp6LdJ3DPo0fVbX5Cjzy6bkw8f9TRc/q
         IzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emr470bczj6K1z356KFbyrt2rqIcsN0IuTkWig68YOw=;
        b=aFAXZvwDOWc/cFcEQSfrmHs1KclYAEQzEbg4bYl21iqa7JaqRJXY6LlFoRnfY3uMoi
         JUmYEgkB72WM3zPO+1F9ewe08yqbyLB7OWIyNuqvVFZzuJ6h+DPiwTiElDHUXFkbcGd4
         8TAEthKZdIQoMy7+RQ1dxKFq6TrNES5EEbgFCAU+TJKb+HJJCE+tFxWf6+hsGq9akHHA
         CoKYZL3gys8zceihWlWI8IaDclYj34xd07RSsItry+jbNtuAnCc2GabbWLAE2Uf3UwyT
         gJqDD0kGoIP2KLFxqqmmzHawjrJBF+FOYavD1JXqM/4TQtxbc10hwstEfUSd1LJW5dYk
         WM6Q==
X-Gm-Message-State: APjAAAUMRxJRSr11lHSecOOA+m8/drnh22d/CIwYbjNUHIoF4rvyq8eW
        EAFr4262gsi1J+HtFq5eI38=
X-Google-Smtp-Source: APXvYqxoQd5u01602qqc269lNuS1SuU5Goe+kdgMGLM7IKV1paQCdyj0M15+NORpX8u8OkrCCI+I5Q==
X-Received: by 2002:a17:902:654d:: with SMTP id d13mr4138916pln.187.1579344672206;
        Sat, 18 Jan 2020 02:51:12 -0800 (PST)
Received: from localhost.localdomain ([183.82.121.105])
        by smtp.gmail.com with ESMTPSA id w38sm32077672pgk.45.2020.01.18.02.51.09
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Jan 2020 02:51:11 -0800 (PST)
From:   sachin agarwal <asachin591@gmail.com>
X-Google-Original-From: sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, asachin591@gmail.com
Subject: [PATCH 3/4] GPIO: aspeed: fixed a typo
Date:   Sat, 18 Jan 2020 16:21:01 +0530
Message-Id: <20200118105101.68580-1-sachinagarwal@sachins-MacBook-2.local>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sachin agarwal <asachin591@gmail.com>

we had written "handhsaking" rather than "handshaking".

Signed-off-by: Sachin Agarwal <asachin591@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index f1037b61f763..879db23d8454 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -978,7 +978,7 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 }
 
 /**
- * aspeed_gpio_copro_set_ops - Sets the callbacks used for handhsaking with
+ * aspeed_gpio_copro_set_ops - Sets the callbacks used for handshaking with
  *                             the coprocessor for shared GPIO banks
  * @ops: The callbacks
  * @data: Pointer passed back to the callbacks
-- 
2.24.1

