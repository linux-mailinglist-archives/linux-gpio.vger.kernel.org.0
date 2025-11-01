Return-Path: <linux-gpio+bounces-27917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB13C27978
	for <lists+linux-gpio@lfdr.de>; Sat, 01 Nov 2025 09:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AFAA834AF0D
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Nov 2025 08:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA4F24CEE8;
	Sat,  1 Nov 2025 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="trjdr7zT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward205d.mail.yandex.net (forward205d.mail.yandex.net [178.154.239.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC14327A91F
	for <linux-gpio@vger.kernel.org>; Sat,  1 Nov 2025 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761984734; cv=none; b=jBF4RK7MxENetZMxl/6UK3+OajpkMfuW+M4QNHUfGBO41WW66SwdV3b5peYTfUxy4VGpHsfzH1hTAgcp4tO4aLH1tOGooJFXn+UdlQWTHIIEvZzC5tZV/hUhZXU7fMuo5PxK6BXDPIJ8cJMMBi+VpDh8glMO4971rbREPECliNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761984734; c=relaxed/simple;
	bh=C6jr9QML9yKqlp3JHdJ7RUSIpD/T3FYHJW7+e53wyjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKhA3YoEYXzVcKvEdZTN0KdFhDTzKxfxArc/+WDa0BzEZ/HxVE1QQixwjuazsK4j+jEES7QVlRkb/KgUsJ492lKZtsUWaqhTUXvGQDLGHC2LBKvdJmDkzgOHloXk1TaEE7TgEUB+9unxFKg+SW/3rwG3Teo5UYLujlERsEzbXSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=trjdr7zT; arc=none smtp.client-ip=178.154.239.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward205d.mail.yandex.net (Yandex) with ESMTPS id DFAAD86D7C
	for <linux-gpio@vger.kernel.org>; Sat, 01 Nov 2025 11:04:00 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2a21:0:640:9c41:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 28FD2C00AC;
	Sat, 01 Nov 2025 11:03:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id q3cYTIBL58c0-PyX2a8wC;
	Sat, 01 Nov 2025 11:03:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1761984232; bh=jE6qFTiQFMgGs7TeZdgnvsTvom1JTizUIo8VTs26TBU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=trjdr7zTpcV/Qfc6EdvEh/2mdVDWj+3FAxsVAz51npAC4QKkU3PFn165m1udZge91
	 lS13rvUaNBBXLjp8q87IkTQ3bOsR0Ch0V/QH1LW5Lx9u9Lxzjx4K14wHZxnURQhLPa
	 lz1W26rArUisabYj2CTipArm+TeIZ72wfQD8iAgM=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] gpio: gpiolib: simplify for_each_gpio_property_name()
Date: Sat,  1 Nov 2025 11:03:31 +0300
Message-ID: <20251101080331.367522-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'for_each_gpio_property_name()', using 'snprintf()' just to copy
the string into a buffer is a bit overkill; 'strscpy()' is assumed
to do the same a bit faster.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/gpio/gpiolib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2a003a7311e7..0a04780962cd 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -107,7 +107,7 @@ extern const char *const gpio_suffixes[];
 		if (con_id)								\
 			snprintf(propname, sizeof(propname), "%s-%s", con_id, __gs);	\
 		else									\
-			snprintf(propname, sizeof(propname), "%s", __gs);		\
+			strscpy(propname, __gs);					\
 		1;									\
 	     });									\
 	     __suffixes++)
-- 
2.51.0


