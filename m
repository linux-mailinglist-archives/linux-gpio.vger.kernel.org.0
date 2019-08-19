Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D441C9205A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 11:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfHSJbG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 05:31:06 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37200 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbfHSJbF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 05:31:05 -0400
Received: by mail-lf1-f65.google.com with SMTP id c9so896589lfh.4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2019 02:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Oha65tTiE8y2ga7ugs6EJqRA+vmk14Daxp04mibMg4=;
        b=LkSQP7giGMD/biydF+x/mSkzOvuwBMw/jiXpA84XNOLkST0LBszOPIzL0OufGJ9ML0
         tvekrLGWwiPOitLpJMsiZl21pf9JArjby1XGAyHSma7n0YW+0kHCF2w67YjKuIqbgP/E
         P+qRuBBgzSGP9VRIHlRFocLwxLczdSdSPj24IEJ2heaMJS6Y3KDqJOlMsAOXytc6HXbR
         GdiqNKqAsLaAES5yufo/nKM7uGHAEPjQTkVA11jZxg0oyGbYDuRLHNjGd6SKEab2YfAp
         AWU2tmDZSL2VEY3eTOnJooPWVBCnggOG7C94r6Dtx6TUc5k4NfNrwn99XD6yXQB17PUt
         uv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Oha65tTiE8y2ga7ugs6EJqRA+vmk14Daxp04mibMg4=;
        b=oeEKg613r/P/3USrwE3Q2Rp6fA5MnAd39xfOlTnB13vBisbSofWj/gNL74iJxVJjny
         /bBAgZi+BiVthlJBRCCamtfHR1Nlm7gTTMc38b37Fw46/IEDU1tkNoCOVQUjk2I1oXyp
         ZYV9MEo//lSNuleiyhUvYfVR2el9Wv8Rq5DA8dkAAOtPRyrdcaE4omollm8guQhocXYF
         7uNfyn/Gj92zIUReQ/0WqfOtUEEg6TAqVTfCb8SoS9aAuqGz84IOyr5ZbA8WaC1OGehU
         1hXXrTJWXqJyF0pqAlBDwMQif9Z5A8NynebTquwriSyxRCwxC+dOQC0GeiZnrb4KYDVP
         shlQ==
X-Gm-Message-State: APjAAAVAGwk8xadMjeZUKXHF5hBHUmOIY5n++AUz/8m38oQB1Cs5v8rC
        lZkev4yclK0o3Pb+4ECuS1vvZw7Upi4=
X-Google-Smtp-Source: APXvYqzI9r5HymzanjG8iaxSkgWhV5R8N0Bp9kwsELLugI0ofFVYsHMRlv7COL8bdm70YBOXqrfQaw==
X-Received: by 2002:ac2:5336:: with SMTP id f22mr11519074lfh.180.1566207062665;
        Mon, 19 Aug 2019 02:31:02 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id 2sm2258237lfr.76.2019.08.19.02.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 02:31:01 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] gpio: Use callback presence to determine need of valid_mask
Date:   Mon, 19 Aug 2019 11:30:58 +0200
Message-Id: <20190819093058.10863-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After we switched the two drivers that have .need_valid_mask
set to use the callback for setting up the .valid_mask,
we can just use the presence of the .init_valid_mask()
callback (or the OF reserved ranges, nota bene) to determine
whether to allocate the mask or not and we can drop the
.need_valid_mask field altogether.

Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c             | 4 +---
 drivers/pinctrl/pinctrl-stmfx.c    | 1 -
 drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
 include/linux/gpio/driver.h        | 9 ---------
 4 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 22b87c6e8cd5..01aa5440454c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -363,9 +363,7 @@ static unsigned long *gpiochip_allocate_mask(struct gpio_chip *chip)
 
 static int gpiochip_alloc_valid_mask(struct gpio_chip *gc)
 {
-	if (of_gpio_need_valid_mask(gc))
-		gc->need_valid_mask = true;
-	if (!gc->need_valid_mask)
+	if (!(of_gpio_need_valid_mask(gc) || gc->init_valid_mask))
 		return 0;
 
 	gc->valid_mask = gpiochip_allocate_mask(gc);
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 13b6d6f72bcc..dd5aa9a2dfe5 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -662,7 +662,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
 	pctl->gpio_chip.can_sleep = true;
 	pctl->gpio_chip.of_node = np;
-	pctl->gpio_chip.need_valid_mask = true;
 	pctl->gpio_chip.init_valid_mask = stmfx_pinctrl_gpio_init_valid_mask;
 
 	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5d8f75da4a7..b8a1c43222f8 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -654,7 +654,6 @@ static const struct gpio_chip msm_gpio_template = {
 	.request          = gpiochip_generic_request,
 	.free             = gpiochip_generic_free,
 	.dbg_show         = msm_gpio_dbg_show,
-	.init_valid_mask  = msm_gpio_init_valid_mask,
 };
 
 /* For dual-edge interrupts in software, since some hardware has no
@@ -1016,7 +1015,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	chip->parent = pctrl->dev;
 	chip->owner = THIS_MODULE;
 	chip->of_node = pctrl->dev->of_node;
-	chip->need_valid_mask = msm_gpio_needs_valid_mask(pctrl);
+	if (msm_gpio_needs_valid_mask(pctrl))
+		chip->init_valid_mask = msm_gpio_init_valid_mask;
 
 	pctrl->irq_chip.name = "msmgpio";
 	pctrl->irq_chip.irq_enable = msm_gpio_irq_enable;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index dc03323897ef..340121c7d2fb 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -403,15 +403,6 @@ struct gpio_chip {
 	struct gpio_irq_chip irq;
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
-	/**
-	 * @need_valid_mask:
-	 *
-	 * If set core allocates @valid_mask with all its values initialized
-	 * with init_valid_mask() or set to one if init_valid_mask() is not
-	 * defined
-	 */
-	bool need_valid_mask;
-
 	/**
 	 * @valid_mask:
 	 *
-- 
2.21.0

