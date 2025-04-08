Return-Path: <linux-gpio+bounces-18428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF1A7F61F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED0123BAA17
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AA52627F9;
	Tue,  8 Apr 2025 07:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v2zFM1d+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E70C261589
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096878; cv=none; b=KKn5mhNM910e+vj1A84yH1IVqumRqVwvHKMDtUBNbGPDeV177j8pDrwJRvHC1pYEUx0aaKfXdDS29u1UttLPd1wvh05KppK1xsK84MDDp/Lo1BSt74CBub4yuW+RjIp+1ILcq58sc6Rp4IHV+eNbX6cD/fhzgImrZQRK8kZEtN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096878; c=relaxed/simple;
	bh=PUo56Q2yzjhFctr4qJbBVg4rRJDOKkYPse+T2INVimA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+zagGvN4R0oVYh1Gc4A++DM3T7tXNYkSCWKZ5Kck0APZwhK92h3wbI6JHlHx2ZF5EPGgdQ/BAQbCViD9DjQvhPXVHkU5bof+NmlSsdnxbTp0jOsfi2q82TfyF8KexfP8wV1WAfjyX/1YdqEhtKJ/XHhzWmKxMA3t/vI0bk6Tsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v2zFM1d+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c2688619bso3139112f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096874; x=1744701674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EKgQ1cgxpU6DSJVVu3CokqxSFGqHBUMN7AY5XSvKwI=;
        b=v2zFM1d+8ZszMR9EihxGe/FBGY+JPPpsc+/6nzozbkgMILd6UOc+i0vd0+p88oPn0r
         lrk+psdo9IF/lUl8TRA0u3sJERmPfbEybrPRgP80FCPNtGcEjGNZkEJMMxImY3LbNYUN
         8QKLMwQ+pkFXEXi1IqIr80qdu5fxpH35UNKYtbE5UgUgNJq1cUpacAEcvRTZ9yHbl4x2
         X6EzBRpkUO/dTZ1KxIX8zaIeMGsFlfEsv29CFmT0WYy+6S7y+Far1Bm0QDDwR5et2g+w
         nLbmQ131DuBcIMS5YDGMOEcE7CqzV38EvyzQMvGCuAUmnOG/HEfU1ZN+Ol8V6Wr5j0wd
         1Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096874; x=1744701674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EKgQ1cgxpU6DSJVVu3CokqxSFGqHBUMN7AY5XSvKwI=;
        b=le7EgDNRYaZ1NYZY7Z0jVo8XqfhUt6ZfgwOAj4g9h8omlhI3XBplZFLBM5ac1bibn/
         wYZAoEhzxAbVrEGX9P9nNgh0/Lelnp+4Y9ECBDUj6/iGzasSu0DRxvLOXHkDVIVo6Z2Y
         C4fdxt+TC0zLvHVfZJjm97sGfrhtGdITzjAbOdMCpvcPsRi3y1QTXVbp8M7Ne8avjXet
         h8CKpCCVENEKXQNp3GMMZ8H/H6Z7K9jIDuOzQaAetry4XqsC95Qj72PCMm/tAYNFIEcK
         vi1bcgfsCTbiE7rxNF8bGFH6+ND5mjwFqy+EFcJOmucKcOj+noZFc6+G37O1WaH1FTuM
         GjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEryPWSaEIS/PJnD7EuD3qWF14LkVPNRzTbcQKKxdTjT1HED8mQyukMN1h8jaLUEQ0QoLXw8tG+pO6@vger.kernel.org
X-Gm-Message-State: AOJu0YznSIJG89CZ/1ANMt0O6MvCZOuX6IYAWWkzH4RT+RWG3Xm4ibfI
	gsspOOF8dfH195Fvex5sMq4nXOdj/rZl2lmwUlkIzlJL7E1VWZjaCTjg/U2ATFU=
