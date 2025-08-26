Return-Path: <linux-gpio+bounces-24979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5157B3598B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 702943BFFFF
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5123375D9;
	Tue, 26 Aug 2025 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N8vzcdQf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05418322524
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202091; cv=none; b=cqY6zCyBTevFlQbSV4qWcKCLj+Z5lnw4IuH9HxKOzMAGSK8tXsxiwabT5zoIjwT9JPddVL1aepahqzE4htl2V9ZWNgJtKF5Z0z7CnGsOu+Q6ehSnxjb+0GwqItNJ0/53cEU3nNG4gylDT9jwkMq5Wn71rg+l2hiXB04sFa/8nFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202091; c=relaxed/simple;
	bh=+DluEEQpDv5mv+wbchOBlw1mfwuVuCWh3IvBbqKoweo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2rMifcee/KZ5sIEjCFxx4i/dLIUm1BSUDar89q1EPvZ340Nyy8tsnVipL7sp4xYPDHBUFP1qhwuWFitAM2Rj06O+XJEGB3ajH3E/8u0m9F3qQcxREem+mNWwlVe/hrNBusOCNLqu6qIsDkxaoBNPljE4I0+m5tcIOz6jIqbmTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N8vzcdQf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so1372889f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202086; x=1756806886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUzxj3AwlFMn/Cb4ZnmJ6RjeXFL5y1o/ilqQYnR/MVw=;
        b=N8vzcdQf2IFpR6d8nemE8YHYMaMb5riEZY6SC56BXU2y8gXzgGdZQIBzAsG7gaTQ1Q
         IzUDUtu4tvPYNiuPLrpzBokYpvXX7BwwcZaqZsOmmbbTRAFKPvGisFjL2WLvl7X7tW3z
         ndHdQRaoikB4CPOQEFd98OLWFJrPcgLk2h4u+CIarZivQCyXiLPyEChy/Ha77U5K5V68
         O8bU8C2n11bz8U0ZGq27jWo79E72wZHcEijGl2nhJdbx17as0BiG6zD1GYEUgL6K9bv8
         vAUwkrkBvOLtdrYez0rTA1El88u6YKHWQ7hpmEvxYqPpceLwPjQCWGFKdMr5ZX7BvQIE
         t5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202086; x=1756806886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUzxj3AwlFMn/Cb4ZnmJ6RjeXFL5y1o/ilqQYnR/MVw=;
        b=U/vDLFlymGMo1D/Yvp8d2AFxgLu8sEYi8BOdQdi+4Mg6VUIkw3Razv5q/+20hpjxVJ
         gAVQtGKq7YwiJcf6zHQp7c1eQwWJly7GVorA+2S1Uk4QhTHkyRt2zHP7x63qo+4dN7Ul
         y/9lmipJzyubM52VZOy8XUWkomMWXCTT27qzD6ojjtNRnrIbXhR4dUr9HIv8xsjOVKLq
         3oKNG6cxyZEUWg2g7dLOu3XpNXyBNxxWlGxpQYuI58Fr08T60gecW/YoOSiZkW4xjvpc
         nFNcqyR8zP2S12uQeAORQ2BvBg2wBZVKlLyFu8kap3aL0wi7c8zT+9cnuXrKo+dCLciv
         TxLg==
X-Gm-Message-State: AOJu0Yxc3dTu9DEl0/CBOLtQWbEy9aPZ5d+Cm38jMU3lhEQY0xmXeyt6
	L4fcowImkC+pKTHnhEwcqlLop6hOX+zm1qV6Ktgvizgdlxx+R6C6GteObqsq2bPM28g=
X-Gm-Gg: ASbGncvVlpuX3OlvEd/uC2+WzvBnWTuXd6JdzBgi4u1FepwJSAT0G54btWR2exWFcgX
	GX2Rqap3ZAU/2vXF0ck2n+80j7boYMxQBV4NTjw3TC9AHsmKe01p2D1s0DYf9GcvV4LPkMchZ68
	2FMQoekRL4IMPKP6Q5ZqAsHUOc7nggbAlaRZ8n/wfQgYJTXVRF3NPBPPtguq6+3ZahOAXxSPb4k
	m2LnGLLUM7w2YL/PGOKywFo9CUomdrPfAZZT7YJXV91V2yI6R3GLtgWVQ4nQi1ZQF2/X5FaNNu0
	IBg0WQI1uqS/iQVUNusWduYBDoRalECuqhFFnV7dRzzvNRSEnwEbjDDbnbuUCzQUMBjdui43r/C
	RYMV0szCUqo/auy/Kew==
