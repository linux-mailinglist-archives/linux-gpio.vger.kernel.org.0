Return-Path: <linux-gpio+bounces-19673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F9AABE2F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E8693B4DF2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FD6278755;
	Tue,  6 May 2025 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E0lqo8iQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F58277036
	for <linux-gpio@vger.kernel.org>; Tue,  6 May 2025 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522130; cv=none; b=MGaXAT9rn357GqvBWZ3giogeAUoeFoMK7iRhlJlmUlrjc+7cZS6y0/rI+OECrawA2ipPc8EkMlR0y+FvGywYiGzv+xb7ddqVoEQWNlgjcS81LWTVlXOpByL52HfdOKvQkLvba+7yJWGypJze2uzBwvDXJqzrJQqclj9ki94F5Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522130; c=relaxed/simple;
	bh=L7ylAv3DjJzqa9bWTH30KaUS/rijboOvo44ZRxv2joU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n0sNLHS53QiT2yMgJnXfla1xALE1WUWX0JXTpC7zGPaJyDhZ96zgZ3ZbLaR53uxBMuoSxseEOzTTU5eNaEmR3TQH+DeGJcLUYOkpeTC0GqRIIPaGYOuuBiD6/0RHZiXIj/W4jULWg7pkrnI8ZKnBpGtsYRc3f3vobNHRtzVlNIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E0lqo8iQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ede096d73so31960465e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 May 2025 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746522126; x=1747126926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5t7463cNsExwzuHfixoOLULX/8A+JIXQFhWYI91z8U=;
        b=E0lqo8iQ2gFu/uIG4u0cJqfZVehC7sha5rtDgIEK3nv6Ywm7uQVY7WRS7tVOnhsswR
         s9ajmW8vFinVgCrb3I+RXU+Tp3TH9dMlxJxJRT5Uit3MjUSRFcdeyf21D9P3sOGYuhDE
         TyTAX2nXCEYtuy4sB1THjgHR/U18dRd38Ry7+K335CDahUooCfGsBR3yQMsetU3lE7Oj
         iQcnsqqFg28ejTYC6Wyo+0uI6HflbBqzfYDq61JLoIBak3v7KF40HvOHk3sNKbXNFEYd
         oCpc9qigeqrGpa0fxH+rwjrrRcv1gHGLm/tDUyMgECCjosu9+JqNYblPiWCOIEd5H5SH
         IXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522126; x=1747126926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5t7463cNsExwzuHfixoOLULX/8A+JIXQFhWYI91z8U=;
        b=OruIMnZg8rBDV2f0iS3XnJtqpYVhTkVFZ52h2OTIW1MhC0LzL2A3ReWLMleHoNCe41
         QNkqfgnjboDCp/wVZQVkcA55xA2rJDN5A0Pe6hYafYZ4YLjGq3fopDDjjChGdMwXeC/Q
         xS6C+T0QuKbFx7qenU+lBD/fIO0rWJIjZB6WqH+LBgwcSZ62zpxf1HpDwXkTKP4o9Yt4
         SKAIyPKpSoGMIdW20A13J8fuoHphS+JPFrNrVN+dnq4htw/PPuuVUmloOorKscxAw3pR
         qrLh/czX+VuXSNNSoXyVDRVK2THZdNE5kZBR2eooj+f3lfqB9rJqV6LVeq0PViuZ3gvH
         3l/w==
X-Gm-Message-State: AOJu0Yzci1f3SJJe7VJlWe1CtF1CQ+reIANiipZbR+uUvI0Gz6ZU/2MT
	FLMwfiG8IU70/FtvyuJvFDlN2kSgFSKS7N7AgvXT7ZcGWRCoH3nDyrLUSdGKFds=
X-Gm-Gg: ASbGnctmVnOElB88W90b1KdolN9c5XuB0gMu/bNeisvUhSxDX8lCcB8P3uXmythW5Zt
	aPiDZp6DJvdrnDijWWSBCcOPvnu1XTR8L/YKH9SAxqIvxNZXJb/no41f0Wiea03meMeqJjVHviw
	jkvYOAx6yNjXOsRh6xH12PS0SRkFLK/SfuqfBWchXY9hB89ZIu/jQJjtwu52Fm5c3LQ6BE/x5uZ
	/Q1Bbx+YwYHDEZYVZlI9FMe0+ht/4UvJ6fH1mGHC2hOCjm74+HE0pdMrbJn9Fu42qX1NumE3/yD
	3kpxyJW6nNEwHhNw8iIh+KQLVSZgthtyktY=
