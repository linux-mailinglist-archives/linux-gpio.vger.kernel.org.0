Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3DAB17BC6C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 13:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgCFMM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 07:12:26 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:32905 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbgCFMM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 07:12:26 -0500
Received: by mail-lf1-f67.google.com with SMTP id c20so1757526lfb.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2020 04:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MdGLbXy1B+XD+XeVWDRp+Nncre/eMQNyqszADUGHI/E=;
        b=U98TlMWc0ETX7ITPk2EBkznugDxokNO8grELVoCdAPYy56inrAKLX4QoKdie2XeLt8
         7bQe7zuoXKVdZmGxFof9IkKlO/WEuuLm2C6sTbbmsIqWLGpTXOavL8v62CsjQJrCA7Ty
         r2ytlDJCL5zMvOqaTyd5ZTW/YU+Cf7jV1k9O7+V0D571UUwmYvAo3kL967Qfa+I7TcSn
         fvmdCup28viSct+XkpWPBtlRhZ6Gtbto3NS6XqsdYDjEK3qyOGIqote42SkPLBnQe7fq
         TO0d2tFF6gAHFz035c88r+39Owf3kqreeALQWwkIvW6AiCIJ19MxjQ2eAOxlopVvilMD
         fVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MdGLbXy1B+XD+XeVWDRp+Nncre/eMQNyqszADUGHI/E=;
        b=qZ0KUmlR1bSqXeikDLnnxzzL0chi9nnNIpN2h1IsYT3NBqvmlLSofPGXVJ2BDwzTcl
         3RnSpKzf5DcJuP+5x792/nuMUlMx7e7Wz4mCeMFvO+06nId6l01l+QvM90JsrSeDdv+X
         jGRVtTxeFN6Lz/pYEhEBx2fuUx2jlyIgDGnL8cM/x/Tjb8omoualUe/nufN9BQ9eEKKu
         73bHpJmVdreuGZvyuB/c8XJrC+kWZUQIsxtoRIJQbZPDge0AcJ+Epshs6sE+RN0CM89m
         FbHDEyumETtTzMa7SzIGEHnlLe6Qkjhx4XhhD9cDgEUtY/sW1BwpZDPXUXvxUnP81boo
         nrRQ==
X-Gm-Message-State: ANhLgQ3ZNX9XNYxVZ7jOJcM9Xt/cwl/tPkX9aBOuJOCpSLZkr67jCJvo
        4wNDR1fqFqZGdWFuTI+e74BwImT5u94=
X-Google-Smtp-Source: ADFU+vsdxv9EKXCC75n0AXj6pYl9BU2DcF9kaZTVaUWJGGSi0JL+PM1v6wqQ65nQvY1SRw4LrBHxCw==
X-Received: by 2002:ac2:529c:: with SMTP id q28mr1798946lfm.59.1583496743953;
        Fri, 06 Mar 2020 04:12:23 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id u16sm16829780lfl.23.2020.03.06.04.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 04:12:23 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, stable@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: Guard irq_eoi()
Date:   Fri,  6 Mar 2020 13:12:21 +0100
Message-Id: <20200306121221.1231296-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the commit setting up the qcom/msm pin controller to
be hierarchical some callbacks were careful to check that
d->parent_data on irq_data was valid before calling the
parent function, however irq_chip_eoi_parent() was called
unconditionally which doesn't work with elder Qualcomm
platforms such as APQ8060.

When the drivers/mfd/qcom-pm8xxx.c driver calls
chained_irq_exit() that call will in turn call chip->irq_eoi()
which is set to irq_chip_eoi_parent() by default on a
hierachical IRQ chip, and the parent is pinctrl-msm.c
so that will in turn unconditionally call
irq_chip_eoi_parent() again, but its parent is invalid
so we get the following crash:

 Unnable to handle kernel NULL pointer dereference at
 virtual address 00000010
 pgd = (ptrval)
 [00000010] *pgd=00000000
 Internal error: Oops: 5 [#1] PREEMPT SMP ARM
 (...)
 PC is at irq_chip_eoi_parent+0x4/0x10
 LR is at pm8xxx_irq_handler+0x1b4/0x2d8

Implement a local stub just avoiding to call down to
irq_chip_eoi_parent() if d->parent_data is not set.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: stable@vger.kernel.org
Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9a8daa256a32..511f596cf2c3 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -828,6 +828,12 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 	msm_gpio_irq_clear_unmask(d, false);
 }
 
+static void msm_gpio_irq_eoi(struct irq_data *d)
+{
+	if (d->parent_data)
+		irq_chip_eoi_parent(d);
+}
+
 static void msm_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -1104,7 +1110,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
 	pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
-	pctrl->irq_chip.irq_eoi = irq_chip_eoi_parent;
+	pctrl->irq_chip.irq_eoi = msm_gpio_irq_eoi;
 	pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
 	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
 	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
-- 
2.24.1

