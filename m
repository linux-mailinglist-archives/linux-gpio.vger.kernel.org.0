Return-Path: <linux-gpio+bounces-34574-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHeJBdz7zWlYkAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34574-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 07:17:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 128BD383E90
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 07:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6230C303D7CB
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 05:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9724B374187;
	Thu,  2 Apr 2026 05:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RssiDcyI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA356372EF5
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 05:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106940; cv=none; b=mOyjy2KJsQWIR+3+4Kp4mOpKOuqxXdq1JsrqJNjmBRtqL/cWDrfyZkg7k8fOTufPm1YAzZZHyUItM05n4bXiTYdbFX/012fbt7dsBEJSfCWj7IEiN+GyzN8m4CNShNSoOrojjOyKxMCUCSD8cVqlbU+xIruletbv4o3UnYtmRaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106940; c=relaxed/simple;
	bh=lbgRgN14X3CUpEJv6dKvS7/nLgyBUL/xeX7e54cB3vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t+UZZavSPb1InRo4j32tU8sewXAsqvWCNImg7bxpfO2Lftkqzw8Q3VfHc4kybbDsW97UdBbL0vuaFrqbeIubxu4P3G+fomi2U/PtxxCSKg1NwfOX6M8yULrp6pvLFz21s3koK2we9vDFVAFMiH9KLubvbTGRAlMxb0j2aSdO1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RssiDcyI; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so249924a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 22:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106938; x=1775711738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urUQup7dc3mN1NcxY7RoIdIVM9FIVTCa2CM6teh2xWs=;
        b=RssiDcyIYDWi/EneUGyN80gJd3yyFN0jCmqyYG87SpoPwC8ezAgO0E7bon0Ejb6rqt
         vIhkND3rYbz8svVlnQYKWp50zY9lBem574aG8fVwIuLItnkEGA4N20OUxUwq/1NovDAz
         ZfljM+6tbx19w9rO2mLh2xT/O4KppOyXdhnFscVu8WzLYcWuWqf0OCHuUdXajUIDGLCi
         yeVRdRqH41ncXPLcWPYJv5wLXdYWuUjkrcXgKNauACQeinzTX+E3k/lBjxnuEwxjbSDH
         +IEm6i4nulNl31VFl4EuTTVIYZmtqCX2oP/HE1tomBoLN2PW+EBOh2uAEavVFfZ7+RmT
         epKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106938; x=1775711738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=urUQup7dc3mN1NcxY7RoIdIVM9FIVTCa2CM6teh2xWs=;
        b=G2iGhccXaPSnYddmMZibSnOjNVlSqaDnpnXGsAGoplPpCdud5kfCmbex2Dd09uGi77
         x4JcpYJqmS9bf9bqbPUzgjTxUmn4M30NrFhSWw+QVRL/axZQ9qyIiivHq2lYHcC8TyfS
         YmXFoXJ/7KbbjbjWU1ptvgmeSxUMLr8LxEWjqKNW+VbWkpQn498lIdN4H8zuqp1vV/NL
         NwI3KtVD3f7aNwFNECuc/swkuDwEvhis7DYU94uLrNpcHoxAyiU6V3rfwJvnAU4gTZNj
         4hHvIRr5UBM3stHqt6QCyIIIV8M30ppQZOfRmwc3+9jy5/hZlxQpB4cx9Oy18/p++Sfk
         AHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV/sLPYR7qvRAmOLnHoHkBntIfYJQNyatkf+qopGpL6GE2xNnJw0iPjnSJ+TncSFcw8pR8WQLrzm+7@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0/SgYsP1W+PJANfZDS8CRe7+FTE0sk55fd5W+k5tla46ry9f
	Zgzc+oa137izedLVcOF5VtXpxSZxJQVqXQcVscWB40CXHY2JtGyq6hDH
