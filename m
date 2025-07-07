Return-Path: <linux-gpio+bounces-22853-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B09A7AFADAD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87C4C7A6C5D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A04628DB73;
	Mon,  7 Jul 2025 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ijLl3wTi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D328C87A
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874635; cv=none; b=TxBo8tglG/swHEGZdNY+KMtF/yDZEeJKesacx0LrjnCk8V4vuK5WYQoUIc6CAp0mwjo22bL8vdJahUYVERH6qLA9OpoSZq6bv/noWYE/IZN/4zpfWYCxopQqw3k1i1ZEAvOl8CALF9g1xa6G1nieFjHUI21ESX+Qlc3YJ6F9jtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874635; c=relaxed/simple;
	bh=7ouLYNojBK8YtI9q7Mvr6a4rawM5cEtpGwkrd35ZmBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kj4NqfCi7GquXFFFCK2p+NqgT74Ee34t9cPZPqiR/5wuwXQC7f5O1QBbV2FA7h4uod+lJaghbj5FnQaX4a5/voyTNKgknhgnmMD9FwwxkdA+OjvOpmbfLFIop0Uw0W5Mxpgz1N3WCqRdJ6NoETSLOIaFAQsXDVjJ248j1yLTk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ijLl3wTi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2376786f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874631; x=1752479431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKIG6360x9EOzMXFyVuOt0+qxmmOCbAUWOq9FvMmdEc=;
        b=ijLl3wTiZpsEhz8QzfQFq4GP2CbLt1KlFp4hFHxcSio3jQ03H0Rzmh/o0zfZyM3pY9
         lzRP8drK1yp0rHiYK4VUaDpWVU1hJywLmVfwZXzRMLt7FFUL66ltFUBtzjbzYgEqsE/I
         oqvSRyzahARe6ymWhxoEYHULLNhVgkUPVOKYGGL93Wj8VKqD/3PtutaXXIrCi2kiwq9E
         8EAND2+hE48lSOaP16ZQCvZlzIHjPj6iCR0L7rW8nEkXWZkae7V1uaBCUHAKTzzg18E7
         tKDLvWXWwfBmtpmGRpATXFUzkw9a8hfJXgxJL2xYiluit94VxMjl/gKSHqkM0Lbm5RV3
         k7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874631; x=1752479431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKIG6360x9EOzMXFyVuOt0+qxmmOCbAUWOq9FvMmdEc=;
        b=W3Cmf7Hd3AkX58/jElfCH5thipCGES44oKcg4v0ZC6SFIujpKcjlFhgwFcHjcgEcIu
         C4O8oSnEyFh68RFCFLE0zywJRLAKu36VsaL5prJ+msclu1hsvVmoahiykgn+t9Rf71pV
         uS+v762t0bfqm0ElQvCx+9UvBuqBf/77ETgf0orcIt021TQqlW5d6AXBDAVO3ZYMoM6U
         4MeonnTzvSEu8CY7EBN8iqz27CVKlJjLaG3KtHIvdYGeRDQOj5j8y1AjhHkVufIb3nQc
         vKChFxsv/eYT+grlIPPdHi4WaadmRwNzHGVYrNDF3mdwXHvv/+M7AMceYOLGrQlJiMfc
         9y3w==
X-Gm-Message-State: AOJu0YxCo4L9cjhC1j36hi2wZPEJctLJY/WMOxAGeJ5QWU24tI1esQzr
	HQHtsMG64scMpekv1tMSzIWJF2pSHnO7RfFUR/1fYRnnhDlRHhKwPeJttRf22/jDJPQ=
X-Gm-Gg: ASbGncubpX67piyEQ0L+JdaQd3xJr0lQzYDDXweyJ6++V+YHk3qITSeZ+r4VNpOY1yX
	T6s9wFYbf1uaWyoOkkGd3sMfZGr9eXJeUiK/gAgauRpVuQRVDLvwGpxeK3z0lbnoc/9B8dS8lCH
	vzvx+18rkFRVJlehAt1sTmmOlYvGVxBgNJZPM8zCB0Q7m8s4ne03uk7i9+4yFAfe82tJCvtFiOq
	uFAlpW8qVe5SbgiulJGTaEiIweapAE1XaW/FSpFUKH3xYhdWdhkkPvEpyT2fClr1fNgBJ2Vumcb
	szGbHZ3Q/HSpNwziy2s6MaofbNmv7BHxzPODcrnnMxgR07WltOsj0Av2cneXkW2hPzc=
