Return-Path: <linux-gpio+bounces-18277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1561EA7D52C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39BA21685F2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAD1226CFE;
	Mon,  7 Apr 2025 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IdPcTtiV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D818D22423F
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010002; cv=none; b=KnU7Ji6VXlHuGKT9ALpExdUAn7m43/wMTRVSCNUCFsnLfxzOjvoUDuEnL68n3Km7GnpRYNa+4ReIO92Y01PYa5bbRPXxdoT98ZiI6mWu/BiOQiKInhZhiunb2JxgkzEisUgTDu5JLJ5x0l4z0dowUV3KELzemlF6pIYUb5Qi80E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010002; c=relaxed/simple;
	bh=3UqRWBNBXZo/ZeZgdiat57DVN/jGiDxmQMa8wMm3mEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOShQVK2bMk3OYCVR+X0MdtJob6LB4grvKaBw4ZeCUzShy/YK+gg5VrlW4p6QS0gZpPxWvivmPg+TCbyxbaBV1MbQ4b7gIJkNHYdoE+/045I6nxqg2P87i9auYkyvjo0+1H+bR8d9dnLOnQuzOdVxd+DLzsbn2VODvpRss4bV64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IdPcTtiV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44863465e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009998; x=1744614798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1fP3xcbZWM3sDn2ueQ9yrMymsFb75Gu1/jl1pJ8LTw=;
        b=IdPcTtiVgu7JlkSEIrOoSX9S0r45eoTQzC/eQnA0V77LzBDWGq1H8xEHOh40AHjTNb
         ET37NePXzcr/KkHMcXrOge393dSSURvNDhVFe+ggEgSYo5bzm85WIzryxHwYe/Kv/GSk
         2fF64N9dgt7k+KcOB7sR6VTci5GEm/seVoJBNErUHQ+L3F0aCoHXcSBv+4p2OQJwNSSv
         7u7n7nekkr827OxDgBFFM05Yxh+2JFdl04NBHrU2CwQGDqOb3+fhKtXX2eG/RDaiL0Cs
         l94zo4mUveByPOneXmTjjIGcb7YbisHuzUjKPDcNNGHOe2tpyGTXFL+MDb3yX6oc7/ja
         4/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009998; x=1744614798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1fP3xcbZWM3sDn2ueQ9yrMymsFb75Gu1/jl1pJ8LTw=;
        b=D+vZjg9/hhy7CsM6jvV6yI5Nv6zJlpSTHq2IVLl8G7O8Bfwmv4SZ1sSB3LZmuXSbVn
         4IHRMgVvbmyf6Zz6zJ7iNBGDi6vNgEcFsM2CdcKboHnZBHzwvG16aPyOwDRUft1wCgS5
         yPgDkBBVpx1e+woh5LgiOKLXUpxifuBleNPNTGMYBp2zXGh8YVGnTc5xf19woMaG7fnN
         rr+hxCxD+0JBNZSPzCJtN2GbR53qshwnAyuJWbHhAGg2UrJiEEMxPHxNkAP3e0WzmCxC
         ZI0E5QHkblsGfhOA2w2ARSyY9Uaz81xpp0i6msZGqhNZf1Jy/ak0e8IH7GlH9Czpdt/i
         9xTw==
X-Gm-Message-State: AOJu0YzpR0nxdQFt256YzpBgdpS4NzW4VwVOvs1dYm0CWYJSBQE5JRe+
	aWDzRTnuYrJcMjktfc82CGHwbO2eLdMF48TYSgMxWnTWJpLYCETVoIeYtghCsxk=
