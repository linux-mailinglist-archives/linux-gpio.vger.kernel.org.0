Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EEF1BFE4C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 16:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgD3Oag (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 10:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgD3Oa2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Apr 2020 10:30:28 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73AAC035495
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2020 07:30:27 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k12so2103552wmj.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2020 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=obGT73clTanBE+91bLOPk62bliFCMBSCDxhDFdT/Npo=;
        b=Pf7KYcMDn7yMAPcZ1SmRKN8+c2VLloEZOgsbaZSnetJ6N4h5z6jmSLyeVfongq6agO
         ENwY1cOOICIw5xPvs7yr0eJ1GLsSD/aoGN1JYBtSg2iuh5Ud0hHwwag5KK332DtBu8s2
         o816S1zhv8mlUyUOu7l5FpdqyxF+g0xa+KGRlGcyCC/zNF6p1WpwpNsir3neM/+NGfDC
         nqDKqlltOvC5ooGBXPsCrcR3euGTF+zY8Xo2aKNC8hIacoz1uV5Z1PF5M5A+tJYRoJnG
         5CwRz71AUyWdvp1efJHl+UnDYvfkKL/GK4NgfUAwJEtUsNH2TTyQp8eKFA4ELdvY8Par
         aSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=obGT73clTanBE+91bLOPk62bliFCMBSCDxhDFdT/Npo=;
        b=PCJlop9Ktjkazt7pY/tNeHXTsKFm7QiXgkgivl2YMOGbK1bcdc/1znVDi0OPQPU07r
         60XcUtszKhstxALgN49KJavo/ZjdBYUYfDZdxbAoHOmXZT/VCi1iwbx89JmTUlpmCQbI
         uV0BrnG2EUjblgzfpFbAinLKGxjqeh8kLZUfBZClUijt8lm46VdZvijMG5eHUP/07ve3
         CHpK4Gqz4wztsc+MHLLUgxPBReqj8pnc3wbvQZdvv6vEF6knQyLQlh65HR56BvA5EDQR
         UCfYZR4HvKC6h2ycniM451UBw8yytzn552ptXw73ntMXYv9ns992dhzlpvwqVK5wz0VT
         ymhQ==
X-Gm-Message-State: AGi0PuYlRzQ22EU+uUju/khFOFOLScjLY/NlozZmLUryaDbAPvwPShn4
        pp8LmT6zlyhiYtHlchV0TrgQJg==
X-Google-Smtp-Source: APiQypLEXDZGjTb/DwDnoEkxCf0puujKGc6MtiRKJAJvtC0xFn6/z+KWszmpbtpbKKFNNcvhqGMPXA==
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr3418683wmg.183.1588257026521;
        Thu, 30 Apr 2020 07:30:26 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id h137sm14696626wme.0.2020.04.30.07.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:30:26 -0700 (PDT)
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
Subject: [PATCH v4 1/2] irq: make irq_domain_reset_irq_data() available even for non-V2 users
Date:   Thu, 30 Apr 2020 16:30:18 +0200
Message-Id: <20200430143019.1704-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200430143019.1704-1-brgl@bgdev.pl>
References: <20200430143019.1704-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

irq_domain_reset_irq_data() doesn't modify the parent data, so it can be
made available even if irq domain hierarchy is not being built. We'll
subsequently use it in irq_sim code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/irqdomain.h |  2 +-
 kernel/irq/irqdomain.c    | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 8d062e86d954..b37350c4fe37 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -450,6 +450,7 @@ extern void irq_domain_set_info(struct irq_domain *domain, unsigned int virq,
 				irq_hw_number_t hwirq, struct irq_chip *chip,
 				void *chip_data, irq_flow_handler_t handler,
 				void *handler_data, const char *handler_name);
+extern void irq_domain_reset_irq_data(struct irq_data *irq_data);
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 extern struct irq_domain *irq_domain_create_hierarchy(struct irq_domain *parent,
 			unsigned int flags, unsigned int size,
@@ -491,7 +492,6 @@ extern int irq_domain_set_hwirq_and_chip(struct irq_domain *domain,
 					 irq_hw_number_t hwirq,
 					 struct irq_chip *chip,
 					 void *chip_data);
-extern void irq_domain_reset_irq_data(struct irq_data *irq_data);
 extern void irq_domain_free_irqs_common(struct irq_domain *domain,
 					unsigned int virq,
 					unsigned int nr_irqs);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 35b8d97c3a1d..e2aa128ea3ee 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1047,6 +1047,18 @@ int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
 	return virq;
 }
 
+/**
+ * irq_domain_reset_irq_data - Clear hwirq, chip and chip_data in @irq_data
+ * @irq_data:	The pointer to irq_data
+ */
+void irq_domain_reset_irq_data(struct irq_data *irq_data)
+{
+	irq_data->hwirq = 0;
+	irq_data->chip = &no_irq_chip;
+	irq_data->chip_data = NULL;
+}
+EXPORT_SYMBOL_GPL(irq_domain_reset_irq_data);
+
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 /**
  * irq_domain_create_hierarchy - Add a irqdomain into the hierarchy
@@ -1247,18 +1259,6 @@ void irq_domain_set_info(struct irq_domain *domain, unsigned int virq,
 }
 EXPORT_SYMBOL(irq_domain_set_info);
 
-/**
- * irq_domain_reset_irq_data - Clear hwirq, chip and chip_data in @irq_data
- * @irq_data:	The pointer to irq_data
- */
-void irq_domain_reset_irq_data(struct irq_data *irq_data)
-{
-	irq_data->hwirq = 0;
-	irq_data->chip = &no_irq_chip;
-	irq_data->chip_data = NULL;
-}
-EXPORT_SYMBOL_GPL(irq_domain_reset_irq_data);
-
 /**
  * irq_domain_free_irqs_common - Clear irq_data and free the parent
  * @domain:	Interrupt domain to match
-- 
2.25.0

