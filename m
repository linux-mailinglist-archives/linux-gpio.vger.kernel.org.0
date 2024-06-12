Return-Path: <linux-gpio+bounces-7393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40D9051AD
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 13:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C723C285884
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 11:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EF416F82F;
	Wed, 12 Jun 2024 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vlnvGd4I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE07381D4
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193187; cv=none; b=sBvY6drgHkQ2rcjWzHnayABV7WJCOMTrBV7ZoPIgEmjxtL0fIo0wke8HevyJ2aAwXDfgwxJUssUk8UFqu5qN//BoMCYOMAqc9J0R30/qkj+3GtaFJ1MkpGFYMBZJ90K53Cnp3mTt8es5xfKw6vrMD5j0ydojOf5++Xqreu1PMGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193187; c=relaxed/simple;
	bh=gIxc5R2yJd9VUifO8gyW7fV3jyzLCecrCt5fl7cMhQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRXj5N0naOHjOy84MAZgB+8UUxARsjou++Skn/EQBj1RC71pXCjYJOX0J9/OB973GQL+p1Uk8ntciz1Bkar9R3XaNNsKtI91L3xMgLDoCg89kE5DkEGIUp91SHUjk4KWa1nLtS4QDXxlxM2twWehgZMETI3dnMYFXUJbnItyeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vlnvGd4I; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so5236145e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 04:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718193182; x=1718797982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMaVrXTNSn8/RlgcBidtA4XNwAtbmdRI1NY6kSKH78g=;
        b=vlnvGd4I9XwvwxIOYIOYmsD7QKkJ5KN8WsIpjHtV3WKatrYDHnkawEZtPh8p6ZNjWe
         wmM2YaX57fsXHk3qTqKjwQnLm5TwdRAPBrnCtAjmhLMoDq+nk3yewV4uSbLPCcpLfu3o
         l4P77jJG/tJqUFPS+OWjYpOCw8klnROq0c2XH67fTyQtWQiXwEXSysfnDUrEgfFxEiDo
         v1C1G+qixJuIj5kCamYwPUbM7xifgqSttaqwjxKxTQQOa/8ocSL+7e/8aRez7VaA/Xyt
         BD4869csava4myns3G8A/31wn81jfjKlqcuu5E8TuO/D36AbhNCgD8yy7Sqx/7OuNZye
         7qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193182; x=1718797982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMaVrXTNSn8/RlgcBidtA4XNwAtbmdRI1NY6kSKH78g=;
        b=MRk536V0/J/OuvUiEo9YAHI/g+XYpD0yEsCo+XgYyaV33AnNBJCNkX5YOpHxcUHmEB
         hu0t5piFPgvQFMdV//W7wQzyx6txCcUJxlNYMA2rPC4JrRVgLt+FOAm/gJuoZ+E+Clgc
         XAyzVE0Tv7wtOZxdkklFskdrCWfkAI7oBZ68aorMUy589yxw3Qz88ZcFtUnmsHBBpcII
         8PGe5JaCtBhjB69jd/iN8A9B/eYMO2qsM3X5SvgzfJ7J5ANI0bnoOEPdw+HKbpeL3oyT
         ZOht1kn5H790Uf0P5cr3BZoKpOUV/vEN7Ah/JkChkC8YkVpLg+0yayCq/RhwPAiTvtlz
         s3Rg==
X-Gm-Message-State: AOJu0YxhzoDYZppNZHCYDwibZxrjo0TzBovAFVs7BaH6xms25MP261SN
	mlx4fDAcRq9+AU/qpozaGHb7pXnQZVHpxrwAnv8fv6N7psVh9HJDcFF1hv+VvwQw/NphWmQWuUb
	s
X-Google-Smtp-Source: AGHT+IHYYStDCJ+efOYUfRfVc0U8uY+8W/Gy+dCA6wjCUkJXARiUSADe+wTLCY9FVnjiFVraHnRknw==
X-Received: by 2002:ac2:46f6:0:b0:52c:84a2:6e0f with SMTP id 2adb3069b0e04-52c9a3c768fmr857602e87.15.1718193182228;
        Wed, 12 Jun 2024 04:53:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:a172:4e8b:453e:2f03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1c958f9fsm10457352f8f.38.2024.06.12.04.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:53:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] genirq/irq_sim: add a notifier for irqchip events
Date: Wed, 12 Jun 2024 13:52:25 +0200
Message-ID: <20240612115231.26703-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612115231.26703-1-brgl@bgdev.pl>
References: <20240612115231.26703-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently users of the interrupt simulator don't have any way of being
notified about interrupts from the simulated domain being requested or
released. This causes a problem for one of the users - the GPIO
simulator - which is unable to lock the pins as interrupts.

Add a blocking notifier and provide interfaces to register with it, then
use it to notify users of the domain about interrupts being requested
and released while also leaving space for future extensions.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/irq_sim.h | 11 +++++++
 kernel/irq/irq_sim.c    | 64 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