X-Gm-Gg: AeBDieuHUz0OBAi0R9e8XUBdHnUwjAd+N5lclC5nnVhm0QRKYrvLI7uwqolSJ82H3+K
	laB9RJwKxnjuMU69IWOGe4HZb2R9eYvPvZJFqE2sORtaz3zR7wnV4M+s8So8r0Q3AQFOo7CiG5Q
	a4pNjdSxrfqrnk1wNDUMjx1JGYWBHwMNAE08iQ61w7ay23NoAHrx5f0246bjaIMtVi3TiRBKuHL
	jYWdXiqtUI2TrcjypBrfWzRttSVHx0U6U5zWefCqpb0uQ/O1JdM2yY2riWBXK2eN80dMWOZcLmo
	/C+faHME9kXfoetQxnFRZwpSDCdLrI+2pUusQtolM2s03xdAh9iq6ifodZM7LHy5Z66wRY35nuF
	7ILCYr5MTFC6ELM1HfORND0v9hNZY2VUerWtpf49cbnfLJdOlJnjGs5f7eVJNs0vy4B3BPbXkYA
	LjSoZ88GEqEK1leaHoL3gMpyDTfXc6r2n9wEyxabpGE3Z9qcCAlT6QBZ4Z3os2F3s24Q==
X-Received: by 2002:a17:90b:2ec4:b0:35d:a8d9:3a8 with SMTP id 98e67ed59e1d1-35dc6f7ad0bmr5899589a91.16.1775106937985;
        Wed, 01 Apr 2026 22:15:37 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe93661fsm6902107a91.11.2026.04.01.22.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:15:37 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	mkl@pengutronix.de,
	mailhol@kernel.org,
	alexandre.belloni@bootlin.com,
	wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v1 1/2] mfd: nct6694: Switch to devm_mfd_add_devices() and drop IDA
Date: Thu,  2 Apr 2026 13:14:41 +0800
Message-Id: <20260402051442.1426672-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402051442.1426672-1-a0282524688@gmail.com>
References: <20260402051442.1426672-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34574-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 128BD383E90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Yu <a0282524688@gmail.com>

Currently, the nct6694 core driver uses mfd_add_hotplug_devices()
and an IDA to manage subdevice IDs.

Switch the core implementation to use the managed
devm_mfd_add_devices() API, which simplifies the error handling and
device lifecycle management. Concurrently, drop the custom IDA
implementation and transition to using pdev->id.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
 drivers/gpio/gpio-nct6694.c         | 19 +------
 drivers/i2c/busses/i2c-nct6694.c    | 19 +------
 drivers/mfd/nct6694.c               | 83 ++++++++++++-----------------
 drivers/net/can/usb/nct6694_canfd.c | 12 +----
 drivers/watchdog/nct6694_wdt.c      | 20 +------
 include/linux/mfd/nct6694.h         |  8 +--
 6 files changed, 43 insertions(+), 118 deletions(-)

diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
index a8607f0d9915..3703a61209e6 100644
--- a/drivers/gpio/gpio-nct6694.c
+++ b/drivers/gpio/gpio-nct6694.c
@@ -7,7 +7,6 @@
 
 #include <linux/bits.h>
 #include <linux/gpio/driver.h>
-#include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/nct6694.h>
 #include <linux/module.h>
@@ -381,14 +380,6 @@ static void nct6694_irq_dispose_mapping(void *d)
 	irq_dispose_mapping(data->irq);
 }
 
-static void nct6694_gpio_ida_free(void *d)
-{
-	struct nct6694_gpio_data *data = d;
-	struct nct6694 *nct6694 = data->nct6694;
-
-	ida_free(&nct6694->gpio_ida, data->group);
-}
-
 static int nct6694_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -403,15 +394,7 @@ static int nct6694_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data->nct6694 = nct6694;
-
-	ret = ida_alloc(&nct6694->gpio_ida, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
-	data->group = ret;
-
-	ret = devm_add_action_or_reset(dev, nct6694_gpio_ida_free, data);
-	if (ret)
-		return ret;
+	data->group = pdev->id;
 
 	names = devm_kcalloc(dev, NCT6694_NR_GPIO, sizeof(char *),
 			     GFP_KERNEL);
diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
index 1413ab6f9462..7d8ad997f6d2 100644
--- a/drivers/i2c/busses/i2c-nct6694.c
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/i2c.h>
-#include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/mfd/nct6694.h>
 #include <linux/module.h>
@@ -134,14 +133,6 @@ static int nct6694_i2c_set_baudrate(struct nct6694_i2c_data *data)
 	return 0;
 }
 
