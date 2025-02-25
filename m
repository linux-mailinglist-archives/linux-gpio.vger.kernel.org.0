Return-Path: <linux-gpio+bounces-16551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C5A43E6E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 12:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 875A819C0A1F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 11:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A1E268685;
	Tue, 25 Feb 2025 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I+n47+a2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56343267B0E
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484592; cv=none; b=s9iZngmWIOWNjV8cftTK0SYOa9Pt07EG52z9S6YbYkx9S2+5DAxmayZw1y9onUZVZqE+OfPgQnURtA+1DFc5sJkWcAbgR6sSWupi9P5OZEXvgk2W3U3JD8hznUM4VXA+rlb2i8q1PcVmDHgFcSkKHrPaCiIfuWYiy55t9WDcFaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484592; c=relaxed/simple;
	bh=QFjKRqG4GcDcIpdsMxSuX9xb92DK41K4Tw396/87/wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGfphlAx6oyDTRk8Cyk1MvMDNX1Pn1EpEWY9G+3SRlFfWFK4WG9wmMDXamBB/7lyXgvDNhIyzkdHtXfqDcy0k2Vo2POa2HdXivyCZsOGVJZylcWAFRf1PF5Avvf2XwN/cVBeVVrIacT4i7I24dj9Q+ok3T7BQdjuk7of77H4jac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I+n47+a2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f31f7732dso3336053f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740484588; x=1741089388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvpBsM7jkGs9loJFTKsRmaNNOCTajLtk5qsmtO2+mCk=;
        b=I+n47+a2SnpV1xbWP4k6/afM54f+Hg/Ogfr6DrRmj93bDwt4w0w3sSi7OkS0xLUET3
         GhADtvI/vjCUwAO/RON5bldQSna2M1HraUQaVsBvOZ2LSrYcoWtl4wKFrL8ZVQqrOpLH
         Ru2LfmPQrL47NwEcl9qtULLvcDGvVEtGQaRJY6rjvRdwzpEs8/8V5OiO2m0g21CiHavZ
         Yc17eQqJyGy8xC7DJjNW5/fDmi1eJRSGMGx+vUyU0znw3LU4TsQITmGbM43SdAogN8QK
         LtwOfJMDEKc4Iu0vkS1dugcWXSQ8eZGm3XmoHJvc6ZRCHroWHjvltU2yBFM9hcgfs5vE
         p5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740484588; x=1741089388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvpBsM7jkGs9loJFTKsRmaNNOCTajLtk5qsmtO2+mCk=;
        b=Cznha7k5D9Fo+H7QyL5AeRuvDXzck6ByjJzJjWv7vQbpKv+ROJID61fpCJhREeBLy6
         /XiEakLzH0Q+GpQJj/2hqw/4r0zmJ4HOBwIpSFY6Vvb611YX+zawtGMFg6Hfs5XIZhkM
         4dEt1/zMSaaRHFSamFmajP6+MEjzztO/aCUlbI3MhDrcyRbungxFV4LbTaAxjgnr/SiJ
         pG/92RmL05YTWajERkQa0iLnZiShS675NavgQXlfNn3rdbqwV9SObZhVo6j/M6W5OZFk
         KJh8sPRX+uC07PhsLP155y/k8r0Tke0bKDtROro7/BaYlT9FUFQu9yQLUbb5ir2GJSgj
         y5SQ==
X-Gm-Message-State: AOJu0YwjJcOtDOin93iunrYISHzFsjmBjoQd2BD/Gp7wqBdQYsCDZ4nx
	1peqvZECO/zHGftH14Ogr058j1+KmvOJfVrqzDYYxwJqVxKJGwVC1gq6PUjviQg=
X-Gm-Gg: ASbGncuT6HMgz+NdHdOmTDQFekObHjwnlQyGKN0oo+a3Md+h7K4xmgHEqSOulvZNLdw
	32L1s8a1ovyxVNFwGpvuQjNU9AoxCBkq7LWP8sHgngLH7tNv7ZqXCUYa0i3Y7Y5hkQZVVOJpYIR
	8XZUOvOztFHxxUcYR5FOC0wKWU7T6DphDrwj6AmyFTbG5lJnPzmtjC3wNlx0sHZMobNEkH9XNQ9
	9+VVj3KdGwzmQZGxC5xeL0tHIA5oNCiQgXnGyWAN1UyCGOwGRHYXzit99L9enlgY27eiACYp3q9
	vSz0GooJuMH8TBt2AT4=
