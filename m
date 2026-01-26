Return-Path: <linux-gpio+bounces-31047-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG0KNrLndmmLYgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31047-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 05:04:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E4B83CFE
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 05:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E3D730056CE
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 04:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C51303C88;
	Mon, 26 Jan 2026 04:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjKVlQn2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769142FE067
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 04:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769400238; cv=none; b=JEHRHTBCWjv64C0erRmwNR4yMBdsmy4BuIn/yRpem9dQkjxNdiwz/xQXbmkAv5aWHuszJI4GHIa7g5lKP5qds3dl8Qqz033cxMQFXqClCc/DwtwjEjNEMDsk1vaMFoAFEcxjd2PAklURyOmHvVOef9GPqtcJY/bnA9kY0FkoDxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769400238; c=relaxed/simple;
	bh=u5ggP3SaLsBZ5fNtGAK69mMRVxGb/2HufTJafqtumgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prdrOTq38BrhLRcPIJvnEYgabVh2EWXPqZKQBO/xZ67805MH+RpZ0o7KAke/XoAeDsOokmsB+TmCh1D2S7e1dlLrJLrY33sMeEl3E3kv7Yqes0uWOlAGZjKE6a5xzuncfKn6GoG1Wz1vSR6I2ZrZ/v+XWTf9nV8spQn6bnx+F78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjKVlQn2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d67f1877so26444555ad.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 20:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769400236; x=1770005036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToUPMBAe8KF/3v+CFujmR6mZU+BDeOfE0AmdHr1dMFg=;
        b=DjKVlQn2XjY7gtZbPIFduzC0rDweeMKPeNWhRAj/SeN0A9/TreOqDxpuXbj5Viesh7
         iD/WAkCOHv8XCOTed8unQtQo8Z+dD9SgyvNac/hA6jrszOitFXCpteFiSJ6RNwr+P1e5
         9vIS3xBNVQbMn36gQ6YUgdDTV2v3bSVHjXfZ7Yxe56lsSmAfy9dWhAluaLsUqHofKNqb
         mIVIiX/BfNxBQRSVW9qUilzfbyIqqVTVCG7tReDtJN6bNLGo2kCNcyzau0Ja0wwcH7ZZ
         b3/hAWz65io5MtDtJ1rmUhBzYwhS3grBKWAKnQcWhSsdjmHolU7x2bswG9k2WelJx9qb
         avaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769400236; x=1770005036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ToUPMBAe8KF/3v+CFujmR6mZU+BDeOfE0AmdHr1dMFg=;
        b=eC01T0EE8H95L+8VR6D934yDVmRe0fsWALogXTEeHRh3bejiZoDKWw6KA4Za/Ok7ti
         dMyhoDU6cS+i/L6kAxxGaaWizp7Xq0w7r47kIUV+FnCAvyVC0oRzjdnjaW0gTvbYGB8l
         KQIOmPwA8MwMQwV03mzcnU/lFBmyi6Pc+8S3a60mxD9TgoQdo9m3JGWwG5f+vGJvyH8q
         Ar1RCD2S3F1syTE84wPvtDwq0DuOoF5z0JYqunQQ29qWVXXco15OQa8NhvwcvZ/ayY+O
         8HYhohPXZsDnFjuTL2gi/yRqJMdpGbhcdojVKuU3NPUBFgosIAroJ8gXGvnp7UYcBrdy
         axzA==
X-Gm-Message-State: AOJu0Yww+DCqxioIxx+bnWKJQKdPKuBtLX3GvCHfKBle73yLPGAbjHLH
	8JmgEjh/BsRoSydEFD8k6jigG8C6vRTV10hr0tMIeSXKglENvxxZ/zKbjDxKfnFyLqxM