X-Gm-Gg: ASbGnctZ8A5Gt7dTzZ2+GKoKYXQDf3KT59Ajbc0/a+5I4jMjlLoqYcNRRnasld6je+Z
	WCw18JUTKdZ+jQy9u8ZnGkkdKtwVHrpiYhs8KEqAV8ZFz52T6pPmX3N6nBHvYHfoYbDhE6/7+Ct
	i/rKVQ5rOwCPOHzJqW0Uzk5VozSxOVjg1ph2Tm/KMaj5HJgPDci8vPiebr8Lb3OtEjheAlUQJ7i
	TZi0fw35R4a2Ag4lqP2XYx5rYw1SDSv5RDFvONzcWuR01F/ck5whKy503AZ1JiCNwMYFgpRr3/U
	8iNHn1foIzk3O0dGId7UCEHS6kZpgTN5kExPlAi76nnhr8CD
X-Google-Smtp-Source: AGHT+IGzLgILttDxO1B8ID6ZmYzo6UknUTAj6YgLYVfn5lH4jvVbwUel10EFxuC86rN+5EElsQDGrw==
X-Received: by 2002:a05:600c:1e13:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43ed0da49e6mr130036885e9.30.1744009998188;
        Mon, 07 Apr 2025 00:13:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:12 +0200
Subject: [PATCH 03/12] gpio: em: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-3-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zoMPRDHW7Y3vEjectUVkjXPywBkkJrvFak4r8W20jMQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sIVNSgQwx43danFZuwlKoFhMjhiY4tXyr3K
 hPcVKvFHrSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CAAKCRARpy6gFHHX
 cjyrEADFMysjkLjIc4WN+B46gtwK7IJ+YVCQQCJApl4/0aueqbNPycaFo8kpJ3MlEQABIFK//YC
 mPYqV+EPiI03ax66V45tvlBnBE4elvx3DUeEvur/yjdOAGJS40SVXUBntZlCnuCuRzHC96vDNcx
 5yiV41OIBqFD25ocDJxlIQTnhzfb5usz3+t9bkcvbah6vDS4sHvbxrre+67+vIraZQ58GFE0Jpe
 IjQUBSkZ2WaA0Uq+4d7HXY9TYEtJvn2nzVwSgyMUQi6iUKG3bxxt/PWDHj+BSIhUOk+AJgRWe63
 NNeT8Loi4x5F51xpLgFXHe2/7BrSAZaUQZ2H5YizUY5cR2K7UfXywccY1FUlGl9ImUqV7PnfrFm
 S/jdAWb9COZ1rkCitxYVX1bEb1Un2DujKjPQJLMzn1HcWr6iURKwXTxTKsjIY+xPG2pecEIzB3o
 EPnNfFBtGbjvsSaCGDm06EiD4V0o2C3BF2uu4LH7BpQlzuYa0bDjFOueCufLBFhPRWyjOQlUuKd
 mEZS8chidh6g8GgwfWfOPh+/eT/19cbCPDi6LKp4+TJwlAoFY/6x4XIsAYpNXENGItGQHAZdxUS
 NEDpumQOLGrDleqcTZwv0xiajhTebODEPE/mzCbAj0Cj9RPyY38A1RuAvw0pTficQbCASosENsf
 7kxItCqcsnjKYew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-em.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 6c862c572322..857c28895131 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -204,13 +204,15 @@ static void __em_gio_set(struct gpio_chip *chip, unsigned int reg,
 		     (BIT(shift + 16)) | (value << shift));
 }
 
-static void em_gio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int em_gio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	/* output is split into two registers */
 	if (offset < 16)
 		__em_gio_set(chip, GIO_OL, offset, value);
 	else
 		__em_gio_set(chip, GIO_OH, offset - 16, value);
+
+	return 0;
 }
 
 static int em_gio_direction_output(struct gpio_chip *chip, unsigned offset,
@@ -304,7 +306,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	gpio_chip->direction_input = em_gio_direction_input;
 	gpio_chip->get = em_gio_get;
 	gpio_chip->direction_output = em_gio_direction_output;
-	gpio_chip->set = em_gio_set;
+	gpio_chip->set_rv = em_gio_set;
 	gpio_chip->to_irq = em_gio_to_irq;
 	gpio_chip->request = pinctrl_gpio_request;
 	gpio_chip->free = em_gio_free;

-- 
2.45.2