X-Google-Smtp-Source: AGHT+IFbHW/dPK4ftZzO7Ek+FUgxyf17HZKH0QZnDUxYZyX57DqZlOG/jTA+jcKaz1zW6hZq1nbk7A==
X-Received: by 2002:a5d:6d82:0:b0:38a:4184:14ec with SMTP id ffacd0b85a97d-38f6f3c507amr13574796f8f.1.1740484588550;
        Tue, 25 Feb 2025 03:56:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:15ae:2cfe:447a:4a32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd883521sm2058054f8f.56.2025.02.25.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:56:27 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Feb 2025 12:56:23 +0100
Subject: [PATCH 1/3] gpiolib: don't use gpiochip_get_direction() when
 registering a chip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-retval-fixes-v1-1-078c4c98517a@linaro.org>
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
In-Reply-To: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+tTnhMWB//FVOHJTSSpSmVpKtdDSpnz0c6diDmew/A8=;
 b=owEBbAKT/ZANAwAKARGnLqAUcddyAcsmYgBnva/qaE2yAUg2nPQ80bDPUYDWPfZhWOnHAN7pY
 qlm6r0nnwOJAjIEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ72v6gAKCRARpy6gFHHX
 cibLD/iHExBqkQIeiKBOZG4VnNjIxs1YVEE5mdFb/S3iCX1FqQOQGf0RtYlmobHe+qDPsOffAi9
 vHyen5ZPfHRTH23hlXv3q3Ws7u9JYWqiHxe6GoyVingpQQBql7/QaFTp/KP2iKNtis40gYBD2de
 tqroqif9wuyf/oD+vzVWtoiq57V3GiyBumXrMyDE4PEEaTGjGfxxy/Gq54y9EjnnckJ65evQ9Dw
 LTuxE9zJyIU8+GTeBQad7NRUVjixItxOOpVFYKyMj6rbW6Itj2gD01oICXtoEWixRvRv/Cd1MMp
 B+wIGv/jM7g8WrhEBITkWGU3/03IYK3nQ8cgqgsIxDuSpyMnStL/WKOgaSXzvZubbTLxOSmTKyJ
 FrZS+hfKiOULzvU+KtC8lCS75o6LSjwmWd4S4nVGLHb313LaGVW907oO2sxqGb4D1wY88WAaIOp
 6kI+Za0ln38bz4hj1Mo6BS9Db0AQGhq7sF5MXaBQg293Xzfen+M4c9mYtHDGVYC938WtybdwIYx
 qYICftwel4MTJH1r1jyZlmkJ/8NX9FAqqPD81XcKu8GizZ++rBabxHz/5YPrRNUvjlZkpk8kI45
 IzlIE7FmL5xgBKq3kOprkFxelmyGxe9EftM1PBE5g102P/q0bBwUO9FesfvimS9X8YwiySHJgrf
 9QxxPojpa1yRc
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

During chip registration we should neither check the return value of
gc->get_direction() nor hold the SRCU lock when calling it. The former
is because pin controllers may have pins set to alternate functions and
return errors from their get_direction() callbacks. That's alright - we
should default to the safe INPUT state and not bail-out. The latter is
not needed because we haven't registered the chip yet so there's nothing
to protect against dynamic removal. In fact: we currently hit a lockdep
splat. Revert to calling the gc->get_direction() callback directly not
not checking its value.

Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/81f890fc-6688-42f0-9756-567efc8bb97a@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8678a6c82ea..31d400b10167 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1082,24 +1082,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 
 		desc->gdev = gdev;
 
-		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
-			ret = gpiochip_get_direction(gc, desc_index);
-			if (ret < 0)
-				/*
-				 * FIXME: Bail-out here once all GPIO drivers
-				 * are updated to not return errors in
-				 * situations that can be considered normal
-				 * operation.
-				 */
-				dev_warn(&gdev->dev,
-					 "%s: get_direction failed: %d\n",
-					 __func__, ret);
-
-			assign_bit(FLAG_IS_OUT, &desc->flags, !ret);
-		} else {
+		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index))
+			assign_bit(FLAG_IS_OUT, &desc->flags,
+				   !gc->get_direction(gc, desc_index));
+		else
 			assign_bit(FLAG_IS_OUT,
 				   &desc->flags, !gc->direction_input);
-		}
 	}
 
 	ret = of_gpiochip_add(gc);

-- 
2.45.2


