Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F50A568D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2019 14:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbfIBMqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Sep 2019 08:46:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38795 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730836AbfIBMqJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2019 08:46:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id h195so2407373pfe.5
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2019 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=typeblog-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i1gf/fWXrC1UDTPa/HgYMmRTeFmFTDpK3Sjfi5JLiP4=;
        b=zuYm0kxlA3UZd2AfAZGCdmm0KMcyb3mO+Fa2dTsIu7PMGg/o0oB9QMBj3eyUs25sME
         qfaiEmW1dsnRr8Q6YQ3ttGpIzNQD5H8fjPswWN9tBzXWgHdfRZDFIUTvA7NuJLBB5ESw
         9LCUT1z0PQIQQEga3BFk9A89Cs8zO3QnJwgX3SssBQDFVjFO3cEelI6wkA5REqw9Xc3M
         +CGIibhrTO96fKD2Zmo8km7LqiSsvThXZYEezUs3mv4XxwQNjkbl7lhVtKr+X5KuXZNO
         GGWbnB4EP9thVZi70ghAhQ42jXnnJ0k7Cz9IPX6Dyu908F8HSsA2JJNKGr9EE/3lDty9
         zdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1gf/fWXrC1UDTPa/HgYMmRTeFmFTDpK3Sjfi5JLiP4=;
        b=YQN5mcrKvjToG1qNV5VF7CVSrLG/oxrkJAAqEWUsJyy8UGYZKDDnvc2Wu3BNye0B5c
         Nvff0vHUFUFCdG21maeMz+6rlBqHpsJXcexyoIq7txecXpkE5tWx8ezRsHIL3cA4oYE1
         LRLytLHO/cdJIVWFIl4XJIxxEsFpzOre9cGunh1c/sN7C9yhoo5webkEl/N2xjBkbPB8
         Qvo1rj0yxOiYw22YVaVwpiYh0mybf8oNco5N4vhyjRa5Lm8lLPpKxtMDWgM92D3CBRfn
         bBM8ysZQUeGBoY0Hgl3gxnWBKKasvqtFYwBTvFVxfv80L8Rinx4RYeF01wI8/4wPI7Rd
         PfUg==
X-Gm-Message-State: APjAAAUUC1FekV+MzfrCVn24WvjgRi3DZt+4qZXH7WWW9FXdS51OrKWA
        JMZly2vopMSALCUKafOdf82vltIDAfA/iA==
X-Google-Smtp-Source: APXvYqx2EJ+yyowBKcAvoN8UoSPZ6gpuS48SesGzR28go5Qbjp5hCRtr8nQmq993xztaJuRn8q/qlw==
X-Received: by 2002:a65:6458:: with SMTP id s24mr24781132pgv.158.1567428368700;
        Mon, 02 Sep 2019 05:46:08 -0700 (PDT)
Received: from peter-pc.home ([91.207.174.229])
        by smtp.gmail.com with ESMTPSA id 2sm15884652pjh.13.2019.09.02.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 05:46:07 -0700 (PDT)
From:   Peter Cai <peter@typeblog.net>
Cc:     Peter Cai <peter@typeblog.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v3 2/2] touchscreen: goodix: define GPIO mapping for GPD P2 Max
Date:   Mon,  2 Sep 2019 20:43:52 +0800
Message-Id: <20190902124352.12291-2-peter@typeblog.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190902124352.12291-1-peter@typeblog.net>
References: <20190831030916.13172-1-peter@typeblog.net>
 <20190902124352.12291-1-peter@typeblog.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The firmware of GPD P2 Max could not handle panel resets although code
is present in DSDT. The kernel needs to take on this job instead, but
the DSDT does not provide _DSD, rendering kernel helpless when trying to
find the respective GPIO pins.

Fortunately, this time GPD has proper DMI vendor / product strings that
we could match against. We simply apply an acpi_gpio_mapping table when
GPD P2 Max is matched.

Additionally, the DSDT definition of the irq pin specifies a wrong
polarity. The new quirk introduced in the previous patch
(ACPI_GPIO_QUIRK_OVERRIDE_POLARITY) is applied to correct this.

Signed-off-by: Peter Cai <peter@typeblog.net>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: removed '#ifdef CONFIG_ACPI' as per suggestion. The #ifdef guards
for CONFIG_DMI is kept for consistency with the other dmi_system_id
definition in the same file.

v3: minor style adjustments. Added 'const' to dmi_match and moved it in
reverse xmas tree order as per suggestion.
---
 drivers/input/touchscreen/goodix.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 5178ea8b5f30..49ce478c1134 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -144,6 +144,31 @@ static const struct dmi_system_id rotated_screen[] = {
 	{}
 };
 
+static const struct acpi_gpio_params irq_gpios_default = { 0, 0, false };
+static const struct acpi_gpio_params reset_gpios_default = { 1, 0, false };
+static const struct acpi_gpio_mapping gpio_mapping_force_irq_active_high[] = {
+	{ "irq-gpios", &irq_gpios_default, 1, ACPI_GPIO_QUIRK_OVERRIDE_POLARITY },
+	{ "reset-gpios", &reset_gpios_default, 1 },
+	{}
+};
+
+/*
+ * Devices that need acpi_gpio_mapping to function correctly
+ */
+static const struct dmi_system_id need_gpio_mapping[] = {
+#if defined(CONFIG_DMI) && defined(CONFIG_X86)
+	{
+		.ident = "GPD P2 Max",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "P2 MAX")
+		},
+		.driver_data = &gpio_mapping_force_irq_active_high
+	},
+#endif
+	{}
+};
+
 /**
  * goodix_i2c_read - read data from a register of the i2c slave device.
  *
@@ -793,9 +818,15 @@ static void goodix_disable_regulators(void *arg)
 static int goodix_ts_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
+	const struct dmi_system_id *dmi_match;
 	struct goodix_ts_data *ts;
 	int error;
 
+	dmi_match = dmi_first_match(need_gpio_mapping);
+	if (dmi_match)
+		devm_acpi_dev_add_driver_gpios(&client->dev,
+					       dmi_match->driver_data);
+
 	dev_dbg(&client->dev, "I2C Address: 0x%02x\n", client->addr);
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-- 
2.23.0

