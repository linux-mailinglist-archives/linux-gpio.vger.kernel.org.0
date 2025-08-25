Return-Path: <linux-gpio+bounces-24903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE017B33B96
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6AE486720
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE152D1F64;
	Mon, 25 Aug 2025 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1gq8ooi8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30829ACDB
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115336; cv=none; b=FhhyHzKMiHB+jZK/sFqZSCot/NtwBLex5ydOL+BjmEJu7nlSSV2sx7oZIfptpuxV7BjOZkDUCqYBDAgqnF3aKZIjwlwA1ZyO7HpkFNIgSC/es7EbjaRADfK4Br+CyPW9PY7YCC4xtjJ+6Vhi55a8qzZsDfz3ZlbxqnLENVtA5NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115336; c=relaxed/simple;
	bh=gsmPjfJ2QmHUYm2T6GbsR3/AGbz0mExN80EXjsadE2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlOKPx+KY3pER751BBLr25ewM8iYcLEw0LwjLIQ8Cik7sCsrQyflMHzWEY9sQi0CxSx3dyEp0noXaFlcSFKR3IYtAkln3DZZ2cVjRNyov4cuvYNsWxhXne9GXRwF9ZreQ1djwR67IZkFKwldJ2n284PNROsSVVuQPOfsU7hbS4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1gq8ooi8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c68ac7e238so1274392f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115333; x=1756720133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=1gq8ooi8d/eYqlMHVdifNqmt0133hfexOz/d5aiksX+etxbqfIpM3bdTMR5f39wiV5
         pgvhEbMKL/smgBYF2mOcgSsB8a8DXp9ZSdpFVPqKP+GIw/jtuVkhP0lJkwi97zGG4CSp
         4eAIapRIJCFrvxHhDNrmbyvD7mX7qn8watEwpn3P9ZS6H/dIUikVs11oXDusK9ib3S9Y
         nIDvA+9hc29SMyQLHhwiOUvwHzpgUXXKVKf5LtkfOhxtAvLtD9lAHhnei+mLPx0XX5ZF
         O9cpNg14SsyzJf+akfXAB69YJFnLbpRnDWXKynN+VocVSJAIG/NNRKRTpBMTT4csCYhS
         4PLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115333; x=1756720133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=kDpn8kG6Pt32p4RUNDCmP+V4V5vYk3LO4cKOcxZPSC2uyXAU//RHo5DB8m9U8OuIZH
         /htbHLmR64KyvlSLf3uB1CwIhDlz54U8IY4h3QGsErS0n3yQDNKfgW8hV0GGHiAk2qr5
         F37qlYa8qJmhJxuwm+yCqSm8Ngi6Y/htDo02SgeUmrkQj2RS9LkjTVXUItia7FUJNtVq
         Jky9pFM9rXpMzFcay2TR1BrcWHe1umWkAiX5yevQmTcfgqnmK0JPvtifvh/Uja5ifalD
         pJ3gNSMIznWtxRN77oJtvyFW0uxF5+Y7g/rLu5QT+w1PrztleKldf4MYfX4J35LdvK8F
         oMRQ==
X-Gm-Message-State: AOJu0Yx40XzlEjsI7qpPyvCKGRm//awuafueAilcWUyHp4FdabwylerU
	JTEXDqWCgb5TBfr5SsJ3BsSbwQpy29fnLjfIMxiB9cG2U2R3/r0keut4AfJ4nzq7qpU=
X-Gm-Gg: ASbGnculLmWlHv13RFlE7LzLUhdN+ExF+9ybIcroAh1reqr7fsYDMwjJmIoN19RJgc/
	+LUGgIDw2BBOaWXF7L5VpcI8r2HLXLzqnU6Er0rou6CWEL0HPSnRlHfPSpU2rUSAUFjXCJhrXZO
	+LTX/l0WKYktgfVbV8ms+ARXsTvoCGFq1asdMJpC7IWgnigo8sDiE+uR2BsLg/jLwkArQptVuM5
	LDndZCwPFnLHUzCarCpXdn3ydu/POYh/0HWZAZ4M2EgUHCovBgmVOQbJjS17LMxaLk6MfEsytvm
	91nwNOGmyHnPJy4iH6PEUpWf1BKgyMEU4KbhzGH75ILeSzQZprGgb41wKyAYFVum1yOv7TPU4G2
	FW9Wh9Xerd//BaJqj4IcCAY1FiO0r
X-Google-Smtp-Source: AGHT+IEzPBRol6ngRIiwBwafEdbjwrW6XPSWfLq8zxY1VDXJdLBaFNn9Mck8nqFBhHeSS6beuJE3Yg==
X-Received: by 2002:a5d:5f96:0:b0:3ca:10aa:ea82 with SMTP id ffacd0b85a97d-3ca10aaf4c9mr1072885f8f.13.1756115333081;
        Mon, 25 Aug 2025 02:48:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:44 +0200
Subject: [PATCH RESEND 03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR
 flag
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-3-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LGZlUs6AQDs8ng5Nn7ommqnFHh3w6/vhUJqzq5JniBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF++jCG//VSmX9rtXyjEtDWZYRz4QSoScANu
 IK+WVARy/SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 cnBED/4wgp55EodYkNBwqOjqiRN9M99fAcanaozgJqRlQ6HPSTZm65M8r55yUsHnL3eaalhzCkY
 q5x5HujE/m+jFPnJh62GmPp+Efs62oOw9MJvF04gW+M9yKCEPBZjOUOnQXpVrlSm1GslyqhpAj5
 Jt9k8/5wWjYUbKIwt343yCHgNbYwm9UCGp9oWeH3faWThhxe3KDZtRi9iU+BLmFtqz5h1CEY/4M
 tUFXNsPpwioCRKDCAu+nsnaeIP3tIt+Ez07yyDerqF74fK0TIB6cjn+Tv+8KCz9Byf1bzTZcbEg
 ZUNPrmRJtfkv9q5DBkSB7Cfj6o7EhjvuTG7hEzcxx0zTJ13CEF/yD+VpxnI6V7T1gRrK0xRy0um
 zjiudnsQRpqzkvjQ9pbBSAmR7GbieSo7K8Hq01YZij2Hc0UleRJxWq5Bcvt78abclVn9Mh26hJ9
 T/Ykt3NKI4F1IcfLrTJHlAhkYO4wHmVw2g78JF/BPXhMzHR6rgn76f+tERkHRUSPLPVSsNG4efs
 qOSYjv/xO39rLGb4UKDJei9qCw7ssl2tez4WYUWOORldfzUShAw+dkbUwjsWXd4PXSpO3P1BeQd
 SeeCebsxhkQlIFAQk8aJODB3ZgOmvWZ1SsCAdOCPDXHhn9fs9Vb2sGIYPRGsc8STeDPjLIXgPE/
 yyaad6906fNYAww==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason for this driver to touch the gpio-mmio internals, we
have a dedicated flag passed to bgpio_init() indicating to the module
that the DIR register is unreadable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hisi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index ef5cc654a24e2327510b872563e68fb0b9aaef71..6016e6f0ed0fb80ea670ebb575452d9ec23976fa 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -295,7 +295,7 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-			 BGPIOF_NO_SET_ON_INPUT);
+			 BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR);
 	if (ret) {
 		dev_err(dev, "failed to init, ret = %d\n", ret);
 		return ret;
@@ -303,7 +303,6 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->chip.set_config = hisi_gpio_set_config;
 	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
-	hisi_gpio->chip.bgpio_dir_unreadable = 1;
 	hisi_gpio->chip.base = -1;
 
 	if (hisi_gpio->irq > 0)

-- 
2.48.1


