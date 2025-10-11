Return-Path: <linux-gpio+bounces-26995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A08F7BCF57E
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 14:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0DBE1A600FA
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Oct 2025 12:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD36A27AC3E;
	Sat, 11 Oct 2025 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFvouBAU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F5F277C8D
	for <linux-gpio@vger.kernel.org>; Sat, 11 Oct 2025 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760187518; cv=none; b=hyZ9fcUeR44p+HCnZ3F410dHAY9U4/ORczE9zsKXZjZKtHNNACAcs6X6WV7LV8zPMXdngK0XYDPMj5jqqjvxmhouvMrcpE76jzljIm5A9M8KD85xgOAcnxiRM3P2NIoYVVo/Lv6l28DiIsP9WqmVteHJxzIbEDqUx7CnL09oyXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760187518; c=relaxed/simple;
	bh=BflumSUt1Df+Pt4sylcVPf1fNVvDZusLNi5LKPKa6gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4TpLmnBQh6Ky7tuds45CkjkcYYlWLvNd+AhYPIDIYADlWFwkyx0KP0FJGL4ranKYrrGPvnP3e5he69jMC83F3N0XieuLI4NGqKlrsTixmGDHHtQjE3/mDqwumA1/rmthIfpvkYSk+zlg++PWpfcQ4cGQlg9XLxESlpCkjcXZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFvouBAU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so20366135e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Oct 2025 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760187509; x=1760792309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PP2cVBqxTHo4iOzKU9RsvBFv1wvTlNYcCHBA/GUcdj0=;
        b=kFvouBAURiOb52ypVkX3Qw2tC9MgKYxQGA1Ie6iZXb/WdMxU0/Sxv2+E1JpXuu/ocA
         wz8NldianPzBkmtcCSFAB5rpC+QqCkZDgMjiBHM9k526BtPsxUcl4Ar/sMrOJ/rjjyB1
         0uEL2EE3cJFs2SNQHm5w6EG4SlZIi77K6UNsNrYSb35p53R7kOcLEXxj0flIxfJbK/mp
         prX+ZyGpmPjt+xpWhG7LNdp/DnknQ9ZeohJrbbXjSPBLQocxvgAVylCP3TIBt7RatT56
         bE68RMMkIqs4a70ibQoDuMchyAR529aLrZSLOOiEtLw0lIbvsPAme9zPPa6lrV0FpisH
         UJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760187509; x=1760792309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PP2cVBqxTHo4iOzKU9RsvBFv1wvTlNYcCHBA/GUcdj0=;
        b=PQs+ii7/Nb2T+VjQn8u9f/uHP2Q8dr8vy9WBOOLdQ0fPOpXf4gO5QtQdM9dITYvAEn
         +E3MtnTZqxHAVphLxP4SJFoOYjJ7xm/jnhm3oNvvv8kRmnV3sGB1bNxiNkgao2n/bEdx
         /UXoXz6ZX0hNtlTR/3GMvNzMTWyebaGVAMplqNuausnL+oyP2YaIoRQjY2sc18ZEujcK
         eXrz6FNBdqGU1yIt3DIvV+LLy8uHQ8tAssq3BPzJ71y36nwz0ZFrjGiNi/oHN+brLnC+
         xt4LRGtU7XOfkWJN6+0ebgFDbOqxNBtbC0ydCshi4T9rArg5Y9SuV7ZS+QZ7M6na1nev
         PGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq1mn2JDso1XL5QMU3LNQQpGh9xEyqD3PqUen9hvQkcUUEkvY/NHbNyPrL7b1gjRe1lk0WPtwO3yeU@vger.kernel.org
X-Gm-Message-State: AOJu0YyuhyS9JF30lAboxZp1mP6oL53NlzIsGGP45TnejrjHGEqDMw/a
	H710K4iR8y1dZHWgQBYgNxMfzE8WASzOAX2v6jPiaelpXjZESJivKa07
