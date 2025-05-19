Return-Path: <linux-gpio+bounces-20270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC48ABB3EA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 06:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF423B76DC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 04:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A737D1E9B19;
	Mon, 19 May 2025 04:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/3gz55C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA723595D;
	Mon, 19 May 2025 04:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747628336; cv=none; b=l5/mqrxrbMkcFI9wmkuDUJ97nYWo6b0+RRPQtc1TTyXY3wSYUslXB2w2DEmqz2o/X72C+kaIGipvsBSkIzVbqAfMQODePY/wnoW2fNgM3rc7wXctRAWHqlOdtx7oqtj5L5xWz7JAXje86LrjGG5RmMiM7dgtci1mlR8F4EXlxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747628336; c=relaxed/simple;
	bh=jLerpliY8lwNJ63awyCH5IEpb6UjJKtwxck0FuxpfxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dkd7i88hT+tF8yQDT/3UFU9DpyEu1NVoU+CNQ3e+YhMUdlx1f35N4uP8gPzvNLilBQ5AVebigSEwi4RAO0JTvX6QdR/MdRFzh5RRLVS9vvQHHqu4LqdyDN/iZAaHhm4opyR8pL1DD7Uw2NpnQTdW8bGbzhYEfN3LRACrwneGgME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/3gz55C; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5e2fe5f17so424160485a.3;
        Sun, 18 May 2025 21:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747628334; x=1748233134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i672wSfl8bozbLq8tqyBq5/SvDJJOrrVRB0z3aIo+3Y=;
        b=L/3gz55CBSN4hNnBQ47dGz17QseiENKfFlv6zOWxTWU6EaKEaQa7b6ediWpzQWCzQF
         kJj1RRNh6EBOJvHxjYWDtN/h1jv1dh22kVgoSnCiaMDepipqgccAwM2epZZdcA4eVau8
         /ereKWILZ8OXq84lWwpqVXZ9FN7JqNZuIAw5uLCk8ZeOzAtZd+ebtBHMouh82bZjEHkm
         snQMuxRKeYT6f5BtXF90XqarfMvB1Sbb0tFOFYLjaAUGrM/nziLxgdUZYmwX4qRgpRtI
         WwzwEX+/MPpQwdR/t7Mai1oDF+wKlmL1FWDDz1cRgdR2iMZV5LBb4kVx6j5O7kIszylK
         msRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747628334; x=1748233134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i672wSfl8bozbLq8tqyBq5/SvDJJOrrVRB0z3aIo+3Y=;
        b=cDdSMjmxb9/JDaW9c2+qNLOCXkb7HGIwiQHHSAhV23qnDT+3e/NBsmDrTNpOtD6DS0
         rnR2GDFdC2spsDdZpUmJ+TtGlmrAx09bOl8X/AbELdp5dO9py32CIJD6DsJR0yExUBPK
         zqz82+shgdS0IMvNFQ637nmvqaIbg8n0trTusFKPvCrDthpkM7mr0nIhb6XVkdOqRC3r
         lFiCD7gzdU6wHyJ8oqTYCTR6qEHa6KahbQ/NwB9PGi2fyRvqkiyo1rJK0yvcSJI+NVIO
         yVfo46GgHjLWA+Mt1W/x2maxamCw6n1rcvLAHcIQ9IIbjbGrkiUTqKJJRkaxpvN1eFDx
         gZjA==
X-Forwarded-Encrypted: i=1; AJvYcCW93QkyDl6NKrbIk1YjKli++FT8GS6CO9dOL1wmTPLA91Q1BDvBBu0iBPidCoPF0nbP6eCCz9blvbQRXLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfsS3mRxlynUCQzdIzqxBURjxoVr5kcV4t6/4krocEVW6TRjyZ
	TlMH3gsN4m4NWBQaRMlTDh8RrnZL73Jpo9vkrsQQvN2Z8sMPbg7j2VlG
X-Gm-Gg: ASbGncspLlX0aiCpY9iNZJaKidaOywUb44AVDb98Evx0txJE3NYokXLdgsaWO1Qoio+
	rfGkt8bYMmWtPVfnOL3zaPv3BQnYFxcby5kWvBM5Mmv7X9fgOKXAYnvGkFDVWP+7EU2sDom4DdL
	J8bZZ99vtrRkDxXqmR1e/KWIXX3G7Uff9QZ5/AVw6soQahRh+imT4TOYFYjFPmYwrteSFfEv0qk
	jgtjWXZLOE2sCC724qwTdPhJ4p+Z81wjuwkms5Gtz4Z2Q+rrSY6P55TMJPyorQGTu+bBLgrJv0A
	vPC9MBujqXqhyjkY92cosjf1XCz5NN26YXORoIB0OIYtwc8rDcyL
X-Google-Smtp-Source: AGHT+IEUs4IT/lhjtYKsJEVnWX5RmdlqFA+buH+dPVoqP2Ad1Pps6JHJvnOI+w6H9lOPftx148Sdzg==
X-Received: by 2002:a05:620a:290e:b0:7c5:4278:d15f with SMTP id af79cd13be357-7cd46724cc8mr1598390185a.17.1747628333605;
        Sun, 18 May 2025 21:18:53 -0700 (PDT)
Received: from CNCMK0001D007E.ht.home ([2607:fa49:8c41:2600::f21d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467be47bsm525713085a.16.2025.05.18.21.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 21:18:53 -0700 (PDT)
From: chalianis1@gmail.com
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anis Chali <chalianis1@gmail.com>
Subject: [PATCH] gpiochip: expose gpiochip set data to be able to use it with a an usb gpio expander for example.
Date: Mon, 19 May 2025 00:18:50 -0400
Message-ID: <20250519041850.13095-1-chalianis1@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anis Chali <chalianis1@gmail.com>

Signed-off-by: Anis Chali <chalianis1@gmail.com>
---
 drivers/gpio/gpiolib.c      | 8 +++++++-
 include/linux/gpio/driver.h | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cd4fecbb41f2..58d051141f53 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -900,10 +900,16 @@ static void gpiochip_setup_devs(void)
 	}
 }
 
-static void gpiochip_set_data(struct gpio_chip *gc, void *data)
+/**
+ * gpiochip_set_data() - set per-subdriver data for the chip
+ * @gc: GPIO chip
+ * @data: Data for GPIO chip
+ */
+void gpiochip_set_data(struct gpio_chip *gc, void *data)
 {
 	gc->gpiodev->data = data;
 }
+EXPORT_SYMBOL_GPL(gpiochip_set_data);
 
 /**
  * gpiochip_get_data() - get per-subdriver data for the chip
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4c0294a9104d..b1206fe42c26 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -717,6 +717,9 @@ const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc);
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *gc);
 
+/* gpiochip set data */
+void gpiochip_set_data(struct gpio_chip *gc, void *data);
+
 struct bgpio_pdata {
 	const char *label;
 	int base;
-- 
2.49.0


