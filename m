Return-Path: <linux-gpio+bounces-15720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA68A30B38
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCE903A629D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0188C20C473;
	Tue, 11 Feb 2025 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MKO8qZe1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E731FCFF5
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275808; cv=none; b=UVigYXLdAJqrJ7jdz5RMkX7xFiet2Er4+W+3Q7ROuzGK2eoPBblOxdAEP6KH8/IEHpuvG1xWdoGII8T8mjpn8C4dUhkOcKpxACbWxr6tZYudsix8//1jq3e0O8JA23p/MadnCFIwXSucXSRaoQ0XET9RU0DRiAQ+AAbfjF8E1m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275808; c=relaxed/simple;
	bh=wXwa0E1M0BKOGtuEr1FqMmPc8bR9UmruxdeB5zto9+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnSP/+BiGMRS9nalSLcy33taXS/jn2IRR9H88cQNYO0q4eKzINaEGL1coPUx4rcxqld14PNaJHAYNpxa0uJqB/ngki615dO8DFptCyCoLn9ajnJrgbqvSMQXEjoBfCRcXDgl2IonLacHSx7dp90InsmYiXHxCcdNsXnH8kzFckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MKO8qZe1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso2679842f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275804; x=1739880604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r482wJny7pIn2us9/LYT8FUnmdRdfE6AyUJxQwiteLw=;
        b=MKO8qZe1Py3yorCBWx/vvw69kTfL+tdrKfOqNNF/VnXczf2NNEud9HtGYlhLk8vzDL
         ByuHxmv9pFRH9ef5pCY2N4Rq7EDzShCo+02nGaREYMQ62bLvxtBF59wxOL3beDzCDdEO
         mk5r/Yw+EDygA/ZmyR2cD1Ed6gaosACkKHLNzuNEmOKHGebvZkayfHoULyUNbuWi1r1G
         CjsMd7WnvmHRcajEveQy7bIe4KcLKEgEIybTf9bopqyZRwHfr57CEl5Pccu4bKvMEkrA
         epHlEDx6Lq1Uecr8Bi6hlj0Uh0y+AcT08ofKet1LrkQeKBKTJYavscDlV4HQakADGIeu
         5aaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275804; x=1739880604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r482wJny7pIn2us9/LYT8FUnmdRdfE6AyUJxQwiteLw=;
        b=ZEFjyseLBMb3DnPZt469llyUJSMG6/LRTKIVBQUYg+EwgIGKBJZnQXFvjRFMY1/D/v
         zbrBSVbPV+dtJ197BWfc/1c2QNLaRuwrWt7hoU1zSjQCp1cSajgjJqeh0hijTxLn2d7x
         fVp+YQ3tr9JoN6/KpD4yPih4BgraHx5dfnQZVb9nI4NQESqiaD7UxKIAIQwv/phQRpRR
         46EauhWU5oL9nzLfEe1vZRQcPL0lQqn/NTO7JH5scLRyQ/wwrZjMXK8BAoZt4mSlpw8/
         6fdFtNZKgA2NxJgoL92ebmaWjxQBTg5U3mi0ChSgDklD4OvCg+zeMogT2i67QTbYeMsF
         ULVA==
X-Gm-Message-State: AOJu0Yy/hrjU8ADBlhW++pTqpmP+z6zz/GMFrp9Rd3NAfgVLV20F4jvB
	Nc/FD9N5RCs97rU4fiJe95IMJxu2ku1X88U+qqydWht81VHEC+Zso0e0/K4AIXA=
X-Gm-Gg: ASbGnctYx8jmzfCFx0y4eT4USC/B+9/JONN4kzsXHkQBM+8Ukti8UK4Xa+e8D2/cjhd
	QyDYn/02EDJItft/dGEw1DsGNXzRq23ny0dKjXA5LPfUvimwjbAK8HWKnu+AmAg+AH9VDcIAkxi
	6CngPyTQfs3W+m3Kd1Iy2gl1G3bZB6O0Q67vFfoKaeh00ix/jwMzedNXrTtR9yiQy+ExoPXyI3s
	SgFNTI+LEyvMc0z84nXV7DEtnVK0bTbh8pVZOq/FLpms/b/yb7ar3Izyi9PeJTh/5kTDk8zCUtg
	whJojoI=
X-Google-Smtp-Source: AGHT+IGm1WkQZSm2qsw7HP5G90EX3T9fCEEa3NdUWmfxnPUwB/BOLSiGfP2dRRFgiiDIkTs1z6MEFQ==
X-Received: by 2002:a05:6000:1fa8:b0:38d:d59c:c9d6 with SMTP id ffacd0b85a97d-38de43c6f60mr2704980f8f.21.1739275804641;
        Tue, 11 Feb 2025 04:10:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:37 +0100
