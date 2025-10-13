Return-Path: <linux-gpio+bounces-27046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E25BD5386
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 18:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6526B582B30
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 16:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1416F2E6CA5;
	Mon, 13 Oct 2025 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyJly32o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2201230D35
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370790; cv=none; b=IdXW7wMGnADmYi5cKjOtdaFpdJer1B5TUmzKCj3ScHT50Vko7fgK3hJTwHI0ZCAyION3dG2M1C79JK+lnVo8Q+TPGzyJcYS3acicAgRdgp5vW7Xq/3UQOGd8TiEfoor9ZFnhPYw+0tT+q9AJ51xRrW0KY56FhPuiAUzXN8bKNC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370790; c=relaxed/simple;
	bh=BflumSUt1Df+Pt4sylcVPf1fNVvDZusLNi5LKPKa6gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e54lS2lmJ62zAwKPTHGzwTXmqSSI5NI3Buwt6XLEu7dAzgP1py3KmU54dXL8X8dtm5ECYIsc3WXi+5P2NJ8fnAQKI0La2byfBGIt1Z0P93Cd1tmy+IxNigGYw/YSLZHAtUlASec59wwtjw7NMcR8Y7SvEFdd5DiFZpzXacVRfss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyJly32o; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so41175385e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760370787; x=1760975587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PP2cVBqxTHo4iOzKU9RsvBFv1wvTlNYcCHBA/GUcdj0=;
        b=JyJly32o1i/q8U1xL0tYQMjGOrK+w7YaLi3Zm5Q4/+4P/dLwIlkB95dvJYCWN8nuXS
         mMlJ8CjqCjf6978NhCk6m/+XhFYqbXJSjqsSUUuXJXuxs5pn0yIbZdLErI5ncTEdo0S2
         LDCCp9dVST1izojwVB31TtmIQTEl4aSSsLwrjy75hlrI2JtvAZgsWHUjEew5Uf08yiVH
         QBw7Nnv0zUpxZrlRrhY+TMbOpf1E5QucF3M6qfBVN1LssfbhRc5knDil/x83FQ8xje1m
         GZzJzDitcYDChNErPqGTKpBC+09wTNNFHlMFM8f0ueZY6KUyKKKYJ77c2dFLzTWbKpKL
         mvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370787; x=1760975587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PP2cVBqxTHo4iOzKU9RsvBFv1wvTlNYcCHBA/GUcdj0=;
        b=nexpKCg4CZh8UBHa5MNeEvuszm/FgNy1QuYMt50T8UuMqQJKHre/fBIEDaNb2hgxyn
         9mZY/uuzjvMqDweTQUztwSi/iT+JicedjNCeV7e+GHBlLxtYsGsdgjX5MfcmKXUzajyJ
         ICJivi2K4yI2TUhx5fEud07RC+4NuJtJnMrEQzmdAM/NWdWzPOyR2/8aFjnAgAEFi4U1
         BBLZis239KoIkbGWcG3fcswMZNhIxsjUKDSY1ugDdF6ZwTS1KnEC+R0hvD6Hzi1ItwYJ
         YKa8UT5TQuIzCefMm1A2QOtBtEdTrNnGv1mfJ93ESotkOKEbnnNd8VaIaDfKflC+BmWr
         1vww==
X-Forwarded-Encrypted: i=1; AJvYcCUldFIpo+TGCm1s3qtf8c18B1af2mHr6tO0VNdC643n6N94RYrNKbNIFjOEHtGBEHHw5Urbn4i23w3v@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2hSO/rmOFiz6/KT3PukY4HLwor6zmq7vPP9cHKWpKfE5zUep
	rRPMDu0zpVQ1jKk3wowsdTJp7OmzTJWvsTnuxuhsGmv6JHFz3sixJnHM
X-Gm-Gg: ASbGncvG5FhfScDRsjb9h3EcQ/sw00PaJbFJ5KyxIMpYJdgXyFzx2t4zCHqgpbVKda2
	O5Lp0cKw02u/bfsoXS3u3U22Xa3BeD/x5IVCTGPcKw91uqh3UQ5jKRPLoBl+tXGSabqcenQNZGB
	6Fs10iGITUvuI4I+qEyAhJFgPz80cl8WmBIpgK/9FmrRTPr8Qk8pCneGImjubqTKO/KRYoGOqoj
	8XoEevKBnWwcO+wRX71rPWmUkrrx8sA8ieroKAxkYfh5rWG9ZQeiqwAq/mwadV63IIB1w7n+WP+
	WSUXv3bbFW2t0mIJ2afw8Dt/A7PlDGcFHgdvp2VLmgtQ6rRZJepUBTLVefdS+bBud/nJh5XPcg+
	EEDABIj2Hl01zmAi4ojF+QA4ilp4D6ScEbP7b7DSQeKoru+/Ep/KLwipbEL1/s3vwGg==
X-Google-Smtp-Source: AGHT+IE2KvAyvfDcxqJ1Dsul6D4no3ioGcQdOMcLp37PQsjQ8g+ED7dk+ijfPAnXos4qSiImjsr++w==
X-Received: by 2002:a05:600c:34c5:b0:46e:4ac4:b7b8 with SMTP id 5b1f17b1804b1-46fa9b05361mr144494215e9.25.1760370786927;
        Mon, 13 Oct 2025 08:53:06 -0700 (PDT)
Received: from dev-linux.homserver.local ([51.154.249.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb497af18sm192097675e9.3.2025.10.13.08.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:53:06 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Michael Buesch <m@bues.ch>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] gpio: bt8xx: use generic PCI PM
Date: Mon, 13 Oct 2025 15:52:59 +0000
Message-ID: <20251013155303.1103235-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aO0f62-RnVyKRLS-@gmail.com>
References: <aO0f62-RnVyKRLS-@gmail.com>
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


