Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C26325C0A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Feb 2021 04:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhBZDkJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 22:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhBZDkI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 22:40:08 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1C1C061786
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2021 19:39:28 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id ba1so4592969plb.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2021 19:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=56AvynNCW+THTU4NZfS3buEv8VRRSK5XT9Dy1cT1dG0=;
        b=jwEATEoiOzi9h1cD0myiw5d+wV2Z5W/u+/HD4cM8CnQ1KsAdrHM6JaOSISnTR53npk
         Q/9QZh3BXBy8sdxFH/EDLVC59zt2ml6IGBXPZK/3fupx189ZMHXu0s8ugQgSMyR6G2VK
         EQ0AWWqDIjyWJtlihLosQXslYvQmoh3Elj6U3Rs5yDx4eHXT7ObC+GxDqzExl0lLEwRG
         nOGSbcXMgcUygUL7NM5zhG3MrjK8V2DmUZKFNGovKQouHHJw+pYEPy13O0zzTqVjHxGp
         7y7ekLmc4gwmSJCm9fGYCI1kK+aFO2LA5nNRkY3Ri7Yk6bsei3LhBIjDf4dsHYTpJSwO
         EJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=56AvynNCW+THTU4NZfS3buEv8VRRSK5XT9Dy1cT1dG0=;
        b=ZU13X8kBYzKB/9Tm0Y/DFOlWHMMGNq7d1Pkd+GKLia14lkiTofgwUlgv0upZczEiaY
         eh1RcWxryJdI5thcyetx8xulsWHnaW25OtxkYEy60OiF8zLInu4wNtDjH7CcvKvPFyOZ
         AmFUEPSpGvPsD3XyGEvLRhkhOSkzjUcqKu5s3K+u5A10KUTI8NwIfytpA1W4yHt2FX1d
         3n06MYmc/8v+0HqzagMxQroCeOWbXrdQLh3jraCy2uYZLOKLkGai4DM9XdDNaxP15wBh
         MvjANkhunV3CMn6AURcwDPa4MVG6hH0w/SOcLX1t4M0C5R41VVbigqXPVvc/Xo07C0IC
         h76Q==
X-Gm-Message-State: AOAM530uTy1AxpZ/ViD/BVm2mQqv4qAGXB9GRKWfyKvKhQyFyuSIy9RP
        X2u1VuKXhHGZ+/Rv1ex7TqMqWg==
X-Google-Smtp-Source: ABdhPJyzrNlyAHTtcjisJZbKIWjUhRki2mKrjHFgvleVW4ikML/lSQFIihGeog6hcS6fdhGH9VrS5w==
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id g3-20020a1709026b43b02900dffb48aecfmr1260629plt.67.1614310768092;
        Thu, 25 Feb 2021 19:39:28 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e22sm4950987pgk.56.2021.02.25.19.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 19:39:27 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] gpiolib: acpi: support override broken GPIO number in ACPI table
Date:   Fri, 26 Feb 2021 11:39:19 +0800
Message-Id: <20210226033919.8871-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Running kernel with ACPI on Lenovo Flex 5G laptop, touchpad is just
not working.  That's because the GpioInt number of TSC2 node in ACPI
table is simply wrong, and the number even exceeds the maximum GPIO
lines.  As the touchpad works fine with Windows on the same machine,
presumably this is something Windows-ism.  Although it's obviously
a specification violation, believe of that Microsoft will fix this in
the near future is not really realistic.

It adds the support of overriding broken GPIO number in ACPI table
on particular machines, which are matched using DMI info.  Such
mechanism for fixing up broken firmware and ACPI table is not uncommon
in kernel.  And hopefully it can be useful for other machines that get
broken GPIO number coded in ACPI table.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 63 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index e37a57d0a2f0..30a5c5a954fa 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -93,6 +93,63 @@ static DEFINE_MUTEX(acpi_gpio_deferred_req_irqs_lock);
 static LIST_HEAD(acpi_gpio_deferred_req_irqs_list);
 static bool acpi_gpio_deferred_req_irqs_done;
 
+struct acpi_gpio_pin_fixup {
+	int pin_broken;
+	int pin_correct;
+};
+
+struct acpi_gpio_pin_override {
+	const struct acpi_gpio_pin_fixup *fixups;
+	int num;
+};
+
+static const struct acpi_gpio_pin_fixup lenovo_flex_5g_fixups[] = {
+	{
+		/* GpioInt of Touchpad (TSC2) */
+		.pin_broken = 0x0280,
+		.pin_correct = 0x0018,
+	},
+};
+
+static const struct acpi_gpio_pin_override lenovo_flex_5g_override = {
+	.fixups = lenovo_flex_5g_fixups,
+	.num = ARRAY_SIZE(lenovo_flex_5g_fixups),
+};
+
+static const struct dmi_system_id acpi_gpio_pin_override_table[] = {
+	{
+		.ident = "Lenovo Flex 5G",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_FAMILY, "Flex 5G 14Q8CX05"),
+		},
+		.driver_data = (void *)&lenovo_flex_5g_override,
+	},
+	{ } /* terminator */
+};
+
+static int acpi_gpio_pin_override(int pin)
+{
+	const struct acpi_gpio_pin_override *override;
+	const struct acpi_gpio_pin_fixup *fixup;
+	const struct dmi_system_id *system_id;
+	int i;
+
+	system_id = dmi_first_match(acpi_gpio_pin_override_table);
+	if (!system_id)
+		return pin;
+
+	override = system_id->driver_data;
+
+	for (i = 0; i < override->num; i++) {
+		fixup = &override->fixups[i];
+		if (pin == fixup->pin_broken)
+			return fixup->pin_correct;
+	}
+
+	return pin;
+}
+
 static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
 {
 	if (!gc->parent)
@@ -125,7 +182,11 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
 	if (!chip)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	return gpiochip_get_desc(chip, pin);
+	/*
+	 * Give it a chance to correct the broken GPIO pin number in ACPI
+	 * table of particular machines.
+	 */
+	return gpiochip_get_desc(chip, acpi_gpio_pin_override(pin));
 }
 
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
-- 
2.17.1