X-Google-Smtp-Source: AGHT+IG2JavFAOfkm5yvEVzhBOWiCM+n63NE0WGorpmBiJ6Up7VY84BWzS6I5+ST2HXolMCVpnzNgw==
X-Received: by 2002:a05:600c:a413:b0:43a:ed4d:716c with SMTP id 5b1f17b1804b1-441cbc3e6c1mr42623835e9.22.1746522126365;
        Tue, 06 May 2025 02:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:bfd0:3ad7:fd8a:fe95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm138125725e9.26.2025.05.06.02.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:02:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 06 May 2025 11:01:55 +0200
Subject: [PATCH 12/12] gpio: ml-ioh: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gpiochip-set-rv-gpio-part3-v1-12-0fbdea5a9667@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nNCKmy4dSJPb2zDH2e9wzncuQT/cTu26TwYiGfHINVU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoGc//yRkQw+Mjxb/VAzEYh4NS0eiU4M8rdeHKD
 lwNJrrj8Q2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBnP/wAKCRARpy6gFHHX
 cgkxEAC8fJnRNCwURyy7LqresTVWXPVo+9MHCVv7Xny2M4dcRTEzIR0UWviKCey2j9UtttbRC1S
 RJLdo1AbErdGoC9X4GXxqTF0HVzys7e2R5IuMDKile7aI5gtS25t3B/MxMAimQGNZYszacXclvV
 tAEhuuUXZoOi0tn+vUL8M0kI5Q0rPoBxjafYzpV7vThKuVDJVlFHnbpX+v73bcpvPrKnNQxkGSk
 Y0ddRdsoVggcxRyRQoP3reI1vnrUAQX6EVbl0eOABGFQGn5v4UtlTf6fcyoK/M8iEkK/fJIwDwe
 1sKo8qCEErY5+/tc0jkNVU7rz2aVDNl+tdxRS/L0uPkdjAFf2hGusuctrIArQjq/fLM4qXcTYis
 oQpVROTxZ8BCKks2ipR9OUnareuOcKkzEwnyNz9Euvbbf9/QTzg8QXilXqdUZs1p2MatmAAVgzy
 78QVnDB1XkwMaayWKL8MjmyZp0VEhrL6MAEYWhEF1e7F9UATHREd/Nb5VfyvjUa4Z4POrtU59r5
 b1cUgOhohRjs6+sUxZ//I7AUuhwYARthUobnm8V6tbEGwKnCsPz/T+1BJ/Zh197UpgE6ML4YMNH
 tu/dPXHdy/6tt4ZGX9/ew/2vhmW0kspKtafG/On2TTVH+5+s9QEUPxqnWJ5TPoPXzMjbkC6HR3t
 6/VRTvBri4V3vRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ml-ioh.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 48e3768a830e7..12cf36f9ca63b 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -89,7 +89,7 @@ struct ioh_gpio {
 
 static const int num_ports[] = {6, 12, 16, 16, 15, 16, 16, 12};
 
-static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
+static int ioh_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	u32 reg_val;
 	struct ioh_gpio *chip =	gpiochip_get_data(gpio);
@@ -104,6 +104,8 @@ static void ioh_gpio_set(struct gpio_chip *gpio, unsigned nr, int val)
 
 	iowrite32(reg_val, &chip->reg->regs[chip->ch].po);
 	spin_unlock_irqrestore(&chip->spinlock, flags);
+
+	return 0;
 }
 
 static int ioh_gpio_get(struct gpio_chip *gpio, unsigned nr)
@@ -222,7 +224,7 @@ static void ioh_gpio_setup(struct ioh_gpio *chip, int num_port)
 	gpio->direction_input = ioh_gpio_direction_input;
 	gpio->get = ioh_gpio_get;
 	gpio->direction_output = ioh_gpio_direction_output;
-	gpio->set = ioh_gpio_set;
+	gpio->set_rv = ioh_gpio_set;
 	gpio->dbg_show = NULL;
 	gpio->base = -1;
 	gpio->ngpio = num_port;

-- 
2.45.2


