Return-Path: <linux-gpio+bounces-23503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B91C8B0AB59
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 23:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0D7F5A54EB
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 21:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF97521CC5B;
	Fri, 18 Jul 2025 21:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueVioxyj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D95AC2C9
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752873740; cv=none; b=Ql36jI7rqMcasMWzxPCRpDjD47j4xsHUD141K9QGrPQRCotde7RhVe5HReMf36KGah80gCJn/SfPtq3J1+s2O8S2MygmHTRdg0y/H2x53PXZVd2e8lDXpBh2tI/PAMYwsW/P5SFFqNSqv0Wo8SvKlAX2cBIlGbmdiJzlqZu+Ao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752873740; c=relaxed/simple;
	bh=N9uR98yXNs5KB5/f4ZmeEMdWhEPvJSr4tS8Zew8+sSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9Jiogq+cv44NXVKY1u3tVfYHj32RLB07dR98CrDAqpGjAzRTD77tlgYhwTpVcl0CAXGv/SqbkvBbYy/1fOn7uzR9HZt5hI64LJwAQbGdMx0Ik1HjfDZX+Tgy8NDU3CPCKWqY6FGv5Et11GFYfnpWL5GF8C0xNevjNsc24gYuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueVioxyj; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73e810dbf5aso888058a34.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 14:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752873738; x=1753478538; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXAPwF0LYL0fWlGzUDFZv1Tx2pY7hr+gzK8mcCbzuRg=;
        b=ueVioxyjGAOPCIwOwj5y9z/kd7eXUAw8rlqr0u+KSSFPkYKKLTsz8AR0UbeEYKX8Xu
         Y9MMiz0nn9cm2G3d/qEuudy1ocND0a57kgwmNOaC5zZtaDx1HkOGSgGHPZN4VS7f/LMo
         Q2ckyyZmPEC0yBSeky5o7wJtGOX+y47ARuwIyFkbmtxJlZ6NKbUbxJChLICHs2H4LZ6E
         XRdmmdgEau16gywm08Q6YbszcnBLViXt8VWmoUbeH27LEaVEfyncpl7WB7GYCZJ4DLjh
         42/9ox8fU2Oq/JNcDiiHTXS5dIz8QOInxpTPsd9Q1/6GFV1E0eEITB04HoBo1+c3nUa4
         HsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752873738; x=1753478538;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXAPwF0LYL0fWlGzUDFZv1Tx2pY7hr+gzK8mcCbzuRg=;
        b=cioqd1D4GQUXr3u1Lai7YORrXTKLauieX1xeQ4opSzHp9fFzSjgS/QbfYMH0fDd3wW
         sXTF7BmA2usx/3aDv5AVK4CuJrlSoXEz+aKrnOfBkZLtgMzTO0tiG24gV1hKn5qVvkqe
         gqLdeyPEQuzj5DI1o2jRodrdPGJLdo6k6SJmWFLH9EV7ZAoFIg7Dme9ziIhK3okEksIE
         aT2AVVO/MLJ9Duf+WF4OZNHtQGb+anmIJYwZyMSMcqyVQacpgIaSqlCXzwZ3UwztvvZZ
         +GFTBTHF+OO8LuUghrRlI4RJCjDo/spZ8h4pwK07plVkL3uJ8kxmCpQBnSWgPE0vwrze
         erPA==
X-Forwarded-Encrypted: i=1; AJvYcCWBy1NbpZxepuMel/bLN29JRVL+afrhPXfPPRESdC+SZ3ztFdB0+HdKPn53ew/5jO0bepdQRKV1UdTo@vger.kernel.org
X-Gm-Message-State: AOJu0YybfqzU1HyI7BiJkzCLHQ7u/rA5MOH5oR/V+tIprWAiT/P1Fsyp
	0Z1d7b9wFh5HZb+tr5QBZJ8Psbuet0XYBRt03d8m7se00c6OF5AEbwt+ftYQKqDjGOk=
X-Gm-Gg: ASbGncvfz7+5rFgRyHCKXtdneRPiQLeLZF9l2ipzp4O6MjSScqoSxDYaW1ScN6mXSHy
	IyvM8DVbW61+/L00CKjCa1EqJqXrTUPmz8fvdAJ3r28y//FyxYH7FAFbELeflyTpnl0h6t2lRpN
	seF/CJ0MeAUm+Tbvk2d3EmrcM97gDZEHVxtsBnOg6u+hhLdDfFDg2PXHNv+/nEN2kSO4hNHWqz0
	efsm7Bnwn1xBPtDapdXHizYiK5zyF8Gy4yR811UgMJN5ibAq93Ygke4w5058bolw7onZ2u5q339
	kyk7zBGv7/luKVPN1TWlc9OKokXKE+XDz1XL2b7/f6HvR9tfazm416HXvZQ4sDXV8nS8ZxepoCk
	8Z3qSuGaPwpI=
X-Google-Smtp-Source: AGHT+IEndzum4VB8B8UC3k1gRZhi4Ec/gRg44iqGZ2544M+GbzncYZLEIkBlxtCSHtft8KG6Ia8oYw==
X-Received: by 2002:a05:6808:6a82:b0:40d:f3d:cef7 with SMTP id 5614622812f47-41d032fb39cmr10072122b6e.4.1752873738224;
        Fri, 18 Jul 2025 14:22:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd5465431sm749285b6e.37.2025.07.18.14.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:22:17 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:22:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] gpio: sysfs: Fix an end of loop test in gpiod_unexport()
Message-ID: <747545bf-05f0-4f89-ba77-cb96bf9041f1@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The test for "if (!desc_data)" does not work correctly because the list
iterator in a list_for_each_entry() loop is always non-NULL. If we don't
exit via a break, then it points to invalid memory.  Instead, use a tmp
variable for the list iterator and only set the "desc_data" when we have
found a match.

Fixes: 1cd53df733c2 ("gpio: sysfs: don't look up exported lines as class devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index f31adc56bef1..b64106f1cb7b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -927,7 +927,7 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
-	struct gpiod_data *desc_data = NULL;
+	struct gpiod_data *tmp, *desc_data = NULL;
 	struct gpiodev_data *gdev_data;
 	struct gpio_device *gdev;
 
@@ -945,9 +945,12 @@ void gpiod_unexport(struct gpio_desc *desc)
 		if (!gdev_data)
 			return;
 
-		list_for_each_entry(desc_data, &gdev_data->exported_lines, list)
-			if (gpiod_is_equal(desc, desc_data->desc))
+		list_for_each_entry(tmp, &gdev_data->exported_lines, list) {
+			if (gpiod_is_equal(desc, tmp->desc)) {
+				desc_data = tmp;
 				break;
+			}
+		}
 
 		if (!desc_data)
 			return;
-- 
2.47.2


