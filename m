Return-Path: <linux-gpio+bounces-21861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69243AE0134
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 11:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEAE25A4FB3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 09:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7F7280006;
	Thu, 19 Jun 2025 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D5WTvK2a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55729277CB3
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323781; cv=none; b=EbJp58Xi3zbwvcBVXFmLqCUi7AgWkZfE7MEqV+GCd7tpQf7uxmEPEs+5T8vnEHlX1nFNcvWFkDXAC8R6LOWGQh9gVJO8oBUwVaObcPu0KNHisD3BiWgfAPcEfitbnVujIwJSNPXHcN4ETuSYXTgsQudXV5AQS7lxqNioQza9rDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323781; c=relaxed/simple;
	bh=JKlrooLoXVp4otsnMroGFsVNqHxJcoPceosfJ7R7mWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elEgG1HN9VHiinmEC5hL2MpCGwjOMyqaAPH8/4u/Iqc8pbcEDuyA6B5lBkKjprM3ZHPUVbLuJDk0oCmEDQyqFf/JWRiDH+hhfdoLU21rinl/3pFlO0anl9l9QdJnKT+8jSomTrVjG0N8MPzwbV6nvkDWuptrLo7raAP/wElBl80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D5WTvK2a; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso532126f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750323778; x=1750928578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eygfCzasIRR3NPibew8zyzczajRJM9GmBBR2GnMe634=;
        b=D5WTvK2aoRL/CioRJM5A7X4XmDcbSltvV+GOzLG7T7SoC+/59T+Z/9OY/540wl1TVR
         cFVA1G3FiPit03wUm00cvTYuTqndTFBN5g2fJF6pmdLsebUPVrm1gDaD2BnwUfQiownY
         +wmCxD/1lTMlN0BXPfpIQ5iLFz1vQzM9K5XaSsotJqcuFue67asg4d7VryGGOJbwfLXp
         UFoBlPNpM3r97rnDL/9aijuM2u96VEGRnZlmlQS43t0dQXE/0lyE4bDPmFcjsaOpxHNu
         kJYdDTPcMiQIKdBi0JlarTnh6lTjd6xPjO3G+kGnwdZDa2nmjaAy/IHoxX4r0Jxp/E1V
         l5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323778; x=1750928578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eygfCzasIRR3NPibew8zyzczajRJM9GmBBR2GnMe634=;
        b=meonUTrORIa1ItVzwmivYb01Yn+j64DC+6znfhCvgHP7BpU1H5zTmb8B0IcxrGLQhC
         WTU5vgWQGK9nToc5fjhYodJg/mx1gRV94Y46Li3j0mRNG9U1wVf0b93nAOgoeHl8gx1D
         lL32kr+fndLhJt7ePfHu7/3mKvIt9wBC/CoGNp+6kVIHP1HY/64L+ziC7qtbQOSZicgR
         fSHE7xV0/EuTsE517/MSUxbiyhxKJIg27vkYo7/+fjcbZBGCKKsxk20YuuQyY6gBCPP2
         xRdOjRk0v++2IpZ0cfq0hklbAcsT70MygvyLVnG5ceZfoujC6fkqplhESNdmSp6nDUPM
         QWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkE2+HoHrhi73RfmPr6spkPS+cSNqj11FVBpZRfCuZVXGfJnWI12e2hiupuFL6K9LOd2EJEE1j0t3O@vger.kernel.org
X-Gm-Message-State: AOJu0YzketeLDCL5pKcP9+/q/twGPbjxJ2pM/zGfSG3hvMnj+ymzj9W4
	0PLJ/3EIiX2eAmfHY3bj3RFWr/aDPHwf+kvBP+SNkwD0n260trabze0HXROyXBrqFkY=
X-Gm-Gg: ASbGncsJgBfV8BeU6R3areo0XBEPkibPB1drrfNTOGWmChJuXpxyUdUch0SWCyZVqR3
	nJ7SIoczQ9ZPWwXggLy5UQW4SWoXszwJMUxZKYvwvBEv2gbwRqNPf9boYYF9gJlgHssudnvGMfk
	aWjUbibyKHfsNoVlfW6NJzdiOy9Tmlwqs7YJrAm5thTZujnhKBD1ezQSFBfcKaIs8bCMlEZAIjp
	0vGg3H8aitMcF2vpxM6t6JHkACLNnIxtMbQZqbN9FRyraxr4N0eXupozW/bbV5bGaJukrhCw5ZK
	snHi65zeDOPr/2gylP+XLCTF8NXd3txRAEodIIy6zYVfcywOsK33Kj8R
