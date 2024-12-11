Return-Path: <linux-gpio+bounces-13768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 393859ED187
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 17:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D05618896FE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EDA1DD873;
	Wed, 11 Dec 2024 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QaGJhj1N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CEE1DBB0C;
	Wed, 11 Dec 2024 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934480; cv=none; b=QVvAoLCMXoNiyO2iviyxOl4pw7lL0yBy3Iy/sOO3C2PrD70S80dJMNznhna9P4otmndc10BU9F2FLjD3dZH7M8lBjvD7exJ2MmhCPwfN6Acvbf9tBPzilrJuzgLs8boTHIxya+CZsiizl8l6s+bhXDSyIcEJfXmifiEf8GpixWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934480; c=relaxed/simple;
	bh=yyNvLDoRqw3n7kygorYC0ZKcQZ8W0My3Qn5ah/JVOfA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k5rVAib9+jaJQu5RaYxFCUluF0yn7cI26iGjCxu+aj5ibMXENz2TuQcPYtK8CnhlhVUrNJtcZclQ8h3JYXVrLfETFQ3OvVuoinRCVQqu02SpSNSyFF+eoUh1q3A6unxtOHO9TJ1UBhUnaWopsqQxJm0gWkysbvmqGDNP2gQhpHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QaGJhj1N; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CABC240006;
	Wed, 11 Dec 2024 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733934470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vlmO94F6PCr3MRVBDoCJwKj3tmn8SRl8fag8OJSDsvI=;
	b=QaGJhj1N3BXKsF4O/l0gE0WlKZyiCvorqS52KoWtT2bdoVKaxA+oGgtUiH5uwDzuyeAdM6
	Cf+K+BzvksSUYfGTl9kQTrBiY+E3LG06f0XxihpBetSiKqEZqrn9Xd+1jS5m+qgFG05qpZ
	CbkJyddITIADD5ebZp3/AvCRI3sSOJUQ11LpEO3xS0DR7dxP5lKehCeGEcw1LQMNXO4rhu
	6IyKDb19TJOZUOCiXn7E/dbk1zQ9ZvsvuRgwXzrGe8Tv4Kt/lZSiC+QScQUj5HyLhDeWbw
	2s6Df9qB+5pr0PLZI2Qr6P39Mlbs/PPeKzW7wcvYU3TRatcw64dTvCY0SZQDuQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH 0/5] Add support for the AAEON UP board FPGA
Date: Wed, 11 Dec 2024 17:27:15 +0100
Message-Id: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGO9WWcC/yXNyw6CMBCF4Vchs3ZMucQIr2JYDGXQSaSt05aYE
 N7dRpbfWZx/h8gqHGGodlDeJIp3BfWlAvsi92SUuRga03Smbw0SsXeYA06edMYgziZ9Y8wheE3
 Y3xfqyLSm6w2Uk6C8yPcfeIynlT+5dNI5wkSR0fp1lTRU2+1at6i2hvE4fvbG9fWdAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

This is the revival of the AAEON UP boards FPGA.
The latest version was sent one year ago [1].

I started a new series, as I re-wrote all the drivers using the AAEON
DKMS driver [2] as reference. I also read all series sent to the ML to
collect the comments sent by the maintainers and reviewers (to not
reproduce the same errors).

The FPGA acts as a level shifter between the Intel SoC and the HAT interfaces.
The pinctrl driver shall manage FPGA pins in tandem with the corresponding
Intel SoC pins. In the previous series [2], this was done using Intel pinctrl
code (included in the FPGA pinctrl driver).
Now this code was removed and gpiolib is used to drive the SoC pins.

The FPGA also drives some LEDs.

This series adds support for UP and UP Squared boards.

More informations (like the HAT mapping) are available on the UP community
wiki [3].

[1] https://lore.kernel.org/all/20231031015119.29756-1-larry.lai@yunjingtech.com/
[2] https://github.com/up-division/pinctrl-upboard
[3] https://github.com/up-board/up-community/wiki

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Thomas Richard (5):
      mfd: Add support for AAEON UP board FPGA
      leds: Add AAEON UP board LED driver
      gpiolib: add gpiochip_add_pinlist_range() function
      pinctrl: Add pin controller driver for AAEON UP boards
      MAINTAINERS: Add entry for AAEON UP board FPGA drivers

 MAINTAINERS                       |    8 +
 drivers/gpio/gpiolib.c            |   74 ++-
 drivers/leds/Kconfig              |    9 +
 drivers/leds/Makefile             |    1 +
 drivers/leds/leds-upboard.c       |  126 +++++
 drivers/mfd/Kconfig               |   12 +
 drivers/mfd/Makefile              |    2 +
 drivers/mfd/upboard-fpga.c        |  325 +++++++++++
 drivers/pinctrl/Kconfig           |   14 +
 drivers/pinctrl/Makefile          |    1 +
 drivers/pinctrl/pinctrl-upboard.c | 1090 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/driver.h       |   12 +
 include/linux/mfd/upboard-fpga.h  |   55 ++
 13 files changed, 1709 insertions(+), 20 deletions(-)
---
base-commit: cbc4912199deab59fdbd830b115d81941d0add46
change-id: 20240930-aaeon-up-board-pinctrl-support-98fa4a030490

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


