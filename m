Return-Path: <linux-gpio+bounces-19297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1072A9C2BC
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 11:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9ED1BC03B0
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 09:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF0423F28D;
	Fri, 25 Apr 2025 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2CeX7/fb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E480208997
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571670; cv=none; b=oo4IqaRZEOE4/qjdpvES1OlwLJfNl6qqBHOMS9OBxpUFGL5aNYaXovOdOrkyoCMJYMGgXZHFtftn1VRkcboooCO3XyfkxBWN92rF59qo2gKnfkBrIow6ZMKadJkzQkkmoJw7eZljYHMUamL/zxGT4L8fUgFjoY3mnBQOxMe1OHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571670; c=relaxed/simple;
	bh=gcgSAGCf9S1xTbI3gVnPSPqXssP4QvQGlqxWgMXBtSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ia/nPJtT+TrjK2JP3YghNtPe+zpOG6yXDKX5zaAYyWizGmsM8L44T5MYOBVTMjd+HN/KDFES7xoTtEaVzSvgPHpDE1KoPl1bKbnoFMHr7sBEAd2x1dRKrk8I0P4+Q+83EvfwpCAFFG9gsX9kdnn6YDJyrUWPeKpm98srtaUoU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2CeX7/fb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1509046f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571666; x=1746176466; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86MPQpP9DYDVUcUDU5TkbLJWYglOE/j2zaAMUX/6YP0=;
        b=2CeX7/fb7C3C4qkMVyeR2si1V/CYu0EsmU4VB5L3s9Epvf8bzClMAXrtbCkj7ZoPXg
         6dlSO5iKC+fSoMm6r79l+/vIHrnm9bcjHrAJ0aHMTTX1VHEyaTAsho2/5O/39gNSD6l8
         rS/X+6Cm87E4tDkwl4b+UL4xI6x/tG5oEFkbSu4l5YozOyUz3A6xOf9elcqAw8QvkGNb
         kDTuRvQpn8cyOolfKn+ak1EcUDe83HjbRbmlo2VY/3FPPg02f8VtZ4gL2fgSK0IAvnGJ
         CdqsnoErdnYh8g07Iae/F/HCIrIaXqqcmAGexMGPE85CegAgpCn/HviRJREcK6J74nNe
         mzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571666; x=1746176466;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86MPQpP9DYDVUcUDU5TkbLJWYglOE/j2zaAMUX/6YP0=;
        b=Oaug5r53gL7ZfYJl5wKttP+YPuXi2UK1ATTOZscTAqmuCP3Ot6J9r4WyelBkhB4FQt
         0bX+KZWZp/G60ZAk+ZIXwFF9aF+axkgFSFSABdv9YNd1yCvV74CcXFkLaUAuLNvGZ6Lu
         ajwS12oK7SxUkKExESMr/HTDcd4tq7vWw57bd4NU0YP6VxpdpwY/iK0yo1hii2EtMqjt
         DR4hYs/NNWeJZq7tKnT7urZWspoogqK4hpgHKXVhdvMNmwBo7UlHepi8BdC5JPKA0U9u
         skZfCmsiVCdthZL/RxCUEbXvhpnHqrDHMRRvnWum4nuCs8QDW1Ury/yY/bZ9qUve9d2z
         8Z6A==
X-Forwarded-Encrypted: i=1; AJvYcCVXOhJ+dUaiIfNijVNShdNh2Vh48As/XvJO3rGVHwviPVuH+rbbPBb/x0+jUWyBqq2GYbhYu9ihG2re@vger.kernel.org
X-Gm-Message-State: AOJu0YxnyoMJBIx9LtRviuURcVS1Y9Zfwt1o3tkQJ4MYHp5WEKwOhfZb
	pPPWSTKy5ksBA3f6NZI+Zpz0v0nT5I8a+kyHIhKNZh7WyMtROi2nayNCDp1PRiM=
