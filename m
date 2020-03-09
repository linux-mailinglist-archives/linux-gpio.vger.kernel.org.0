Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBAA717E7BD
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 20:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgCITC1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 15:02:27 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36791 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgCITC0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 15:02:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id d9so5141826pgu.3;
        Mon, 09 Mar 2020 12:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LqjgG/BRzXge1SRKmRz2Izg1e1FT7fpH0mgiegLZaD8=;
        b=f2+PRJpfuQtEeh3NodtIE9kNC/TOuTePSMQH5x7j3+liuDNeLVvUwcTT7z0D7ArA+P
         rxhFd9xEJh/cNudISU7Bzq1TAwrc3XdcK47YvYteWi6BEirAHUDbpUfzcIp3QpRJtd0/
         4RoW15JweTZaJHwrwi4U52yYTaYSHhMYiTWQu1CWXL2sJN+3og3dsW83rrOyqgTS+vPY
         jaeh6wLEHe7VtlkpIi0cSm4LC2+yfXzhxpNhlJ8Z+IUFHY+4vdBbGTDypLoCbnmsghCh
         CalEHE4ASU0O+un8fvGd6kgysDKeJlpGHUmtF4/7+l9M6TmN1L3XvhVUQsbLRvaUhX1A
         HZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LqjgG/BRzXge1SRKmRz2Izg1e1FT7fpH0mgiegLZaD8=;
        b=aCzBi7ohkJY01DUTcS9QN4c2k9jZZlIJnIkGZy1agDht84GdH0NnmBx+7AHk+1e4PD
         aFu99gxrB7z6o6XHsRpNZJhsxJcPfoihQYB5vJrS+ZkaFgaFP8fXIEVDaCwWzsGmzJtP
         3uBczk4Ma1NovYHKBDjKtVrWe2js1b9inz53orMrd4g6PPHS9GyBJ/Rck8OhgDFQWg75
         fYBym6LQYyziYug/wCFbUYoGMga4dNCp6F/3x6JdCp9mUz7QBDUCFYsLMq3JdfOkAIre
         K6tFZSavYj4+kjR4KE6lV5I+ejJmftsR093wbbDod+X4iC7ErMh0fGyLn0Z9G++fDIZb
         LMzg==
X-Gm-Message-State: ANhLgQ1zdL5DrmQou21EyJ2ydJk5Vb+AGnxSuTzhT91MBWvqpeVne6VC
        CAPhlQHoe7OJ1C6DtXggvlY=
X-Google-Smtp-Source: ADFU+vsr6TmwDmzuNPLlgUI9yBuj0NFXy8B4HJffvWJ+MQY1DRFUMkUWr980hOOF+1FU799k+AJmig==
X-Received: by 2002:a62:6842:: with SMTP id d63mr18012944pfc.113.1583780545890;
        Mon, 09 Mar 2020 12:02:25 -0700 (PDT)
Received: from stbirv-lnx-3.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v8sm289616pjr.10.2020.03.09.12.02.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 09 Mar 2020 12:02:25 -0700 (PDT)
From:   Doug Berger <opendmb@gmail.com>
To:     Gregory Fong <gregory.0xf0@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Doug Berger <opendmb@gmail.com>
Subject: [PATCH V2] gpio: brcmstb: support gpio-line-names property
Date:   Mon,  9 Mar 2020 12:02:01 -0700
Message-Id: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The default handling of the gpio-line-names property by the
gpiolib-of implementation does not work with the multiple
gpiochip banks per device structure used by the gpio-brcmstb
driver.

This commit adds driver level support for the device tree
property so that GPIO lines can be assigned friendly names.

Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 05e3f99ae59c..fcfc1a1f1a5c 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -603,6 +603,49 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
 	.resume_noirq = brcmstb_gpio_resume,
 };
 
+static void brcmstb_gpio_set_names(struct device *dev,
+				   struct brcmstb_gpio_bank *bank)
+{
+	struct device_node *np = dev->of_node;
+	const char **names;
+	int nstrings, base;
+	unsigned int i;
+
+	base = bank->id * MAX_GPIO_PER_BANK;
+
+	nstrings = of_property_count_strings(np, "gpio-line-names");
+	if (nstrings <= base)
+		/* Line names not present */
+		return;
+
+	names = devm_kcalloc(dev, MAX_GPIO_PER_BANK, sizeof(*names),
+			     GFP_KERNEL);
+	if (!names)
+		return;
+
+	/*
+	 * Make sure to not index beyond the end of the number of descriptors
+	 * of the GPIO device.
+	 */
+	for (i = 0; i < bank->width; i++) {
+		const char *name;
+		int ret;
+
+		ret = of_property_read_string_index(np, "gpio-line-names",
+						    base + i, &name);
+		if (ret) {
+			if (ret != -ENODATA)
+				dev_err(dev, "unable to name line %d: %d\n",
+					base + i, ret);
+			break;
+		}
+		if (*name)
+			names[i] = name;
+	}
+
+	bank->gc.names = names;
+}
+
 static int brcmstb_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -726,6 +769,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
 		gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
 
+		brcmstb_gpio_set_names(dev, bank);
 		err = gpiochip_add_data(gc, bank);
 		if (err) {
 			dev_err(dev, "Could not add gpiochip for bank %d\n",
-- 
2.7.4

