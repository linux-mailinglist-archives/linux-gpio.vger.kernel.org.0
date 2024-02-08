Return-Path: <linux-gpio+bounces-3085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5484DDA0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 11:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99D201F2A06A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E6A77626;
	Thu,  8 Feb 2024 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Oe2E0bfF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADA97640B
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386389; cv=none; b=pEczoxqqvDE2w3/43O6v65luOnVUrGYP3xX/CV8j3550ZaxILNV9oml0VZMxIFeWIDND4HH1ZXgZ96RJB6IR2h4S44oY+Y2PskOOwgXtl8D7XCuUpVhHvsPRnPBUFTN++TuzdtHC1IG3jQRG5s+ZeLJzPNRGr/2UkaOcVcbdrdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386389; c=relaxed/simple;
	bh=e2jA9sxoxDgk0Yo8yXFHQ5QmaZCOljQMxwcPvDfphck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dcPb23QexBkBIoaB1Mt4md2hDMXZ4AjjUZD4ExjRFuQk6RlvjhXg13nmOyVNr+tRF8ceIjIlmeNkY/Nd8CnwAXnUbydck2XK+GG7PTzTzd7Gox19by+GAabHBN6PieOteHSPN2WMNttyEu7q+Cpke1cSqOg24JHNKe8awKvrqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Oe2E0bfF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5114c05806eso2417025e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707386385; x=1707991185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSvYY20bsG3YLQLtQqZAj4VIzY9NSOxs1N8eV9mNDzY=;
        b=Oe2E0bfFUX5flHJiOhsQBq0kz475M1E4K5M5ffAe+JKd8BsiRKbrOt/c7uW4B9BRFs
         3lymI8EAoXec+3gMwYB1H8IM88fZkcBoVhVqIL1ouhHhyuXksL26ztZeFqndRwKn752B
         /c64LydeA4e+sj8kVyjb8ZxvOboGrwvIiz7vJ6LV/OFnx18v1gOPQkwPlMvml+mpDrvb
         TPnc6vb8WbM/9Nx/aeZjnPP+5gGL8TcTV6H4Lut70s5OsHlthKFcEjg3RD7uPACSP2si
         lhtqAZAszSFBWgfrpExJyBZBBeS4mmCP4wllcYtKYfnMlQeNwRhBxX1FAr0A87yFThSE
         RmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707386385; x=1707991185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSvYY20bsG3YLQLtQqZAj4VIzY9NSOxs1N8eV9mNDzY=;
        b=syVu+/InopHdPBwJ9ohDQG/nwfby5TNM2gCKOdXIHHAiLfOdqYUkbRbP44SzPdWeS/
         3MyYboKS9CIkftBOORpAAra498HjdXVqyM2KhJ3BiNJcVN9zpzjIq25sjGpS9+WDGT19
         0/ODPDQiYcaRtYdl7o9QV+8ADsOtpPN8vyjb93n+RHS3a3JgPqVd95aN8GcoFZ89w0l7
         GJ5bk5NOEfT4hbJKXEHCApMGDTcfW/i/pkH303shTbDKit00gxt5G4YyDMDM110z60zu
         zqaJKcsYTUXlBYhCcjQBy6IE0SoFvKpCzW8xNyLq9YrMqgTl5Al4mnkjU31EroOUiXUx
         qJGw==
X-Gm-Message-State: AOJu0Yz25dt8PEch6E6Yvx3a5IM/ezQ5D11JWtjX/lhV1gCGDY6Gwr/Q
	C0pB7sk6QzQHatqwkwAkkScyJtms7NQvtZcjei+68nr8h/haEat7pGZZ3NhxMBM=
X-Google-Smtp-Source: AGHT+IF8x35m80ZdaG3qrPqZ/C9cTaIubJF0gdb+qsxnQfZwIEe4xWD3obLvRa9ccOLIRwkXcRwTuw==
X-Received: by 2002:ac2:5967:0:b0:511:69f8:c4be with SMTP id h7-20020ac25967000000b0051169f8c4bemr2183961lfp.22.1707386385122;
        Thu, 08 Feb 2024 01:59:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU242FHHxTbD2IudtNlQqDRyZKNE5NLu3La2edstf4JAjElG4i5brk5j01vhvsOtxlzRaTNwry9DNuDAOBPIpyQV9GzycjZHwxrIABamxg4dLG4HEhzKeX1Fof137wrFKN09eCvjvtvrswlI4YZZ+/dR+6Y7yb3Wu/81ZDktnpoAvaLM1TdWnsHR4CCsQJnOqB3Ksd1IMNPHE1DtYxorgZSOZhiQagSQSh3prJFwIdpPw2dk5bRLlUaNxlUGZTnQ2D6L8fl3QXK4Un+H5zlldG9dxOUgx7t0NdszXb5YVGBRGnbpx/y90e6VdiEe+DNPNe7cnhNFVN7W6mjtjmeYL/i4eXulsfHTA==
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:44bd:e160:131:19a4])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d60d1000000b0033af5086c2dsm3265963wrt.58.2024.02.08.01.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:59:44 -0800 (PST)
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
Subject: [PATCH v3 19/24] gpio: remove unnecessary checks from gpiod_to_chip()
Date: Thu,  8 Feb 2024 10:59:15 +0100
Message-Id: <20240208095920.8035-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208095920.8035-1-brgl@bgdev.pl>
References: <20240208095920.8035-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We don't need to check the gdev pointer in struct gpio_desc - it's
always assigned and never cleared. It's also pointless to check
gdev->chip before we actually serialize access to it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9be7ec470cc0..140a44dec0be 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -214,7 +214,7 @@ EXPORT_SYMBOL_GPL(desc_to_gpio);
  */
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 {
-	if (!desc || !desc->gdev)
+	if (!desc)
 		return NULL;
 	return desc->gdev->chip;
 }
@@ -3505,7 +3505,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	 * requires this function to not return zero on an invalid descriptor
 	 * but rather a negative error number.
 	 */
-	if (!desc || IS_ERR(desc) || !desc->gdev || !desc->gdev->chip)
+	if (!desc || IS_ERR(desc))
 		return -EINVAL;
 
 	gc = desc->gdev->chip;
-- 
2.40.1


