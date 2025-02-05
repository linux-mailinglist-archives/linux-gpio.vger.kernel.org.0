Return-Path: <linux-gpio+bounces-15402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0097A28B2C
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 14:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37681163EB0
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 13:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D147083D;
	Wed,  5 Feb 2025 13:05:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BFE502BE
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738760714; cv=none; b=hKYvkgJqklmAlCODZq+BndZfORtOShiTsuvef0oJHypYcYknA0lxffYbxq8ewYtDWQF6R0qQUTq9wDnZtBauLodaL/aloSyjrwYajV/AhRoeBWFH5NOu6gk8G4iNVdhIt8EVwUHrL/+auIaoqUNiK5GNIjhX7ImBsHqP1cgOkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738760714; c=relaxed/simple;
	bh=1lbD5u3awMB8FBEfYe3jiPTwSBQuoBo9YXz8XbKCjpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIqia9TwM0DgJQxkTjhWbspHs1pED92/xqrNL7cZ/ADjVpM6hf5vYKUOKoQm3dC9Yl5PU+ZrVjWwiZMJMmITupLfG02+ExYDMoPPqr9Hw8KotSvhErLJHvhfmCU2nUrkL5Mc0ZE/hwqYeVVfwUuzoQUAx6gRfp5WFQwKcsqzcuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by andre.telenet-ops.be with cmsmtp
	id 9p552E0053f221S01p55wz; Wed, 05 Feb 2025 14:05:05 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tff5I-0000000FvZS-3qWg;
	Wed, 05 Feb 2025 14:05:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tff5U-00000006PqT-41G4;
	Wed, 05 Feb 2025 14:05:04 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-gpio@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 resend] gpio: GPIO_GRGPIO should depend on OF
Date: Wed,  5 Feb 2025 14:05:03 +0100
Message-ID: <db6da3d11bf850d89f199e5c740d8f133e38078d.1738760539.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the Aeroflex Gaisler GRGPIO driver has no build-time dependency on
gpiolib-of, it supports only DT-based configuration, and is used only on
DT systems.  Hence add a dependency on OF, to prevent asking the user
about this driver when configuring a kernel without DT support.

Fixes: bc40668def384256 ("gpio: grgpio: drop Kconfig dependency on OF_GPIO")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
v2:
  - Add Reviewed-by,
  - Depend on OF instead of OF_GPIO.
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 68c5e69342571495..285a93061daee717 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -338,6 +338,7 @@ config GPIO_GRANITERAPIDS
 
 config GPIO_GRGPIO
 	tristate "Aeroflex Gaisler GRGPIO support"
+	depends on OF || COMPILE_TEST
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
-- 
2.43.0


