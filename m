Return-Path: <linux-gpio+bounces-18273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FEEA7D516
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 290B2188FB7F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C52225760;
	Mon,  7 Apr 2025 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ncAkilTQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065C22423F
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009854; cv=none; b=QohwZjaJDv2uF/DMf8QSC0z//+NV+LE0YcK2J7+1JUYsspuARnRBMnei1NuNhn8V8BDLshlbX5TO5rYlThaoN1JVoyJRn0Bl8b2vaKXJ+2EnkK6+9prZzwNTrZhfDDlxtSt0/GNLsu9kXWblWoSpyv6BG4pPgLQJrXAunictDIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009854; c=relaxed/simple;
	bh=Gn/9poI96RQZEB4BdTG2EIlVnj5fIffZbi0kjF65Z3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Yk47tkGtamfP6NRVU7EXP7Maedutg0MLa+Ry8F3ZmPbC+DoG0i5PDZQc09QS75dEHDS8k9hCB+AOWa72pW6iZzr2D4Pqno+/Fc19g38klk1fNFLcOQCCoLt2cZS7SvUAu2QX/Z7ArxV7AP70KGZY5pdXzxLG2wPmZQTVMEH8nDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ncAkilTQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0618746bso27603285e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009851; x=1744614651; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S09RcVQv3bFd4mzFCRVHGkaFyCuRf84i2/SgMcqwsV4=;
        b=ncAkilTQpIMAcVkgc5BIs7BeO14i9pCho8HmylyiCZ5JDErSV+DoTErDjmw6PXAt4f
         VxqiryK5/pczyOySPGim8k1HsjXP0pqF4AD4D4k/7DGgZl7DPXbryeLNv/jGLm9PTeO4
         cCqg9L3j3aDfTDVQvWhfujtKXYV2wQ91CRLRzCRyCMgqxBQ06H4+q9HL91BTxDICYHQG
         DmeDGzNYy3uHcNa74JNqxdORvmepk8BIY8YEsve0E+2kEGQfNxzCw7t686STRTcVpjYC
         UYkDFZx9VwR9u8NG3fpa7yR/DC2gu3Msl1ttsArLwVd0N+KXqKZ31fSQWkhvYI56wDeD
         fLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009851; x=1744614651;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S09RcVQv3bFd4mzFCRVHGkaFyCuRf84i2/SgMcqwsV4=;
        b=C7ljp/v/ZL9mGaX0XjESsOKsQC8lVYptnY5xqPf3RD3Uad0/70EvTWlW+szztRZp/+
         5CTQjVtdzGgf8ugeka5rUMPy9D00AYxAl2IM/F443TqrbLYFLLfSGtHBPDo56jGVnwsB
         nq0NgNqhnx3EH568px54aBVz7a3/bqsYDk7ae5oradvr9b32ons5CqbyeD93knY2hi++
         pZMS86AWHlwxJ8zUotg+CXOecTP/2+aCSoMrfMhpHxsuCqeNIUw6PAmpfEGY9Xx+VfBc
         DXhxJgF/+XX/sM807BPzfGuNlAHojK6VD2Or6J5f/eHLuDPTgRluc91MpQsEYMLp07bB
         LTkw==
X-Forwarded-Encrypted: i=1; AJvYcCWFvLKDSnWFKEVk9PH+i+6zArVmjAte4HuMuj4Cg+0eqs1tie0vnrxgtUsGdS5TxWzAt2cmhVAZf1sB@vger.kernel.org
X-Gm-Message-State: AOJu0YzvJtAT3gvNaBitsAru7BPA+rywb96jXTcv1T+wZkzAs03x3gsQ
	qOJV+cUlVluKJbuLE/wYjEP255WJbai4U8HqU6S3OhrGNt8tB/Xhrt2Rx4aMVUA=
X-Gm-Gg: ASbGncuLmaJkWfDWF/F4fOBy+4Kvo555nQc7Ppje4LSxMtaNzpXngZFmcDcegx7nq7g
	EHeKD3KfHFL9d4CF/NT+GQQ+iG5iGR169nAb0CdDxcY5k7LiJyRITqEqIjht50MZoUgz6tef5vM
	dBWBr6WRQ0avc9Q4hQezFoT5Yseamo1g5PfcutSgVz9pyNontjG0m3uFsswgfONLhyh/bsisSrw
	rQ9o9AyxrQw6MzKqn/DTZyjZlw4fkG8VPCkt6h3jo1Yy2At+kAwxIoQHP9mzSOi+qDjItkU79C+
	FA8QCUdLj84cueIlOpBLpYkFCVXgBNIEoHBWNA==
