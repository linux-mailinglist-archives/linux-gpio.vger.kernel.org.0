Return-Path: <linux-gpio+bounces-32743-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE2WJuHbrGnGvQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32743-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 03:16:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F64422E51B
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 03:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8355300868F
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 02:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACF33624AA;
	Sun,  8 Mar 2026 02:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IklvxTCn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC931A08AF
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 02:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772936155; cv=none; b=ta7pCHJZYo9Pzto4Jrc5PBfatYDnx7sPRtIBo3/Ck42o7DkmnJ3cKkf9bHboXf8zBmtFjIzp+yijfsMn6h5aSKYXonKUkOQbAFCr9/+A+I/ElrB6ajGz+KEz+z3VC/cf7qi5tRYDqLMc0o9mhLKfTl62o6sGO22maXMP/zqrccI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772936155; c=relaxed/simple;
	bh=RFTtLtXTJSCNlN81p7jhHeIaM5OglLMy9XlFjb1EpGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpZopzczXVSQjC2FtTrH9HR+gRyjbDvfortrGr8j9ZSfzrTQ5R9b/gBk4M6s4bdRqMid5Rvhk7CgbMFxH8xFQKJ3BCC1s4udeAqo1KI6DXVCtU5LtOmNpHI/b31T2+aUHT35hIhv0cvHWhqo7pbaYhlztEuFcWMxrmgPyRDk5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IklvxTCn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3597fea200dso5407739a91.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 18:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772936153; x=1773540953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIcO5BEsmaavjxp3pWNdUOixbx6V+gvKfNkKSDPbOxY=;
        b=IklvxTCnhXSR0WNDZcm8uy3KcOlqpXrdjhm+9XD9Xrs3xtfr8cpK5Q9rxKQtfI19Ne
         vu1qOig4TKysAQKEnXxOfh7SXl6go6ayQKsDpX+xAKPJD3WG8kB+xa1fGgqvfeDzHSZ7
         rvGCaHHHU9EHX2EtX8XT6EeBboE2k+qbm/PA9vHFIeRoHlF7J4xMIxGM9m4RCI4NXrDB
         WZ2F5lUAaWnqmXc1lbKdr+fIDm+WP7VBff2qKu1ReFRi89N5gJH2ClSEJ9BzBUabYM3c
         M11CJqwfXvhh7V0uK3T5/+J6O3Jch5UOa8VxgMSmSd8TZqGLWYb9LQjZp03TDaGlivZ3
         QzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772936153; x=1773540953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIcO5BEsmaavjxp3pWNdUOixbx6V+gvKfNkKSDPbOxY=;
        b=i+/sS0Eq44JwnmtyEG6pkXjtluCjQ2bJ/b5HmdcFQqh/1Rbz6GAIfhUsxytH4DNcoX
         90bU/lZ7m6Bca9dBqH7b2OV8YlVWeom/IIyWE8tEr9vyLOZ2ob02SMouWbPZaNrB30wf
         vQ50Xdlx9a+GMlIsD3/2Ii91o92Wq9Toz1VS7+j44gmTsnC4CSsnVn21PNsOAgGiX6r3
         UjE8i8l+y0qOojMXVpAZfr0t+SspS/G3tHyaSy7iGs8e9BeBeLSWaFS8TURFiMrG1vc8
         j6wTOyR6VLkH/JctkpSJj/bHTYJlvd3dPOOoELzfYgEg7XOzmZLgqYrH2Pfn8lY8u2gV
         ZAXA==
X-Gm-Message-State: AOJu0YyLyB4AMuOrXwR6KR9UTRG6mSsJshr1UX7XWUPWditn9G/1z0//
	yAz/3Uua6rjqS0Ca24ZGIH20crE4MHvrbCNCdYrq+FMVCZ5+nTECr0Bx2WN2iLYDEc8=
X-Gm-Gg: ATEYQzzDLqfDtx5gkcnKM5E1vIZdg/SiW3LbW7ETSRJe3f+nBdVklwINrYRjWlzsB+H
	MxmuPRw+M6E00q01mFHmmYnLEzW3X0g4viqQLEx7ABA98WtBP7xskpvKkjFsjLyXmj9cJD6CjEw
	ktB2T1AyHtyi0xwbiuaol2BBIgL1eYIeGnzvP7PzmONEVmRM+Ben3Ictekwag4LIv/DCRNHyBRS
	zpdI2KuiwW1QmJcrly8857x1git84z0L+6fFQtYGkvQvEYD5rxid7Rp5ndX/zK1phzCSeQ+nohS
	5f5+G8DWSxnhbDaI26N+DAa4Wv1F8uVu146NWyM4/+2I+UtLrOzX+gArJbytvmm+8G3DCkvSG5D
	n0mCjAlpI6pE1IFJmvyGbUnqSAVvYCkeMo3fg7DO35AEH9x8l8MRKm0KhsDeVbPemgNdaUNjJEs
	lIJN2MPHeDnvrbzPBiXb3PC0Tiq/XoIKKfyfF+TvFj8hNfKfQilAvYUg==
X-Received: by 2002:a17:902:ce8e:b0:2ad:ca3a:ecb0 with SMTP id d9443c01a7336-2ae823ac6ebmr70405345ad.25.1772936153317;
        Sat, 07 Mar 2026 18:15:53 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840adb42sm85962385ad.81.2026.03.07.18.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 18:15:52 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Daniel Palmer <daniel@thingy.jp>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Romain Perier <romain.perier@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MStar/Sigmastar Armv7 SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: msc313: remove kcalloc
Date: Sat,  7 Mar 2026 18:15:35 -0800
Message-ID: <20260308021535.48098-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8F64422E51B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[thingy.jp,vger.kernel.org,kernel.org,gmail.com,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32743-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Use a flexible array member to combine kzalloc and kcalloc.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-msc313.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 7345afdc78de..de3e6da2a089 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -483,7 +483,7 @@ MSC313_GPIO_CHIPDATA(ssd20xd);
 struct msc313_gpio {
 	void __iomem *base;
 	const struct msc313_gpio_data *gpio_data;
-	u8 *saved;
+	u8 saved[];
 };
 
 static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
@@ -631,16 +631,12 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENODEV;
 
-	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	gpio = devm_kzalloc(dev, struct_size(gpio, saved, match_data->num), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
 	gpio->gpio_data = match_data;
 
-	gpio->saved = devm_kcalloc(dev, gpio->gpio_data->num, sizeof(*gpio->saved), GFP_KERNEL);
-	if (!gpio->saved)
-		return -ENOMEM;
-
 	gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
-- 
2.53.0