X-Google-Smtp-Source: AGHT+IHgy2G2c3OxJ8FYLKCk97XZ7orGJmfRGmZT4nxLuRvh8+N3r4btSfSz1pDnlP00KPLOWONdFg==
X-Received: by 2002:a05:6000:2889:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a57238b90cmr17548726f8f.5.1750323777681;
        Thu, 19 Jun 2025 02:02:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm18874645f8f.100.2025.06.19.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:02:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 11:02:40 +0200
Subject: [PATCH v2 1/2] USB: serial: ftdi_sio: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-usb-serial-v2-1-8c43e4a4c810@linaro.org>
References: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2752;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8QYiaDcuByp6lX/VMJqGh5FavZ76N3lPhAN3orOxS4s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU9I/hrVhFLLFLkxbHZeCTZTTVqdFQCWp4jxMz
 5sxRalYDxqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPSPwAKCRARpy6gFHHX
 cvZiD/9H/3Ifk3c/WhWIL4GwR+/l8+vp+hlvLkyjnCSVWs+EIvKF+sj7kmXowZUQ4jstuJ0OfAv
 RRFyIZAsHtwdQJs8LKmfXkmRl5L0l8fZ47Ql50mrEm16pkDBmLJqrUptcyNYGzyQgcdKks40CpU
 Y+QVG3tymEK66Z1T1CnAPyWAvN9xslGLp9zqY8AWHXXTLBY/iNIaKUhbNX6D8xyIitgIQTbRYlG
 s6K0vtbIjc0R0bFpqL4tOu6zm6alqXKtr3DBxV5ZWT/jRwx9t3W+4bNBwySyfjmPmqsOEF0Iv35
 ZwaY8RFahOUEhP3HsePlKI019JfAKjr6dDvu/9p8bK6OMjP6WWtI79kvYuzO7mDLdEn1o30LuLz
 10IZfzvek6nCE/fCBtrTJ2MoqUknWmKtIimmxkYUoX9AXXnUH2wwHjclRjtmHhX9csQoz/J1bLY
 NVOVN5qNWrUyn7R2FIGPFsvexFZntvlyWFmkkB4k/mPYY9ToOU3vNXpJ8F4YW1P9x2L0ik/rkNE
 MRUrUU0/ItO6HW8SDPrB7Y7pndfEPyAGzk3TnsG+asaOkQL+7u9V0Zxn09ivaPv/JukyilHqylu
 li/ldqtut4RyLXCgshsDOVjGLIkT3VLRTS3CZNFRGev0ouJbup+sCojKL42mUhX1BitDYv90poo
 QIJYp4ngSTaYoRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/usb/serial/ftdi_sio.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 6ac7a0a5cf074e0629dfdd3b2330bfa05ca31663..d0a190c6dff38f64e393c11d1bc7759e52876d4e 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1857,10 +1857,11 @@ static int ftdi_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(result & BIT(gpio));
 }
 
-static void ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct usb_serial_port *port = gpiochip_get_data(gc);
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	int result;
 
 	mutex_lock(&priv->gpio_lock);
 
@@ -1869,9 +1870,11 @@ static void ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	else
 		priv->gpio_value &= ~BIT(gpio);
 
-	ftdi_set_cbus_pins(port);
+	result = ftdi_set_cbus_pins(port);
 
 	mutex_unlock(&priv->gpio_lock);
+
+	return result;
 }
 
 static int ftdi_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
@@ -1889,19 +1892,22 @@ static int ftdi_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void ftdi_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+static int ftdi_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 					unsigned long *bits)
 {
 	struct usb_serial_port *port = gpiochip_get_data(gc);
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	int result;
 
 	mutex_lock(&priv->gpio_lock);
 
 	priv->gpio_value &= ~(*mask);
 	priv->gpio_value |= *bits & *mask;
-	ftdi_set_cbus_pins(port);
+	result = ftdi_set_cbus_pins(port);
 
 	mutex_unlock(&priv->gpio_lock);
+
+	return result;
 }
 
 static int ftdi_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
@@ -2142,9 +2148,9 @@ static int ftdi_gpio_init(struct usb_serial_port *port)
 	priv->gc.direction_output = ftdi_gpio_direction_output;
 	priv->gc.init_valid_mask = ftdi_gpio_init_valid_mask;
 	priv->gc.get = ftdi_gpio_get;
-	priv->gc.set = ftdi_gpio_set;
+	priv->gc.set_rv = ftdi_gpio_set;
 	priv->gc.get_multiple = ftdi_gpio_get_multiple;
-	priv->gc.set_multiple = ftdi_gpio_set_multiple;
+	priv->gc.set_multiple_rv = ftdi_gpio_set_multiple;
 	priv->gc.owner = THIS_MODULE;
 	priv->gc.parent = &serial->interface->dev;
 	priv->gc.base = -1;

-- 
2.48.1