index ab831e5ae748..462d1913bb27 100644
--- a/include/linux/irq_sim.h
+++ b/include/linux/irq_sim.h
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/fwnode.h>
 #include <linux/irqdomain.h>
+#include <linux/notifier.h>
 
 /*
  * Provides a framework for allocating simulated interrupts which can be
@@ -23,4 +24,14 @@ struct irq_domain *devm_irq_domain_create_sim(struct device *dev,
 					      unsigned int num_irqs);
 void irq_domain_remove_sim(struct irq_domain *domain);
 
+enum {
+	IRQ_SIM_DOMAIN_IRQ_REQUESTED = 1,
+	IRQ_SIM_DOMAIN_IRQ_RELEASED,
+};
+
+int irq_sim_domain_register_notifier(struct irq_domain *domain,
+				     struct notifier_block *nb);
+int irq_sim_domain_unregister_notifier(struct irq_domain *domain,
+				       struct notifier_block *nb);
+
 #endif /* _LINUX_IRQ_SIM_H */
diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 38d6ae651ac7..653b6ca869cb 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -17,6 +17,7 @@ struct irq_sim_work_ctx {
 	unsigned int		irq_count;
 	unsigned long		*pending;
 	struct irq_domain	*domain;
+	struct blocking_notifier_head notifier;
 };
 
 struct irq_sim_irq_ctx {
@@ -88,6 +89,28 @@ static int irq_sim_set_irqchip_state(struct irq_data *data,
 	return 0;
 }
 
+static int irq_sim_request_resources(struct irq_data *data)
+{
+	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
+	struct irq_sim_work_ctx *work_ctx = irq_ctx->work_ctx;
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	blocking_notifier_call_chain(&work_ctx->notifier,
+				     IRQ_SIM_DOMAIN_IRQ_REQUESTED, &hwirq);
+
+	return 0;
+}
+
+static void irq_sim_release_resources(struct irq_data *data)
+{
+	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
+	struct irq_sim_work_ctx *work_ctx = irq_ctx->work_ctx;
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	blocking_notifier_call_chain(&work_ctx->notifier,
+				     IRQ_SIM_DOMAIN_IRQ_RELEASED, &hwirq);
+}
+
 static struct irq_chip irq_sim_irqchip = {
 	.name			= "irq_sim",
 	.irq_mask		= irq_sim_irqmask,
@@ -95,6 +118,8 @@ static struct irq_chip irq_sim_irqchip = {
 	.irq_set_type		= irq_sim_set_type,
 	.irq_get_irqchip_state	= irq_sim_get_irqchip_state,
 	.irq_set_irqchip_state	= irq_sim_set_irqchip_state,
+	.irq_request_resources	= irq_sim_request_resources,
+	.irq_release_resources	= irq_sim_release_resources,
 };
 
 static void irq_sim_handle_irq(struct irq_work *work)
@@ -183,6 +208,7 @@ struct irq_domain *irq_domain_create_sim(struct fwnode_handle *fwnode,
 	work_ctx->irq_count = num_irqs;
 	work_ctx->work = IRQ_WORK_INIT_HARD(irq_sim_handle_irq);
 	work_ctx->pending = no_free_ptr(pending);
+	BLOCKING_INIT_NOTIFIER_HEAD(&work_ctx->notifier);
 
 	return no_free_ptr(work_ctx)->domain;
 }
@@ -242,3 +268,41 @@ struct irq_domain *devm_irq_domain_create_sim(struct device *dev,
 	return domain;
 }
 EXPORT_SYMBOL_GPL(devm_irq_domain_create_sim);
+
+/**
+ * irq_sim_domain_register_notifier - Start listening for events on this
+ *                                    interrupt simulator.
+ *
+ * @domain:     The interrupt simulator domain to register with.
+ * @nb:         Notifier block called on domain events.
+ *
+ * On success: return 0.
+ * On failure: return negative error code.
+ */
+int irq_sim_domain_register_notifier(struct irq_domain *domain,
+				     struct notifier_block *nb)
+{
+	struct irq_sim_work_ctx *work_ctx = domain->host_data;
+
+	return blocking_notifier_chain_register(&work_ctx->notifier, nb);
+}
+EXPORT_SYMBOL_GPL(irq_sim_domain_register_notifier);
+
+/**
+ * irq_sim_domain_unregister_notifier - Stop listening for events on this
+ *                                      interrupt simulator.
+ *
+ * @domain:     The interrupt simulator domain to register with.
+ * @nb:         Notifier block called on domain events.
+ *
+ * On success: return 0.
+ * On failure: return negative error code.
+ */
+int irq_sim_domain_unregister_notifier(struct irq_domain *domain,
+				       struct notifier_block *nb)
+{
+	struct irq_sim_work_ctx *work_ctx = domain->host_data;
+
+	return blocking_notifier_chain_unregister(&work_ctx->notifier, nb);
+}
+EXPORT_SYMBOL_GPL(irq_sim_domain_unregister_notifier);
-- 
2.40.1


