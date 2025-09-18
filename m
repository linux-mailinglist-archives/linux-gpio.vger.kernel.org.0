Return-Path: <linux-gpio+bounces-25861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85142B50EF4
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 09:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 264C54E21F1
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E4730C371;
	Wed, 10 Sep 2025 07:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MdWRFSxq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847E30C375
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488387; cv=none; b=VwS4V0eP1+e2FwQ8WfdlZlW+at0xLwc+O+T5ZSeUBins/elrOWl3CMcCUejp+bxegYwUXOlGDe5DdcCy4m8V8cbQdn017ti+WsYmdePbwj9rUleYEv9vfU9oO4qh+kwO7yRHiCHzBrGb9XW6wNPPv/cHh8Meq9y2XBiiyv13Afw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488387; c=relaxed/simple;
	bh=yVgPPOcE+ewclBktjz5E2v2YtjZnxTx9c2rSBG/L3iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkitdJcTDUh08X11XwSdTf+do6DK77+e2OWJcIuJe/y2+WQ1AQwYi58Auo5inQCF53s+lQEDLaFYYXMfiVLSqoeHWRCDOpzD6NsUo0OCU5aLw5kOuyuaF4xJJSctgt1cwivH9OoU4s9vJ0cDYZzLQeUfzWRdYLaf3hs9e0w2o88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MdWRFSxq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dda7d87faso34204545e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488384; x=1758093184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=MdWRFSxqoX+kSmCr0y9Ps6106QNy+bQ0mPNdfKGSVYT7YMo7+MehGMct2JlBErM6kp
         r2BWuRg/5F7Vfgc5Rn60Ho6fquWDEVF9FtvN2Kl7n2sA4EfB/6NmQzK0N11yUBMGBRU4
         WCP+DvmcTkRv/aDY5EunVCzX4zggWMRYR9VL+HrA38PxCD0q2y49JxIN5ydg8CrbYiyg
         ZbzM8JSqTMlSrD43eSKqCxt38biDdFy4VLC4+YNyZaxgw+XqQfTDgSE9fnE7oKnz6K4L
         t7ckldWYMn+FDgSNa/xeGwddNv5OtH/22RMqAvyQH9ekGgoQZ5skTFE0GUy2iAVNd/M/
         R1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488384; x=1758093184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=GGk446DoNQZIsDeTQxsj22wp4EL6jcxtQJypHAd4hS/8W8kAEXAYdvfBcnrHYXF0gQ
         1m2KNKUPCd3QuwotAoiTvRHDlbKlZi80OevMLwojrcPR99+euZMVqHTdilWWu95xX0w9
         0VtAKvLmPAcq74AXnRXT+qswR3pLHrBrDUwIEmavBZLp8SFHuWgBEOSjKjrELMK6qF+G
         2DgVz+M/xlEdLdN4VV4ZT3Z4HSCom20QubCf51xMdbTI9H0BWSLiamPQL2sn64yQqkdr
         XXVT4nPyjYOzDDs7ybfB2u0Vx2vdFoG0wtBNbKabkX619Xlpvt0U7I5ZXbC8bJeq7XJg
         Urfw==
X-Gm-Message-State: AOJu0YygZEwsHKgWQFX96X7IVg72sWpSW9475p+Wbjl75YIFnuPAGLKw
	WSkVj+OaaO4lsxBb0KIXjlYzvy/x55anevaRrHp7lY+xC33IeDwbuMMhrV/oZ26Rvv4=
X-Gm-Gg: ASbGncsXufhLS3GuwSzeJpBSbyVancEn9Eg0HrPhmJ83EOjqlaFO9MO/uBYwhtxUNQX
	shvT1c/aCzGkEpAowCvxwhnKdtyBS4GWG9HDIhp7xuNG1fKEQnX9H0wSU4OFCeeF8/GHvfEwupb
	UShMnFtDu/EehoflcLDjdKaEcJW664/0n+sRe6GuK7D5xr7nBEyedT1HYIRF3YwtC7Yv4jKU14D
	DO/F1fLuSWSa2FDf9IegI774x7akanmTx3b84BJNIOBZbRBc/yOkHnfWzIjnrLgljSsG1etOsY1
	dErhu+WEVeiH3ZJ3rTOWTYk1R7CPGgHjt1zCnPur8dXxPrcqv6ui269GcmN7hHcP4HnjUn5NirX
	dy5nLqkMJ3fGY6TmOtUaJXPoBzqc=
