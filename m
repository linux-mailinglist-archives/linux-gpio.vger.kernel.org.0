Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3001C8BA0
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 16:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbfJBOpH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 10:45:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44576 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfJBOpH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 10:45:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so6859221wrl.11;
        Wed, 02 Oct 2019 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JbsRywd3P/upMxkLRZ+GFc95MVXDV5IdJYCkY7YwM5k=;
        b=K67F4O8mvksJgs8CKjINB40T6yZz2pqJ2M0n0u7I7JBKk4uK1a2a2j+a1xH4wF3bhc
         v86uuK6X8lyNLl7dpzdnaPZtH0IPZR+T/8b6M9BeKV90InNKkaoBosAOKj0R1uLlhcpm
         YokltHXTozZ/7vtbydA2yhBHNxRmFTjRQb99emSIjrhNEr/60vh2ZR1InPwWtRb9qRgB
         GECZJKeZbeg6krrwR2WYG8nGlevKKRxzEBroQSfwhBnnHP09XPoiIkrvJ7pyZFm4Sxcs
         /APzXGSG2+hLEHzF4ykuryR7UoJYfTZ1a5pN+DC0jBhsX4zzHo3Qa8+xsFdaFzvy0qaD
         ZsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JbsRywd3P/upMxkLRZ+GFc95MVXDV5IdJYCkY7YwM5k=;
        b=p7L4ONcHjALgO/sMQRDGW5LZM/niHLlLZN4kUzix9xZD8V3nB4Qdz2CemKP35yNTKM
         79BP7uNtAfEh+K8GLHWQxpvgfSEW3Kap1g4uiXL1tWqM3IzXhagPeyTTZIRDwiC5Nzzm
         jTPQC9opIamxb3VOZiqprMm8SdmGwNg4RU6PHPFqOoEMmvGKKE3FEXiAbTidQn5Ywvh6
         dVteZVgaBlGz+RU/heRC10XBbvUbNpW8YMj+SO3yqk+uvdmBkVCD9+yrzSdcwUxY3NrV
         8LEEMYQ7CwdCKVki9L7mPTc3xsTliCEfqgHj1v34b6HGUDAbd07BpuqGDm2YIWa01Gn7
         eh4A==
X-Gm-Message-State: APjAAAXvssJGDokR2WmdE17aZZGeeV672548N4fanPoV02P+WKDcVqqd
        Bc3/fs4i2OIrYv0FjbRot9U=
X-Google-Smtp-Source: APXvYqwdf0RXaNcaclHySoqLP0mzJAMyQKq+lPl9FcAe2vZADHpAdFD7qeATRax5B8IXKddJkMTjXQ==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr2889072wrr.70.1570027504922;
        Wed, 02 Oct 2019 07:45:04 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id z4sm15984346wrh.93.2019.10.02.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:45:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] gpio: tegra186: Implement system suspend/resume support
Date:   Wed,  2 Oct 2019 16:45:01 +0200
Message-Id: <20191002144502.156393-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Backup GPIO control registers on suspend and restore them on resume to
ensure that the GPIOs' configuration remains the same across suspend and
resume.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index a9058fda187e..3ded6ba2f997 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -64,6 +64,12 @@ struct tegra_gpio {
 	const struct tegra_gpio_soc *soc;
 
 	void __iomem *base;
+
+	struct tegra_gpio_context {
+		u32 value;
+		u32 control;
+		u32 config;
+	} *context;
 };
 
 static const struct tegra_gpio_port *
@@ -455,6 +461,11 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	for (i = 0; i < gpio->soc->num_ports; i++)
 		gpio->gpio.ngpio += gpio->soc->ports[i].pins;
 
+	gpio->context = devm_kmalloc_array(gpio->gpio.parent, gpio->gpio.ngpio,
+					   sizeof(*gpio->context), GFP_KERNEL);
+	if (!gpio->context)
+		return -ENOMEM;
+
 	names = devm_kcalloc(gpio->gpio.parent, gpio->gpio.ngpio,
 			     sizeof(*names), GFP_KERNEL);
 	if (!names)
@@ -526,6 +537,45 @@ static int tegra186_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int tegra186_gpio_suspend(struct device *dev)
+{
+	struct tegra_gpio *gpio = dev_get_drvdata(dev);
+	unsigned int i;
+
+	for (i = 0; i < gpio->gpio.ngpio; i++) {
+		struct tegra_gpio_context *context = &gpio->context[i];
+		void __iomem *base = tegra186_gpio_get_base(gpio, i);
+
+		context->config = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
+		context->control = readl(base + TEGRA186_GPIO_OUTPUT_CONTROL);
+		context->value = readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
+	}
+
+	return 0;
+}
+
+static int tegra186_gpio_resume(struct device *dev)
+{
+	struct tegra_gpio *gpio = dev_get_drvdata(dev);
+	unsigned int i;
+
+	for (i = 0; i < gpio->gpio.ngpio; i++) {
+		struct tegra_gpio_context *context = &gpio->context[i];
+		void __iomem *base = tegra186_gpio_get_base(gpio, i);
+
+		writel(context->value, base + TEGRA186_GPIO_OUTPUT_VALUE);
+		writel(context->control, base + TEGRA186_GPIO_OUTPUT_CONTROL);
+		writel(context->config, base + TEGRA186_GPIO_ENABLE_CONFIG);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra186_gpio_pm = {
+	.suspend_late = tegra186_gpio_suspend,
+	.resume_early = tegra186_gpio_resume,
+};
+
 #define TEGRA186_MAIN_GPIO_PORT(port, base, count, controller)	\
 	[TEGRA186_MAIN_GPIO_PORT_##port] = {			\
 		.name = #port,					\
@@ -680,6 +730,7 @@ static struct platform_driver tegra186_gpio_driver = {
 	.driver = {
 		.name = "tegra186-gpio",
 		.of_match_table = tegra186_gpio_of_match,
+		.pm = &tegra186_gpio_pm,
 	},
 	.probe = tegra186_gpio_probe,
 	.remove = tegra186_gpio_remove,
-- 
2.23.0

