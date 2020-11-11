Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFA52AF31C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 15:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgKKOJL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 09:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgKKOIg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 09:08:36 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF9AC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 06:08:36 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id q19so2207899ljc.10
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sl17UnNN1853pv8Fm2YJwHvBxDhtc6bmkJMszso6wJw=;
        b=lWCk5qxlFFQNf1X4wZDbIoSNQ3OiEi8AuwEDxdVDpD/FZYdWPgEs4hRKyE5ukfSPrE
         26Yy+SvJwmncWe4l0jv9MZL2TXygHdnV88DClbSbAUqnTkWlLKLRCuou0nzhv8eQX/Yf
         ytT82aZuzfvEGFobCoyI/yDnDzjZITTWeZmH4eQrJfpy64UTO8ROsHIuL29u8cx1omSk
         hZUTPl3KE7+q+tx7Hyft5vhSYgbY9MOPNpEqOb184/eN49bJqDQpX2qovNb/qUnDu4a1
         ke4D0UiHdXpiVLTGtQlTYLWDkVGTrmsgPr+MYVpimrJPzHX3dOLCA/M1YhdlpT6oXJsr
         uzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sl17UnNN1853pv8Fm2YJwHvBxDhtc6bmkJMszso6wJw=;
        b=KEepOjN/uslpsuwkf0Pq9+r56wEuQrWlGtbYsmpzZxl3gLXIRPREijZ6/BRZNumRFm
         eS8PbhhKizEkoa12Ftfcss4DnIPuR00Kpw5s9B4oES737SbERCjXFovT8MK+iLyFHMvE
         /hGZn5bU8yJzjZQQ+hBMxDPntNg4B+qHVZISpQvUHnZgLRi1DbXRu1BLaX0B4VgEjcO2
         cS9Iz4F30q1iEnK+/ZBtDJSBQUfkLc41xvwhBFN/MWFe5Av0hir+Fo1n/ubSUTQAlc63
         ARMsU6rqnziZilf7A1mqYGjo0Z47Zk6B7Zc6fgJcdCXlxT7NWWJEP9ERwOkITgUFBspk
         mCEQ==
X-Gm-Message-State: AOAM530lpDPTBRTE7xlSzF/MViEf7OPdsapowoQyg1HtqgYio1yRgERy
        rqn4D2gBXtYDlHsNG/ekMZyPV9XwRR8yvCZs
X-Google-Smtp-Source: ABdhPJyAs/q8Le7LKnDYllritZSni6VfKOCDnj9B2EL0oOnPFEJzW5PGDYFeQ23zK8ZkAz4cX6MROw==
X-Received: by 2002:a2e:8753:: with SMTP id q19mr2262360ljj.188.1605103714503;
        Wed, 11 Nov 2020 06:08:34 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id w10sm245437ljo.130.2020.11.11.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:08:33 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Yash Shah <yash.shah@sifive.com>,
        "Wesley W . Terpstra" <wesley@sifive.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH 1/2] RFT: gpio: sifive: Set affinity callback to parent
Date:   Wed, 11 Nov 2020 15:06:27 +0100
Message-Id: <20201111140628.24067-1-linus.walleij@linaro.org>
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
 drivers/gpio/gpio-sifive.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..e4c190562132 100644
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
+	return 0;
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

