Return-Path: <linux-gpio+bounces-17362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07AA594C4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 13:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC1587A488D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 12:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6B9228CB5;
	Mon, 10 Mar 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rUjznsln"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52BA228C9C
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610435; cv=none; b=BIE3ZhAZy0EenbA4qhHrJaOIB2h5kUuNugNpMt4LdFQh3EQPZJT2VJX+/R4xg4M8D2hz6WCUtw99P9JH8ybs1WXyPy7lTZZeBGG27rzstb4/zCu0wZBBDYmdMqqa6/PnjDRSgiIGdhTS4gwcqFUHhGgWXZEstMNMFR99HMJfsq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610435; c=relaxed/simple;
	bh=0MwJHiYz8qP6XnHSBXy1CREHdTzyEJq2M36Gm2JfK/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfO2EU1zxDGihWZnOpknXt7dn61y/m+cvFHPlhnf3TfPfPT3tqRJs/Rgyf2EtCKAwDMgk45Yq15UMAmv7sZDTe/WfcB6whVGiboGPXhffUC5EM+qF18MqG1bBZhYP7MQPMg6fOA6Ihqh9JqzHAn8JNKNnvJ9i5KQPEaD64hWEk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rUjznsln; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3137679f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610431; x=1742215231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awwcKklLcxQSyEau0VgGeRNglh8IyrJvaJkwq5PFXFI=;
        b=rUjznslnp6MndPc6nP+CvZICzYxsWbObnIedFMZQy1TRJUFjPdyMapOGNzRtV3Yn8P
         OhdRR3Oc8l4Jr/NijTNdHJuLO+qDsdH2/JPAXxQm177pponexkfEGjJXi7DP0vsp8R4r
         fNKx3Cs+Nf+zxZTQEl/Tb1C217xkyeH/cFZsrCaenm6hGrQvmpAWkeidO2QuOe9diJC7
         HmKKsQOhwm81bkeM0RNprEvd5TH0bX5lGWyIqTUUiG16TkgYVk4I9+YH1AOAolCvsaFc
         tndguyGGakrUnoKTylf9SqxSQ8WnI6q/OK41I3FmNE/Hv5FhxPpjIkhIcKNygLGDMKR5
         NNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610431; x=1742215231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awwcKklLcxQSyEau0VgGeRNglh8IyrJvaJkwq5PFXFI=;
        b=eheukqhFzj3O6PVKCGUNFVrRNRYWyClo4wGblayJ2OvXd9ocjo6QmwTSroA6ZR0GJ8
         VzOH5iLzvQTPn4mvsf/RnsFBmdUqBUuMHDImZynf1gpTgXnsX43NY8aPhC4xwjGWvcBi
         Rz///1fIKm6E4gnFO0eILgImL9ecqjzBZI7IejmkWQhQxGf5FMYh512zPtqYKohybyA9
         44rpXS1BWhxMb3mlH3dCB/uBCuLBGQYRgqFKV645ph3O4UToeF3egWt+/PZFYVrBeP2h
         2ICG1MT6Lk+qxHRe80X22osT4Kh9TV5Pu4AQS4+TL7Z8BLvyvnL2V9AiJnJyaBRG7Tx+
         cW5A==
X-Gm-Message-State: AOJu0YxmZ0kpP9o+6ojAKDoeFKPfhWu2g9yRBGctyoQemNHdU7vjrF8K
	AgrmjRMdFcCsk2nbu5llzxU7BbiGPHv2m9QHVaCY5mdmL4wr6uSODKBTPaVIiV8=
X-Gm-Gg: ASbGncuSSjtzNCDBqPR8ty0w1btHL9JDuVTMa75XLicv1q7qY9FjQg/HZVGkRLapKjC
	lBk5nUZDFMuXayuvhHx/DzvZKzUEg3yg2jz5WT7tmfOu3Auo9dffwuzx6ZoW1lsxYGLuDlGyU2r
	8JziZ4vUNMjvisPE+MQ3EYrSpsPXvkF8iyVnBLxx96Yz2Go/r+LzPToUWC7pk1sP4QKYCoarbme
	ngPH6bd/J3Y/6qO/vLnSKagBl69D89JdiysvRi2ZVqNIOefuqoA2NXrDK4XV/DvuylSWdHRTPaF
	KVYkUR0UdBgDQT+oGFR90rkBBrcd42sq5FJ49w==
X-Google-Smtp-Source: AGHT+IGlRgJJ9INTUJwKbljtaLYH8PDbAKVApHIeEa/nm9bcxNZJsDZtwMRYD3lCtAqqXEVILMZWYA==
X-Received: by 2002:a05:6000:4105:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-39141c97c1bmr3295266f8f.54.1741610431159;
        Mon, 10 Mar 2025 05:40:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:19 +0100
Subject: [PATCH 05/15] gpio: bd9571mwv: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-5-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wYAPVSwzz7/jE+CVEfGYtgk2a0UY+dKDJuh7tZ/STns=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt222BavMpMSozEwH8XI6H0xiQ2YZMKIXLEIE
 8HySLLbA9SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtgAKCRARpy6gFHHX
 cmKmEAClxbQtV/gXoQ0RxZNPyR+nrKHt43fRMnVuAVy2vWmYHcmZW0xLQcxyCRZE3o7WqcK3Lmt
 c3hJqfZ3mre0XADPaixFfSnxbH+urPnDLoNnCCkvX+MY1vDj9orcz95rxS+k9WV5sYFklVEl+89
 VxZsSWClk/X1aIJMtDCwSNI+P7lImbpfxQA6OKsMNs7+Yn2dFzpOiG/clsboxhOGTuOF7/AaLxa
 R4kBua09Qtdx9GlUqbiXF2xLk7Y6iFcTCqJpX3/OSlyFJnMpvGj7gGI35DR790tq7J45S7cdc8u
 pMuYd2JfV7/RzK4sXJVNMV+GiJxd+SIWuKhHQuYEJdt/L/aIhYHyLupU1Wm8rs8cc7x4tBZeOix
 N6gt2SWOa4mElAUgn55Zxu8xbGu8La0dy3Y3cSC+rqMuflqpY75qBS4lFDocZVCDpW+NCFnZwVs
 ryuO04oVUZOVaMvGJA5t7poWAVqg+qZPnnSq5x065NxQJJNLgz9KBTr/ApggwJXcPnmCwyzVAHf
 w/zh1BBFZgcJvcvEuODzTODX1MPv85X9q+YklnDA/IWirFF4UkMjOvVmP/G+ppIRhkM2t+EWAL2
 paiNEEw1DphieKOAPTniLdCzZPpJofu9PJ5GeiDMT8zSlk77OIN8jQ43QdWJ8AQA6dp8CLa5Z5q
 hQeJZZ+DH0T1gIw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bd9571mwv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index 9a4d55f703bb..8df1361e3e84 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -72,13 +72,13 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return val & BIT(offset);
 }
 
-static void bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
+static int bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			      int value)
 {
 	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
 
-	regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_OUT,
-			   BIT(offset), value ? BIT(offset) : 0);
+	return regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_OUT,
+				  BIT(offset), value ? BIT(offset) : 0);
 }
 
 static const struct gpio_chip template_chip = {
@@ -88,7 +88,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= bd9571mwv_gpio_direction_input,
 	.direction_output	= bd9571mwv_gpio_direction_output,
 	.get			= bd9571mwv_gpio_get,
-	.set			= bd9571mwv_gpio_set,
+	.set_rv			= bd9571mwv_gpio_set,
 	.base			= -1,
 	.ngpio			= 2,
 	.can_sleep		= true,

-- 
2.45.2


