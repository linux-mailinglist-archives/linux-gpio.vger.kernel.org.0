Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B4172A44
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 10:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfGXIie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 04:38:34 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36850 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbfGXIid (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jul 2019 04:38:33 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so43715600ljj.3
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jul 2019 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DCCUYWwiF/FmuCeEm8HO/gSdjjzr9bdL/IKHo1jATvU=;
        b=MWeqbL4ZpTWYDt8YOy0r1IbWEt4BCQKFjsZfafJ8O89MNIQp2Ib7AMR6wN8rsIWcPS
         wY9fNgwKvOjK5EVGl2GIk8eSxPu6DKtt+t5SHv+JGnRBT9nr9yeyiQcq2kpiMP2RPMA6
         vMXuPsyyqJWq/8GAQ6OX51G201/LYDOjeX95CusHGYFLMpOkwwlGh6O32P/8WOUh/rSv
         xvxoLFWjcf7OJFFr3ukztNlSgRLdThcImiQdoWqjzXAYC1bH6EANNHdd2lqvqeeLEgos
         bY3INh2k5kSTOqkMDhNiRoBvxt8W0f1ZNm9/S2UbCTmsnnjhTydK2z0iyU5SK0sURjUR
         R/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DCCUYWwiF/FmuCeEm8HO/gSdjjzr9bdL/IKHo1jATvU=;
        b=XHCpWGiRD7Jt0WCxWpbjVBuOq9MIUE4ryBlbD6dL8SSdhqOCDMwPqlaxq0D5Zs/tLh
         RfzWijwQd1IKqHiQW3HiE6w9jhSrgR9pUk7Qk2lnvLtT4BdHBd1Q7LO3lhLZ+TRB8/Zc
         YU7hjPiTXX2kgO9jM0ZoR2fsIhV6ZbPocNqcyQeEmYJoaFHfYyt0VdqrXioq+anaNlsI
         cxvKYLU9Ol0EzHP/fJ86xF9ygjiD1dnadDvM7Lx9xBhXwXWUQtcpLrnUIPy8vZfEpHlk
         k4dzezZJWsNjbGm/pVNiEJnyxGNYEshFqAPV+nj1Un9AAVyd+jwQ65gCUGRgHzbeCTgZ
         w2og==
X-Gm-Message-State: APjAAAU+9PMYBkWn8NCkUmWXVxklzuPATPPcLTL/5J6aYaHdS/YHNb94
        gK7aUkLqvhAxDFyjH+0m92OunD3XoyY=
X-Google-Smtp-Source: APXvYqxJ8bgPmEIQ5VtkrNJh9IWmzq/8VdbK7hRvPx0zt9blSVV9qQuBf25kd400QIEA/nFrLMOouQ==
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr642957lji.231.1563957511516;
        Wed, 24 Jul 2019 01:38:31 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id c19sm6869512lfi.39.2019.07.24.01.38.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 01:38:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] pinctrl: qcom: Pass irqchip when adding gpiochip
Date:   Wed, 24 Jul 2019 10:38:28 +0200
Message-Id: <20190724083828.7496-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7f35c196bb3e..73062e329f6f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1002,6 +1002,7 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 static int msm_gpio_init(struct msm_pinctrl *pctrl)
 {
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	int ret;
 	unsigned ngpio = pctrl->soc->ngpios;
 
@@ -1027,6 +1028,18 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
 	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
 
+	girq = &chip->irq;
+	girq->chip = &pctrl->irq_chip;
+	girq->parent_handler = msm_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(pctrl->dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+	girq->parents[0] = pctrl->irq;
+
 	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
@@ -1053,20 +1066,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 		}
 	}
 
-	ret = gpiochip_irqchip_add(chip,
-				   &pctrl->irq_chip,
-				   0,
-				   handle_edge_irq,
-				   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(pctrl->dev, "Failed to add irqchip to gpiochip\n");
-		gpiochip_remove(&pctrl->chip);
-		return -ENOSYS;
-	}
-
-	gpiochip_set_chained_irqchip(chip, &pctrl->irq_chip, pctrl->irq,
-				     msm_gpio_irq_handler);
-
 	return 0;
 }
 
-- 
2.21.0

