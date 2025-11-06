Return-Path: <linux-gpio+bounces-28213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9246BC3C64A
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 17:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3394188E00B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 16:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9258C34EEFA;
	Thu,  6 Nov 2025 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V3AHeMsc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A3934E765
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445804; cv=none; b=T1U6r02R5gptxN/8Wc6PadnZipJziMBmcoHN40m6BDcRxE6xsAV88+e8sgqO1IolNX7AUYucT9Q6ieSd/phOEWHZ1Xkagq+cxP3lOojw8RtA40usY51QLk0Od9sjEW5e7PcNvXHlJlrFih52Cq+ul3niGs4DcyVsQpgXQEE/CyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445804; c=relaxed/simple;
	bh=bV1csp2rWHEChhH2wtc+ipip96VeBDB9QOyjlvKNG/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJ42jzu7G6QS0VSM11TDtuxHx/a7KONkyzktSKKoh+4FzI8gQ7aAOcqOoj6XlKz8o2mKbTELom0bHFx4kI4j40k7E5QBARMOqDNOOeY47WmBeDg2/jZmQkuYLKJz7wexPOFV3STsOo8G5W0D7KH1Ch4RktSOrB1fnX+hUrLr2Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V3AHeMsc; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-633b4861b79so231392a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762445798; x=1763050598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuhfmQr7uINSDkC4BFuRhNQ4HVMgm7l+cfZeaeFW1fQ=;
        b=V3AHeMsc8mlt2GLfF+cHOG9j3kVISlP+olnI9TeRS5QqO+4alXKPP1SmlkcvcD8S+G
         s0hB1CMnejKP9vtvK0ZIg4wVTu5q1+QaIFQJJvQLTpzicF4bG2f1q02kBTutJdAvR5Nt
         U6LnOzU+U1Vy9veEyYDLIMCbSZL+opfv+2SDdhZL+P/U9N2N/p6ebIMESI4yNWy6poP7
         D1oK74FJVy0faUWXxTXMT1p0HY+DNtf0jxXKJuqEf01HTNilXrs8G5+fhL4wd+HRM5Xs
         vORGushxRGUtRRm9Bt14QGgkm/psww1YoNELS/iwFE4MwVM9ZgOsT7RVg1eyMqQ+UmgN
         4E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762445798; x=1763050598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuhfmQr7uINSDkC4BFuRhNQ4HVMgm7l+cfZeaeFW1fQ=;
        b=EbyuxZcGTEJxOhbmwRuWxJAYRhQ1guiDEjI3kiwHT3nyWipkKKle9HsDgO7BhXASLd
         4CmesqlHRb4k+h4MeXbjds8ogdY7mbYQIp406Q1WEBCkenmX14HryJ3CExpOeCGN9+GN
         ikCRhGFwgjMl5/jrpDTIwR8VogueqL5CsiQg6HPoZDvms3D70kLsDjgm7Qv/97IAqyiz
         /zkqpmkKZ+XGpyAOP3ooVKr3uVjdgr+Axc+j6MLWtOQYT/fy2Qy8G2ng4N6iwhYv4JRy
         ipzXg9Csuk6+PX2RShWeVNeuU/lIDukPLYJLqhsTocsFNyf/wWcd+TmpzzcR+Sm6fJVZ
         DcNQ==
X-Gm-Message-State: AOJu0YzSBZ8FCXTp429u1vZcBSQJAIgS5ZmG8gzBBHMy8goC5RdWOuNz
	yyhWqUn+sdJ7OYA/bQ/iT/Z7faD2RhEkfNKjEe2MD2SKkObEr8/NcM6vzuXBYkOOedM=
X-Gm-Gg: ASbGncvyycF6dSZxQOuiLbqGTruGkexn8NAtU9f1YaXgL+tryy59e+W/3squVPivZ1r
	HHfrvT51zUcTVwImzkdqKq1/E1BKGBlfQ1BYOBv2ZYvIIcA7T5w5KcEz6zjEpKDbTs07P0WU4FS
	VMcNSuQsL+iDpLg/kJ7AAIdHI2Ec81Nq7in6eV1mJhV3vF0TxExbiwtwzRs/oVthta3rUgDP6EM
	do637rYWchYZ8Qt6FH0oTkh7Q3panZ+3ne5KLStRSbAwa30e783Ql6Ol0t+B66vX4rC4BVFQTfS
	ozrpWP34C1XCLFYVj5RIOvPtAW5h49VUBImvoZHGgxUkP9R5B0FSTgV0UFtbiS493pkx+YRpYrk
	Z86iJ9wZjes7pWw6VHP9C49tCzWP54b951nh33MFGSo7WXh/2tHaQfVQVz2cOV7l/EV8DfzTgqm
	j6a5BfHlBp1dGrtNeImXRCQ5zBq+A=
