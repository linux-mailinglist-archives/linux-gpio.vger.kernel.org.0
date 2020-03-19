Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56D0D18B35F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgCSM1x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:27:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36498 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgCSM1w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:27:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id s5so2730762wrg.3;
        Thu, 19 Mar 2020 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6XGGwd58x1tIrKYtTKRUFuzcIG+rY+V6D5niSMczhjw=;
        b=B1bawgSbk+h8bCvAjt4FkOMoOfLyvnduQFXIxc0JZqMVD0PXtnacEzGBuwDBrvDjG+
         UZvg5KPdsSF+U4cHsNttF9vcIpAHD/80iXiCdzCLhP/sR5mnYuCeaOwY1gzjd2pp5Qqu
         rxXwG5q11fsIaiJH+Ri4hYHILUq0ZqIBEvkxeiPTG/jvwnGkWYtPnzkgZWuu6ObrPMb8
         ZDFSdb72+p2wXafC3kwVJ1hANW7JMUM2ylD5UvDUkovulYO24VRjvudx3Dqj4XOf0ZwQ
         8blFIgdvkVx16+4m+NLkT1Q411kOC0Ozyja6ifaqJH9NDxH+2pKO5M9iHz6d3E9clJ6S
         tJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6XGGwd58x1tIrKYtTKRUFuzcIG+rY+V6D5niSMczhjw=;
        b=aA9uctGwnN7LPB64yvtIkBN9Q+ewwPYMSEEOBTNs7e4J6LCHN1Q1Nmjmr8FiKGnBSd
         xePpJCvchmpsa85gKISqhz9ggnlnUNF7o4a43ZX93rclXAfZ6hwxA+wT7+DB27wougcQ
         zHCD3eNlO78fFrM39KGtEIoRtXh/3T4WgsUeNGARffieadMXva+lFIxnoZsP3fC2ap++
         O10N6E5AZCRxtd7+4hGZC2kG6JRjhaKrZ9nl0/Q0R/r2yUCUPn7KOpTIaUQikOad851a
         Vn3OEYVpIguGCpkCUFi0UQ18pHtradOvXlNzCAVIvmBs9JlZ9QaYmUg2atDaLA79NZOR
         E2HA==
X-Gm-Message-State: ANhLgQ3Wn2QNnrzldyEk3FR0pRfy4/UBwsCRfZ4h9cb0D6Vo3GBVTDs3
        QRmX4MQ+Yb8i5zfHoWsQFbI=
X-Google-Smtp-Source: ADFU+vv+jTESfVx62AgIpm0GK2s/ym5wLhPNwa+PVZIr9T7tG1MgONTPEBbZbdgS6TgE3uoKnB1v1g==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr3921299wrq.216.1584620868669;
        Thu, 19 Mar 2020 05:27:48 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id w1sm2813779wmc.11.2020.03.19.05.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:27:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/9] gpio: tegra186: Add support for pin ranges
Date:   Thu, 19 Mar 2020 13:27:30 +0100
Message-Id: <20200319122737.3063291-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319122737.3063291-1-thierry.reding@gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add support for Tegra SoC generations to specify a list of pin ranges
that map GPIOs to ranges of pins in the pin controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index de241263d4be..1086c1fcaf49 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -58,11 +58,20 @@ struct tegra_gpio_port {
 	unsigned int pins;
 };
 
+struct tegra186_pin_range {
+	unsigned int offset;
+	const char *group;
+};
+
 struct tegra_gpio_soc {
 	const struct tegra_gpio_port *ports;
 	unsigned int num_ports;
 	const char *name;
 	unsigned int instance;
+
+	const struct tegra186_pin_range *pin_ranges;
+	unsigned int num_pin_ranges;
+	const char *pinmux;
 };
 
 struct tegra_gpio {
@@ -254,6 +263,50 @@ static int tegra186_gpio_set_config(struct gpio_chip *chip,
 	return 0;
 }
 
+static int tegra186_gpio_add_pin_ranges(struct gpio_chip *chip)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+	struct pinctrl_dev *pctldev;
+	struct device_node *np;
+	unsigned int i, j;
+	int err;
+
+	if (!gpio->soc->pinmux || gpio->soc->num_pin_ranges == 0)
+		return 0;
+
+	np = of_find_compatible_node(NULL, NULL, gpio->soc->pinmux);
+	if (!np)
+		return -ENODEV;
+
+	pctldev = of_pinctrl_get(np);
+	of_node_put(np);
+	if (!pctldev)
+		return -EPROBE_DEFER;
+
+	for (i = 0; i < gpio->soc->num_pin_ranges; i++) {
+		unsigned int pin = gpio->soc->pin_ranges[i].offset, port;
+		const char *group = gpio->soc->pin_ranges[i].group;
+
+		port = pin / 8;
+		pin = pin % 8;
+
+		if (port >= gpio->soc->num_ports) {
+			dev_warn(chip->parent, "invalid port %u for %s\n",
+				 port, group);
+			continue;
+		}
+
+		for (j = 0; j < port; j++)
+			pin += gpio->soc->ports[j].pins;
+
+		err = gpiochip_add_pingroup_range(chip, pctldev, pin, group);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 static int tegra186_gpio_of_xlate(struct gpio_chip *chip,
 				  const struct of_phandle_args *spec,
 				  u32 *flags)
@@ -578,12 +631,15 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->gpio.label = gpio->soc->name;
 	gpio->gpio.parent = &pdev->dev;
 
+	gpio->gpio.request = gpiochip_generic_request;
+	gpio->gpio.free = gpiochip_generic_free;
 	gpio->gpio.get_direction = tegra186_gpio_get_direction;
 	gpio->gpio.direction_input = tegra186_gpio_direction_input;
 	gpio->gpio.direction_output = tegra186_gpio_direction_output;
 	gpio->gpio.get = tegra186_gpio_get,
 	gpio->gpio.set = tegra186_gpio_set;
 	gpio->gpio.set_config = tegra186_gpio_set_config;
+	gpio->gpio.add_pin_ranges = tegra186_gpio_add_pin_ranges;
 
 	gpio->gpio.base = -1;
 
-- 
2.24.1

