Return-Path: <linux-gpio+bounces-6117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7780B8BC0B2
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 16:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31D12281D09
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 14:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24DF22611;
	Sun,  5 May 2024 14:14:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358E20B0E
	for <linux-gpio@vger.kernel.org>; Sun,  5 May 2024 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714918475; cv=none; b=dakslW1SdkqrEdFwuhEKvyp2ikqMTfJUX86glrN6liwx9K1Prv0HSSkrchQkXaZTQ/r7zr8gElrq5fs8eOKnAkYRGv+O9Qwjnpd37Dg/zuNQZBpkYc8QjlfvYCxjLeoJ+Pg9lEPLm/CeT3hJPdInqcQx4w7yVOLLta2GVM9nzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714918475; c=relaxed/simple;
	bh=S2udcO86AAUOlJqUCaaHKk93tPUQSfKy/zbbJmspVTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4kJCBhnTLUEgOFNyNjFUks8iGQMNc4xN+y+GCjXUnnBw/FE2p8JOsaXQ3JHzbFDT/p2iFk/9MK4FFdAhUXVqUjG0jATX8ADCF1Uq4WywWu96tUSM4n1xrawoxH/tgESTirThwPiUkxQbk8vNLa+fPXbVk5C8xZ166gxlORZ21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id ca24acbc-0ae9-11ef-b3cf-005056bd6ce9;
	Sun, 05 May 2024 17:14:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] gpiolib: Discourage to use formatting strings in line names
Date: Sun,  5 May 2024 17:14:20 +0300
Message-ID: <20240505141420.627398-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation for line names allows to use %u inside
the alternative name. This is broken in character device approach
from day 1 and being in use solely in sysfs.

Character device interface has a line number as a part of its address,
so the users better rely on it. Hence remove the misleading documentation.

On top of that, there are no in-kernel users (out of 6, if I'm correct)
for such names and moreover if one exists it won't help in distinguishing
lines with the same naming as '%u' will also be in them and we will get
a warning in gpiochip_set_desc_names() for such cases.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 include/linux/gpio/driver.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f8617eaf08ba..0032bb6e7d8f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -376,9 +376,7 @@ struct gpio_irq_chip {
  * @names: if set, must be an array of strings to use as alternative
  *      names for the GPIOs in this chip. Any entry in the array
  *      may be NULL if there is no alias for the GPIO, however the
- *      array must be @ngpio entries long.  A name can include a single printk
- *      format specifier for an unsigned int.  It is substituted by the actual
- *      number of the gpio.
+ *      array must be @ngpio entries long.
  * @can_sleep: flag must be set iff get()/set() methods sleep, as they
  *	must while accessing GPIO expander chips over I2C or SPI. This
  *	implies that if the chip supports IRQs, these IRQs need to be threaded
-- 
2.45.0


