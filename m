Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 444E9124857
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 14:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfLRN0T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 08:26:19 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44138 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbfLRN0S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 08:26:18 -0500
Received: by mail-pf1-f193.google.com with SMTP id 195so341909pfw.11;
        Wed, 18 Dec 2019 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=idlyZxvEnPlghpQU8kfe9TImOw9EeUeKU6bmuNGfafY=;
        b=fX6AxVP0pgTdM/OcE0lfO1+/4MYe1P34y4x4NqIy9OCO70Nk6sna6l8AFqjX01Lf6u
         SgWrRAFOF9TkQX/txS9Omov8XdiMd4i9nPw54u4EGesaa0nsy9Rw8LZA9Lq+7BE27VB5
         GMqg2l6H1hpXLGBsdyJ4k2dR/mk1+aD3WshShHvl1W92rYBTp7nHnuTqWG4+N+z7PY0N
         crfC1bb5SzabuDfgfPDqAPku5wuWnsY8M6E7VK2hRGlAxh5d+USdx7PRtZUPsYkUt+qL
         tk7IS31TlyjB0c49DmtCiMmEqnrx7bEYJrl03f/46ftlbWnst1t7bknR7jtmdqUr53dT
         7ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=idlyZxvEnPlghpQU8kfe9TImOw9EeUeKU6bmuNGfafY=;
        b=RcsuI7DIeyG6fmbA0Am+kK1ExNeYr2qSgTyB2qqkZPJwoqDWDlqCt5awReYELQgm6n
         +g+GxoH/zArkP/TKlYdCetJreKxvRZyh4pcOSB/oTjU/StTnL0NOBT1TvgxJqw2ALWpL
         JMjFXvMY9+sqUtkLr0oungQ6e46M4tmv8GJelHQWL8JVj6BR2EAqG8HzxFOvANy+/s1i
         6WAARAQB+FImdpPoQFD5ZGnKQRycLsxg85YRif5vFit180GUor5CNMfdki2rbe58Ptfk
         UxqBMjG3QU2cC/dGzVqLeOB0SM19F4eFkGkBIPFHDTjP6ynqAR07J6efmrFGUit03rBi
         RDAg==
X-Gm-Message-State: APjAAAVrJTAePB+74JeQlKOeZkTieGPD8CytmZ9+hREE5kHOQ7sqbxnV
        /a4KtiarRCoNEynPoylcjng=
X-Google-Smtp-Source: APXvYqxfnoweorQOxa3vqLFo5GCBT8FkKIocf3TLrmgKBXFs2tqavGhKe5SKBktyQubuc98Mh1T/JA==
X-Received: by 2002:aa7:8299:: with SMTP id s25mr2902934pfm.261.1576675578000;
        Wed, 18 Dec 2019 05:26:18 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id l127sm3307141pgl.48.2019.12.18.05.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:26:17 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH 2/2] gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in grgpio_irq_map/unmap()
Date:   Wed, 18 Dec 2019 21:26:05 +0800
Message-Id: <20191218132605.10594-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver may sleep while holding a spinlock.
The function call path (from bottom to top) in Linux 4.19 is:

drivers/gpio/gpio-grgpio.c, 261: 
	request_irq in grgpio_irq_map
drivers/gpio/gpio-grgpio.c, 255: 
	_raw_spin_lock_irqsave in grgpio_irq_map

drivers/gpio/gpio-grgpio.c, 318: 
	free_irq in grgpio_irq_unmap
drivers/gpio/gpio-grgpio.c, 299: 
	_raw_spin_lock_irqsave in grgpio_irq_unmap

request_irq() and free_irq() can sleep at runtime.

To fix these bugs, request_irq() and free_irq() are called without
holding the spinlock.

These bugs are found by a static analysis tool STCheck written by myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/gpio/gpio-grgpio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 08234e64993a..3224933f4c8f 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -253,17 +253,16 @@ static int grgpio_irq_map(struct irq_domain *d, unsigned int irq,
 	lirq->irq = irq;
 	uirq = &priv->uirqs[lirq->index];
 	if (uirq->refcnt == 0) {
+		spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 		ret = request_irq(uirq->uirq, grgpio_irq_handler, 0,
 				  dev_name(priv->dev), priv);
 		if (ret) {
 			dev_err(priv->dev,
 				"Could not request underlying irq %d\n",
 				uirq->uirq);
-
-			spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-
 			return ret;
 		}
+		spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
 	}
 	uirq->refcnt++;
 
@@ -309,8 +308,11 @@ static void grgpio_irq_unmap(struct irq_domain *d, unsigned int irq)
 	if (index >= 0) {
 		uirq = &priv->uirqs[lirq->index];
 		uirq->refcnt--;
-		if (uirq->refcnt == 0)
+		if (uirq->refcnt == 0) {
+			spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
 			free_irq(uirq->uirq, priv);
+			return;
+		}
 	}
 
 	spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-- 
2.17.1