X-Google-Smtp-Source: AGHT+IFSdci3CHq8VqUJcbVpnmzo+2lQEmXOuKmC8RRv+wtgm3NDfrNeLIsCyZlc4vVFVDxHItzjfQ==
X-Received: by 2002:a05:600c:c4ab:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-45dddef8c61mr118822845e9.37.1757488383998;
        Wed, 10 Sep 2025 00:13:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:42 +0200
Subject: [PATCH v2 06/15] gpio: xgene-sb: use generic GPIO chip register
 read and write APIs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-6-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=We0X7xb7ACmLY+lbQa1fcNw6pP25NDN5z92R8VM93TU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTtTDj4oNGwDRR7+qL+H0qpz1nceYdGpGDPH
 ia1yPhYhmCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cltID/9Ctub5VaMhx1Y9F7RnCwKevVF+bxKd+hpiZxi/K5bnOELNFhQC9MrYe3Jo/xgNtSOubP+
 e6d48QqOuSuIV5d++/Pwni9yyHDsRzqCfGPA2sfV/Bab6KBoWxhzDFn7s3lGqcOecV05i8onc8w
 wFCuxdoJ2i+LvKp0salt7xPfvkjgcIgKGzQmTopLYLKahtb4dC4nWif9HBKqL3RiNU2dkpEQiAI
 ippQcDB6/0i6YRrnVZAEtqpMgKaPwyRaKiOa0VdiVA+ZmDw7GrC1p+27jgEkErOCxYboKXTW5Ae
 gKTqLhDKSVO7c8IKGCdbIQxYiJEsGZCrYFuLA0pAogyydqwf/ZrcVP6UgJSOttmdPXlWCEfaWHy
 cLBcQnSi7cTCuPVS9mvSF6h4umNbP3tpRfb6pOfp7l0RY4i9BJsC6WTDRDQ/vHekGy86Kwi6Esq
 IzhKLr3OO4wfaano0EJJ5Gs84UnV4nMnYW9Nts1TM7oIybmuoDUgWV2QyuT4HcBQmTL6/b7FDyw
 82BVH/fdSFI2eKKOB3z+/AkHtl9+TcngTVS3xIAQWvL6HdAmpBuy2zbPJ7GMd0eV+meic7kYxxF
 1/MoGJeiOoVwFVOK5uGV2GtBCFo8xz97rQ3SKuV2hyxM9CExMXw9JCmDOBulmxf8+Vd8Afmotk7
 5UhY14It5j5GHJw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The conversion to using the modernized generic GPIO chip API was
incomplete without also converting the direct calls to write/read_reg()
callbacks. Use the provided wrappers from linux/gpio/generic.h.

Fixes: 38d98a822c14 ("gpio: xgene-sb: use new generic GPIO chip API")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene-sb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index c559a89aadf7a77bd9cce7e5a7d4a2b241307812..62545e358b6c4b1cab25e1135cb24ccc3e955078 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -63,14 +63,15 @@ struct xgene_gpio_sb {
 static void xgene_gpio_set_bit(struct gpio_chip *gc,
 				void __iomem *reg, u32 gpio, int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	u32 data;
 
-	data = gc->read_reg(reg);
+	data = gpio_generic_read_reg(chip, reg);
 	if (val)
 		data |= GPIO_MASK(gpio);
 	else
 		data &= ~GPIO_MASK(gpio);
-	gc->write_reg(reg, data);
+	gpio_generic_write_reg(chip, reg, data);
 }
 
 static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)

-- 
2.48.1


