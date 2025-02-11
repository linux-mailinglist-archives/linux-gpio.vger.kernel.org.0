Return-Path: <linux-gpio+bounces-15726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C19A30B4E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D97437A39D6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D3B244E8F;
	Tue, 11 Feb 2025 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1//6zzPb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80033220686
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275815; cv=none; b=on3LFvYQO/AmGZNccTYIgzib1rcF0E+YYiogaE1qB19UzIDLYUYxR/CxQa9O1NuU7xwASn3PE2n78hBkF3RRe66uyTqA14CeEgpfeeQ4EQKp258mP+bBFKk0HiVk1GSskw5humA3pdISdhqwGhbDSordDLV1mniK1uBSK+kT/fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275815; c=relaxed/simple;
	bh=/VBhiRwoQ267W/j7YB1GP/Wml1ttqJQc2PSxQAtybVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/GSNc04qLIOXHAVQRH+hwjxqksp3+f3tI8+kGVHc1gOF2++Ro95Dcd+YXivNyS8RClI7PGBpQ0J0ZAT4Tt5my5ds6F+UKe/NtXIU2Dbj1nwAS/Rx15L4+J7xoEi1fkbfBwpaY65okUjWJ0R8FlIWzSW8A+4w6upYh4i5jtM+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1//6zzPb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dcae0d6dcso2354941f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275810; x=1739880610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/soJKMgO95fYhALZzWlo+U5ebpod9YKpGe1zG5XUO78=;
        b=1//6zzPb4AscLxakfR/3RdNuLdIm0u83QTjBM21AljKVkcRSRzLRi99lTgIpvjTAvJ
         tbdIzJg/Cjmww5WE4oHNHW6lFCAuf01cu47PKkNhyUyLzjfE2cIUdZmoltaLsVjy6jAl
         xrnw2ujZkLjH2it8h7PRGkLWJ7aDKfZX9Hv5jWsK41ZEdgiNuAIWhNM4fVyPPmbPAONe
         m1w20LF/Qer7pykkoiWQJGso/YMxkUk+eo/mQ2GyU58wmaC6n0SpKzpuPsd0qF9VukZs
         OFpLAI0QxChJiF21D0sJ4+a7QT60He04NFOsv+JQDXUu1jZfKhsQxWmmMwQEJ45aiLsT
         Zy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275810; x=1739880610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/soJKMgO95fYhALZzWlo+U5ebpod9YKpGe1zG5XUO78=;
        b=vv/rq8nBAQ2EErTowbMnXsE3ZgYiX/RuhsXxgBz2KM1xnTZMGiZj4AALLNIP/ruyHC
         6wUsA4jMFCRaHWnmHIv/F5p+SfY3zVYOsaIo97t4hNBCLbXPm1/SGRG1d7RrWy8pgVUv
         Y/0A7KbbWsPrI1Es9JPO91K7tWKKiVM4B81SSte/2Z94owOi10W3wI+6ofIUqz7HAHPB
         yE4e5N6w12753eGKkt2TFcragGdubLHFXQsqX5RliNuXUNiBWVIGOrYXrGDSxFe65jQ9
         TSKqgtyt0uJ1aLUv4z/GcxqeUjuGGWDMtIwPU1iElrgHaH/365bcXoQYVV2ghVomTFx9
         /1CQ==
X-Gm-Message-State: AOJu0Yw2PykNu/QbtCzXr6fq+Nqp8uwh93IjkJI1DqpKKoeaq/2MCegH
	EFl4RMwxmQCRNNKe4Os3cVzOGrLZMtZykFDc4wZInF/VcBip059zVfP3wCe8eDc=
X-Gm-Gg: ASbGncsRyok682WUifA2W3erlihmeM0XLwZnvIF7+vbxSkTMSjk3IeZs+/FouF9ExpP
	5qFcF8rj1kg9xYG/DxqAqM6hiMnqeyedQol8oRBzLeJHaMNwzmdOidIF6ai5h/oNhtP54iLtGxJ
	Us7JcSMwszoEliwt2luvftRrBmOocO8QdvarNGr8r625EsUM0tqlb1xxDkwOADv19iIzAp1uvue
	U2TqDDvagtQtBnYpazuQNfz6yzcpmDLyCGC7YneEBya8K4wbyRcIlqfonryX59v6a5IZ0R3YOcP
	ypIYTWo=
X-Google-Smtp-Source: AGHT+IFNsSm9YLBYurhiZJ3r0wLuiNdbSfXzE/fPunZETourbnKpAwAXP227RFCPz3tZT6gTfsHrNw==
X-Received: by 2002:a05:6000:1789:b0:38d:df83:7142 with SMTP id ffacd0b85a97d-38ddf8372d1mr6616269f8f.22.1739275810313;
        Tue, 11 Feb 2025 04:10:10 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:09 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:43 +0100