X-Google-Smtp-Source: AGHT+IGnSqLeLz4f4OlYPyWFl1B12Re+pZQxqbUbOij/xJOfJOGrlBFuuxidA355YJED2LEeFyFJGw==
X-Received: by 2002:a05:6000:200c:b0:3b3:9c56:b825 with SMTP id ffacd0b85a97d-3b4955895fbmr9795564f8f.22.1751874631294;
        Mon, 07 Jul 2025 00:50:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:21 +0200
Subject: [PATCH 08/12] gpio: twl6040: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-8-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WdoaTovljRVdfcPXoOOpPCv/dUUU3fxtmp6eCVydmWU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w7TnJ01R7z2+UX47L227yzd8aywcscqE3m4
 m+QNrchCa+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OwAKCRARpy6gFHHX
 chuuEADWLZ0PhkJxuIIyFZpFqaQyNO+F2toxso5+gZ3uWKMxU46ds+vGbE/iA7kMN9669g+9rLZ
 C/K5a6cwcsdBh/kjSJXGC2cFI3B3y2rJgdLl2BdKowgiSFuXKgE1wg9ZtDdFfiMeaGfdzTN8wSd
 1X5x1jmE2/Dq5yPn12l7WoQrILfZMgB60shK9eXFPgFp2iL73Bk/wmah6skSo0ur2g5j3hSd+rV
 wa934N/PjDweLSFnkdaHjmSwTjPEZNPCaHW268ZUda/xhgcE1tR9XjIaSkYJKhmd4ga+Mk13fyp
 IkLIcd+6osDn7hDo/noQL3p5pkJRarD4wQ0pqR8ChCqRLqJb1OURx/Tl/Q7akeXtHetpp1O7rr2
 HbjxlvJ1hewJJg4qSvUsCHcUdrN4aDxpAtIy7TFTz+p4dnVf1WW0SrcJlgxBwjQHkwllrf+FYTc
 8MEiSlKjzg1qw4AGnMIm62hECJHxHyaAU2yjM3ys8p82rajD0BfXUYQqXcGZXV0dLxv6iVbSSwz
 0yq1ZKlyjplFPa9G4x8GUP6XGsN73FRba6S7CRO2yuXeEWR1yCKnudofXyNSdltRl3tn5rAfh/A
 va4XB4TxLbdGZ74JTSeh+UCzg77MjlSMZWwOnku7Y8m5+E+6otkV2Da6/OULGTFs9otJ7Rn+wH+
 tCPE7laRozoAEJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-twl6040.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index b9171bf66168f054e9eddef8417bef6d8f197f3c..b9c0d54d12f43242444f12a2bd8b6988d1511466 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -44,7 +44,8 @@ static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, int value)
+static int twl6040gpo_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct twl6040 *twl6040 = gpiochip_get_data(chip);
 	int ret;
@@ -52,14 +53,14 @@ static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	ret = twl6040_reg_read(twl6040, TWL6040_REG_GPOCTL);
 	if (ret < 0)
-		return;
+		return ret;
 
 	if (value)
 		gpoctl = ret | BIT(offset);
 	else
 		gpoctl = ret & ~BIT(offset);
 
-	twl6040_reg_write(twl6040, TWL6040_REG_GPOCTL, gpoctl);
+	return twl6040_reg_write(twl6040, TWL6040_REG_GPOCTL, gpoctl);
 }
 
 static struct gpio_chip twl6040gpo_chip = {
@@ -68,7 +69,7 @@ static struct gpio_chip twl6040gpo_chip = {
 	.get			= twl6040gpo_get,
 	.direction_output	= twl6040gpo_direction_out,
 	.get_direction		= twl6040gpo_get_direction,
-	.set			= twl6040gpo_set,
+	.set_rv			= twl6040gpo_set,
 	.can_sleep		= true,
 };
 

-- 
2.48.1


