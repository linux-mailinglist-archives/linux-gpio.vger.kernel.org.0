Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2308CF4FC8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 16:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfKHPeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 10:34:07 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35391 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfKHPeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 10:34:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id p2so7566001wro.2;
        Fri, 08 Nov 2019 07:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WdDeW92y2qVE79DyNTa3Tmgwm1hcpTXyayh05y5HvXM=;
        b=rR4knMDBNkPBLV86qZHf+E2ul05xOxZEMa4RQJ32Wc4cmgi6mJquEpEklLnTX7giQS
         biT7bRxx04I2X+PHMo72hBnvNH+23Gd2DrOlHc0nf/DYQs0QFuI8SXXuNR3IsIyMPGtv
         ZEJHvuL/YrRUojUEG5A9MdlhA/5y2H9SeMrdJaO6MVoDr1R5PiRmMA/IqX1rx5TE0kwP
         O9X4e/k2OA6/AjeDSX78Hc8hvDa9HZ4WF/g3YbyCJbMJMYyoKeqxgzjwDnc/DnrsyeWE
         Hs+AocfrXtzVEgJEpffEJoEMv/FXA9wYxS3iRA3i8Bf6ItHJzkn5Np6xNbkyVru/aNhs
         IawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WdDeW92y2qVE79DyNTa3Tmgwm1hcpTXyayh05y5HvXM=;
        b=A2TKsJb4NzvwU14d7BNBtBKEZiZGMwl9BjVfPBJKZ56x7rsmu4yMHbaSeqajy+qMVA
         qIqT6nQseFT40UqZzT4jBYWeIh1aYEulAub2QzJcWO6c57w/AlV+3rzC8gtGlDikfPdP
         obbp77ke7VK/ZntYm8hrYdGLCqIK+XcjbFB0VLr/77ih4iKzZfAxjRMSflkNYZP0SvWk
         E0uykYUZyX0avKEDKu3qTI8zzaJ27LpXAns/KdtGFYx2dFC8MU6x9Nwt4F2f/Twh6+rg
         ktfZlN4TYmt4cB3v0mTso8XimMubh5+dWulF/+r75d9XxORBDjBsZF18Q01eNHQYBF/T
         PJxQ==
X-Gm-Message-State: APjAAAWghrGso4BFvTxCSWl4mTRWRwBoR92lLyF1yYLq1IaaeOTWsC9a
        87OPULAV/IWvvCgP650tVP8=
X-Google-Smtp-Source: APXvYqzA8/kKsU1H/Po9xAu76KMyfyhzuZOd7S9nsF20IXlCbrsC2qq+qAaBWyqjHrN/MV2qU1j40A==
X-Received: by 2002:adf:e505:: with SMTP id j5mr8628053wrm.46.1573227244646;
        Fri, 08 Nov 2019 07:34:04 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id v16sm7447226wrc.84.2019.11.08.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:34:03 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] gpio: tegra186: Add debounce support
Date:   Fri,  8 Nov 2019 16:33:53 +0100
Message-Id: <20191108153353.3149078-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108153353.3149078-1-thierry.reding@gmail.com>
References: <20191108153353.3149078-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPIO controller found on Tegra186 and later supports debouncing for
inputs for up to 255 ms.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 404ebb82bfa2..c4e23f530664 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -32,6 +32,7 @@
 #define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_DOUBLE_EDGE (0x3 << 2)
 #define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_MASK (0x3 << 2)
 #define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL BIT(4)
+#define  TEGRA186_GPIO_ENABLE_CONFIG_DEBOUNCE BIT(5)
 #define  TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT BIT(6)
 
 #define TEGRA186_GPIO_DEBOUNCE_CONTROL 0x04
@@ -217,6 +218,42 @@ static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	writel(value, base + TEGRA186_GPIO_OUTPUT_VALUE);
 }
 
+static int tegra186_gpio_set_config(struct gpio_chip *chip,
+				    unsigned int offset,
+				    unsigned long config)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+	u32 debounce, value;
+	void __iomem *base;
+
+	base = tegra186_gpio_get_base(gpio, offset);
+	if (base == NULL)
+		return -ENXIO;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
+
+	/*
+	 * The Tegra186 GPIO controller supports a maximum of 255 ms debounce
+	 * time.
+	 */
+	if (debounce > 255000)
+		return -EINVAL;
+
+	debounce = DIV_ROUND_UP(debounce, USEC_PER_MSEC);
+
+	value = TEGRA186_GPIO_DEBOUNCE_CONTROL_THRESHOLD(debounce);
+	writel(value, base + TEGRA186_GPIO_DEBOUNCE_CONTROL);
+
+	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
+	value |= TEGRA186_GPIO_ENABLE_CONFIG_DEBOUNCE;
+	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
+
+	return 0;
+}
+
 static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
 				  const struct of_phandle_args *spec,
 				  u32 *flags)
@@ -539,6 +576,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->gpio.direction_output = tegra186_gpio_direction_output;
 	gpio->gpio.get = tegra186_gpio_get,
 	gpio->gpio.set = tegra186_gpio_set;
+	gpio->gpio.set_config = tegra186_gpio_set_config;
 
 	gpio->gpio.base = -1;
 
-- 
2.23.0