X-Gm-Gg: ASbGncs+X0+GTfXrX5a4pVLrfUf92bADgEFdHQftsBjSkScNZFNsQfsIlY7xrav5xBs
	z1jzwbWnMaK7wTMiOXBTW/d2iZMOxILi3k7xgrgKuyUidyCK2UoaTcD2VeK62Litep7vvSJoPOn
	9itQX1KkYP6LWRcnFnEbiGMFZZJwcf4/qEcWgZ2p7g0KxMQnnqXdNpOuMctD+2VOdG1YGXLE5Me
	xpNoTdCA4biFhtlWgQjktZ24geflD3RToiLJMPPm8ofhNsugotudmuLwv7cEJnp8luWJUg00wFZ
	YudA58fxdVsGI+gcP8QKxPiNnzJ96ypRQSUq2bARkQIB
X-Google-Smtp-Source: AGHT+IH3OnIubuFCBwHvzDU6+k3f9N9mzQaSt1HB4QUYIlDhLHCrYidDLJkaQB3hjNSR8q+IxbksRA==
X-Received: by 2002:a05:6000:402c:b0:39e:f51d:9cf9 with SMTP id ffacd0b85a97d-3a074f42e7amr1207472f8f.48.1745571665602;
        Fri, 25 Apr 2025 02:01:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pinctrl: mediatek: convert GPIO chips to using new
 value setters
Date: Fri, 25 Apr 2025 11:00:56 +0200
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEhPC2gC/x3NwQqDMAyA4VeRnA2YTnH4KuKhNFHDtlrSIgPx3
 Vd2/C7/f0EWU8kwNReYnJr1iBXUNhB2HzdB5WpwnRu63g24JT3CrgmzFLQTk8ZQ7I0fYfVFXkj
 Mzwf5nmkkqJlksur3v5iX+/4BviB2NHIAAAA=
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gcgSAGCf9S1xTbI3gVnPSPqXssP4QvQGlqxWgMXBtSY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09LShA4FFFs7FxYzWMo/1MzGZYVAv/t/XsCr
 XI6PnVu6PeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPSwAKCRARpy6gFHHX
 ci3cD/9iJ/xVDYLFM7DCh189mq6iSH435TREA5mvwF1xWjo5k+b1ttZTjFnkyQHXyQCVmygSLBq
 Z9xZ3BHypbpwD8ykxvnDZ2IOP5QkvXArTwYU7SsqEAOzsLQ1woH8qCK06dOj0fXfjuBxyjY0PGw
 w2iSbbza3dIiabeuu7ed8uAJmgBuf+qrUQon1gGImTXwyYRKJSIfMZ8GwIhD5sdVbj7IF+NqVv8
 DzQMC2pOQ8/uyaoz7DDypiT8QZ4VqNyIS0YCU0qAFOsud0U3LesVVNIr7x6SViXRDaeAvF5C0vN
 xK3cd28bek61r1sYczNp5XAWFZZbZE1JanSfO/Ra1m3UFNWhxrbsPuccrAvlUHcBd+fhP6AwVwz
 7ODzLYWquoOtJDLDMeGfZTaNmenKqsQZKEfw+5aryPpWSCrESUbP9AnejrJ2gpDGpdXaya6s84i
 YLIEB+KusN8gNbzPOy5+x2MF40OlbYfdA2479FscfDcvG3OIpn0AQox+enlI+1jVX1kX996qELm
 3kpMjMSqIMO5RaCKGxkyiWzmkBocfOG6W6iGco1FeARqFlZB7dOn8TNzQT/X2tlgOz91ag6PvPD
 3qfrDaI1aDWXGHlQWAT66D2q+8ZxvUHrB/4Qk0w/B/D7JwV+XE6BYhnDA9bR34WHbb9R7fzDspS
 GBnZdlnyiNYYxjg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the mediatek pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: mediatek: airoha: use new GPIO line value setter callbacks
      pinctrl: mediatek: paris: don't double-check the GPIO number
      pinctrl: mediatek: paris: use new GPIO line value setter callbacks
      pinctrl: mediatek: moore: use new GPIO line value setter callbacks
      pinctrl: mediatek: common: use new GPIO line value setter callbacks

 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 19 ++++++++----------
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 18 +++++++++--------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 ++++++++----
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 29 +++++++--------------------
 4 files changed, 34 insertions(+), 45 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-gpiochip-set-rv-pinctrl-mediatek-1dd831a4d171

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


