Return-Path: <linux-gpio+bounces-8863-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7EA958967
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 16:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF99D2838D2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 14:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2B21917C7;
	Tue, 20 Aug 2024 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="dDi3Y0r7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E9618E756;
	Tue, 20 Aug 2024 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724164455; cv=pass; b=mfUCUE7ewQmtBBbsF52FSv0HHNxYBwQTxXmd/+LU3NKheCo+9A0HCimeoqM0VLxwvLcFZdxuvxCNeda7I/noJ382EcWN4zfSDJJwAGrgH5eKMLQFtFE+i29sm/sx+rCSFs8qfbRAOejcjfxe45lTd8Wuk6opwIS1ybWPiKlMDAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724164455; c=relaxed/simple;
	bh=tlVZiJq+FXMzsigETTBROYaKMXD3oFR183eogggWQkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1ezI7IGv81hkXKfGiqMQVr3ZPv/wJd9dQlV2GLPJXOG1yhHPqiSF5fG6JUyQN7wG2J53eJk73vP6/DjDLT0ZEiboKkIfxyqN93AvKwgXi+Qy3bYqfhlK+L248e8SWgrKHz0fIpse7uAceTXW9g0mH6v+RPsMpcubByvOjTStAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=dDi3Y0r7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724164445; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hzuFoSwF9CrtHZ4j5hZKfAaBi7lXcBK8fiJx2qw7fNE5GJovhGvVSWd1PeMwMOCDO1YxZxRBZlHRkUPBs64j1u4RvYtfdydDsBOp+zA1TggqwEEkubKafS84swUiai1JgopjIkxR2r+fAm25ev1jHmdEr+Fs6sdTzNrBniyJaTo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724164445; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vplBHQruDMbj68SuzMwoca2dFOJUKVYY913/jF0sAAM=; 
	b=jBNs6tfxECeO/iytGtapAGEJqAHgfXxvzIXHVWt+n5WyV+KUcGxFPm1+46TzNJ/s0DbW4eyli5j4ntSXFldeXrMfXkHKz2IFovaMyn92u9MKjsqdpc6fn1qUeJjYNsqvYnAFI5ISazPnYDiFHmr3RFgcyojw+0kzL2q28zrguwk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724164445;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vplBHQruDMbj68SuzMwoca2dFOJUKVYY913/jF0sAAM=;
	b=dDi3Y0r7HjoIXx8ebhDf10o/8EttkkYWJ3kH06Xw/ze8gsP6LEzxdi4/5fahH2nO
	GcYkcorVks17YCBZZo3iOQNS+IbEF5VHf/GRkaoEu9i09CWHT6OYkYSm17AureXqXjU
	8ErIP9360PNUReYgWTlI4EtqcTIpayBlhABpXKH4=
Received: by mx.zohomail.com with SMTPS id 1724164442979644.9362485336538;
	Tue, 20 Aug 2024 07:34:02 -0700 (PDT)
From: Martyn Welch <martyn.welch@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@collabora.com,
	Martyn Welch <martyn.welch@collabora.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: mpc8xxx: Add wake on GPIO support
Date: Tue, 20 Aug 2024 15:33:27 +0100
Message-ID: <20240820143328.1987442-1-martyn.welch@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The mpc8xxx GPIO can generate an interrupt on state change. This
interrupt can be used to wake up the device from its sleep state if
enabled to do so. Add required support to the driver so that the GPIO
can be used in this way.

In order for the GPIO to actually function in this way, it is necessary
to also set the GPIO bit in the RCPM. This can be done via the device
tree fsl,rcpm-wakeup property.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index c0125ac73906..ab30c911c9d5 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -413,6 +413,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	device_init_wakeup(&pdev->dev, true);
+
 	return 0;
 err:
 	irq_domain_remove(mpc8xxx_gc->irq);
@@ -429,6 +431,31 @@ static void mpc8xxx_remove(struct platform_device *pdev)
 	}
 }
 
+#ifdef CONFIG_PM
+static int mpc8xxx_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = platform_get_drvdata(pdev);
+
+	if (mpc8xxx_gc->irqn && device_may_wakeup(&pdev->dev))
+		enable_irq_wake(mpc8xxx_gc->irqn);
+
+	return 0;
+}
+
+static int mpc8xxx_resume(struct platform_device *pdev)
+{
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = platform_get_drvdata(pdev);
+
+	if (mpc8xxx_gc->irqn && device_may_wakeup(&pdev->dev))
+		disable_irq_wake(mpc8xxx_gc->irqn);
+
+	return 0;
+}
+#else
+#define mpc8xxx_suspend NULL
+#define mpc8xxx_resume NULL
+#endif
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id gpio_acpi_ids[] = {
 	{"NXP0031",},
@@ -440,6 +467,8 @@ MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
 static struct platform_driver mpc8xxx_plat_driver = {
 	.probe		= mpc8xxx_probe,
 	.remove_new	= mpc8xxx_remove,
+	.suspend	= mpc8xxx_suspend,
+	.resume		= mpc8xxx_resume,
 	.driver		= {
 		.name = "gpio-mpc8xxx",
 		.of_match_table	= mpc8xxx_gpio_ids,
-- 
2.43.0


