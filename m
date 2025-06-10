Return-Path: <linux-gpio+bounces-21184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AE3AD3692
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B81E3A92F1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28B32989A2;
	Tue, 10 Jun 2025 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UuFfONuG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63186298265
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558817; cv=none; b=gtPpF8pFCRcffE84isGqjcpG38esUd5P4OL6mScXjx/6wNCgtsOYm9utbPjwlLvhQa5QTjNQQNZWHILOO8Zwvrt1QaEVEnx5WEp4A6xfstTUCRc2BiavPfS+IJAN6TCMlgMz+uodmn6ZP8nPGn2EVQR1c4WyzT9FkdDSwe+NBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558817; c=relaxed/simple;
	bh=UCl60XA5zybIlle3UgD6Tp3LRDopzHcyoITVtLoPMAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPCQAQWvzJcQIL5/t7VQ1WXlFrSszClTxIkOFM8td8gYuJBlR/mVusNCEQ6U0X1tp+TCZpeKEyXooSjLqUiz4VyXZspWfQXofUaVHPY7n50tbQVNWiK7AvhZLHYiDATI2Tm9EoMfupXUE8FVvCPeTKH2ex7j9UeRTaUx93Wmgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UuFfONuG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2245844f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558813; x=1750163613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
        b=UuFfONuGYfAmEl+pfrIiAjBLsfvBNV5T3w3ILNO1YOZd4J6cxihUc2wN2P7E167voH
         HwiDbSYjsyVPIGcRGb1FJ627bZ1ln2Nv+rnMOPPnBKcx/h2P7Mad8a7BhK+JJrvuwfP5
         c9ZqiTHMiRBgpz6895+p1JBfag+CpaTIkrn0haNC59HSAdpoLIQeagJ0cOqz/P/BJcKy
         Tl1BV1MjCpkGaGtPr+XmcbwdNQe3tJoXkY4d5rnxOawkGZSmiF+D70BxcHavx++pQ4wO
         uIERCUG2afnqof9UlOz+HcGfldI6YBvqHFJmAzm328eP+EsvWY3OCy7z+3LMpbVLMgfv
         ejKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558813; x=1750163613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5efislHrp/JRAcyS3DpceL6NreL8VPyCFAzfIt/z8uY=;
        b=qqDYICYC6RbPnx4YFmALRMwDFK6fcZkovK5qjvDZ9+pjfplGYeWRp97DReHg4sj+31
         29qHiyGQgjyOLXdcJXd/tIriRbpTUfD0n7TKx/bH964kfXg1qT+3iEhuQlAjdIkby6Po
         tf0G2V09IowBHNZck61s0Yo4vn1sITsvdT5cy5RBhdH7cJ8QHsIqe6xsqx2CsxfuNObU
         z694T0PGBPfMO+0TAHXLcCCRY5xCcMYOM/0WRqUeJHPEeV/gyjfXfA3xdJUz67BQfKqj
         dDbE98bNfCkXDdujQwfpgWFJm0P3p6ZglyrgSYsabcxr0bMMnk1bmkSELbMGJCvEPeTq
         msKg==
X-Gm-Message-State: AOJu0YyRtx4LQXHjhBgDePP6WooRoXeTNV51crt/zkW8nL7t3C0OJ4Cb
	zi93t0jvfdWib+xwAIUiiiJliH7LEe3Ve3OdlXoPgI4gWCzVVpLwN1zI6LlcjN+gCpc0y5vViPA
	WnXQ1
