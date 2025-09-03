Return-Path: <linux-gpio+bounces-25511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D527B42166
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5BE27BB123
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EB72F7449;
	Wed,  3 Sep 2025 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kGFd976y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57723220F24
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905550; cv=none; b=D1fbTu/A5GngVt/NyAUQNMhctv53Kx4MZmecIpy3uGjIWNS/BxGpmDxGmvryXgE3uxhQWVUWiNuF89KEpaz3P4le/Fm+Vzk6yaViErUcqSOHy2d36yAoqii6c8RSIdCftwRqb31QVFJZmwgDGiDXrvNyyqTdh3JDm3dL5k9tT3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905550; c=relaxed/simple;
	bh=AxnjN8HdcrrRJdD3Em5OxZHWI30slwPQxLIaH5Dm8zU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jTtgMkThE41DNC7L7XN8XJHEItg1HYVYRzLfUcpOYp4OW8YUHKSAOLGCk/ZE+Cvnkoq7cWw5E88KYadbd/h8ELZtMv+9OCCTUBK3FD/Ebt59vl0Rku+LrJOD22z9R/W4dtKJqyGovUn2xUh+8IFsYnowczpnSXwc2FyWBveYK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kGFd976y; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45cb5e1adf7so6168995e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756905547; x=1757510347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SorLujCi/8VwUy2DiiZuGVeG0//OIQh6/vMrgqY4imo=;
        b=kGFd976yp/IwUwTJO9WR3PD27Bv8MnZhhABRIXlDypzqZM2lTLId2agh2plNE4PRUl
         yjXoSFqLx8xz2kv60nbMMtw8XW/7Ath3vhE6YUgvWT70srfXk11kKnnxZsjwdkHLbjxl
         2FEtuekDmbQ8J7bIYwXZwXD29mG2Mrl8orb0YgPGXsHbFxdmD2NwMXIh3esRNoR1powg
         BzDkHOo6QKPyvgGBd2j5dlZmtDpC15uZPkMZE6D2bmIGrI5RYIyZ7tPM65VzCBVVcyVn
         KmGXshoSfZa/Msdh9nK2Ow0hlZiGTw3wTfndYHtoNTUYsYFLpTW4zANju/dzOZL6o+7l
         1z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905547; x=1757510347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SorLujCi/8VwUy2DiiZuGVeG0//OIQh6/vMrgqY4imo=;
        b=U+2oQFUBpTmCAZUpT1x4H7WXJDXlsjgW2OZDrJx1g2KRWfd3ofz/W8WQYxW/1jyx+f
         6nd70HeTOUdZJVPioRZZZ9b3v7x6bIiTqV8DazwVJvbGSmzQSLSmp76kGuD3DQMGMMTw
         6ww60yvIVyOMTZMF11FsGlYS+/wSOvh7+CHvbnuRbX7H+sT5lvrTOTgHU+/7GT0wUizG
         I9R4p1GgFL65DBpiiNjWF0xTH+vuUy4Ax+9yTa+aRiA/ilUhBUjVCd0rJfXme2bwzTiB
         6SGfvckgpxaMbRC8ZeYJ0GaFIn7Ey2k0ocuq7PXn0sZN4IoII1JxbFDn630/L+AK4aSp
         Iu7w==
X-Forwarded-Encrypted: i=1; AJvYcCXnLeJuIU0e30C2tw/Zw9eNfPZBWaZBVthe5MDaFGBaZneammoRIt8aYw9Jkg9qZiGXWwHrZfJJKm9e@vger.kernel.org
X-Gm-Message-State: AOJu0YymsyBJbfqw7cfdDSqTz4Zmt4YMJ9YXddweW+yxwXEG38aNxECL
	Ozahb/gtq/7/R7Xnp6Y0FrhW91ysS/rAZ4R9shcYSocVV4SQsUeA78YA4dVzVQ+Ygms=
X-Gm-Gg: ASbGncuSIYyA9EDdlC1nvepXn5uz+On2ZRVW6XMLCVDlHDEHzX8BMqcy+eGraLmNClA
	AaVFF2KmDmBxOpDoZnnsZhW1/oxeFZ1LeGt4SjILbpNGIcjvA/F8+yHdpv+4eyXvxDXzACdMbUh
	Q/AdNUND1mE/qcCsAqZIVmGwofcNMpzqDbUJkBDL54CcbhyrxAm/Bou/nzYDPix0ACQe5Mjuxon
	T++/nw26bA5Ix1NVZC/GVubZIeGTY7fsIws7CmMNqwYeCUapmqcvS/hv98RcmoZLZnGFggJQQSN
	L6cXN9TCQlIQn16YyvpLcOqGr0LN8YtoJujBcCGB1aIIBsjUnYJv/DbN5R8SOa2uHBWaCVrZDGx
	Xwqcaum0rAOF/1w5YUv89aKH3X2m8wtaW5DU=
X-Google-Smtp-Source: AGHT+IGknUG6HgigUOQWTunTcwtIb0WJ5XnoTsT77lsG/WciW3ylo6pBLCzcVEAz8Ytw/rgRDnZgiA==
X-Received: by 2002:a05:6000:2911:b0:3ce:f0a5:d597 with SMTP id ffacd0b85a97d-3d1e04bd373mr13481486f8f.47.1756905546669;
        Wed, 03 Sep 2025 06:19:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm239486025e9.3.2025.09.03.06.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:19:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] gpio: nomadik: wrap a local variable in a necessary ifdef
Date: Wed,  3 Sep 2025 15:19:03 +0200
Message-ID: <20250903131903.95100-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The 'desc' local variable in nmk_gpio_dbg_show_one() is now only used
with CONFIG_PINCTRL_NOMADIK enabled so wrap its declaration with an
appropriate ifdef.

Fixes: ddeb66d2cb10 ("gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509032125.nXBcPuaf-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-nomadik.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fde4b416faa8..97c5cd33279d 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -400,7 +400,9 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 			   struct gpio_chip *chip, unsigned int offset)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
+#ifdef CONFIG_PINCTRL_NOMADIK
 	struct gpio_desc *desc;
+#endif
 	int mode;
 	bool is_out;
 	bool data_out;
-- 
2.48.1


