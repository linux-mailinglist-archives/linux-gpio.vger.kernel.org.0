Return-Path: <linux-gpio+bounces-19672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84320AABE2B
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C29E64E7E96
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB81E278142;
	Tue,  6 May 2025 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pQAbfEl6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A195B2701A7
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522128; cv=none; b=vAgqVXtjxZCVn2EFgDaRcxamZwrGKEvJFN5+Z0l/PGJSNOPT9PYdTxKijGTKTGgZqoH8ILnAsCzO/t7hLf8jEzG7s5FRZQXX1gDd6iTbvpPZnO6dT8MfG4m3EIPZMuo+59cL2gKtI/Rs92AY7rgJyZD1V1MDYqz6ruCQc8Soiqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522128; c=relaxed/simple;
	bh=ZkRJCrK6scuZdggi5orvTvUK9ZzbA+DAkoUDdmoNVIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUy/Xk3YSK4G7nK9yuze43bsiul6i/19A5BcIs3xVAoLA+DS6Ut4UlIu3smvRIxP5amuZCZ6Ujiq4zt28QBOGK29Ac7SEfGYL6gaUrxIpxtLSx69knfnBjw3PRVasC8F/K9izAFp3eySrO4oASblqp8xkaTlaegciM2T4+5jZWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pQAbfEl6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso33428685e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522125; x=1747126925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnErFkFW00l/PAG6MwIj1HiufEnT+BpJAjKHZo9C8hw=;
        b=pQAbfEl6QI6uAXew5mudmwDQhwhwDYGtAxlEt2HmqVVcu0XeDbnnUaFjv+eVX/Op5v
         cp6pRNIOYSPFSdatfyHXcbaDvSaaSGJJlyi77nrvA4g2yLGEarwIrNq0YlaVtispiyEH
         7twpS1Z4ZDcCnUJYkqMD0hm1Hv2VyNoJ5CoztsCxw2lbohYw+P6OiDCjVstfrPu+eM+F
         xk2Dv3U2Mn05ZSWeSGKSvgVEsbJRd1JO7SQj+5zu0xcb4xsnXyIgkzhbD/pbrtr19Lcc
         k685SQx9MkVrMHqR+fiyedSkoFKFuy7ftUF2vCADmrmhdDa8JjBn1R4hN04yAfsRvB3x
         uMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522125; x=1747126925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnErFkFW00l/PAG6MwIj1HiufEnT+BpJAjKHZo9C8hw=;
        b=r+/MX9RPT3pgcoYrvtP9fPOgwT4CS1voY1ln+OXg1zpclisafadvH8r8temHPN0QG3
         NrTIXStUF1mPeJLKdqRpawKyvxMhevYS+EPDS6jzWG9w1HZ3JGhAcmilOfnAdL7T8Exp
         vz6KirePNhNPrLTEBWebwF6Gz5mXucw0nkVjdpGNqGPLWs3s3rxlnRKTE/b7Ju37m1h6
         /zcdDVDI0BAqhpT/KTE9nshSSSXN1R/IR/qUgfDFmkj8K01HERHxeB04kEGlnr3jm3MU
         cahS6hc4Ov9C5cIjfsVO5mVFNBvBxLch8VhmeE7nOpgo/GRISWKbTodxYTFB6g347R4/
         6yjg==
X-Gm-Message-State: AOJu0Yza+NGd/SHIyzCuSXQiNrHbF4lol+kFuFchXfUa01xys1YmOH86
	kBV0rxPEzd3KbgKa2VQpRXu9sQ3SPhYnNi12YUEeP7FNXzuSIwEVoxNgTDzc9YE=