X-Gm-Gg: ASbGncurPICxtL68YkNqupoYGUTX8SHr2cy/bSH3TdBfsxPFBu2yjvTkHVzRqbLY04S
	6cP7HopCzOunUVzoZj1S0w9XQBzugDof+ogOrebNXOJ+w0vSwTY/IaNkdBmrhRC+HuBvZAB5zYN
	PT++s5M9acMDTAeKmcdmzIXLGzBp5N5KvfZEjO7i0tG2Ck7bHbh8rDLx7I+tjBRu/NCh2iefAzf
	d2ig/LFittFQPnfjkIeUOkUct9WAik8nXbDdkaQjfAFuONj0lWsK58J5e5AmFv06ALJ3nO/ROT4
	rn5JoP1MpSumgedzSyQW6kBVqMIc/k2YbNmDc5SUKTejZMnvpp8p0A==
X-Google-Smtp-Source: AGHT+IFgyML87FC7sXwU9H5OuYAASfbZLFGVxDzw97GzCafTQDbHfQzd+kDvtAb5xiwbEFxqnYxW+Q==
X-Received: by 2002:a05:6000:250f:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3a5319b5ca5mr13136061f8f.58.1749558813586;
        Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:20 +0200
Subject: [PATCH 10/12] gpio: octeon: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-10-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=inYE0B+JIbFcYN8GhgAuP7ekd2fsyKlPqwAEHBeRQ6M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQkSSfeELcCg3oaC15IzD7nqU50aRHnj20R
 3Vt+fMHWlqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cqyAD/96GLYr1WlD8IQwvSvdKxhhNMNdPLuDvV+muwAcy6JTo0yVwtFi29APezY85UQRA1fBdH8
 tBj9XT9r93hwmuW1csYQjI0Y+hbNfmuqJcmQBr6Dzc+ADZk0/dhgqr5t3VHtV/Ur5QvhQGvn+k0
 2lsUOiGUQvMHc8A04WFfw6ek64gegW0vBC+68qMehtMzvgGAwtsk3D9VnjQ0GjZmqeVb/r9sGrz
 Eu41NcHjU6rXmgqDfSm2H1qMh+Ak5Dp49H9cDZbQ0wM2ODNFF3rLCiuZSdMco7jGPXJhK+BIvQ4
 hi7fC69+1/XtsXP59x7xhKZjX5bYObsb9oC6CwW5BaOxMmXKR7Pt47oshFdfYmzRxaJDNYTPcdu
 gSxBr29xktm4DI9JI+25hY4hJQpSsrQOKCBxGiU+55W8miBMG8h9pe71LysUt8Fr8AR8LbZG5sa
 Iqj+eIMUujT95lGnffsd7RwYWfvennBwTykRmBumWcA1HNt7m/gzgU8Ktm6ZF8fkNzEtgu5yWrk
 ijJFq/SPI2UnsQcs5HEbTJe7Ujvsck3MfkGILvNmjHgK9NVsdY+Kla3dGFC0oqKxRSxxlo19Vvq
 mg3UGgaOALMKfIcTu1FOeAv+aBJudryS+uU0V2ore5yflhFusBi8OdDuO+BF/7pbSoZ7qOIkPV3
 QRPFnoLRMWGdKnw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-octeon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index afb0e8a791e5a8f1b3029c4ca890a5eb9b8efe44..24966161742a96082baeb850f124c71b894e9057 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -47,12 +47,15 @@ static int octeon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
-static void octeon_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int octeon_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct octeon_gpio *gpio = gpiochip_get_data(chip);
 	u64 mask = 1ull << offset;
 	u64 reg = gpio->register_base + (value ? TX_SET : TX_CLEAR);
 	cvmx_write_csr(reg, mask);
+
+	return 0;
 }
 
 static int octeon_gpio_dir_out(struct gpio_chip *chip, unsigned offset,
@@ -105,7 +108,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = octeon_gpio_dir_in;
 	chip->get = octeon_gpio_get;
 	chip->direction_output = octeon_gpio_dir_out;
-	chip->set = octeon_gpio_set;
+	chip->set_rv = octeon_gpio_set;
 	err = devm_gpiochip_add_data(&pdev->dev, chip, gpio);
 	if (err)
 		return err;

-- 
2.48.1


