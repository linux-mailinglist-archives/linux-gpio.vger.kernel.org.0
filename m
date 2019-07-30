Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 644DA7B19F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 20:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfG3STD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 14:19:03 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33561 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfG3SQ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 14:16:27 -0400
Received: by mail-pg1-f196.google.com with SMTP id f20so21248882pgj.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 11:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=798KcEGTrSwLx5Xm6lM4Wt7zSKkXup1N6a2rN1l+UxY=;
        b=XpWt56F9ZUXmWs3TPgoQ2NGKo/rPugYvYIBgS3UseXcF/J1rXuk4GMhje99H9mjZni
         Q0lEn/Lu+lOmX29Sx5qRLdFE17hm6H82MAdmRlvSX7giM257M826Wmux64CoLQKTOpa9
         czolyJSPK0NQDtxoPm1fygXMjN0QomV2SQwBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=798KcEGTrSwLx5Xm6lM4Wt7zSKkXup1N6a2rN1l+UxY=;
        b=Psfo9dOUkPVyZsU8Cfam2DFLgyquW1ufd5wM42HeMd69Dr425rYMKItCiy/f0Miecq
         mqiRyQlf1N8UfQarxVXAF8Up4PibeSLUwzVCqpvuFyB52elrb3VrrLUfMmUmOYG6zkIt
         RYRDfSOuhYwbBQNbdBWCHrled28JoNnYjJVBv94zLJFxGjf/g49GrSpU/4nKWM7Z0meI
         RnzrIY0JJJKyCtKaYrXISpr0SU6ocWkXz0oVvIkoIiB92S58P5LC4FczFqVeKwrHmh30
         wLV6NQk931+FBCOC8712qa4/R22jMgT94MqtSd1BuFHOB70R+h2ZPJX02TkX3eLyKT2n
         qVZw==
X-Gm-Message-State: APjAAAWg1b0YACZhsCIe4DFGzjS37SG1rYlDIAtOZJ1g2h+TvH4BVkDQ
        mUEBgBoMoTcduWOWSNPePYKGbg==
X-Google-Smtp-Source: APXvYqzNRIBqN8b5v2paGctHdWin+ApXWdXI47XHsE/7P2JmxL4D0RP51NvavvSimwV77P2m3C7cTw==
X-Received: by 2002:aa7:93bb:: with SMTP id x27mr44484534pff.10.1564510586198;
        Tue, 30 Jul 2019 11:16:26 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:25 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 33/57] pinctrl: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:33 -0700
Message-Id: <20190730181557.90391-34-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/pinctrl/pinctrl-amd.c           | 4 +---
 drivers/pinctrl/pinctrl-oxnas.c         | 4 +---
 drivers/pinctrl/pinctrl-pic32.c         | 4 +---
 drivers/pinctrl/pinctrl-stmfx.c         | 4 +---
 drivers/pinctrl/qcom/pinctrl-msm.c      | 4 +---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 5 +----
 6 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9b9c61e3f065..60d88e1df272 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -861,10 +861,8 @@ static int amd_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	irq_base = platform_get_irq(pdev, 0);
-	if (irq_base < 0) {
-		dev_err(&pdev->dev, "Failed to get gpio IRQ: %d\n", irq_base);
+	if (irq_base < 0)
 		return irq_base;
-	}
 
 #ifdef CONFIG_PM_SLEEP
 	gpio_dev->saved_regs = devm_kcalloc(&pdev->dev, amd_pinctrl_desc.npins,
diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
index b4edbe0d9a73..4f6a196a663a 100644
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ b/drivers/pinctrl/pinctrl-oxnas.c
@@ -1229,10 +1229,8 @@ static int oxnas_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(bank->reg_base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "irq get failed\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	bank->id = id;
 	bank->gpio_chip.parent = &pdev->dev;
diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index 6dc98e22f9f5..e7f6dd5ab578 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2222,10 +2222,8 @@ static int pic32_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(bank->reg_base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "irq get failed\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	bank->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(bank->clk)) {
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index d3332da35637..5735ef5a71d5 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -608,10 +608,8 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		dev_err(pctl->dev, "failed to get irq\n");
+	if (irq <= 0)
 		return -ENXIO;
-	}
 
 	mutex_init(&pctl->lock);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7f35c196bb3e..45975ed31205 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1160,10 +1160,8 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	msm_pinctrl_setup_pm_reset(pctrl);
 
 	pctrl->irq = platform_get_irq(pdev, 0);
-	if (pctrl->irq < 0) {
-		dev_err(&pdev->dev, "No interrupt defined for msmgpio\n");
+	if (pctrl->irq < 0)
 		return pctrl->irq;
-	}
 
 	pctrl->desc.owner = THIS_MODULE;
 	pctrl->desc.pctlops = &msm_pinctrl_ops;
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 076ba085a6a1..3d8b1d74fa2f 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -791,11 +791,8 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
 	for (i = 0; i < pctrl->desc.npins; i++) {
 		pin_data[i].reg = SSBI_REG_ADDR_MPP(i);
 		pin_data[i].irq = platform_get_irq(pdev, i);
-		if (pin_data[i].irq < 0) {
-			dev_err(&pdev->dev,
-				"missing interrupts for pin %d\n", i);
+		if (pin_data[i].irq < 0)
 			return pin_data[i].irq;
-		}
 
 		ret = pm8xxx_pin_populate(pctrl, &pin_data[i]);
 		if (ret)
-- 
Sent by a computer through tubes

