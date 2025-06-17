Return-Path: <linux-gpio+bounces-21690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D168ADCB41
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37C86188ABC5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A75293474;
	Tue, 17 Jun 2025 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bdP9rVmK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA62DE1F5
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163086; cv=none; b=Q5rEAgBA16g3uge8Zuzs9hoxFxAFBfnUPAY2RjnZg1AuUBqkEeFZc5u0ozH/xh0m46OJOb2vU4O5KGbA5g4jsI1OOOsyUQCOiLvVjCVYUakZglI5oKRLQrax2xpv/hOo3ADZ+kv9rPnDTGCoMpPuiY6nkQwziCKl3yeQpPf9OVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163086; c=relaxed/simple;
	bh=RPhkT3IzDcFi1m3smXl28iMPiZa62xWz+n4q9CIoNU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnY4h4wLxnYjKwrnyC2a0ElLHjU3azHXDwOyfqteL/VNafQJnsaI5qWkoTIQvaLK/UZ6JS8vmneCpa3MqOVwY9fCkhXRyyqZjbJ2V0yj5kLn6ZGA01+D+RjlGYyAnbgOUaPPFAAaqruSoSKbRU6mIkM2+vbespImr6ENzPFtQF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bdP9rVmK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d7b50815so47719655e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163083; x=1750767883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=bdP9rVmKlF4I5S9A//E9NTrjwAv4FBeDhMEuO0wyeMpDDQDy9MRrbW1Wk4D2OXQvir
         eQb41LxRtJ2P9VE+pJ84l4CShwCXYD8Qn4Br7cTAnURuwzvNjQmWqIeq4lAtCj5jkvuJ
         W63p6OtpMQF8l0XArvOSr9ttIGDbFcm5ATZmycf+Vr5fmkznOLh0q+uHwkCflwPzG2u7
         Dc4BzHsNFyjLbPYQY+cuNHjQ7hEpNloca2IqNMdHuNgnsVSeWO9Bg+x2l5bAUS8WKK4G
         rsTZ7LaOAI3Lcaavt8m9RA9zF2lPdXpD5risvvpe98nD50aXuCTz228kRVN/165+7Iha
         F0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163083; x=1750767883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN053MZ+yEo6A92AhgjaJPUWZr1Vpzz6RE1Bqia1tO8=;
        b=nW6uUfsUyzQv/l6GMnJQ7MHiwpXXYOzsLltuTMmII4i+rQKw9Gv+6sbB2i0WYFBWqy
         MK9+SRWp3w0OugQDhrNI/GwHi27GTi9Nks3t5KfV127+EheVaWawPaYirxJje70aMQd9
         nSRw9wYrpIIV21kn4ibO5atIjgBr8J14Ifvrx+vyo6WrNO96vSwuEv8tqVnOPdp58Twv
         zb5P1h81qfLmFFRxceyKH5LlF/MJeJm9zXUCEEidX5s8q/sQPhEXcoprxHB5Gx2hzVV4
         zjn7IHXV0obX7t9BkWDL48FFEAnyZvZlCW0wYpc1zJeI8IxS32jQoxYYFqoNU1PZ1Drt
         cjWA==
X-Gm-Message-State: AOJu0Yz5QyRTWXYt9FASdh6qmSPPkKaSDOTOOHSboWOBxyYa7UG+Mpp+
	FEil8IgTnRx+CxfBlPFQWsQItoMUjL5DqMbO7NmUy/0TJNEJs1QHPQvsOr09oiatQBA=
X-Gm-Gg: ASbGnctqi8DbRQ3qyyTIdM/kH1birzWmD45qFUFtbEWOR9cbyBEzfMZ8uke+3b5eWyv
	Fwwq2fki2XmrrOhUnra85A5epqlzE16OdXoojsV9ywu3siWdffhdZPy1uX7py73qLJQr/AlrUg3
	yKACTHvhW5ZVnc/wGeNPS85CrFonsiwYIKC2YUSNWqQm0y6W/61wgPb2dETaNthuHmw8cRfoaEO
	c78V0bTuAQqy1uBZXW2H3BxJlDF0+TbIV/hOkQ1apKm60M00URB8o4ycVzfESZwwPj2xdEmBv0J
	gIprQJeP+RmmqaycGtEY0cLg4IO4SgDwhdxMbB1/NByxWANrz2/XsPwRjPmSoJjyhNc=