X-Gm-Gg: AZuq6aKZ2h+MBjOHZXqgVwBTX5tjv3yezfLCp7ftwZcWsxXGqxL7V7Lw17reOSC+lYz
	zA84ZU0o+Q6LgzlFL9J77MFssIAy5F2FDg7d5Ai/wYMpMbpzYCh9mNK5/H8KDBUb/G/0UDNQTWq
	qC2U4FveGaKV2vW41lt8cjYyUfQsiTUNhY7BJ0UnccaM6sjyHbgs1GLoVCh7XI7msTQlC8g70Ui
	konlxy9IpTvfrvnej/xSsYv1oXLE0eCsLoLu+sJ4gZElrCf5OrJy1iwmY52FLCBoxipsCUJh/jf
	WQTvr9MrE8eBRUmsg0mDTm7gqWg0swO+FJrTdvSm9/dJDmMgdSFO1EEeRdXKmTSwVfgBnMVl1Ju
	ch1XqGHKO2PKDUzfmqSazW1kPfvu5QEGDjLYo2xSYIgZSQ/6+y0fBlx7dac0i2PMDNlkZvKzVaI
	nuANpVI2ks/+VgFgHOuFDgtr9OVPUfwm/SzZLZ+r5uVoR2t3KZA/Emh8k1D30R
X-Received: by 2002:a17:903:40cc:b0:297:df4e:fdd5 with SMTP id d9443c01a7336-2a84523bcb6mr35639525ad.23.1769400236411;
        Sun, 25 Jan 2026 20:03:56 -0800 (PST)
Received: from localhost.localdomain ([115.156.144.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb0262sm77563835ad.70.2026.01.25.20.03.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Jan 2026 20:03:56 -0800 (PST)
From: Yuhao Huang <nekowong743@gmail.com>
X-Google-Original-From: Yuhao Huang <yuhaohuang@YuhaodeMacBook-Pro.local>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org,
	Yuhao Huang <nekowong743@gmail.com>
Subject: [PATCH v2] gpio: virtuser: fix UAF in configfs release path
Date: Mon, 26 Jan 2026 12:03:48 +0800
Message-ID: <20260126040348.11167-1-yuhaohuang@YuhaodeMacBook-Pro.local>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124162111.3945666-1-nekowong743@gmail.com>
References: <20260124162111.3945666-1-nekowong743@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31047-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nekowong743@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,YuhaodeMacBook-Pro.local:mid]
X-Rspamd-Queue-Id: 35E4B83CFE
X-Rspamd-Action: no action

From: Yuhao Huang <nekowong743@gmail.com>

The gpio-virtuser configfs release path uses guard(mutex) to protect
the device structure. However, the device is freed before the guard
cleanup runs, causing mutex_unlock() to operate on freed memory.

Specifically, gpio_virtuser_device_config_group_release() destroys
the mutex and frees the device while still inside the guard(mutex)
scope. When the function returns, the guard cleanup invokes
mutex_unlock(&dev->lock), resulting in a slab use-after-free.

Limit the mutex lifetime by using a scoped_guard() only around the
activation check, so that the lock is released before mutex_destroy()
and kfree() are called.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Yuhao Huang <nekowong743@gmail.com>
---
Changes in v2:
- Fix indentation to match kernel coding style
---
 drivers/gpio/gpio-virtuser.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 37f2ce20f1ae7..098e67d70ffa5 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -1682,10 +1682,10 @@ static void gpio_virtuser_device_config_group_release(struct config_item *item)
 {
 	struct gpio_virtuser_device *dev = to_gpio_virtuser_device(item);
 
-	guard(mutex)(&dev->lock);
-
-	if (gpio_virtuser_device_is_live(dev))
-		gpio_virtuser_device_deactivate(dev);
+	scoped_guard(mutex, &dev->lock) {
+		if (gpio_virtuser_device_is_live(dev))
+			gpio_virtuser_device_deactivate(dev);
+	}
 
 	mutex_destroy(&dev->lock);
 	ida_free(&gpio_virtuser_ida, dev->id);
-- 
2.43.0


