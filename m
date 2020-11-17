Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574232B7100
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 22:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgKQVgL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 16:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgKQVgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 16:36:11 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A234FC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:36:10 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 142so12373291ljj.10
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QjVQoOTt3shsLqnsVnpkhic6+UrAPp0sadOUVrw9MEU=;
        b=fyNObB9rsiCq9KEHbVjCu2oUn2zFdNQH/YLWiUiSow/yuJDPFtC82vAU0WbX1Lij5R
         N5rJu9jqJFbVy5/sSRVKvRUcFVNjXb27MmM/UL/nAHomjKYDUxUnGEmto7r75ILKF9gz
         iKK7rCYcE9nbi5spdKNF21EItfdDW5ZAWURwTuFH84ld81xJb46oVVsydi/ADh+yfL66
         uVt7eCYb2kuJ6wzOGuSp8s00CWbn2rmbfjg9fCURMzEWRX1XvC4zxtc6WDCyD6Lpf7RB
         du7qlzytnS9BAXiHIGUP/qk0LIkP/gG7qm2Xlx9N+PJX0IYBRkbk1Q/OWOX37xq1Nw/k
         aJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QjVQoOTt3shsLqnsVnpkhic6+UrAPp0sadOUVrw9MEU=;
        b=HWKKWXrDMk4C6vzjZ6MaCaqtojiBDN9DOVx5KF74LqeqG/jVv7X5+HMx/0XMAYKOPR
         iw31nlJDAGoOWW47Dnf8XXLRFbxUoo8OK6iGvNoaPjRuWsOtEXznKnNq8sF+RhvuPAVd
         cdPmSxfx2jlGj9CuwoK8BKhgIAaFxPuoKlhPtL3kH4Aq9Dpq2XrD1akE0F8Tk+hmzwAu
         wao38rXU9XzAtrTtqm6NaUrJHyeIr8za7fVdWukY/IMrsErx7ymQsbZTe0ArJAm9hg0d
         gZCbJI6oPHQvGxQdfDuTOoF+7xff8eQlSqCL/gYsoY41daOgDNbogsdnryvaHvfxaruv
         oRWg==
X-Gm-Message-State: AOAM533lz2CGt++eaKBrgMmQJACaq0Y3404xdAVB1iDhivVCaPM0ZuN2
        fSMY0f54PXp3YGczPf0Y9ocdfk1D03z/fqzm
X-Google-Smtp-Source: ABdhPJw2Zx5kmRl9ou16dYnotpqkruuPoRwJnRI0RfoqkAzlmCilxeQl73JmtcLUqvcprVRST7dQQQ==
X-Received: by 2002:a2e:bc1a:: with SMTP id b26mr2674103ljf.359.1605648968952;
        Tue, 17 Nov 2020 13:36:08 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c9sm3301534lfd.98.2020.11.17.13.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 13:36:08 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH 2/2 v1] gpio: tegra186: Set affinity callback to parent
Date:   Tue, 17 Nov 2020 22:33:51 +0100
Message-Id: <20201117213351.249668-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201117213351.249668-1-linus.walleij@linaro.org>
References: <20201117213351.249668-1-linus.walleij@linaro.org>
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
ChangeLog RFT->v1:
- Make the affinity setting call return -EINVAL if there
  is no parent.
- Real patch because now we believe in this
---
 drivers/gpio/gpio-tegra186.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 9500074b1f1b..286e0b1f46e4 100644
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
+	return -EINVAL;
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