X-Google-Smtp-Source: AGHT+IHdDJq3gvA4sfWiaOxd+XFP/XNqtrP+XE6lxG6A2/HHHT+4Da+4G92+pmD+3HshQ5Xg9wkLvg==
X-Received: by 2002:a05:600c:37c4:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4533d5a03a9mr141189635e9.15.1750163082843;
        Tue, 17 Jun 2025 05:24:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Jun 2025 14:24:23 +0200
Subject: [PATCH 01/12] gpio: pca9570: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-1-903703881fa2@linaro.org>
References: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
In-Reply-To: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=t5r7nMPMOl/Fqhu7blFrjnyYOcc5SoneVJWT0UVvyG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6GexaPCP0OCCCwFHuQx75j/9CG0GCDLgAZ+
 KSrqpESNoeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFehgAKCRARpy6gFHHX
 crYWD/9ppC5aJkPOyjWUhC/39fpEYawzV1oo4LA3Ztz2IaHRnTre6rmnHt0RWCnXb3Ogft50bJz
 3OfxYoBxk7sT23zhDEayJMLa7f+yRxlrGtMkvvbajg7FnK6dG0ZLDivOjPjg+3j6E3Csa63xB2j
 8NHdCO9JCcXS993dXW2c3g1qsqyUR9jz8rDcpExWFZ/dpsvD1IhAW1s9pxCuuE6tkO4fK2zT0e/
 di9CWR4RhrAK430nIY3rf009lMITmd/RqKVwZqF5Ao7QVyT1xkeE2tyi8+SLYebXQrHJCOGir6z
 HvkMvSkvjZx58Vh587NJQmVKxXh+hfbpfjoifEL1TAG/u4umxKzvGrtWB/6GM6Ea702rIGaK379
 y0A3uyAYwtTOlKyB+AtIdxG2ydQWpo0NXYdH9Yh+RVNveDOALdEVGPqf7USkh/PIEJJRDPpXe0r
 s3bdRpJem+8LjEB3NEZWVlWEpdPiHVZB8YN+CImGcs2ZDCvS0plVUK0AOTDix+TymPsvXzmJGLR
 ha7VhjmPrxB8on4mkXhIm89HpjTC2Ifn15yc7tNP8ewrAgJ0CWo1V5xAgKX0hB/oUjIbBWWJDzo
 TEzXU+kxQqmGT1ktMvoWFMbHuwI2JIJHPv3eMDKPjty/8ZQqsn83VFR6GZ+oAtqFAQzfujICE4J
 zyK6vI1OeVADF8A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pca9570.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index d37ba404936835bca160822ee361604827976e9b..a33246f20fd838a57abeedbbd7e58259bf073a86 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -88,7 +88,7 @@ static int pca9570_get(struct gpio_chip *chip, unsigned offset)
 	return !!(buffer & BIT(offset));
 }
 
-static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
+static int pca9570_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct pca9570 *gpio = gpiochip_get_data(chip);
 	u8 buffer;
@@ -110,6 +110,7 @@ static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
 
 out:
 	mutex_unlock(&gpio->lock);
+	return ret;
 }
 
 static int pca9570_probe(struct i2c_client *client)
@@ -125,7 +126,7 @@ static int pca9570_probe(struct i2c_client *client)
 	gpio->chip.owner = THIS_MODULE;
 	gpio->chip.get_direction = pca9570_get_direction;
 	gpio->chip.get = pca9570_get;
-	gpio->chip.set = pca9570_set;
+	gpio->chip.set_rv = pca9570_set;
 	gpio->chip.base = -1;
 	gpio->chip_data = device_get_match_data(&client->dev);
 	gpio->chip.ngpio = gpio->chip_data->ngpio;

-- 
2.48.1


