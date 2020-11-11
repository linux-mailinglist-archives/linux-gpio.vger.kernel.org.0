Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D998E2AF322
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 15:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgKKOJ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 09:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgKKOJZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 09:09:25 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CC0C0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 06:09:24 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id o24so2228217ljj.6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 06:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iI8bwpzFdeqCWrAP5di3B5BnMpGL0V/sXol352J96LQ=;
        b=XZfJNMHGOS81Kx1vLVlNszA5M5RBAHIcReAg44YuXb+qoGnPphM+3mwpkRenHQsw0c
         HQyn/6zfC1plygZ5XriWNV2ZFT84qAlQtdgwVtQ/UjYfDd9uYKYDJs9T+3CdEyq2ozWH
         r9pG4EpT+MOzi2CeKUYzy0jF/xe/39dauPECX+tMleXaEBNgzkD28P47kH3aWSFcoIFM
         TRLifNT81SspoG14pOnobbao+4kwsm3p1MLu44vOxZ8QsvGw5Ef5NZ8iS/YuRxY3qOAr
         bubPbCIcM9Rz/ohrXVZMLnkTeDL5B1AIMRb1WiqMtF9GSJHJesd8cNupgkWEln8Putee
         hQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iI8bwpzFdeqCWrAP5di3B5BnMpGL0V/sXol352J96LQ=;
        b=IAXjUR4JaITqGEjYfX1Lgq1KjGP37joFAvwjr1kUjz+4fmSfQ6mcUjJILClQGn64wH
         8K5zITzyPai5KDu+qNql9u4TSCJ9paTpXDNO5BdE4h6hcpXSq7bT9A3HfqvUjmAuQEjV
         2zylXtw0wC4CWwXqiKs2ANz9kpTm5/QZzzIu0j4+wYjHoZk0dEICq9CHA7ri1R7anhgi
         SeR0wzZCUYJ8hdcv5p66NNZAhyBxTg+N+VbPfFHNMxq95i1LKs3WHlh9HCvueEfA4DJN
         TNkYGOYdJzXEcJpNp6NHTsQ/24gZFRsQYQNLv1bByQkqswnjwHlqxy0TPWQtVB9YRrtZ
         4kKA==
X-Gm-Message-State: AOAM530n60BI6mx6yu1AcHYqvxBWETOH5SRe16TWr7lsgp7FOmOFgFc3
        5sjhQJlKykdbulh3VE9A7dqysA1jsu6CRX3H
X-Google-Smtp-Source: ABdhPJw2T21sifqMhsPOJeTf+J2yEINCcTkoaWL5CPJwyhEM83+VTgxj9zbgV9MY7/93ZncmxQ4etg==
X-Received: by 2002:a2e:b5a8:: with SMTP id f8mr1248842ljn.174.1605103762981;
        Wed, 11 Nov 2020 06:09:22 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id w10sm245437ljo.130.2020.11.11.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:09:22 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH 2/2] RFT: gpio: tegra186: Set affinity callback to parent
Date:   Wed, 11 Nov 2020 15:06:28 +0100
Message-Id: <20201111140628.24067-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111140628.24067-1-linus.walleij@linaro.org>
References: <20201111140628.24067-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This assigns the .irq_set_affinity to the parent callback.
I assume the Tegra186 is an SMP system so this would be
beneficial.

I used the pattern making the hirerarchy tolerant for missing
parent as in Marc's earlier patch.

Cc: Thierry Reding <treding@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tegra186.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 9500074b1f1b..5060e81f5f49 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -444,6 +444,16 @@ static int tegra186_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int tegra186_irq_set_affinity(struct irq_data *data,
+				     const struct cpumask *dest,
+				     bool force)
+{
+	if (data->parent_data)
+		return irq_chip_set_affinity_parent(data, dest, force);
+
+	return 0;
+}
+
 static void tegra186_gpio_irq(struct irq_desc *desc)
 {
 	struct tegra_gpio *gpio = irq_desc_get_handler_data(desc);
@@ -690,6 +700,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->intc.irq_unmask = tegra186_irq_unmask;
 	gpio->intc.irq_set_type = tegra186_irq_set_type;
 	gpio->intc.irq_set_wake = tegra186_irq_set_wake;
+	gpio->intc.irq_set_affinity = tegra186_irq_set_affinity;
 
 	irq = &gpio->gpio.irq;
 	irq->chip = &gpio->intc;
-- 
2.26.2

