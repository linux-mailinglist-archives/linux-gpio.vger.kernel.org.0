Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875DA2B70FC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 22:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgKQVf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 16:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgKQVf4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 16:35:56 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F37C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:35:56 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id l10so26000486lji.4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+EuZNr8yakXz6HzcHbLLveOlk4w2RFRzhA28nxSA3b8=;
        b=C9uIKj1zZJ920qameQpof+I2WV0sQKt8Fs+Iq57Ia6693H/l6Txp3cq28x8o2nBUPh
         KXTHyyy80vcnYIbhKRgMn0c1RLUZV1NXlB9UbOJ9N8kQl5bkmrZrqa+hjwFxDCBiuX07
         R9J7xDmoH7gkZprhRNpMg5fmoPZ6HaYoEPeveq8Y13TWK7VYIMLFw6GUUSd1WBGwSVEj
         n1DR92e3KDgdmK9Jjl5F9M3TASNbymlJd1sHDayB2U2ZuF9Xm7kF9P2CELqH4a9jR7fq
         xV25L5M5PMeU3R+Lp1DeUZVJqDT7KPnN69yB3qTFwkPTbEyo8Wymo9wk3DkpleYvTbbo
         xr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+EuZNr8yakXz6HzcHbLLveOlk4w2RFRzhA28nxSA3b8=;
        b=kTHBZ1LyiJuzaO39UKevCTqrBMT4ziHGyXxCi3xLCG3J5wVzbpErIGeEvCb5T0mfu3
         SyiDT2sB7fzr7QZ462TEfZa9m8u6rduoVO6Sj0G2J0gNjeKKaeHjDPqa5LfVx7+ty1mi
         R5JNFlVuGvRg+MoP2iOEhcH2PQFCKzK84r5kKuFCWrAW1EZzEnCliOYStmB0Dp9dxCKa
         ik3X/sCQn8taFfnuEqcKhgDdlwgM2S3amB9jakzTPEsgjxnPTGVw5f+6tBt/hLTxIo+9
         py3rGL+7/0ALEJ70tYRO1JgjeNxqE9nH1bOUjeRRCrcNGPJ8YHpm0uxfbNItJ+c/zKau
         yemQ==
X-Gm-Message-State: AOAM532gVMNU7UVhBm8Fbj99gdeIRxHE/az/K03fnDqf+cG0HddOrlzs
        LLhzd4/VKZVwG1H034p7uU8P1xhM8spWPozV
X-Google-Smtp-Source: ABdhPJzCoB2MNpAhIibXw+Yq8LvmM91jJFbl1BkwCZWmEp6qdjyW+b32B7rDU77hMvZ/eQjFBAD/0A==
X-Received: by 2002:a2e:2a86:: with SMTP id q128mr2652231ljq.158.1605648954579;
        Tue, 17 Nov 2020 13:35:54 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c9sm3301534lfd.98.2020.11.17.13.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 13:35:53 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yash Shah <yash.shah@sifive.com>,
        "Wesley W . Terpstra" <wesley@sifive.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH 1/2 v1] gpio: sifive: Set affinity callback to parent
Date:   Tue, 17 Nov 2020 22:33:50 +0100
Message-Id: <20201117213351.249668-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This assigns the .irq_set_affinity to the parent callback.
I assume the sifive GPIO can be used in systems with
SMP.

I used the pattern making the hirerarchy tolerant for missing
parent as in Marc's earlier patches.

Cc: Yash Shah <yash.shah@sifive.com>
Cc: Wesley W. Terpstra <wesley@sifive.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog RFT->v1:
- Make the affinity setting call return -EINVAL if there
  is no parent.
- Real patch because now we believe in this
---
 drivers/gpio/gpio-sifive.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..485820e4488c 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -128,6 +128,16 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
 	irq_chip_eoi_parent(d);
 }
 
+static int sifive_gpio_irq_set_affinity(struct irq_data *data,
+					const struct cpumask *dest,
+					bool force)
+{
+	if (data->parent_data)
+		return irq_chip_set_affinity_parent(data, dest, force);
+
+	return -EINVAL;
+}
+
 static struct irq_chip sifive_gpio_irqchip = {
 	.name		= "sifive-gpio",
 	.irq_set_type	= sifive_gpio_irq_set_type,
@@ -136,6 +146,7 @@ static struct irq_chip sifive_gpio_irqchip = {
 	.irq_enable	= sifive_gpio_irq_enable,
 	.irq_disable	= sifive_gpio_irq_disable,
 	.irq_eoi	= sifive_gpio_irq_eoi,
+	.irq_set_affinity = sifive_gpio_irq_set_affinity,
 };
 
 static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
-- 
2.26.2

