Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A543048B803
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 21:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242898AbiAKUPX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 15:15:23 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37744
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242489AbiAKUPU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 15:15:20 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BC68240049
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932118;
        bh=d5pGhmqJ0JRQXzooQo2hGyeaXgPlX3UQHjrncRGcciU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=QHinbmk/hEe8kxmSqWnKfU9mpCK0LcV8zcVMzPd8qs5AnDp2Tcl37Qf9BLAFPPyx7
         RtGr8UeyeLIB0zqpMdvf6UgKSshBrTUIBF2R7Le6V7NasTT0AlWpVBW0GDcHs1vUnc
         +zVdVDrKbSSiaXZMKb43tzQHYbbgj708RpBnIEqQTaKKuL6cF6NGkEgGkevmpIBlh/
         yeMSOqUiWSCzhMMgUh2mKtw//XlHIbE7+beYeTK8ynkdSLDoAwXdMQBB6H/bZ0KPBd
         uAiX2KY07vwNovuMqmi7YRC94BckYXq0XrguKl5BLfHY/c6VJvAnC2vr0PMKDQgyr+
         6HGCHn5BRiThg==
Received: by mail-ed1-f70.google.com with SMTP id h11-20020a05640250cb00b003fa024f87c2so205357edb.4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 12:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d5pGhmqJ0JRQXzooQo2hGyeaXgPlX3UQHjrncRGcciU=;
        b=xE5uahPosFD7cvVjcuJWAEZYEmgNss8wekOw3ZlKUdQptGbcashhS5QUkwAIwUX88j
         kuNsed+to3fn+8hb6QRDbLHzJVCZrlFZBVDvlNrsUTkblcv3qJtNTE7Yon3FgMCIVu6y
         f+xjmVFFkTN0ooXikCbPzhTagvI2zfIYepFFk0/8de6NyytdfOwkB68oQZ8a2JQdLFRz
         vAE/TBil2vujIl4uVn+RdLw/jXekVwthDG5JmXNU0sSRdKl5+uAtmSWXArbTTQItZkI6
         /IWnjWa6v/ZXJh8Yv3eCi3IAnHbONgN1oM8S1lelzSe3STxhO3lUWHvbMn9Ws4uWQcFE
         /HEA==
X-Gm-Message-State: AOAM530+nm3plmGSQIqJceKz54u+Z901hHWe1zplAfax9+B9mSvhZGl3
        oq0T6NPYkktqftNtT6SkpvqdWU0B13LLiib8jodBLdht/krnwuuU8W5xmfJy2AtaQzwYLSkvq9A
        vmXA0HlK+X9GxSd+hXRpy/KFo2mtIUDgBjS6biTM=
X-Received: by 2002:a17:907:ea2:: with SMTP id ho34mr4926910ejc.168.1641932117432;
        Tue, 11 Jan 2022 12:15:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVXIzemSiT3Glycmt0qLBDrfwwgWfKCYqgbL01msK36gJb1e8KFMLVuCJzheYC99dB0RaOlw==
X-Received: by 2002:a17:907:ea2:: with SMTP id ho34mr4926894ejc.168.1641932117257;
        Tue, 11 Jan 2022 12:15:17 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f23sm3852212ejj.128.2022.01.11.12.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:15:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v2 01/28] pinctrl: samsung: drop pin banks references on error paths
Date:   Tue, 11 Jan 2022 21:13:59 +0100
Message-Id: <20220111201426.326777-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver iterates over its devicetree children with
for_each_child_of_node() and stores for later found node pointer.  This
has to be put in error paths to avoid leak during re-probing.

Fixes: ab663789d697 ("pinctrl: samsung: Match pin banks with their device nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++++++++------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 8941f658e7f1..b19ebc43d886 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1002,6 +1002,16 @@ samsung_pinctrl_get_soc_data_for_of_alias(struct platform_device *pdev)
 	return &(of_data->ctrl[id]);
 }
 
+static void samsung_banks_of_node_put(struct samsung_pinctrl_drv_data *d)
+{
+	struct samsung_pin_bank *bank;
+	unsigned int i;
+
+	bank = d->pin_banks;
+	for (i = 0; i < d->nr_banks; ++i, ++bank)
+		of_node_put(bank->of_node);
+}
+
 /* retrieve the soc specific data */
 static const struct samsung_pin_ctrl *
 samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
@@ -1116,19 +1126,19 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	if (ctrl->retention_data) {
 		drvdata->retention_ctrl = ctrl->retention_data->init(drvdata,
 							  ctrl->retention_data);
-		if (IS_ERR(drvdata->retention_ctrl))
-			return PTR_ERR(drvdata->retention_ctrl);
+		if (IS_ERR(drvdata->retention_ctrl)) {
+			ret = PTR_ERR(drvdata->retention_ctrl);
+			goto err_put_banks;
+		}
 	}
 
 	ret = samsung_pinctrl_register(pdev, drvdata);
 	if (ret)
-		return ret;
+		goto err_put_banks;
 
 	ret = samsung_gpiolib_register(pdev, drvdata);
-	if (ret) {
-		samsung_pinctrl_unregister(pdev, drvdata);
-		return ret;
-	}
+	if (ret)
+		goto err_unregister;
 
 	if (ctrl->eint_gpio_init)
 		ctrl->eint_gpio_init(drvdata);
@@ -1138,6 +1148,12 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, drvdata);
 
 	return 0;
+
+err_unregister:
+	samsung_pinctrl_unregister(pdev, drvdata);
+err_put_banks:
+	samsung_banks_of_node_put(drvdata);
+	return ret;
 }
 
 /*
-- 
2.32.0

