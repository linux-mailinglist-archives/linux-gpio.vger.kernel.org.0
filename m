Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 391B2158F8C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 14:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729047AbgBKNNI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 08:13:08 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45063 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbgBKNNI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Feb 2020 08:13:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id g3so11234448wrs.12
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 05:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vPmpeWQjbELhAAh7qUDhl/FE61ojZhZ+nedC+mmNBA=;
        b=YMVL4UutOUUUBwxTLjas1GuxZpiRAyZ1QAJDqZuCsiixVQ0HwJ8iqYUKqX4By5wK1O
         xh5q5/mIudN6g8VmBHS+ZVag+52200shz8xC+qEl5LTCcxOS9snJLRjuDHpc6Uq/8VMD
         /6BZpEia3GazsYMJfmihNFHq7HA0BMFugaXVwo6qJag3ClvXZPuzjUW8pACj2AN6HJCY
         EDpVS9GLXJtxdNC9SmGGn9C7fNvv2wno61s8xPnkugdealVsXLRUmJxHRks0PlH6hyGb
         s73Uvf0fZhev9/ZOwoT21KBAA23sMroSApT3hyDQqvHJKDqVrtogp75kjFOM4er1dKUX
         /l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vPmpeWQjbELhAAh7qUDhl/FE61ojZhZ+nedC+mmNBA=;
        b=r9pm+l9mkKvKi63fNhulSob1mJsUGnsTSinKEc30pxRvskkq2yvEZ0vCeWp7ny7FXu
         iDffBf6xAyZOEbL1yJwDeFV/PpoF+74wSW0j63ZYvXY287NTgyRcFcoUh20LinkVdJwf
         tMPOSPYd2NVkADflKdPlBIBoQu4rbcbrxRkGeUlErZ8zd/bhuJa2Pjwb09b08ixQKCY/
         Mon5n70vGiBg0CX1bhnp1e42wJ53muC6JRbO8tCgbod7m7A0tBAzMW/uFt2ceJLuV3N9
         PqqSO3saSg6g4P/qPiAJGA3p8WKP8GT5ZNQHg5iWGzvur3tL3ScIkmFi0ZlElCl9vXR4
         LzEA==
X-Gm-Message-State: APjAAAW3jHPA5d5eBcPrTU5KgKqmc/ZmJ7UT/NJ/Lpr4MnJlbLiwZUL4
        S0QjdvMhw5VfD3jR51I2r4YxIw==
X-Google-Smtp-Source: APXvYqwsqGPsgxct0EcwFH2nXNkyOmhcAIVbam2T5OBf09TafGb/SaZA0NIR5OfaTljHguvsgfn4aA==
X-Received: by 2002:a5d:4d12:: with SMTP id z18mr8658792wrt.139.1581426786597;
        Tue, 11 Feb 2020 05:13:06 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id b21sm3873013wmd.37.2020.02.11.05.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 05:13:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 6/6] irqchip: keystone: use irq_domain_dispose_mappings()
Date:   Tue, 11 Feb 2020 14:12:40 +0100
Message-Id: <20200211131240.15853-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211131240.15853-1-brgl@bgdev.pl>
References: <20200211131240.15853-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Shrink the code a bit by using the new irq_domain_dispose_mappings()
helper.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/irqchip/irq-keystone.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-keystone.c b/drivers/irqchip/irq-keystone.c
index 8118ebe80b09..57819d1c3c32 100644
--- a/drivers/irqchip/irq-keystone.c
+++ b/drivers/irqchip/irq-keystone.c
@@ -135,6 +135,7 @@ static int keystone_irq_map(struct irq_domain *h, unsigned int virq,
 static const struct irq_domain_ops keystone_irq_ops = {
 	.map	= keystone_irq_map,
 	.xlate	= irq_domain_xlate_onecell,
+	.remove	= irq_domain_dispose_mappings,
 };
 
 static int keystone_irq_probe(struct platform_device *pdev)
@@ -203,13 +204,9 @@ static int keystone_irq_probe(struct platform_device *pdev)
 static int keystone_irq_remove(struct platform_device *pdev)
 {
 	struct keystone_irq_device *kirq = platform_get_drvdata(pdev);
-	int hwirq;
 
 	free_irq(kirq->irq, kirq);
 
-	for (hwirq = 0; hwirq < KEYSTONE_N_IRQ; hwirq++)
-		irq_dispose_mapping(irq_find_mapping(kirq->irqd, hwirq));
-
 	irq_domain_remove(kirq->irqd);
 	return 0;
 }
-- 
2.25.0

