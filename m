Return-Path: <linux-gpio+bounces-7309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B847902345
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 15:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1D4B1C20BDF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 13:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F98014387C;
	Mon, 10 Jun 2024 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R5dpanIH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7744B85624;
	Mon, 10 Jun 2024 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718027606; cv=none; b=ongnuZp8AvVRRZ0/eVZd5btkHncN0yZ/ZMbY1p5lfjksjA+fKsG1II2a0DcqvRXZBZjpI7lJNXngIdwCXyiy4MhCjugz1HPKPz/tyyk19yw3a3QyhNPWKInyrysHrX70E16ZUFq2vCiav/Cj8MtkJjFLk8LON8Mphvxkhl3XTGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718027606; c=relaxed/simple;
	bh=9hYa8l5lfGSwkKmbgb18J6D8KUzmTZxbQJnlzz7hNZM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ffp44rWIQ5KuwgRp08ATTh40mKIJYu0uMrFsY74yUro/1vSl/UnvyyjbuBxFPK96F/uCWGB+Vd1BlQL1hVdulBw/c0LINizjvpWlDyz5iZoJcdyQ/Iin0RgLo++S786MlYIPYALkDTyW7ISuQ36ZIISI5OEt5avAno0RYPIVU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=R5dpanIH; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45ADrEnM106139;
	Mon, 10 Jun 2024 08:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718027595;
	bh=N1OeRdjzW2BDag8v1tJ9PaBomBTrv4HOdNeEt9jOvL4=;
	h=From:To:CC:Subject:Date;
	b=R5dpanIHD8xp+zZ9FCfRboABUCL0j8vAM+IngPcWLc5WWLJi3tWixDRewaPa9XouT
	 xj6IwZL4zBbtIlCFWCJCGoQijtQWIlU2SCvNC9/GgcEw7XvitmqqNm08rm1I1ml3RF
	 b1E5MJS1TlMZBC20LTH6zfu3GFmkJ6BRGRvhYa8w=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45ADrEWN099130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 08:53:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 08:53:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 08:53:14 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45ADrEoG032480;
	Mon, 10 Jun 2024 08:53:14 -0500
From: Andrew Davis <afd@ti.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
        Rui Miguel Silva
	<rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
        Alex Elder
	<elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <greybus-dev@lists.linaro.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH] gpiolib: Remove data-less gpiochip_add() function
Date: Mon, 10 Jun 2024 08:53:13 -0500
Message-ID: <20240610135313.142571-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

GPIO chips should be added with driver-private data associated with the
chip. If none is needed, NULL can be used. All users already do this
except one, fix that here. With no more users of the base gpiochip_add()
we can drop this function so no more users show up later.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 Documentation/driver-api/gpio/driver.rst | 5 ++---
 drivers/staging/greybus/gpio.c           | 2 +-
 include/linux/gpio/driver.h              | 4 ----
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index e541bd2e898b5..ae433261e11a0 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -69,9 +69,8 @@ driver code:
 
 The code implementing a gpio_chip should support multiple instances of the
 controller, preferably using the driver model. That code will configure each
-gpio_chip and issue gpiochip_add(), gpiochip_add_data(), or
-devm_gpiochip_add_data().  Removing a GPIO controller should be rare; use
-gpiochip_remove() when it is unavoidable.
+gpio_chip and issue gpiochip_add_data() or devm_gpiochip_add_data(). Removing
+a GPIO controller should be rare; use gpiochip_remove() when it is unavoidable.
 
 Often a gpio_chip is part of an instance-specific structure with states not
 exposed by the GPIO interfaces, such as addressing, power management, and more.
diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 2a115a8fc263f..5217aacfcf54c 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -579,7 +579,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
 	if (ret)
 		goto exit_line_free;
 
-	ret = gpiochip_add(gpio);
+	ret = gpiochip_add_data(gpio, NULL);
 	if (ret) {
 		dev_err(&gbphy_dev->dev, "failed to add gpio chip: %d\n", ret);
 		goto exit_line_free;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0032bb6e7d8fe..6d31388dde0ab 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -632,10 +632,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
 #endif /* CONFIG_LOCKDEP */
 
-static inline int gpiochip_add(struct gpio_chip *gc)
-{
-	return gpiochip_add_data(gc, NULL);
-}
 void gpiochip_remove(struct gpio_chip *gc);
 int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc,
 				    void *data, struct lock_class_key *lock_key,
-- 
2.39.2