Subject: [PATCH 03/14] gpiolib: rework the wrapper around
 gpio_chip::set_multiple()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-3-52d3d613d7d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3178;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7EHwjLmMOp5i1lwV4E9OqV8YPFD4rMKN4X3bOQqQoMs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4WlB6wl7VuviO9RVP4ZQ6IKfVuQCqI4ys9F
 FlywPa/RK+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FgAKCRARpy6gFHHX
 cuW8D/sEVQ1GIHY94+MF7SYD7ldcMrKEKxbzIl/A8HiMMe1jD4KIkkZbC7w/0v0KkPXbyFGm6Ka
 ielhuHHRavv4ZDgXysHqoKqa73JgWrXT61tx7z03DSQOHYUnB3AcvReHdj3XR9ETlrNcMMs/MbS
 Uewo20cZnAozyHwSHfeBNoZKl8UGkDhuTc4lZywz7swislpBXTRq8prFT0zxVJFQh6TzaFyB0RG
 ValuOi/AfTVzTSfjDh0b9I14y7gORbTEgb3sJwMXlP5gP5J7nzG9xyagLaXzeATeV1Oyu4bciOY
 RAp94HfhlAd1MsBGTFU7ZWUoNyk9d6t7uL2WpkCl4LAyLArEM3jLb/zElsmGSj5W1DBJosGLlyO
 dztgOpEIneqO9f2i4Q4+9wcuiCYSxzvSgefxz95yJMaunV92k7eyVFOg9yv1FQiqiAMJovyaude
 abM9xPj9M4tlDF2vsKMtEz/n6mrGeHDee3gvvwWLIa3fpUrFlW8ozGcJJFqBQAo5EPd8EYvm9D/
 z/p3eohmgMQ/SlUY/tjiNFwJxZ6MMt56YANTxzZFGkEZCmnBosc5AoFnYdgOB07CLLhDz+R03xj
 yftVC8stTz6IOa4bU2wsk/6UOM2Ct8Kato4d6PjJLSPHiXgwyhTuaHTn9SpdPBOUPShof4GIcAX
 5exXsv+hV0xnqsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make the existing wrapper around gpio_chip::set_multiple() consistent
with the one for gpio_chip::set(): make it return int, add a lockdep
assertion, warn on missing set callback and move the code a bit for
better readability.

Add return value checks in all call places.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7826bfb72104..1f078a20ce3d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3468,19 +3468,32 @@ static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
  *        defines which outputs are to be changed
  * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
  *        defines the values the outputs specified by mask are to be set to
+ *
+ * Returns: 0 on success, negative error number on failure.
  */
-static void gpio_chip_set_multiple(struct gpio_chip *gc,
-				   unsigned long *mask, unsigned long *bits)
+static int gpiochip_set_multiple(struct gpio_chip *gc,
+				 unsigned long *mask, unsigned long *bits)
 {
+	unsigned int i;
+
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
+	if (WARN_ON(unlikely(!gc->set_multiple && !gc->set)))
+		return -EOPNOTSUPP;
+
 	if (gc->set_multiple) {
 		gc->set_multiple(gc, mask, bits);
-	} else {
-		unsigned int i;
-
-		/* set outputs if the corresponding mask bit is set */
-		for_each_set_bit(i, mask, gc->ngpio)
-			gpiochip_set(gc, i, test_bit(i, bits));
+		return 0;
 	}
+
+	/* set outputs if the corresponding mask bit is set */
+	for_each_set_bit(i, mask, gc->ngpio) {
+		ret = gpiochip_set(gc, i, test_bit(i, bits));
+		if (ret)
+			break;
+	}
+
+	return ret;
 }
 
 int gpiod_set_array_value_complex(bool raw, bool can_sleep,
@@ -3489,7 +3502,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap)
 {
-	int i = 0;
+	int i = 0, ret;
 
 	/*
 	 * Validate array_info against desc_array and its size.
@@ -3506,8 +3519,11 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			bitmap_xor(value_bitmap, value_bitmap,
 				   array_info->invert_mask, array_size);
 
-		gpio_chip_set_multiple(array_info->chip, array_info->set_mask,
-				       value_bitmap);
+		ret = gpiochip_set_multiple(array_info->chip,
+					    array_info->set_mask,
+					    value_bitmap);
+		if (ret)
+			return ret;
 
 		i = find_first_zero_bit(array_info->set_mask, array_size);
 		if (i == array_size)
@@ -3584,8 +3600,11 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		} while ((i < array_size) &&
 			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
 		/* push collected bits to outputs */
-		if (count != 0)
-			gpio_chip_set_multiple(guard.gc, mask, bits);
+		if (count != 0) {
+			ret = gpiochip_set_multiple(guard.gc, mask, bits);
+			if (ret)
+				return ret;
+		}
 
 		if (mask != fastpath_mask)
 			bitmap_free(mask);

-- 
2.45.2


