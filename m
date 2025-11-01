Return-Path: <linux-gpio+bounces-27915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C377C27915
	for <lists+linux-gpio@lfdr.de>; Sat, 01 Nov 2025 08:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0860A4E21A2
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Nov 2025 07:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8586F299A94;
	Sat,  1 Nov 2025 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="B1j2NTpI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F09F2144D7
	for <linux-gpio@vger.kernel.org>; Sat,  1 Nov 2025 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761982911; cv=none; b=AcI7AbzamA9xdPfcd7UepT/LwkTaQxzbZLaFqel3S9h3FWe6Urua/p+GKIdFRfpuaY6vj8toZXeVBGahuhDR32bBXIuEyKaG6ZQebUmuaFtR3gxKeX6mR/8+wxP7WmHytR7JPcJi8Z4XRbvbeMjtSoul0fV1axutfJeBBoLdYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761982911; c=relaxed/simple;
	bh=mSw/rltB15wNrO0TNc/5bGlDtOQf6J6vcN0tJLT/t+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N41HIm/oLAjN0EGSXhHM6Ioy0XfTrjUIu/p6Z7TisbPWn4CVqeNcChwVLI1l5smkykfLcX2Hv6wTDmzaalbWLzhWcX/953hh1GGymEXtziilWv9cCGCYP66MA3h6E465n7RLGPmpp897PrlUyX+dax1IsH1wdHBwpbxfHi68wGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=B1j2NTpI; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:86a2:0:640:3ad2:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id 843C9C0049;
	Sat, 01 Nov 2025 10:41:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id afbi5MbL2eA0-st1hBII2;
	Sat, 01 Nov 2025 10:41:38 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1761982898; bh=mzxOtnuSbyr1bIKcZkKlJCvrhBTu8eZK9s90Jih4szY=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=B1j2NTpIx09W/NOwyDHq5vjgFXgwGdcz0Z0dwjyQs7mf/NZIPVDBC6KUstAoT/+Sn
	 b7X+DeNwAO9zr9MRyfVVhtqq60AAkemNxL3ro1Cmz5wBwznK73/IBR4hqDryz8j5hs
	 eX47gQsKGrfh+1OzsHohLiPtCbmRLk0E0AaAcIAA=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] gpio: virtuser: avoid strlen() in gpio_virtuser_direction_do_read()
Date: Sat,  1 Nov 2025 10:41:31 +0300
Message-ID: <20251101074131.353640-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251101074131.353640-1-dmantipov@yandex.ru>
References: <20251101074131.353640-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 'snprintf()' returns the number of characters emitted and buffer
size guarantees that there will be no overflow, an extra call to
'strlen()' in 'gpio_virtuser_direction_do_read()' may be dropped.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/gpio/gpio-virtuser.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index a10eab7d2617..0f959254fda5 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -342,7 +342,7 @@ static ssize_t gpio_virtuser_direction_do_read(struct file *file,
 	struct gpio_virtuser_line_data *data = file->private_data;
 	struct gpio_desc *desc = data->ad.desc;
 	char buf[32];
-	int dir;
+	int dir, len;
 
 	if (!atomic)
 		dir = gpiod_get_direction(desc);
@@ -351,9 +351,9 @@ static ssize_t gpio_virtuser_direction_do_read(struct file *file,
 	if (dir < 0)
 		return dir;
 
-	snprintf(buf, sizeof(buf), "%s\n", dir ? "input" : "output");
+	len = snprintf(buf, sizeof(buf), "%s\n", dir ? "input" : "output");
 
-	return simple_read_from_buffer(user_buf, size, ppos, buf, strlen(buf));
+	return simple_read_from_buffer(user_buf, size, ppos, buf, len);
 }
 
 static int gpio_virtuser_set_direction(struct gpio_desc *desc, int dir, int val)
-- 
2.51.0


