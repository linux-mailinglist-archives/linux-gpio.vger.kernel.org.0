Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDDD125BBB5
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 09:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgICHah (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 03:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgICHac (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 03:30:32 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E9DC061245;
        Thu,  3 Sep 2020 00:30:31 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 31so1398019pgy.13;
        Thu, 03 Sep 2020 00:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bYwyS6xcFZKtbMy7Ramn/ZzLGZ/OsAzuvP1v3oeNA/0=;
        b=PWLVsvDkBtjLZaHx70uHZ48Tuk1sUHJ/4JVWxfpKgyt++1uYdWfUoNKn6a7y+wh/+b
         UZTw3hG4BIO2iq4oVMg3cJxg0sig/yr5UIKPdbqrRpW+RPc8XtYEI++/brmy4cWRkQr7
         m3u68I3N/dXeGjHOE3CkIpDL+z6DDVkSDeqmw4RA7N9OI3W0wjYB2R8G/+SZNb0klvtA
         M1DbHcsSMzvPZu26Shxm7ccQMhohLaVgG2jHW8+Ku9M1oQ9Ycoi7ekCQA52McBTEgxFC
         l2ySGr1lomKPyWTknE+tPo0nwNORsg/o0rUpWH0k5TZhzX+o5NrVGt0U0JfjSFnI4KOr
         PszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bYwyS6xcFZKtbMy7Ramn/ZzLGZ/OsAzuvP1v3oeNA/0=;
        b=KXXB+Q0UkttkgvNSOsTL6LXw0PD7B5fiS6ix1l5Q39T0N7d3fbPmHQbc8lCLUNn56O
         ZcMKl0+noyoORaXvBYOTSu1/kuadrmRheQVfxP7GXukDDjUwFLnS8PK1Srmy6jJTHAq6
         fXjV4sY1CTxZ4mEpc5lFEmZksy/Z3sF6UQRhzhTDrIlsavJIaAwDR8wyXHuHYgqJvTYj
         pUW5xsDj3HmNLSw0zN4cPoRuV0EWfMEl3Qc43h/x7QTzMzEWu6OSMXJAidXr5GoZaFYt
         Vghy64JuiG9rtCsSaDmGwxGi2LEdyh5r+O5lVPDmDZNEQk7UROgto8kIMfYNAw3/uI8Z
         Gz9Q==
X-Gm-Message-State: AOAM53242/qDPn7r08pl+sTmHiZqD4eEFIYk1iu6BfyRtxEBgAa4fT/5
        yB0x2kJwog/oZce0ij+4AGXoV6bzT+SAgQ==
X-Google-Smtp-Source: ABdhPJwh9iqQezkXPRTeJCrVp/pq0tdSoXhNBcbwaaEikQ3lZE8W7r0ZcJ+bxWlU/ctVsoOQU3luXA==
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr2574874plr.226.1599118230653;
        Thu, 03 Sep 2020 00:30:30 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.6])
        by smtp.gmail.com with ESMTPSA id u63sm1949105pfu.34.2020.09.03.00.30.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 00:30:30 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     linus.walleij@linaro.org, lee.jones@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH: V2  2/2] gpio: tc35894: Disable Direct KBD interrupts to enable gpio irq
Date:   Thu,  3 Sep 2020 15:30:22 +0800
Message-Id: <1599118222-18990-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599118222-18990-1-git-send-email-dillon.minfei@gmail.com>
References: <1599118222-18990-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

On tc35894, have to disable direct keypad interrupts to make
it as general purpose interrupts functionality work.
if not, after chip reset, IRQST(0x91) will always 0x20,
IRQN always low level, can't be clear.

Configure DIRECTx to enable general purpose gpio mode,
else read GPIOMISx register always zero in irq routine.

verified on tc35894, need more test on other tc3589x.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 
V1 -> V2:
Add DIRECTx register configuration to active general purpose gpio mode.

 drivers/gpio/gpio-tc3589x.c | 18 ++++++++++++++++--
 include/linux/mfd/tc3589x.h |  6 ++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index ea3f68a28fea..55b8dbd13d11 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -19,9 +19,9 @@
  * These registers are modified under the irq bus lock and cached to avoid
  * unnecessary writes in bus_sync_unlock.
  */
-enum { REG_IBE, REG_IEV, REG_IS, REG_IE };
+enum { REG_IBE, REG_IEV, REG_IS, REG_IE, REG_DIRECT };
 
-#define CACHE_NR_REGS	4
+#define CACHE_NR_REGS	5
 #define CACHE_NR_BANKS	3
 
 struct tc3589x_gpio {
@@ -200,6 +200,7 @@ static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
 		[REG_IEV]	= TC3589x_GPIOIEV0,
 		[REG_IS]	= TC3589x_GPIOIS0,
 		[REG_IE]	= TC3589x_GPIOIE0,
+		[REG_DIRECT]	= TC3589x_DIRECT0,
 	};
 	int i, j;
 
@@ -228,6 +229,7 @@ static void tc3589x_gpio_irq_mask(struct irq_data *d)
 	int mask = BIT(offset % 8);
 
 	tc3589x_gpio->regs[REG_IE][regoffset] &= ~mask;
+	tc3589x_gpio->regs[REG_DIRECT][regoffset] |= mask;
 }
 
 static void tc3589x_gpio_irq_unmask(struct irq_data *d)
@@ -239,6 +241,7 @@ static void tc3589x_gpio_irq_unmask(struct irq_data *d)
 	int mask = BIT(offset % 8);
 
 	tc3589x_gpio->regs[REG_IE][regoffset] |= mask;
+	tc3589x_gpio->regs[REG_DIRECT][regoffset] &= ~mask;
 }
 
 static struct irq_chip tc3589x_gpio_irq_chip = {
@@ -334,6 +337,17 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	 /* For tc35894, have to disable Direct KBD interrupts,
+	  * else IRQST will always be 0x20, IRQN low level, can't
+	  * clear the irq status.
+	  * TODO: need more test on other tc3589x chip.
+	  *
+	  */
+	ret = tc3589x_reg_write(tc3589x, TC3589x_DKBDMSK,
+			TC3589x_DKBDMSK_ELINT | TC3589x_DKBDMSK_EINT);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_request_threaded_irq(&pdev->dev,
 					irq, NULL, tc3589x_gpio_irq,
 					IRQF_ONESHOT, "tc3589x-gpio",
diff --git a/include/linux/mfd/tc3589x.h b/include/linux/mfd/tc3589x.h
index bb2b19599761..b84955410e03 100644
--- a/include/linux/mfd/tc3589x.h
+++ b/include/linux/mfd/tc3589x.h
@@ -19,6 +19,9 @@ enum tx3589x_block {
 #define TC3589x_RSTCTRL_KBDRST	(1 << 1)
 #define TC3589x_RSTCTRL_GPIRST	(1 << 0)
 
+#define TC3589x_DKBDMSK_ELINT	(1 << 1)
+#define TC3589x_DKBDMSK_EINT	(1 << 0)
+
 /* Keyboard Configuration Registers */
 #define TC3589x_KBDSETTLE_REG   0x01
 #define TC3589x_KBDBOUNCE       0x02
@@ -101,6 +104,9 @@ enum tx3589x_block {
 #define TC3589x_GPIOODM2	0xE4
 #define TC3589x_GPIOODE2	0xE5
 
+#define TC3589x_DIRECT0		0xEC
+#define TC3589x_DKBDMSK		0xF3
+
 #define TC3589x_INT_GPIIRQ	0
 #define TC3589x_INT_TI0IRQ	1
 #define TC3589x_INT_TI1IRQ	2
-- 
2.7.4

