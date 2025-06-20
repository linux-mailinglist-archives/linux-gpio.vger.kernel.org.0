Return-Path: <linux-gpio+bounces-21935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69209AE1B56
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 14:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524AB4C0149
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0A928D8D8;
	Fri, 20 Jun 2025 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yztXB/a1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9022B28B51F
	for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424292; cv=none; b=qOc4SkJAkk6ESgx18/xtedjAhaZNwfFce0sFd2jGwJC8H4n2Pf41wCMC3futM2a/e8ko/cpjglgvCZZwQynhOLuEPiBb0LxRhzu4Xh47lSHV+luC++PeOde2pEAthFXTHk/qncUONH2KiaiRv//2h0e9vLf/xQJ+Cb0VPMHiKUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424292; c=relaxed/simple;
	bh=6RRXZ9NAblpUYRu/VW+XQm+2TcYtFhybPosOtENnoGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDmYqtxdmFgxnCGN4DIj/jnm9bIGqH1o3EZzxHtKBl6zpsEsTbAiZ71iW+0jLRUcH5z5wu40olCtGFe5JYoMQua6JXU2u/rzF9ay5sPKxtTKp/2fGO4zP/bSUSPp0tIb8SRs4XXXMt0G+orgIBf7h7qeiGgYJGyjZ0CjFKOAS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yztXB/a1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d54214adso13673435e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jun 2025 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750424289; x=1751029089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/UUEbhV8ajjp746akkPruIBfbnU99PXnYMQ4IdmFPM=;
        b=yztXB/a1o6gfKKx7N7PZiYeSOqQ0ooVT9eMgFqiHYflEiC5GwP6HP/fUflJD7iPr3G
         fSoiPpoKribvGgXvCZIc7BpgRZX4AIaTWu2HKGlmvQ3WQy2o5yOGexK86Jmjh9UHuM78
         ynRykpnsQSzVwtbhUclYlhqrd63npz/6uZPKEPymUeMQze7EeL0/soHgyA8UxHlZPvtf
         bU3gl7+fUg4gIhulzry9Zxa+72KT5Yy+lNz8KA38XOTwe49vVsa/43jvRddI3pyWRM2j
         S5I9WFE7RS/rT32CE5evZdISGfYm6ab2u+sbvz/zN+F2h7Wc04c8v54WAcjOFf6wqaGn
         T+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424289; x=1751029089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/UUEbhV8ajjp746akkPruIBfbnU99PXnYMQ4IdmFPM=;
        b=lmpI84wLwgeWmUj/ivf8At8YIKzE1KWYmgruK4EEsXP0fa+45CQ6TuG1pz6BNgThCZ
         xd9L4MyHc3EHW86AjvHeb+gEqyI/bxxA7h8HxzBRA44w9nee/VmKxZxmncnuHzEElPId
         YfNCtQtte9Y9FNOTL2GyMuhxG2v4LoibP0kOys3GQmsxPiC3JydDy3xy41+g2/2gXQXQ
         CAoYn++AICGBId7FAZjk/k+6c559bqb0SlJEdZWLSexN28+z5DufbaTdEiy1pJQKhknM
         t1WUrxlBwhNJSNNGZdQHSX6yHReX/noFtHPrnOtYhhqyOJd97vJ+wAAkxBP33PjxL4zT
         ZyJg==
X-Gm-Message-State: AOJu0Yw6xA4zlq2cWiU7CeI7pY+eAutL3X3WX6VfL3e+P+Xw5R0BqrCe
	QXGRFXqeUus2xw+SixKHt+Ggsi7YgwhHVK/TPkH6fvV933lrXDAI2Ay5G7LNhx/K0mQ=
X-Gm-Gg: ASbGncsMzB4iCrgDxtynVgTxL9CLZzxR6I7XIo/xhVc6yePObwIqCktM7pctxEonkC1
	1oAPV/Qw59MK0IlrZED2tryhHSJbyPF0y+BcWYABBTw5zGMkpeMB18HeJhX1dMONOSQBYLskBhn
	yoCVzvfWhuuDL73193FVM2Mifg8gE6zrJYO2kIjhu6GZIpJOrcKD62bTecV6WKUZLSCCAfjktWB
	F37BMyVhAnjd3PpZFnAcif7Yqq/QjA1LH6rWJXlZfsXU+wRiKQmX/lJnl3lDBEclO7hjKxURI6P
	ON6xXWQYxQ1vPrjwCEyzw4BFrytFkfw7AgZm7K6QJigOEnKKC7erLmoQ
