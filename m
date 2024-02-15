Return-Path: <linux-gpio+bounces-3330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62129855C87
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 09:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04DCF1F2DB95
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 08:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F7013FE5;
	Thu, 15 Feb 2024 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rgiRJp+Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907413AEC
	for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707986020; cv=none; b=pmgbmuHSQhVqOk5zVsS4iVaSvBtjZQNLPFdH55KXaAgMbzbNsI9m4MY+MJAlYGuDpRG8J3bAH0jQBzJPRweGolD/4mv+AxNpZaWW8BvceDMgdCRgTHuSAaTtuI7z+QqiCVhH7lRXA8EIRXCMGXOFogp1e8eWRStMbwyDSOf3ubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707986020; c=relaxed/simple;
	bh=xT5dfURtGIxff62raqt0jG+pcsjp7uhfEREhWd31PRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZiT/dv0zmwnIMXAqLEDsDkgu6De27JqxtaH/yAkK6djwTUyabg+CsxVobvDUF4yB+0F4wzj1N8nU7AB1MWARMA22VZNt3XGOA9NIfG5cA4fKbd4fzbukn6qOgif5+pCb606Bb0nZ1Rq2Cl3FhvfUCQ6RBXSUwfAuQa/9lOUwRgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rgiRJp+Q; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d11d17dddeso6697471fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 00:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707986017; x=1708590817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez9xOpn3UTLsU+b3iGm2vmX6gqE6PZNq2Dof+USHQP0=;
        b=rgiRJp+Qem11c2HuaMFORjMJWUhH42bl3u6IkuCAVxIVmcHdhSrqrYI4ii3zb3yGjk
         4Zgq6t+jLUt8A8cDulRb84EYI/N8iUT8gRr12o/3I3bF2T7mCiUXG4PvZQcOcK3khmRJ
         kZOC5kzYPOtiAdM3sNd0lf9iIaVCiTca/MCY97XxUFXy/L9gX6NNN9ByOBktVaLhQiWI
         iNRKfWCIQlHTKiFr2F90RC0ledaQfI5f50LU+BALeuPGkJa5ktf0EXlu6bCUdb6Tija9
         wSvU5n2IH/yr9v1Uopaj281PKZODFMssAVI6lEr69ZXwx/4KYa+uinI6E5LuYKglssKS
         BDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707986017; x=1708590817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ez9xOpn3UTLsU+b3iGm2vmX6gqE6PZNq2Dof+USHQP0=;
        b=od36tp0u0IJJz4ZJybz5lLr4r1A6uBxhH8Nf7M+8l3CTyU+I83PWyQG93HYzgzGPGf
         11Jp/97uiYHnXiF9yGHsAFOubjcuvhedwHf8ZxsNrTkKzTklf0uxQFnUyEoKhAj2xWcH
         zOvcUh/xUT1HZ2X+tmEEgpmz4JE33qiJB4bOup8D5xWOqNoTn9echml+CC2T5+98Juja
         +ZKo3o5hSqiLq1QkUsYNnJNedT2vpvhMD4ShYq7YaFosdh0yvurxcNr01VpwxGNhkcMR
         +rCcoKZAn841BJU/K6DEgeJN/SBeDuhkdUMMjkQGsbbfZ3+WnEwOJQl5ou/b+HwXogWD
         jyuA==
X-Gm-Message-State: AOJu0YwW8p0A/XHOdQPfLAvP3gVvVJOvEQbrfrVH56+xPY973JTnMHxR
	jSPk8tnqJHOYv4VROftMC10MPaK7+9PgC8byQoDlwPhHa2SoAFnsJtmlUoJLPsM=
X-Google-Smtp-Source: AGHT+IFQV7OKQsTQ/UxE3IWZlRvegLax6f9smfnoepWKpuD0SsrBm4RCPyfQCitdXEojv+hB5o6haQ==
X-Received: by 2002:a2e:9c58:0:b0:2d0:a8fe:4263 with SMTP id t24-20020a2e9c58000000b002d0a8fe4263mr760447ljj.25.1707986016884;
        Thu, 15 Feb 2024 00:33:36 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:20b3:d902:bf8e:897])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c211600b0040fddaf9ff4sm4286906wml.40.2024.02.15.00.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 00:33:36 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: provide for_each_gpio()
Date: Thu, 15 Feb 2024 09:33:27 +0100
Message-Id: <20240215083328.11464-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We only provide iterators for requested GPIOs to provider drivers. In
order to allow them to display debug information about all GPIOs, let's
provide a variant for iterating over all GPIOs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 9d0023f83a57..5f915b653548 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -551,6 +551,21 @@ DEFINE_CLASS(_gpiochip_for_each_data,
 	     }),
 	     const char **label, int *i)
 
+/**
+ * for_each_gpio - Iterates over all GPIOs for given chip.
+ * @_chip: Chip to iterate over.
+ * @_i: Loop counter.
+ * @_label: Place to store the address of the label if the GPIO is requested.
+ *          Set to NULL for unused GPIOs.
+ */
+#define for_each_gpio(_chip, _i, _label) \
+	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i); \
+	     *_data.i < _chip->ngpio; \
+	     (*_data.i)++, kfree(*(_data.label)), *_data.label = NULL) \
+		if (IS_ERR(*_data.label = \
+			gpiochip_dup_line_label(_chip, *_data.i))) {} \
+		else
+
 /**
  * for_each_requested_gpio_in_range - iterates over requested GPIOs in a given range
  * @_chip:	the chip to query
-- 
2.40.1