X-Gm-Gg: ASbGncsbCgpSamXg1pPDN2HN0KKTKhDj91Fv8n4IfgQ4ETFUjTbyLIR8nwiOKXWyKvX
	7wZOhNnCBXoB/9WJu2IgKhlu9Irt4AW49u6XWjJAwgiMkjxTgu2kQWDXNBsWNJ8cvl1pkGD0I2u
	bpvtvRbl/gcX1tbU5pSSh013i277oaq3gfJAEPSYYx2hQpDX3Sf9xtwNj4NFUygbA+aqqYe5MYE
	fGPC5weqtfkFrV/UB+EuuvX5FoeKGgv+IuyKMKgbkpeXjUTY+qFiI/ABN9yKQ0Pq6GsinjkK8va
	MSYYtQ5joc+zACfwLtFVAXVcPUzZWeLklDAgeRN3FsfvwtFSLNLFUKCrwUIqs+T2r0clwmNURPM
	3KeI1mENM2AMyD83DtQHg3IOwtuOaGKem5fmA7yv5l//mP3s9ppd3XEVTdBcU7x1JTg==
X-Google-Smtp-Source: AGHT+IFypDFEfHT4k6jCPST2r0F14x52GIJv5i+x39HBd4euooCKsMtk4pEX4/z7HuGjqI5IAYoavA==
X-Received: by 2002:a05:600c:4e47:b0:46e:652e:16a1 with SMTP id 5b1f17b1804b1-46fa9a8b482mr104336315e9.7.1760187509283;
        Sat, 11 Oct 2025 05:58:29 -0700 (PDT)
Received: from dev-linux.homserver.local ([51.154.250.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4982c10sm89708785e9.5.2025.10.11.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 05:58:28 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Michael Buesch <m@bues.ch>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] driver: gpio-bt8xx: use generic PCI PM
Date: Sat, 11 Oct 2025 12:57:53 +0000
Message-ID: <20251011125802.1068043-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011143123.094043ed@barney>
References: <20251011143123.094043ed@barney>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to the new generic PCI power management framework and remove legacy
callbacks like .suspend() and .resume(). With the generic framework, the
standard PCI related work like:
	- pci_save/restore_state()
	- pci_enable/disable_device()
	- pci_set_power_state()
is handled by the PCI core and this driver should implement only gpio-bt8xx
specific operations in its respective callback functions.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/gpio/gpio-bt8xx.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 05401da03ca3..70b49c385b43 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -52,10 +52,8 @@ struct bt8xxgpio {
 	struct pci_dev *pdev;
 	struct gpio_chip gpio;
 
-#ifdef CONFIG_PM
 	u32 saved_outen;
 	u32 saved_data;
-#endif
 };
 
 #define bgwrite(dat, adr)	writel((dat), bg->mmio+(adr))
@@ -224,9 +222,9 @@ static void bt8xxgpio_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifdef CONFIG_PM
-static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused bt8xxgpio_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
 
 	scoped_guard(spinlock_irqsave, &bg->lock) {
@@ -238,23 +236,13 @@ static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
 		bgwrite(0x0, BT848_GPIO_OUT_EN);
 	}
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
 	return 0;
 }
 
-static int bt8xxgpio_resume(struct pci_dev *pdev)
+static int __maybe_unused bt8xxgpio_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
-	int err;
-
-	pci_set_power_state(pdev, PCI_D0);
-	err = pci_enable_device(pdev);
-	if (err)
-		return err;
-	pci_restore_state(pdev);
 
 	guard(spinlock_irqsave)(&bg->lock);
 
@@ -267,10 +255,8 @@ static int bt8xxgpio_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#else
-#define bt8xxgpio_suspend NULL
-#define bt8xxgpio_resume NULL
-#endif /* CONFIG_PM */
+
+static DEFINE_SIMPLE_DEV_PM_OPS(bt8xxgpio_pm_ops, bt8xxgpio_suspend, bt8xxgpio_resume);
 
 static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT848) },
@@ -286,8 +272,7 @@ static struct pci_driver bt8xxgpio_pci_driver = {
 	.id_table	= bt8xxgpio_pci_tbl,
 	.probe		= bt8xxgpio_probe,
 	.remove		= bt8xxgpio_remove,
-	.suspend	= bt8xxgpio_suspend,
-	.resume		= bt8xxgpio_resume,
+	.driver.pm	= &bt8xxgpio_pm_ops,
 };
 
 module_pci_driver(bt8xxgpio_pci_driver);
-- 
2.51.0