X-Gm-Gg: ASbGncs2nyqzD5jlLc0H9R6uCB6c/79WwA7dG64DbLxKbsJsFjoHLzg/XcajtrkOKzY
	Ho05TS423C9sCoWVCggrv/87YcugsrzB8ix7PcpDW2cG3s+ir/vKd64/TlKG86vKaWiFIkYRmIo
	m/UT+bmc2YwEgWYWbXd//M7KXlYuhpVxqd1d/1rOgUbJ4MZKpJckpkWYpTYSHuYHCQ2ZRnvyLRi
	TqSAlioD0WsmaReyiPDeYiuSOG044B6Vlv+xTgSTF8rcgjzk3Uhg7N9qoFtzDsXx/NLgcwSUaVk
	UXCuWi1axzWVUhEtH1oEE2ErZ3FjjDMCMYb8eA==
X-Google-Smtp-Source: AGHT+IGfBvpH0yFkliZLtXlbOsc/im0FjsnYwDk1DO3Fnkg/Amyk0+BzHkIllruNLf+k0vJRb3h3JA==
X-Received: by 2002:a05:6000:40c8:b0:39c:142d:c0a with SMTP id ffacd0b85a97d-39cb35bda23mr12921572f8f.19.1744096874610;
        Tue, 08 Apr 2025 00:21:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:10 +0200
Subject: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=T4A59REGiz5eXob5HMd6JwbPWhPT8lTp1DmdLIdpCvw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5mXcX7kY466l0OiK8NIg5nd6PegVrBTz5Aa
 R0NwF85CWSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 crwFEACOditebqDnaphThATlEMjgOgAWyDQeAEeb+QxdPhrDCGrM945fOgEEDGXhJGdoD7do5iE
 Hz6qaTwsLtEacAQodx1V+cgO+UD/vFMjHmaZZ3Bg52U+0J/qzYK58L9l4koz+PARYWiDbcNmQIx
 yu5/cZhXO+enA3bpZPQUcKmDtfOujhymNXkYMzBfZVv0sBfALvPPkv7c15AOlCtwVUvLwzubEiJ
 gNYvdIxXjMSzhvV5t+KOVFZpWbv0smNiEp2tNOHU0DAZZ7ogu03DBk9d9AscS9tCGF/1a6pWueM
 fzvvLxDfmPqXTrW1DG4fQ8Y36utZEXUfpiGAPqYsjICMIwmMYaxYBLIHTmuRulXpkrdErKJcwXN
 oM3jjdlHR6TpE4w5cbXxJY+tl1SiGNA0xaZZSQj4WCpTKXxH1qnqeNvImuYdQ7Im8665DuOIcfc
 /OYBh5JBhAZPqe+JlDjrQpQUTqXDT2MM6s/d7JJ1ys8EwTq5KY3EZaZAorGAGCsAmscyuz/uefG
 QTQJS3NFuVkw6wzzSFFHTUm8hz+PVpLWLnhoZOXLx8kP8ljszTFiKp7coboOT4J02tUzkWzQ0Ue
 CM+5pjZQ+VmDEp9OswqiqyPLiMTIGPgCBK7L3F+2CIwHDk/lKvNn6nZd/Ktm805r2AJOItWe44I
 73ElfPLII2F36nA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 4d8fa9ed1a67..d4ba6dbb86b2 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -92,7 +92,7 @@ static void mcu_power_off(void)
 	mutex_unlock(&mcu->lock);
 }
 
-static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mcu *mcu = gpiochip_get_data(gc);
 	u8 bit = 1 << (4 + gpio);
@@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
 	mutex_unlock(&mcu->lock);
+
+	return 0;
 }
 
 static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -123,7 +125,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
 	gc->can_sleep = 1;
 	gc->ngpio = MCU_NUM_GPIO;
 	gc->base = -1;
-	gc->set = mcu_gpio_set;
+	gc->set_rv = mcu_gpio_set;
 	gc->direction_output = mcu_gpio_dir_out;
 	gc->parent = dev;
 

-- 
2.45.2


