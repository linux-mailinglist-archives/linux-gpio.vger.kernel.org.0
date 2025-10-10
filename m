Return-Path: <linux-gpio+bounces-26973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680EBCC9D8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 12:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B8719E51B3
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 10:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78B32C326D;
	Fri, 10 Oct 2025 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcQnON2P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD0D225A5B
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093628; cv=none; b=Yr4yrE99L2LZFLpHeSP4ZDU8j/GjHBwqEgaMJwV/4Ledf3A4J094Vp15bQqmdlISmpXXp5zyNSFz7lvjQn5Zr07zITriKlloxY3OiwLvy7kGHLZmnVJp+BFFto5N0Dm8yRybW+Ia/u7auvZK7RyFFkOXIBFh7Is270+rayImakE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093628; c=relaxed/simple;
	bh=VT/Q5/cCmXGEVaIxL9EqS7cO15NmL2PHqm+oFXUO1ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqbS9L2H0yhspiM+XnOYjJsigihXSwn/6A2hTvP2qjChJ2iWyl8RS28pz3ijLSv+A1mq42XDCFMISucW62Uz4/LntQBtetm3+oy3qcZ60iWqVWsfYZUs8mQ6f8snhSafDtQTbZt6j6jDdm71QlNk6agOZM0Bz+14Th2Y49KEEDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcQnON2P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso11437185e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760093625; x=1760698425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQZwgbH1uwfwr12Wrdw5CZ0PuDM7xPtb6/PYbm7MoVs=;
        b=IcQnON2Pv/7h8pX8+iwJTopoE4W7Wb63+hBbuaX+Fvxpdr6ldITje7VyXBl1fxRaTj
         rv1Y9yxMTTyBtbtSQCOD6OTqf3i7rFIvwyH79GjdTA9g1TMrh7MtKYNUwnVsty9HTNyH
         mk5vE6FLBA35lLOdWlIb4J4e2RLg8fBSPBsmkNddTG+N+pwoteM4NEdwrpK4nRn/8l1t
         y5XZqfojBDpaMgTiBZpe1jexCL8cMEpvQlm7mt20xSOrVnumrfHNiExWBnZDtM1LpFMH
         orfj4AC5IcD63FMAUmvefs8qB+4hW97Kjj9js+Xxax/SUYvzDeTne83crUrc0Wdn7Gp2
         qLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760093625; x=1760698425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQZwgbH1uwfwr12Wrdw5CZ0PuDM7xPtb6/PYbm7MoVs=;
        b=w1f8IAKZAwZEi0bXsSil2kyAQ5YpkYWhm68JrHYB+64hcW+Xq2JgGHk/M3YG86ecYy
         ShKC5J2OMcnUEya3xnbZ2yCZPfDWeTE2fsq3SaDkb4jaasl2Qx6NKh1WO1dulaeACWPZ
         XMDM9t24SFxZeelsVr2ShbwZ/s2pNTExiP+T542IdC8rGzidk+IRMY/te/nLZ8Nkz0K8
         9P6O9xg0KurgrrSpeIwEXjW0do3/xIHZbm4RMyLX1PQQ2LK+w1Rk8lxXNmiCoQ2lsY3x
         ZcMlbmwNue4TVe1uTrKk28QpGPXYTthZGKfpduJO9DRAa/jd9VPnoyAM3RDwK1NAqoSJ
         8slQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOyiTl6BNlP9MTrewdAn/Dd7kHumKRUMgdQi/oYfZMayZwF9DBvMH74Eii4wLny15GJE+K/QKH79mK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YdbbDpcNAPFXio3+vUsN7DQ4Qy0DkOdY2JpdFRywO6egzKXW
	Jq7RrqivPL4RIUunyppMbnp5P7t4/omOE06JWDN/YGqx2iu5UTVMExk+
X-Gm-Gg: ASbGncv2DzJjquwOGrExehGK8TNuxnn9e7Vrcx1jfAgm6a2uO1nUQ+JcgTP7fr6G42N
	GBpTkfhoFi+t1NVnbZqE1SUWPfRUMcKOaVZ0CEjHID2JEF29nfC25FLjfZ08Bv7/CThBadFyCJI
	r0l8x9Fm9IdNWAD89V82cS0YkzNhtVzzwazrJuxolZ2FTQJW9UZlcBihBkk7pMOlp02DKRtSYK/
	qGJk8iTJImJZV/rq6bh+CxwSYmmz+wj5bGebLrehS2RhhQUWzWze5688EvEx6hLxC6HbEd9k0YH
	4QnFECeO7tFU7VL59X6xksRDvbQ63umMKkr2+hgYJWoAdABeVQizP6BTTxNWYbKZz9B+r03udcc
	k6GMwtHRi5Ojf67G3BdMz3qDXJceeRd3w6kLslZ1YXZzAmKtT9g84CNiK3kkr14ySaEtlqZ3NKn
	bL
X-Google-Smtp-Source: AGHT+IHH9F92BAY1gGu4HHJ/SnpYJZAdB9b4ua0sHAT9WkHef3NzVZbZ9ZaAZaZ2EeenNmAWf8+TCw==
X-Received: by 2002:a05:600c:c4a8:b0:46e:4921:9443 with SMTP id 5b1f17b1804b1-46fa9b1b277mr76411355e9.37.1760093624587;
        Fri, 10 Oct 2025 03:53:44 -0700 (PDT)
Received: from dev-linux.homserver.local ([51.154.249.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4983053sm38889925e9.8.2025.10.10.03.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 03:53:44 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Michael Buesch <m@bues.ch>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Date: Fri, 10 Oct 2025 10:53:36 +0000
Message-ID: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
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
 drivers/gpio/gpio-bt8xx.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 05401da03ca3..e8d0c67bb618 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -224,9 +224,9 @@ static void bt8xxgpio_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifdef CONFIG_PM
-static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused bt8xxgpio_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
 
 	scoped_guard(spinlock_irqsave, &bg->lock) {
@@ -238,23 +238,13 @@ static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
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
 
@@ -267,10 +257,8 @@ static int bt8xxgpio_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#else
-#define bt8xxgpio_suspend NULL
-#define bt8xxgpio_resume NULL
-#endif /* CONFIG_PM */
+
+static SIMPLE_DEV_PM_OPS(bt8xxgpio_pm_ops, bt8xxgpio_suspend, bt8xxgpio_resume);
 
 static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT848) },
@@ -286,8 +274,7 @@ static struct pci_driver bt8xxgpio_pci_driver = {
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


