Return-Path: <linux-gpio+bounces-23405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5037B08DEA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 15:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D7F4A64823
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 13:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAE72E091E;
	Thu, 17 Jul 2025 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ND/BH4EL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9E92E0909
	for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 13:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752758037; cv=none; b=O2fw2zPSF0gGcPzsBxSUrnv5ZoCU+mFUYBo4fSiEvxGav2CzIO4USVW4Oj5m9g4I3o8c6xViOEZ8TLrjmpvi6kJHO9URpgQ94krSgaqWzH8ZhL5JXwgT+1VNpFOumuu2pEb8RTn/iudN4gs/M80d4jhuqJwwNBz5aRjMA396lds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752758037; c=relaxed/simple;
	bh=a8abfs7W+odJAvc05UtZxThb7KM7VZKwhQlopTwPBxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FSkeIC9qXBLImM5ZmQsIo2d3nE292nS/+XVHPkphQD6z3AZoalfHFuha5An7PTST92eyQDI7BSrdQ31oXU5Dla8ZFA7itRBojbJwYMFhyhcG1MW9K4kpK5V1dr18DBNtd8gXGs/x9JP2eeQE2B8aOjkXQNRRUBlT07oYCE1o7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ND/BH4EL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d7b50815so6630075e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jul 2025 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752758035; x=1753362835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BlSOIjzqGPblnVa/16/fM22TF8N0olF4TmJ+G8fMEQ=;
        b=ND/BH4ELTp6I2JGqRX7M2LoMP2UzpqdsgEovKZlP+ySJnnVO7csIur2rhNG+8sWifL
         q/ES3vCOKcd9QCE+drNsJGzwT1FUS4a6gH4zM/wmnKzVqrZMKtGnogE5Fl3kXJUUnBc+
         Lcwy5hel7MR5BPlyvudzk3QZANSy77Iyj5dbwGOteNsSSnRJuvSHs66f3moLAzoTrX2C
         RE56px00A/PW80S5WDldUvOa3X0jXrDJn6pVRR8la/o4mPtL0bjPLi9BWuMFtXrw3twI
         PMyjrJDo0mFYepy/b57B0Z25VZzwKETqk2ocL9txdEmRftKQZQkKEv7kKY/X62wND8Y5
         6qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752758035; x=1753362835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BlSOIjzqGPblnVa/16/fM22TF8N0olF4TmJ+G8fMEQ=;
        b=iaUuMizjd27cEzKgLXTT+ypJ51A1yNUpS6nJAeXr9B1OW5AT1uxXzy4qgi55AcwZaL
         VFoUUz+qpFQCLyv6DOCNReU+yGxCHpQ9j2KUy4dUo6EN9QseV1+ds/X+E/vPgV7CpzS6
         iaCVTGAx0p4t1jF1zs01FH0wUJr3GaA+TKsWeYxT3i0Hcxo8dRtfozdIyyokJnCo5Ir/
         r0xDy9SECU/EoG+VY9lDrDMqD6rBIaO3e39NtW8utd/fRSDxubMomvgPa2e70S1LfCZl
         d1hTMNheeEGo0bqmWcu7Kg85OZjX7uAPHTdEtOpT72MA80kb9r7gVztbYlpkc3G51M0p
         i5Bg==
X-Gm-Message-State: AOJu0Yy71xlFDAQps31ngGhxuNZ/IYDRlbfQzcU7iNqe6zEWtE3dbxGy
	zpWjyaEwSe5Dpvk+ZOk/vOaouQdZh74FCIy6Oa84b/A6183hcJMapOraHXvKWNyPpXs=
X-Gm-Gg: ASbGncsv7NONxLYwbjMzUIClJ1e0AAwQ6+SFlSxe5c7afP+hBprPJz8hYNIZAXVZB3L
	R+QclBTDJeDtiS2q60VrianvY3G1Vgr4K89yWNgX27R7zZXfREebl4IXgYpc0VyPEoIcLW8Wa0v
	yLrKVSV/XUjA3ie4MSyDxXX5I29pYSR+UhDnAQ/MGZPiy1oJM2VVa0Mf+LC+i+/i2CcHd3HcHic
	JVCrWWvxLkuQ80HLY0R//mxaq6Axvq5bwGI+FR5WU6t9hMARFOAXf/3hBH1pi5yPC2cuIrKNrx/
	jSc5cXCVCyck5c32OmL8A4RDtue8+2AOjh5cZ9RDAqX2txBVjkY9LfAaAMsyvp8ujTqS7MfZNta
	Iik7fVw8oJpPFFCxd0tOJ8A==
X-Google-Smtp-Source: AGHT+IGgB/fpEAWYu2VM4+/5m13YBJZhxv9mX05x7EQ3+MNtNHwvKU+xVuc8dbVnVJALD9SGIg6aHQ==
X-Received: by 2002:a05:6000:43c6:10b0:3a8:2f65:3745 with SMTP id ffacd0b85a97d-3b60e523b07mr4058374f8f.51.1752758034621;
        Thu, 17 Jul 2025 06:13:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9e61:4694:c621:5693])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc201asm20565852f8f.22.2025.07.17.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:13:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH] pinctrl: rp1: use new GPIO line value setter callbacks
Date: Thu, 17 Jul 2025 15:13:49 +0200
Message-ID: <20250717131349.54074-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Resending with linux-gpio correctly in Cc.

Another driver we missed, that should be the last one under
drivers/pinctrl/.

 drivers/pinctrl/pinctrl-rp1.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index d300f28c52cd..6080b57a5d87 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -779,12 +779,14 @@ static int rp1_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return ret;
 }
 
-static void rp1_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int rp1_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
 
 	if (pin)
 		rp1_set_value(pin, value);
+
+	return 0;
 }
 
 static int rp1_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -849,7 +851,7 @@ static const struct gpio_chip rp1_gpio_chip = {
 	.direction_output = rp1_gpio_direction_output,
 	.get_direction = rp1_gpio_get_direction,
 	.get = rp1_gpio_get,
-	.set = rp1_gpio_set,
+	.set_rv = rp1_gpio_set,
 	.base = -1,
 	.set_config = rp1_gpio_set_config,
 	.ngpio = RP1_NUM_GPIOS,
-- 
2.48.1