X-Google-Smtp-Source: AGHT+IHl6y9iDOY49BAwFOs7hG/RVLZtEdamyODfITzZyzn1WTV0Rp2hfZc46KqzKtqhWHW1oYFryg==
X-Received: by 2002:a05:600c:1546:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-453659f7a4emr26830995e9.30.1750424288649;
        Fri, 20 Jun 2025 05:58:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535fdf82f9sm50522975e9.29.2025.06.20.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:58:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Jun 2025 14:58:01 +0200
Subject: [PATCH 1/2] gpio: constify arguments of gpiod_is_equal()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-gpiod-is-equal-improv-v1-1-a75060505d2c@linaro.org>
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FpJCLQ1y/BknIVva7DOCHXJ1+kmF6FqDtTgwQexrEh0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoVVre5Sc32Twv5BcYpPMVGPHChYJ8/JoOAye48
 5AVCXdnGB+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFVa3gAKCRARpy6gFHHX
 cj5AD/9piOt7IVjVp9FjH/cQcPahXk6fvo4mPXvdun0rAOJIODDyTdAnB65002dDppCqJkfKrOq
 dhuvhHtlyZKd6esT7wldixMFMs7WjmhNCcWU0jDoGmtYkp4lzZZiusvmYmxkim1Cccv2gWZUNzx
 1v7TTP/sNc6qUZar6whwmNju/c3ZYWtXASORXHgS3qhNXEO5LbyzPJldDHId6UlBRn5nQ2UIUKw
 5nHSJAcO5YatepPrJU7HVtd+DYzkfLc7QmuZxfV4V4hivC8lqMPUc7rLQOGTvHiJ4Azum2+0oAA
 BSn5W20Ad38t9AI8rez+M8INjYqh9nSHiNs8NdZOgkW3S7tG8O+tKXTMtEY/Ju8gGTTWIhkJMFu
 hM5KFGu4nN2cZna8ekTFJ5Pd4W/+p830PakpKlcV01aQj5vRMX97NkJ1oah+jKKGoZVhXM46/07
 XE8rneK46zH+GQDN0blrEFn4Qo+xPrQw6zdhHn0Is9pwJ6LBi4N5QkL88Wsrm7u0kiaavIqBbhr
 ePZ1Gs2uR/mmXu1yWd8emSI1bSGe1W370AN+0U89IvtqprSBfYf8aStfdMwrSkpTMMAtiLYBdzJ
 6pNt+2LyrGEJYNhyS7Q7DleE8wzHuVA7upuqg4+vipmvPDWMtuhMk9vm+hgD9sEmDWU46j6/Y0V
 rFaMVptt7zGsdnA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function is not meant to modify the GPIO descriptors in any way so
we can safely constify both arguments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        | 2 +-
 include/linux/gpio/consumer.h | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5b0b4fc975435290a03410f1e33fea28dd6fea08..6b4f94c3887fcbe1d90a0ff5800100e9ae7ad5b9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -286,7 +286,7 @@ EXPORT_SYMBOL_GPL(gpiod_to_gpio_device);
  * Returns:
  * True if the descriptors refer to the same physical pin. False otherwise.
  */
-bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
+bool gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
 {
 	return desc == other;
 }
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index f0b1982da0cc78b85af8bd61474cc2fe0dd73c98..00df68c514051434e6fa67dc2307c6a8ce4ce3df 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -181,7 +181,8 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      enum gpiod_flags flags,
 					      const char *label);
 
-bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other);
+bool gpiod_is_equal(const struct gpio_desc *desc,
+		    const struct gpio_desc *other);
 
 #else /* CONFIG_GPIOLIB */
 
@@ -551,7 +552,7 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 }
 
 static inline bool
-gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
+gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
 {
 	WARN_ON(desc || other);
 	return false;

-- 
2.48.1


