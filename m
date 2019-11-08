Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2EE8F4FC6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 16:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbfKHPeE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 10:34:04 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37524 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfKHPeD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 10:34:03 -0500
Received: by mail-wm1-f66.google.com with SMTP id q130so6664054wme.2;
        Fri, 08 Nov 2019 07:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LAavGvCqSznA3tJZo3lxl308Kc3DzbSW8U7Et/sjyOg=;
        b=A/Qgt2Xyey05nSNN7RNb+0v/0FLgf9ei4XBbPUltsJDrfK+3x/FJcJDNbV4v8bNUgn
         S1SoeOUJXidR+4guUhy3IFZdcRoGxyOXugmmvFsHYTfqoY1prXQHcZE1UGA31RSnxXKr
         sRlq2YbJqQtwrN9sEs1ulFH0jnfv4XKs2MnqvxtHQ4Y7WIC3V8eKPV/NlNVU8hQQ+U+j
         uvnkx+E7MQktzdszy9oDJmDfwY5/FwAlROZRBnWxPlHnlJyblv5pjrQCU34rtvVUHgId
         pWf7haz+PqYqBhEysyEFwk6U/GdWPZKbRHMXcb6YDvXU5L66htwTFGqoCPlKCKjd77Yz
         mt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAavGvCqSznA3tJZo3lxl308Kc3DzbSW8U7Et/sjyOg=;
        b=ZZlbnV4LXOVwAtzyjgG6qjgZ9v0d9AhjBfz6ATOQcgjHCGxplVnJNreEpezhH5ei+6
         XUdgvNPT4GjzfIWuTt41th7J0aDzC/IjFWmOLw2kaG38XjzD/DE5O8EDmWn1otDVDkFA
         tuYn3rZ/EUXHMTDyPg4E+owTY7E3fhvLqXxwoVvcDXCFdGJvs4kg+YsFwdzQOovEEBre
         3v6MJahN7dHx/cXV3lnRoj5zYQOqVK4Sn2xyjsPnBAtaspaiEVRDr7sQC2u+6UxTmaH8
         4xwIL+DB8Yz0JFlzxKp1XT11yZmjVp3XPRE8cBqrwTqOCFZdF42cfJSodtQNEcqk67hl
         vDDQ==
X-Gm-Message-State: APjAAAVTFKXcOj4cI/QfuUFeua7h11KUqCxdB9WrUVhyhK3aChqy8WXd
        yZmY0ruMNLo8UoH+nCx+JICadL/VTss=
X-Google-Smtp-Source: APXvYqwOj+XnyKhVi1oYRjlmpdOZ2zgHeGTxitVyALBcqy+avHQ7JC8A56t8iiDH/YlhUgNemrXDSQ==
X-Received: by 2002:a1c:200f:: with SMTP id g15mr9057085wmg.96.1573227241527;
        Fri, 08 Nov 2019 07:34:01 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id i71sm11468384wri.68.2019.11.08.07.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:33:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] gpio: tegra186: Program interrupt route mapping
Date:   Fri,  8 Nov 2019 16:33:52 +0100
Message-Id: <20191108153353.3149078-2-thierry.reding@gmail.com>
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

The controls for the GG port on Tegra194 resides in the power partition
of the C5 PCIe controller and its interrupt route mapping can therefore
not be programmed by early boot firmware along with that of the other
ports.

Detect this generically by looking at which controls have already been
locked down using the security registers and fill in default values for
controls that are unlocked.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 46 ++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 32714cefdfde..404ebb82bfa2 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -15,6 +15,14 @@
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
 
+/* security registers */
+#define TEGRA186_GPIO_CTL_SCR 0x0c
+#define  TEGRA186_GPIO_CTL_SCR_SEC_WEN BIT(28)
+#define  TEGRA186_GPIO_CTL_SCR_SEC_REN BIT(27)
+
+#define TEGRA186_GPIO_INT_ROUTE_MAPPING(p, x) (0x14 + (p) * 0x20 + (x) * 4)
+
+/* control registers */
 #define TEGRA186_GPIO_ENABLE_CONFIG 0x00
 #define  TEGRA186_GPIO_ENABLE_CONFIG_ENABLE BIT(0)
 #define  TEGRA186_GPIO_ENABLE_CONFIG_OUT BIT(1)
@@ -64,6 +72,7 @@ struct tegra_gpio {
 
 	const struct tegra_gpio_soc *soc;
 
+	void __iomem *secure;
 	void __iomem *base;
 };
 
@@ -449,6 +458,37 @@ static const struct of_device_id tegra186_pmc_of_match[] = {
 	{ /* sentinel */ }
 };
 
+static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
+{
+	unsigned int i, j;
+	u32 value;
+
+	for (i = 0; i < gpio->soc->num_ports; i++) {
+		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
+		unsigned int offset, p = port->port;
+		void __iomem *base;
+
+		base = gpio->secure + port->bank * 0x1000 + 0x800;
+
+		value = readl(base + TEGRA186_GPIO_CTL_SCR);
+
+		/*
+		 * For controllers that haven't been locked down yet, make
+		 * sure to program the default interrupt route mapping.
+		 */
+		if ((value & TEGRA186_GPIO_CTL_SCR_SEC_REN) == 0 &&
+		    (value & TEGRA186_GPIO_CTL_SCR_SEC_WEN) == 0) {
+			for (j = 0; j < 8; j++) {
+				offset = TEGRA186_GPIO_INT_ROUTE_MAPPING(p, j);
+
+				value = readl(base + offset);
+				value = BIT(port->pins) - 1;
+				writel(value, base + offset);
+			}
+		}
+	}
+}
+
 static int tegra186_gpio_probe(struct platform_device *pdev)
 {
 	unsigned int i, j, offset;
@@ -464,6 +504,10 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	gpio->soc = of_device_get_match_data(&pdev->dev);
 
+	gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
+	if (IS_ERR(gpio->secure))
+		return PTR_ERR(gpio->secure);
+
 	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
@@ -558,6 +602,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 			return -EPROBE_DEFER;
 	}
 
+	tegra186_gpio_init_route_mapping(gpio);
+
 	irq->map = devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
 				sizeof(*irq->map), GFP_KERNEL);
 	if (!irq->map)
-- 
2.23.0