X-Google-Smtp-Source: AGHT+IGnKjqzbkhuvdWC2zI52BeV7MMIvf9OsVAI4XiKB15JDfOLSX5YIo7aBUdC8ZUdmjSM/iA6Sw==
X-Received: by 2002:a05:6402:358a:b0:640:be87:a86b with SMTP id 4fb4d7f45d1cf-6411f6b3baamr1693540a12.5.1762445798504;
        Thu, 06 Nov 2025 08:16:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eabsm2113408a12.11.2025.11.06.08.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:16:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:16:25 +0100
Subject: [PATCH 1/4] gpio: tb10x: Drop unused tb10x_set_bits() function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-gpio-of-match-v1-1-50c7115a045e@linaro.org>
References: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
In-Reply-To: <20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bV1csp2rWHEChhH2wtc+ipip96VeBDB9QOyjlvKNG/s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDMne//1G4nx6sAjk0fip9F0NwApN5hshBoZuD
 RHWNh/iIoOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzJ3gAKCRDBN2bmhouD
 15IED/0XzrXZAYuaXb8FfmaclQ0RY6jfzxQrHGsf/WmuK02ww2efB75Exltpwwtm91fHOTkDU+T
 d2Kykn+OUAn6bPtd7LG5TSjCDI1tyM+/Nmd1wpAecJLUwG74wFPmu/ofjaxFh7lT6wZihV7lyHt
 8YmM+qnYuUolGhcqcfv7MDurJ8J2Bsqpat4m7N5nHOw++bPTo+SUOojVuhOwrXUI+9kKJ7myKLI
 cKXvLFDL0IOZDKcsJ6iq5nunmneht/iT7YFCKW6+gD1WTJpoziwV/6SXm8XJ6upKBSlnq9KxPSj
 NJ5fAe4+xkXGcBrd5oN7v7sbLM7FSPVyKlmrmHlv8YD3Vxl/t+0CwfwD/YkXVuUYFGOhPzRq1p1
 2eYQ0DqHsM9ulF4ZqHMFaRpLmHwNu1noNDT8MzzuoMNAWW4XN5JJtqeYlHHvlrcSFufrmyWAMpm
 5gZv8IPPiJx3Zw/XyFAwIepY+evhUcdg39kj+D/DVwWnTUGrdKgT/OYrpvvcE3Lxa+MjtAD3lji
 3DB8a4wIM9Y6xyQDaN3gtz5pxIPJGG+kyoN1ctUWXZlnUPRzzb20y01PoVvuhmiyPqOvVHa4+8O
 qGOKxXXWJBJOE+bPEc1yIlencBqk4SY4CpcNcxsvQ8A5Av5IswK60aumWzlZL+3v+oM/XHcxZeo
 xNC7jP93MIRL56Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

tb10x_set_bits() is not referenced anywhere leading to W=1 warning:

  gpio-tb10x.c:59:20: error: unused function 'tb10x_set_bits' [-Werror,-Wunused-function]

After its removal, tb10x_reg_write() becomes unused as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpio/gpio-tb10x.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 09a448ce3eec..3c8fd322a713 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -50,25 +50,6 @@ static inline u32 tb10x_reg_read(struct tb10x_gpio *gpio, unsigned int offs)
 	return ioread32(gpio->base + offs);
 }
 
-static inline void tb10x_reg_write(struct tb10x_gpio *gpio, unsigned int offs,
-				u32 val)
-{
-	iowrite32(val, gpio->base + offs);
-}
-
-static inline void tb10x_set_bits(struct tb10x_gpio *gpio, unsigned int offs,
-				u32 mask, u32 val)
-{
-	u32 r;
-
-	guard(gpio_generic_lock_irqsave)(&gpio->chip);
-
-	r = tb10x_reg_read(gpio, offs);
-	r = (r & ~mask) | (val & mask);
-
-	tb10x_reg_write(gpio, offs, r);
-}
-
 static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);

-- 
2.48.1