Subject: [PATCH 09/14] gpio: aggregator: use value returning setters
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-9-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3524;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PJ3ATY3KxGGrfdXGr1+oD3P0hee0kL1IuXdUmcak4rU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4XlB8wKC7uaLgAa/RWRm6wTXgc+2I1DL4zD
 EsN/vIAR1yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FwAKCRARpy6gFHHX
 cicwD/9y9J1vb2Nw9ftM8P+jwCiPBjUpJw6NCtM4wbyvaVkIDh/nrjADO7bsrHXTetMswPxt8IR
 GdufqPE5hvj+pFhXOLdUyN/r2lFrHOUmxLmWtnuzhiCVzi2Cs/Km9zrVOih3/Nq6qizuy1olK6r
 vnczqHACtUv50puQ928byt5Tieb6WrT9lmInioYkk2Z16Bgy1m67HsOXn0aC3Z5Q+si2e6WtvJo
 cdH/qFKovfD2Dj/AN/sM9m8wxlRbAc87cerm6CXGXYlUA5716IK4AMahblbeFsYx4OdqU2K6+4A
 m1oYKS+OUMWEfOivjwRw6QUTx+HG81IrmnSJC5VirmIjjxvUzP/8xJadZFs08o/h7Y5HqJs7+uW
 TUk7ix3Tq0tiarQxy0gMrDzQu/4yzaDh/1kQ6gNh6shDIV8R4N3cMAtwF/eydmNn6Wn7BNPsorq
 FCutWQlx5oh7FIpM43YgAv3kIsebEsMkKk2zc34/rcbG+zvKea4++b+OHtIjO0v+A7hp68SbCKh
 3zhBdeUOyQkq5X3s5x0dPp/v1txS+5qLJfGEiJKx/AuvlxEyb+FkYd+ekilCeEfKLNzf34ANinF
 1bAMwgkdS5s3fGZDVSyAHFVZ0WU5VoF4Ypg8hQklfD+VBsshJ7OlCgNgxeIb94PqmfABtWpImYC
 cTv5GnDNi+bzsQQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has additional variants of the set(_multiple)
driver callbacks that return an integer to indicate success or failure.
Convert the driver to using them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 65f41cc3eafc..e799599a06a1 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -358,25 +358,30 @@ static void gpio_fwd_delay(struct gpio_chip *chip, unsigned int offset, int valu
 		udelay(delay_us);
 }
 
-static void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+	int ret;
 
 	if (chip->can_sleep)
-		gpiod_set_value_cansleep(fwd->descs[offset], value);
+		ret = gpiod_set_value_cansleep(fwd->descs[offset], value);
 	else
-		gpiod_set_value(fwd->descs[offset], value);
+		ret = gpiod_set_value(fwd->descs[offset], value);
+	if (ret)
+		return ret;
 
 	if (fwd->delay_timings)
 		gpio_fwd_delay(chip, offset, value);
+
+	return ret;
 }
 
-static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
-				  unsigned long *bits)
+static int gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
+				 unsigned long *bits)
 {
 	struct gpio_desc **descs = fwd_tmp_descs(fwd);
 	unsigned long *values = fwd_tmp_values(fwd);
-	unsigned int i, j = 0;
+	unsigned int i, j = 0, ret;
 
 	for_each_set_bit(i, mask, fwd->chip.ngpio) {
 		__assign_bit(j, values, test_bit(i, bits));
@@ -384,26 +389,31 @@ static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 	}
 
 	if (fwd->chip.can_sleep)
-		gpiod_set_array_value_cansleep(j, descs, NULL, values);
+		ret = gpiod_set_array_value_cansleep(j, descs, NULL, values);
 	else
-		gpiod_set_array_value(j, descs, NULL, values);
+		ret = gpiod_set_array_value(j, descs, NULL, values);
+
+	return ret;
 }
 
-static void gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
-					 unsigned long *mask, unsigned long *bits)
+static int gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
+					unsigned long *mask, unsigned long *bits)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
 	unsigned long flags;
+	int ret;
 
 	if (chip->can_sleep) {
 		mutex_lock(&fwd->mlock);
-		gpio_fwd_set_multiple(fwd, mask, bits);
+		ret = gpio_fwd_set_multiple(fwd, mask, bits);
 		mutex_unlock(&fwd->mlock);
 	} else {
 		spin_lock_irqsave(&fwd->slock, flags);
-		gpio_fwd_set_multiple(fwd, mask, bits);
+		ret = gpio_fwd_set_multiple(fwd, mask, bits);
 		spin_unlock_irqrestore(&fwd->slock, flags);
 	}
+
+	return ret;
 }
 
 static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -533,8 +543,8 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	chip->direction_output = gpio_fwd_direction_output;
 	chip->get = gpio_fwd_get;
 	chip->get_multiple = gpio_fwd_get_multiple_locked;
-	chip->set = gpio_fwd_set;
-	chip->set_multiple = gpio_fwd_set_multiple_locked;
+	chip->set_rv = gpio_fwd_set;
+	chip->set_multiple_rv = gpio_fwd_set_multiple_locked;
 	chip->to_irq = gpio_fwd_to_irq;
 	chip->base = -1;
 	chip->ngpio = ngpios;

-- 
2.45.2