X-Gm-Gg: ASbGncs71qmhDLS1tl5uiITaG/RRiZrBspvJa4OKp6IqEEIaA+uxOH3c3yFJC2/Ce71
	5SpOukOLeVWGfU4ivSjGATHzM5NZRrfMAQvZL2Rbs5nfqBtcANW1ns/Q5migzZNNc0KipkpT1JN
	xin8GoZ82l5nL7RRTOSdwlMVo66V/ykNf+m3JiXuMv+JDAsCmXdV7t7mrDcyMKUU1IeRM9kzLEk
	ixDUmvYYlGoM+vmeVYNVNUILxqzrPCGM72uhEo+xDOpjAPRap5uRjcvIk1pbhAIRtIXtvdUOYEf
	dg0FVSOwVW3X4N004mB7QYIC5ofbc3WIj+o=
X-Google-Smtp-Source: AGHT+IFO1hQZjV4t7yl1TN8fzggwDVqxrNbuwXVatO2B4+xlJe0tbSOvXbGoPbT3JNs0BKBgDLCecg==
X-Received: by 2002:a05:600c:3e09:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-441c491fce2mr77521325e9.20.1746522124947;
        Tue, 06 May 2025 02:02:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:54 +0200
Subject: [PATCH 11/12] gpio: mc33880: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-11-0fbdea5a9667@linaro.org>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9Aw2t8H6c4f+KPi58wqKHwRBhg3G3TO2LIpCTfvznKY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc//cXPCtvlIjGZ1ft1cmtsktDk5hauqLZ6Y7
 3Y2mIFq9N+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/wAKCRARpy6gFHHX
 cjLVD/9YUlG7AuOZS97Og0sK8FN+tAo62VFK/rgAzGiJNFZSbqlvlN1wPCOJQDyskKi66mM+q6N
 mjJlED+ljPXgxPZ/4ciL8jENmyBCCpVBrUsMbg0LV1LKsBKWVCH8d4PDzOu+G5aB8WxVtsKFoBl
 KYMcS2lkNNAqVA1xOi6dMBvv4mA2zTXG+MGHvY2lRMc47WNRbGwoCj/Bveo8Knyexm9kW3HAITm
 lzbBU8uxOtTstsOQl4Q0FruUVkqCIhyeUmKflEp3QsKxKg3w0CevbvIXHy8YNYoM50mXdPGsrv0
 4+k0bOz23bo/em2m7GxmaR6jLbMmgFmTC3Ooc19a0/8SkTjzNVIAEx1thJTZ2SAPxtZ5hjdCWe4
 j56/zlckvNcAr2+4RtsC98mry3xnETRdeCYqek20zpECJc6o5ctYVL1lhFvS3E2RRZH6S6I1Pel
 Nwe6hcAPJwMB+NRU153wiKSa8xGaOgch+5O7RgmxCU/lfXy6UShkzHjVWYQCJ57+q87/KVKHWXC
 8GVLJ2SgL8V7PnLR5ZfP0t2p/AV0VDDfJl5jcqjjJNSyR5EyRxqkmoGfu2K+5OwCMB8nKpDXZeF
 wLOo+wMHweQCnw+eSaiqeiCKWO+wEB4lU1b2vmo90SDtlnNAsDwCHfG1U7dsaNqUxA9uKWZaqrx
 KhUwh/jd72TxWhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mc33880.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index 5fb357d7b78aa..e689561041616 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -57,15 +57,18 @@ static int __mc33880_set(struct mc33880 *mc, unsigned offset, int value)
 }
 
 
-static void mc33880_set(struct gpio_chip *chip, unsigned offset, int value)
+static int mc33880_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct mc33880 *mc = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&mc->lock);
 
-	__mc33880_set(mc, offset, value);
+	ret = __mc33880_set(mc, offset, value);
 
 	mutex_unlock(&mc->lock);
+
+	return ret;
 }
 
 static int mc33880_probe(struct spi_device *spi)
@@ -100,7 +103,7 @@ static int mc33880_probe(struct spi_device *spi)
 	mc->spi = spi;
 
 	mc->chip.label = DRIVER_NAME;
-	mc->chip.set = mc33880_set;
+	mc->chip.set_rv = mc33880_set;
 	mc->chip.base = pdata->base;
 	mc->chip.ngpio = PIN_NUMBER;
 	mc->chip.can_sleep = true;

-- 
2.45.2