-static void nct6694_i2c_ida_free(void *d)
-{
-	struct nct6694_i2c_data *data = d;
-	struct nct6694 *nct6694 = data->nct6694;
-
-	ida_free(&nct6694->i2c_ida, data->port);
-}
-
 static int nct6694_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -155,15 +146,7 @@ static int nct6694_i2c_probe(struct platform_device *pdev)
 
 	data->dev = dev;
 	data->nct6694 = nct6694;
-
-	ret = ida_alloc(&nct6694->i2c_ida, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
-	data->port = ret;
-
-	ret = devm_add_action_or_reset(dev, nct6694_i2c_ida_free, data);
-	if (ret)
-		return ret;
+	data->port = pdev->id;
 
 	ret = nct6694_i2c_set_baudrate(data);
 	if (ret)
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 308b2fda3055..8ce2c4985aab 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -11,7 +11,6 @@
 
 #include <linux/bits.h>
 #include <linux/interrupt.h>
-#include <linux/idr.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
@@ -23,35 +22,35 @@
 #include <linux/usb.h>
 
 static const struct mfd_cell nct6694_devs[] = {
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-	MFD_CELL_NAME("nct6694-gpio"),
-
-	MFD_CELL_NAME("nct6694-i2c"),
-	MFD_CELL_NAME("nct6694-i2c"),
-	MFD_CELL_NAME("nct6694-i2c"),
-	MFD_CELL_NAME("nct6694-i2c"),
-	MFD_CELL_NAME("nct6694-i2c"),
-	MFD_CELL_NAME("nct6694-i2c"),
-
-	MFD_CELL_NAME("nct6694-canfd"),
-	MFD_CELL_NAME("nct6694-canfd"),
-
-	MFD_CELL_NAME("nct6694-wdt"),
-	MFD_CELL_NAME("nct6694-wdt"),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
+	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
+
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
+	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
+
+	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 1),
+
+	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 0),
+	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 1),
 
 	MFD_CELL_NAME("nct6694-hwmon"),
 
@@ -307,23 +306,18 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	nct6694->dev = dev;
 	nct6694->udev = udev;
 
-	ida_init(&nct6694->gpio_ida);
-	ida_init(&nct6694->i2c_ida);
-	ida_init(&nct6694->canfd_ida);
-	ida_init(&nct6694->wdt_ida);
-
 	spin_lock_init(&nct6694->irq_lock);
 
 	ret = devm_mutex_init(dev, &nct6694->access_lock);
 	if (ret)
-		goto err_ida;
+		goto err_irq_domain;
 
 	interface = iface->cur_altsetting;
 
 	int_endpoint = &interface->endpoint[0].desc;
 	if (!usb_endpoint_is_int_in(int_endpoint)) {
 		ret = -ENODEV;
-		goto err_ida;
+		goto err_irq_domain;
 	}
 
 	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
@@ -332,11 +326,11 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
 	if (ret)
-		goto err_ida;
+		goto err_irq_domain;
 
 	usb_set_intfdata(iface, nct6694);
 
-	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
+	ret = devm_mfd_add_devices(dev, 0, nct6694_devs, ARRAY_SIZE(nct6694_devs), NULL, 0, NULL);
 	if (ret)
 		goto err_mfd;
 
@@ -344,11 +338,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 err_mfd:
 	usb_kill_urb(nct6694->int_in_urb);
-err_ida:
-	ida_destroy(&nct6694->wdt_ida);
-	ida_destroy(&nct6694->canfd_ida);
-	ida_destroy(&nct6694->i2c_ida);
-	ida_destroy(&nct6694->gpio_ida);
+err_irq_domain:
 	irq_domain_remove(nct6694->domain);
 err_urb:
 	usb_free_urb(nct6694->int_in_urb);
@@ -359,12 +349,7 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 {
 	struct nct6694 *nct6694 = usb_get_intfdata(iface);
 
-	mfd_remove_devices(nct6694->dev);
 	usb_kill_urb(nct6694->int_in_urb);
-	ida_destroy(&nct6694->wdt_ida);
-	ida_destroy(&nct6694->canfd_ida);
-	ida_destroy(&nct6694->i2c_ida);
-	ida_destroy(&nct6694->gpio_ida);
 	irq_domain_remove(nct6694->domain);
 	usb_free_urb(nct6694->int_in_urb);
 }
diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c
index e5f7f8849a73..29282c56430f 100644
--- a/drivers/net/can/usb/nct6694_canfd.c
+++ b/drivers/net/can/usb/nct6694_canfd.c
@@ -8,7 +8,6 @@
 #include <linux/can/dev.h>
 #include <linux/can/rx-offload.h>
 #include <linux/ethtool.h>
-#include <linux/idr.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/mfd/nct6694.h>
@@ -725,15 +724,13 @@ static int nct6694_canfd_probe(struct platform_device *pdev)
 	struct net_device *ndev;
 	int port, irq, ret, can_clk;
 
-	port = ida_alloc(&nct6694->canfd_ida, GFP_KERNEL);
-	if (port < 0)
-		return port;
+	port = pdev->id;
 
 	irq = irq_create_mapping(nct6694->domain,
 				 NCT6694_IRQ_CAN0 + port);
 	if (!irq) {
 		ret = -EINVAL;
-		goto free_ida;
+		return ret;
 	}
 
 	ndev = alloc_candev(sizeof(struct nct6694_canfd_priv), 1);
@@ -796,24 +793,19 @@ static int nct6694_canfd_probe(struct platform_device *pdev)
 	free_candev(ndev);
 dispose_irq:
 	irq_dispose_mapping(irq);
-free_ida:
-	ida_free(&nct6694->canfd_ida, port);
 	return ret;
 }
 
 static void nct6694_canfd_remove(struct platform_device *pdev)
 {
 	struct nct6694_canfd_priv *priv = platform_get_drvdata(pdev);
-	struct nct6694 *nct6694 = priv->nct6694;
 	struct net_device *ndev = priv->ndev;
-	int port = ndev->dev_port;
 	int irq = ndev->irq;
 
 	unregister_candev(ndev);
 	can_rx_offload_del(&priv->offload);
 	free_candev(ndev);
 	irq_dispose_mapping(irq);
-	ida_free(&nct6694->canfd_ida, port);
 }
 
 static struct platform_driver nct6694_canfd_driver = {
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
index bc3689bd4b6b..2b4b804a1739 100644
--- a/drivers/watchdog/nct6694_wdt.c
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2025 Nuvoton Technology Corp.
  */
 
-#include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/mfd/nct6694.h>
 #include <linux/module.h>
@@ -233,21 +232,12 @@ static const struct watchdog_ops nct6694_wdt_ops = {
 	.ping = nct6694_wdt_ping,
 };
 
-static void nct6694_wdt_ida_free(void *d)
-{
-	struct nct6694_wdt_data *data = d;
-	struct nct6694 *nct6694 = data->nct6694;
-
-	ida_free(&nct6694->wdt_ida, data->wdev_idx);
-}
-
 static int nct6694_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct nct6694 *nct6694 = dev_get_drvdata(dev->parent);
 	struct nct6694_wdt_data *data;
 	struct watchdog_device *wdev;
-	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -260,15 +250,7 @@ static int nct6694_wdt_probe(struct platform_device *pdev)
 
 	data->dev = dev;
 	data->nct6694 = nct6694;
-
-	ret = ida_alloc(&nct6694->wdt_ida, GFP_KERNEL);
-	if (ret < 0)
-		return ret;
-	data->wdev_idx = ret;
-
-	ret = devm_add_action_or_reset(dev, nct6694_wdt_ida_free, data);
-	if (ret)
-		return ret;
+	data->wdev_idx = pdev->id;
 
 	wdev = &data->wdev;
 	wdev->info = &nct6694_wdt_info;
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 6eb9be2cd4a0..496da72949d9 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -8,6 +8,10 @@
 #ifndef __MFD_NCT6694_H
 #define __MFD_NCT6694_H
 
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
 #define NCT6694_VENDOR_ID	0x0416
 #define NCT6694_PRODUCT_ID	0x200B
 #define NCT6694_INT_IN_EP	0x81
@@ -82,10 +86,6 @@ union __packed nct6694_usb_msg {
 
 struct nct6694 {
 	struct device *dev;
-	struct ida gpio_ida;
-	struct ida i2c_ida;
-	struct ida canfd_ida;
-	struct ida wdt_ida;
 	struct irq_domain *domain;
 	struct mutex access_lock;
 	spinlock_t irq_lock;
-- 
2.34.1


