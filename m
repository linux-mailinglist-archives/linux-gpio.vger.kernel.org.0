Return-Path: <linux-gpio+bounces-2958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5AC8496B6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF2228920E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FE119473;
	Mon,  5 Feb 2024 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PZyb4/wu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B893F1802B
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125684; cv=none; b=czZNT9Q+4LlWMAnLRQWqPyIY8Nv639Rhon8CUfeSpgiyi9CLPAmONYWI1XDfJ4+3Uc3Sb4d9Lc8JeW4+q7TrZ9guFbQnB0/ZQp5e+DadAHT2qL9e3LhVrjLcj6iXC3atp3QN8xvuhX7Z7ztWZVCJmam5kXB+BKXzm0GjQdrCf7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125684; c=relaxed/simple;
	bh=DEm4ivJPwvyJQ3+rwUCzWKrs05E/BVn3gRvUWmQAFN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1X/phDb2CefR8o/aGgPkaD65pgWqi+jKO/9rs2KLtaCDVXO29XmhtO1yOTZz8/HCP5npccDEMXg/jKmveZw/wzW3QBtjonKrhrJA8ZybLrHraLxZVLRQiprLuUSTEkr1J5B+cc/WDfFnn94tjGY/D//ucHwxPBH72tpdfK8yzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PZyb4/wu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so9368455e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707125681; x=1707730481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJfsBLVML9p9Iy9pV/o7OjQ6GeZUjbwVmk3zuZ2HyJg=;
        b=PZyb4/wuX4TCaUqA4Wksz+TjJoDLgA6L5b8sSBHxg97dbH9jJvwzBYcViteljdnNo6
         x05CA8lPWScieQnZqqU4XU/GezrSTB/kjA3nwCS7mB+Lx/vS4Iheh/UCYjp5yMvFiHs8
         hlskGtu64Jd78pUsQlKayd0Jucl9lwSzMEBPdBm3O8A6mlHcxI6SirOd6cM8q9YANbtC
         0pfOtdFi5xMINaBetaDjhKy9/yBSt7F1xupntsv4CHPuyqNmI0/aSainfEi9+/eJ3T0V
         mN3T5GRBS5SI5970UTFl/lyd/RWSkbpUuPr34PKoQ9xt7Mqgdpqi70Gj70lvXlfhHF3H
         DoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707125681; x=1707730481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJfsBLVML9p9Iy9pV/o7OjQ6GeZUjbwVmk3zuZ2HyJg=;
        b=DCUAaFlhOA5Op517tgdBL3q06eW2f8ZOgaTwXqXNeF9OTA66LhPDX6/DAaMu89vnS9
         N3s6bBjV6LqTS1jVYu/GFFpc2DH6zbZdJbHOs7XFUwADOA1ec8ADRq4zO94Pr+PVg5HB
         yBoR6AqKJZ4bqM+8mUkx+yxSXgxiAlw2qdg11RX6z2ZHBFWeRyeMo4t9NM6A7JuVVnkX
         s9OQuab1vQenTduwX7mEPJoL7D/CdGKDy92JfSGFixB98hB+MSVFDC/pVOZAl3Lxdb9d
         CYOAkyPXpxzsyLLFu5EjLYF5qWOH9AVxNWFomaYST+6YQtVB9zhgWXIpbFRAllHcGwcC
         JrBw==
X-Gm-Message-State: AOJu0YyO5fPhHdNuL8nUa9+wDY9NZSzxvsrdhkqN/how5jIhxREmUfms
	de83OfDGEswEMHW4objO6JYV3yDp9OSGA+5uhCHqiYh7w8FNgLv8AS76un4rSB4=
X-Google-Smtp-Source: AGHT+IFTk75p4T7YsB2qUfoM1Ugfl9KI9GBfXAbd4boWpGB3sTqz4xEuekxq7k9bDL7O579RyRi3fg==
X-Received: by 2002:a05:600c:518e:b0:40f:ddda:4e19 with SMTP id fa14-20020a05600c518e00b0040fddda4e19mr506479wmb.9.1707125680992;
        Mon, 05 Feb 2024 01:34:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWjvm/tk38/dR++2+UOg7NwEVKczDnNOK22kyYjVAFTkO2DGlirfusYq123N8IU068HPfieFUIS/yUiCJFZTy9WOkfcVWCrbummQyXl9mA/PV7fIWijg1B9R3vFGjlEAtxZx5gZ3iQ/VWrexNNQWoZzoLJJaL+DHoYabAl+A9YY7DrudpTECMIi9ih+itfdWNQDKvFY92j7z3QCPeZWjBpij/e1nkZ9RRsYG+zVwIrR5lxfnbfcZhR4QbMBf1i3+sLXiP02vnoMs7JCZPRIjZ4Q2S/+G6GoXyf9F21akdE4JyhXh6cA/VMuU1ldTbkWVDY6+6zxuYu4ExuNGWAyrzxPPeSu8cyZfQ==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d929:10db:5b5c:b49d])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b0040fc771c864sm7980397wmg.14.2024.02.05.01.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:34:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 17/23] gpio: reduce the functionality of validate_desc()
Date: Mon,  5 Feb 2024 10:34:12 +0100
Message-Id: <20240205093418.39755-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240205093418.39755-1-brgl@bgdev.pl>
References: <20240205093418.39755-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Checking desc->gdev->chip for NULL without holding it in place with some
serializing mechanism is pointless. Remove this check. Also don't check
desc->gdev for NULL as it can never happen. We'll be protecting
gdev->chip with SRCU soon but we will provide a dedicated, automatic
class for that.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f8d53ebbf25b..7d897c807e95 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2251,19 +2251,12 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 {
 	if (!desc)
 		return 0;
+
 	if (IS_ERR(desc)) {
 		pr_warn("%s: invalid GPIO (errorpointer)\n", func);
 		return PTR_ERR(desc);
 	}
-	if (!desc->gdev) {
-		pr_warn("%s: invalid GPIO (no device)\n", func);
-		return -EINVAL;
-	}
-	if (!desc->gdev->chip) {
-		dev_warn(&desc->gdev->dev,
-			 "%s: backing chip is gone\n", func);
-		return 0;
-	}
+
 	return 1;
 }
 
@@ -2339,12 +2332,7 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 
 void gpiod_free(struct gpio_desc *desc)
 {
-	/*
-	 * We must not use VALIDATE_DESC_VOID() as the underlying gdev->chip
-	 * may already be NULL but we still want to put the references.
-	 */
-	if (!desc)
-		return;
+	VALIDATE_DESC_VOID(desc);
 
 	if (!gpiod_free_commit(desc))
 		WARN_ON(1);
-- 
2.40.1