X-Google-Smtp-Source: AGHT+IEq7Pdf+yKsvkWm+MwW4ovsbwrrSZre17IZ6PflaifIEPCYnP/bAcdG3LE+PYHL5F83Vsr22Q==
X-Received: by 2002:a05:6000:26c8:b0:3c8:e436:a5c6 with SMTP id ffacd0b85a97d-3c8e436aaccmr5104411f8f.23.1756202086354;
        Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:37 +0200
Subject: [PATCH 3/6] gpio: wm831x: don't print out global GPIO numbers in
 debugfs callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-dbg-show-base-v1-3-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0doGTq4jVCHH5hAlopIUV2rywiE5EAOXG6MofWNOqdk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRgPCC7iTt/8LaCLZ4zIye40qfjGVFVH5elC
 XqjSnKoEeKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYAAKCRARpy6gFHHX
 chxeD/0Z4DZnn9ZzUFJ05Yd1652M+GEyzC29T6CIFKaE/dlhyax7hUNfKtRHYE7U+/Spudq+OPU
 vJpWBxUSWpqDHubZ2+FPbYRFosDePbdOqRMxdp6PogyXJ6HA0eWV9lh/DRkC+YMUdAVFZkgHWCt
 EHFhnQDH9SorKiEdPmOueFadYPqipZA6k/dJTyGQBqAhZbymA0vEDlHdPZlIwzciFLnGrFaDEaF
 E4Mb5Z642juTfhqJTlMTtqqH4YpCM7hA+I8TehIxj3asLn8h03M6Uv/wndoaanBjNzP+3IVvXTJ
 MAe7b1pfQmMSdvjjcJCOJI1YJlkMfpzj9MT5QsNb3N790NaJqK9ADIUAyEBK5y8AVbK9fc4cQt4
 CKOND2GqpYC7JfJzlizaV7LUtlSDc/HCRZiZq5LuZYiojlL2MzexXaLVgbKzJaQwmtzRvLAJzDE
 Tz7aeHvkzd1zExLGalCuHKHq5VBgf8ER6svb5hI74wr9dF1MYN87PkOERip+qF0spc5T6TDwvO8
 JiUwldshiqUlKmLFe/jhOAeFGDSqFn7UdHbFe4oNKtPwQA5Km8D353wRUjpBGbc26wCZYou+zH8
 c6rkZ/kNTgnFo9mYAVMVY1J2JlFZf0AF6uNaP4/Ho19bN9924Iah7g1D96Yxentnt61AeCveARD
 tThXGIwo2MT83dQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to further limit the number of references to the GPIO base
number stored in struct gpio_chip, replace the global GPIO numbers in
the output of debugfs callbacks by hardware offsets.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wm831x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index f03c0e808fab27349c39f9efc41e5ea420b2d03b..489479d6f32b3a8bcd7592e46ad61ec70794a2ab 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -159,7 +159,6 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int i, tristated;
 
 	for (i = 0; i < chip->ngpio; i++) {
-		int gpio = i + chip->base;
 		int reg;
 		const char *pull, *powerdomain;
 
@@ -175,13 +174,13 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		}
 
 		seq_printf(s, " gpio-%-3d (%-20.20s) ",
-			   gpio, label ?: "Unrequested");
+			   i, label ?: "Unrequested");
 
 		reg = wm831x_reg_read(wm831x, WM831X_GPIO1_CONTROL + i);
 		if (reg < 0) {
 			dev_err(wm831x->dev,
 				"GPIO control %d read failed: %d\n",
-				gpio, reg);
+				i, reg);
 			seq_putc(s, '\n');
 			continue;
 		}

-- 
2.48.1


