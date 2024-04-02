Return-Path: <linux-gpio+bounces-5017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5828959F7
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 18:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCE8F1C225CA
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 16:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCA215A487;
	Tue,  2 Apr 2024 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJecy9t8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F666159910
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076239; cv=none; b=W9xbZUoglt3fDyRww3iwGdj017RHrfnY/Kfxxl57AjOnVDuRvC1UV3lw8Oh367fd1+tDLTgRS7vMeQWwXOHr4nEtsETAiXRgkhEvf+kaWW5hcMeO5ytvuu04nXjEvxwH7gGCOPTXreIpZrBUT1lM9uN2a0fjkZuOE232x2jtITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076239; c=relaxed/simple;
	bh=zRkhmGjgmVMhbBTs4VgkmwPJvD4Nu5No5k8gC7QBMGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uHiwRk6ZzcnOysZKa/lK05nrkB94ZO35i+XQDKQBt6e4gOzTMOO6ttpuTStQYaiW0+Xc0LI5V2Wq6DUGpy38j03dEH2lnmPOvfrFvgjmvFIULjS4yxiO6QjgyeYOgad8BScfDasngm2z8DHQIxTL48yymDPmdSqDXZAh/60act4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DJecy9t8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712076237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3mmSRm2AtBAuROYhBMqBOzOmzoCJiEGySZSdD2yP9So=;
	b=DJecy9t8KHWaMZ7sUurfbDR7StNG9+npL/tDS2DjHZtGD3+WdLw5XDUspLwkQKZF/s14uE
	ank4+SdfWWCN835FclOFXC61OeGWQ+Z3veMAS2pjrcNDAIKekkIzNtNwb2/MvYNxMXCM0S
	+ntjM1cp3QHYxnjIRfxUHJcjvI9v+Mc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-jS27BinaPdS8F1B7XgUnkg-1; Tue, 02 Apr 2024 12:43:53 -0400
X-MC-Unique: jS27BinaPdS8F1B7XgUnkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B4C681A291;
	Tue,  2 Apr 2024 16:43:52 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3BD917B24;
	Tue,  2 Apr 2024 16:43:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v2] gpiolib: Fix triggering "kobject: 'gpiochipX' is not initialized, yet" kobject_get() errors
Date: Tue,  2 Apr 2024 18:43:45 +0200
Message-ID: <20240402164345.14065-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

When a gpiochip gets added by loading a module, then another driver may
be waiting for that gpiochip to load on the deferred-probe list.

If the deferred-probe for the consumer of gpiochip then triggers between
the gpiodev_add_to_list_unlocked() calls which makes gpio_device_find()
see the chip and the gpiochip_setup_dev() later then gpio_device_find()
does a kobject_get() on an uninitialzed kobject since the kobject is
initialized by gpiochip_setup_dev() calling device_initialize():

 arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
 arizona spi-10WM5102:00: cannot find GPIO chip arizona, deferring
 ------------[ cut here ]------------
 kobject: 'gpiochip5' (00000000241466f2): is not initialized, yet kobject_get() is being called.
 WARNING: CPU: 3 PID: 42 at lib/kobject.c:640 kobject_get+0x43/0x70
 Call Trace:
  kobject_get
  gpio_device_find
  gpiod_find_and_request
  gpiod_get
  snd_byt_wm5102_mc_probe

Not only is the device not initialized yet, but when the gpio-device is
added to the list things like the irqchip also have not been initialized
yet.

So gpio_device_find() should really ignore the gpio-device until
gpiochip_add_data_with_key() is fully done. Add a device_is_registered()
check to gpio_device_find() to ignore gpio-devices on the list which are
not yet fully initialized.

Fixes: aab5c6f20023 ("gpio: set device type for GPIO chips")
Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Move device_is_registered() outside of RCU read lock section
-Simplify backtrace in commit msg
-Add fixes tag
---
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59ccf9a3e153..94903fc1c145 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1175,6 +1175,9 @@ struct gpio_device *gpio_device_find(const void *data,
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
+		if (!device_is_registered(&gdev->dev))
+			continue;
+
 		guard(srcu)(&gdev->srcu);
 
 		gc = srcu_dereference(gdev->chip, &gdev->srcu);
-- 
2.44.0