X-Google-Smtp-Source: AGHT+IHV0AysUoJ50GBhtdS1U93v5S2aO1jvgA/LrlpNVHs6oeC/W37GOR8YbQv8vBRtvRtnfI1+Xw==
X-Received: by 2002:a05:6000:4021:b0:391:2df9:772d with SMTP id ffacd0b85a97d-39cb3596914mr9392893f8f.13.1744009851078;
        Mon, 07 Apr 2025 00:10:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm120476845e9.18.2025.04.07.00.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:10:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:10:49 +0200
Subject: [PATCH] bcma: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-bcma-v1-1-fa403ad76966@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHh682cC/x3MQQqAIBBA0avIrBswJYOuEi1KR51FKRoRRHdPW
 r7F/w9UKkwVJvFAoYsrp6Oh7wTYuB6BkF0zKKkGqZXBkDnZyBkrnVgu3Oy+4mi0HY2RznkHLc2
 FPN//dl7e9wNlTrGoZgAAAA==
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3QgGWzq7NIFxjepgO+EmxIwBZ5R8mEbO5nAStbsHTAI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83p6dQ6MBr5EP50kHnerEPZb674bB0ty/mPpO
 AkT5Lt41qGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6egAKCRARpy6gFHHX
 ctY6D/9ShTLBL9Z6nPznwrvX8KbisGsXZDGio4APnrq6sv+eyzWEIUuQpVj6hLiAGofpngsZN8z
 7KYIk7x2nqmWhksXtzbemhiSaYduVaLICb5vPhyyxX7uJM2HxRsTEGUEKhUeY3l91g8RtxCIW5h
 W4iE3Pm/DcoM2xk4V+fdPicW/a6PrpDcBj0G1tHY5zVqZC0X9MqsK78V6jjCOu0yIdPv18TQS8P
 NQmsN0OdbUprYBS327ua3WUzvDVKzcYdlTT22L6MAI1psZ5KEp2kNyUmQmQXe9Ze0VS28ZMSTLQ
 XbzCYNWwwc9dhc+ef/U0NmXafZg7ui0RQ8FU8u3j1hHYsk0aYner35bWObVd1R5+qbC/J0T6nr9
 JWAefuvYfggMY2dML7OcIFxw+eAqNnxaRG/wGPFNsI8xgODcFtiH2eHvA9RwA+xfDtOM0hCCYtW
 MEwEUXI1Dhw4EB7oANpCc8ucg55yMHcwGEuiFV9RdUn7MNx4+PrwzAbyGwisOxUpI5F12NDOKjc
 +pNDSM2+5oEeYRjchK6VCHFzGi37+Wth8gQEiW5sjB6kdwFn1NdshhNZ3gfLIUW3I0Dql/A7yYH
 sQbPbiYKtBRFxArph9hk3Kb5yBP0cvawSFe48bZvU3KBGAungIK97nxtzc6geL8B9i+f/gPtcaf
 0C6BVMj5zCpFTUg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bcma/driver_gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/bcma/driver_gpio.c b/drivers/bcma/driver_gpio.c
index 5f90bac6bb09..f021e27644e0 100644
--- a/drivers/bcma/driver_gpio.c
+++ b/drivers/bcma/driver_gpio.c
@@ -26,12 +26,14 @@ static int bcma_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return !!bcma_chipco_gpio_in(cc, 1 << gpio);
 }
 
-static void bcma_gpio_set_value(struct gpio_chip *chip, unsigned gpio,
-				int value)
+static int bcma_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+			       int value)
 {
 	struct bcma_drv_cc *cc = gpiochip_get_data(chip);
 
 	bcma_chipco_gpio_out(cc, 1 << gpio, value ? 1 << gpio : 0);
+
+	return 0;
 }
 
 static int bcma_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
@@ -184,7 +186,7 @@ int bcma_gpio_init(struct bcma_drv_cc *cc)
 	chip->request		= bcma_gpio_request;
 	chip->free		= bcma_gpio_free;
 	chip->get		= bcma_gpio_get_value;
-	chip->set		= bcma_gpio_set_value;
+	chip->set_rv		= bcma_gpio_set_value;
 	chip->direction_input	= bcma_gpio_direction_input;
 	chip->direction_output	= bcma_gpio_direction_output;
 	chip->parent		= bus->dev;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-bcma-763c7660ddfd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


