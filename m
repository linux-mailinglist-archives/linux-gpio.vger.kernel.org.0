Return-Path: <linux-gpio+bounces-27916-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CEC2791B
	for <lists+linux-gpio@lfdr.de>; Sat, 01 Nov 2025 08:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F313D3A40B0
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Nov 2025 07:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54207299AB1;
	Sat,  1 Nov 2025 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="wysrlNnO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79829992A
	for <linux-gpio@vger.kernel.org>; Sat,  1 Nov 2025 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761982912; cv=none; b=kmM4r55I/XdZ5urlvmfwe+ngqy+G+E6FIxrDwQDXfJ0uY1QymvJ9HPDq/Wa4OFx0tFlWl4wFD3kxV/ZWVx34ucoctJLROuG/Ez+WJOkaUd9FC7dR8RDRhPzffMmXjJHTDzvsUroSKa+IvawmiIzM9Uyop01Wtf2oO/tgAiPk3SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761982912; c=relaxed/simple;
	bh=DSl0OG5BzQ4viNJHeW/+FbE3UfJwEMRDmsNG5epjfN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kI4OvYfrNGME7EbUn6DLM7dRkw7kRIQorAhRWzrWe0DiINaCV3QjiXnG4rN9oNuply4T50gmMYDeUz/UktJ/v4IpyOViqkIYokp43DHA2dAFWxKpdasK1VW4/+lMf11bhAzyrUGUMghvVZ0kO7uOZ/7lWWyPMoT3SCPSp7w/WJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=wysrlNnO; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:86a2:0:640:3ad2:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id EBF84C01E3;
	Sat, 01 Nov 2025 10:41:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id afbi5MbL2eA0-jQNUAtiG;
	Sat, 01 Nov 2025 10:41:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1761982897; bh=RN+Sx5r+rmPIdZsT4O9ab7oaEv0cVkMwDIDbLNk2hlo=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=wysrlNnO6knmoXIfSJcGchkkSFx3807AjOAqRyk3n8RCrnVaW3lY7iAzAljbT1g06
	 o0eQuXVZcztXKJOgtp5OFJPT7zLsg0NVdr36uWGL3L9kg7/0vJ9VcL/rH4dAT3X1hU
	 AaOv/Y0VbAET0zxC8nSB0dfR1HZ4Wp1UBcRFZl6w=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] gpio: gpiolib: replace deprecated strcpy() with strscpy()
Date: Sat,  1 Nov 2025 10:41:30 +0300
Message-ID: <20251101074131.353640-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer 'strscpy()' over deprecated 'strcpy()' in 'desc_set_label()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9952e412da50..5c0cd096642b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -146,12 +146,13 @@ static int desc_set_label(struct gpio_desc *desc, const char *label)
 	struct gpio_desc_label *new = NULL, *old;
 
 	if (label) {
-		new = kzalloc(struct_size(new, str, strlen(label) + 1),
-			      GFP_KERNEL);
+		int size = strlen(label) + 1;
+
+		new = kzalloc(struct_size(new, str, size), GFP_KERNEL);
 		if (!new)
 			return -ENOMEM;
 
-		strcpy(new->str, label);
+		strscpy(new->str, label, size);
 	}
 
 	old = rcu_replace_pointer(desc->label, new, 1);
-- 
2.51.0


