Return-Path: <linux-gpio+bounces-10577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3E498A7B5
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 16:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8B44B22856
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 14:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2941E1991C8;
	Mon, 30 Sep 2024 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jWX/7Qvc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B10D192B89
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707695; cv=none; b=V+Hm5XPTB5DH8atjM+Gd/nrDt5ljbYMh7fW3obNmzCDzg7uDMhtAxGifdb5FOtsJUoDFw2OO5ic1LA8VJHUUwVBl/QH4IFqX8u9adFDZZTY9n8uQdugaYnPgIuVK2rdDNFxPNOtRrE7K1M1ofP2IgqwV12pRwexUHYOehKBv214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707695; c=relaxed/simple;
	bh=dS7033UK5o0SDp12ez9+MsK/OvK6hEmTLroWCeXZvno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rwwLWUXmaGHow6answRolevvGKgz2cmzFYDArB/b3PDhyAXhiTg/mj9X/lidDLDOOETe5GREaaGVN57oUZHcqU6A6xGVc4wkDM1fCV84StHzji5vQJxFAmZ/I9a+7/FamUJ5MDa8Yd1WLYFfzK9KKc8MvcJKg3Yo6gZF/gRRf+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jWX/7Qvc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cdbdbbb1cso1314180f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727707691; x=1728312491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5JPVDbbNqioPx5PpN9QQ9QHeM55uETxow7YFSewChHo=;
        b=jWX/7QvcJYtxl/uqE1ZFULxjKzK0zKk5tv/lU1MGKHKdaIltfKKg2yL0uVl7CAN9LT
         7Mhny4MTLEfVv+Rqo8dBjrRFcw+0GGgLBPDHhHQyJaZS96anYZofc6jKzESBfyZSEgoZ
         1M1PmGaJeQHMkeavU/lZA0iFHV7jOcslJo1fX6/+AWRw+YvDOHjRnoLfivnUKfvYJF96
         9TWpTa71Yy/YyVPhrYHtqMoLpmp0Q5WggQMAf1OLlrpl5JXpi4pTrqiChjg18Uqh0hzY
         JvKQOmvSzIJBoNSBh/R0H2G7Rt+qnbLQEIizr/dQs3iYmCkAfaNE7cAPPvvIm17hlcco
         6tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727707691; x=1728312491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JPVDbbNqioPx5PpN9QQ9QHeM55uETxow7YFSewChHo=;
        b=NjTEExlke+hO++hr9Jva3KyvLXu/SnmeYpyBYtM5fS5O18x7/s1wxVxY+lJDMRxCCF
         1hDh09f9MWpfNP2Lbp5wVvfkWub5onjsHJdEs/KIFgk7haa42+O1wX/uttIEu+jCSNZN
         XxvNOXQDJXeu5Pwhyvvas3nePheGhLJd8iYivwWhHIIezaslB7e8SrC/D4dl4PdP93D4
         aqTPzLDD/5NSf36MEFRZaBA5CepsLZMAVWMRuXahEoedldKgmeTiFlyo9WWek+227eb1
         j7ZDmjwpGBpjer6uChMDUcJ4epksVsja8J5qqN4f+L0djvqtedbbWWn0k17MGRzZZqv4
         Zbcw==
X-Gm-Message-State: AOJu0YzkerucTB+FuaoHoUNIoFmrUm1mncRZIo2NXMH4mvuVmjxO7+q2
	+uE+aRbHw1Ikiz7zfMNRq5xgBI5ClYOfbVZSanoUx10s5rfc4yud9K8sg33IHkhCyiFrXe11gW2
	G
X-Google-Smtp-Source: AGHT+IHEBWsgzN+e1E83ihM7s8lCg7F/C4ranxA5EM4TGZYF65BQAsQ7T5R0fceezMF+TXipft52dQ==
X-Received: by 2002:a5d:4572:0:b0:37c:d183:a8f8 with SMTP id ffacd0b85a97d-37cd5a82669mr6394506f8f.19.1727707691355;
        Mon, 30 Sep 2024 07:48:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd566a41fsm9241505f8f.45.2024.09.30.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:48:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/3] gpio: xilinx: drop dependency on GPIO_OF
Date: Mon, 30 Sep 2024 16:48:02 +0200
Message-ID: <20240930144804.75068-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver doesn't really depend on gpiolib-of being built and can be
compiled without it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d93cd4f722b4..0d676c96b72d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -796,7 +796,6 @@ config GPIO_XGENE_SB
 config GPIO_XILINX
 	tristate "Xilinx GPIO support"
 	select GPIOLIB_IRQCHIP
-	depends on OF_GPIO
 	help
 	  Say yes here to support the Xilinx FPGA GPIO device.
 
-- 
2.43.0


