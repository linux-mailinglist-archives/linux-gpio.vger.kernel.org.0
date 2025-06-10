Return-Path: <linux-gpio+bounces-21196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6597AD36DD
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B790C1729C0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF62428C003;
	Tue, 10 Jun 2025 12:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eslsMBtU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B729CB52
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558974; cv=none; b=XbggICArpQQCUULs1FRI28ipstSqLAXjavw69u5kD6aAHziYxHfk9WK/mWBbr8yFbSXNMfQWXumwCPQvzQ/KrgTShW0KFaiSdMowcyPkpGj+ULnp/A9zs7CRW0XYTMJwD4xKLvBFJ3r8ubsEYHT3Gqijczhty/eJGWdis9bBUdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558974; c=relaxed/simple;
	bh=j8Ee5zNRTgD6Im7szjj0YX+ao0qiLzGNAn/JhbhBZbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aUo/6LssoLdvPcyvVmwlqXgk4zRM7XZhYHM/WCR5upSC3IkTsvNawJuwKY+PCCqHTkmQE1prmKdKKw1kTlZSAjVBEkfw2jAKSFvvfdtX5COpHTgWiciMSxYBwF6mfhNkEhlbzdSJl9dNWOsu62e6NYID/dSEUCq6N4tKxDzfJJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eslsMBtU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so44605585e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558971; x=1750163771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnEiJ0DPVJeTNWgLtlb3XDcjvamvu9NbT3oHT6+NmYs=;
        b=eslsMBtUON43EvDBMS4G8JtEWhJ4AvaqYfmKFX0JANUU0VU9Ckm8OYwNCbmjA48Gkm
         ZO5zezDn8W5F4NfJy7droAe8lVK/ZvThBm2mQZIdAdYbDo3Wye0NgRF9+a7Qod15G4FM
         GrSDH0pk0Pw8ElBdjufGA40HeHRaRrTbWcePHET5WHS90zanlZFWu4m8BtwVwzkpyO1a
         eC/c0qYm9yMHUX2wJUaBNjKTakHgwHOsaKKGJvdxlrR8weOFSvcxCwAKIkqwyRTHeUrX
         qQ6ZD9gmip6Qoq+QBYCbiUnReroJ9IM13syniEmG3hO0sLrBdRvHqB1Ve0RSwGSM2nWB
         vtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558971; x=1750163771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnEiJ0DPVJeTNWgLtlb3XDcjvamvu9NbT3oHT6+NmYs=;
        b=WH1JOor+AwRxbEkIhj09qpHn4SGHBhcWnzDT7bG+AUehwkxFzYDk7QXaUVq41OC+lr
         EtzLpHbl5ZCoTsDRQEn89nlZYxlhwoXnhuIWKAulKtodESYLauKPsfegaw1btkMZc2aK
         yfYqTjnYIqXklTygGPeaSi51M2XXfxF77V8UkXytlNLLoCkVKWf5kYa5JSqi0XXt4eRn
         Ct4/v3sc+HmfJRZG9tE1bhZzVi8DXiDaNCFQ7DVifl98xfvfb5qUkWZ66ItBIOM+4QCL
         PDaFBhdxEPOgxktEh54/s6jhF6Q70V9kJ5tIOtyIeCWfRvpIbVfBKOV4aTBBuD0B2YWB
         HXhA==
X-Forwarded-Encrypted: i=1; AJvYcCWM8PJq4Ezc02Zm0IE6fv1rYyFws2K9MYiSBza83Ml/Jt3uQsJ8vO+LGrp73MnfrOe1Tp3VKPEZc0vQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9mOsMNHD2az3h6Zu0GW6nYQrMsfhGw1I/BmAuKjPNgauLCS4d
	wHZz3e95xccSXUdRi+6A70OBw5+wnYUKU0d+vi89wuFedJWrIsRaPtjmmSluM0lra28=
X-Gm-Gg: ASbGncvUKTmJwXNx3k2eETUnSyRxmkpRjYLdnu99dXledcTJtheBOO7LsBGMlRsE2ah
	8MtPyiGqPU2yvWlqK6Mh9q1+BGsU+quHInplcbRSqfdNupaXxhfWvpJyxqYw4FJhcDli8SnxdkO
	klHOxoVnpeNinAOeazBek5TYjNbsj3C9x8TwhWe0AvRZ8/8EmZjrZZVelzYibwNhcjKaea/4Vbc
	rljpxjRorEThWN0ncwtnw7SAt31uH4uKpYoDfXxprAfeXPujqImc1d8BkBoRtV77AIp/K5sg/O4
	Y6XQ4uKZnmg0oxr1ulT+8LBAe90+mLWAqHBHL+pSCIqBMpQL4wrgQRSpLFh3CXVy
X-Google-Smtp-Source: AGHT+IFu88AAwRyhu7BA5cAy1Z6ElMtpfHSvLceWBxJHD0IwTf3JNoo2snJDzPdaHI3Cx5bomnT2ww==
X-Received: by 2002:a05:600c:4507:b0:43d:fa5d:9315 with SMTP id 5b1f17b1804b1-452014b56dbmr144330555e9.33.1749558970866;
        Tue, 10 Jun 2025 05:36:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:36:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:41 +0200
Subject: [PATCH 7/7] media: i2c: max9286: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-7-c088006a152c@linaro.org>
References: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HgIaQmZBN+2BMb6XtS/4r6T+Stu0X4lPC1c0+Nqlo58=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCaeYVgRtgxneM0Tdp6ek4umZK57hxpFsRPe8
 3Qo0tsVOWaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmngAKCRARpy6gFHHX
 cnzLEADanEO4D61rw13E6xqC1/8/v7BtcDVy/bqNG+Y+NLc4oBXjEUrImGZ0A73JmJOyoIo3h/R
 Q+IjWG1T5qOiyBDuZkPJCgX1PUaHRzLcUpLGo77ov52Jl7YG9h4E/T7XoXnU4SgZG8f/ALerKQ2
 P1TTL+GRXwu1p8eEOtxymo/YMD2qqzAeZVSxqpTNv51OcA5s/n0ZD4C7QsJ38S8HDlM8yNZXgE0
 XOgEjxQ1t4APIOlELklaiqvYho7OSFfedhxX/WLcyEoHr9cDEoLpd6WCPXoR27DF0yLmo8mwKnQ
 74wOYfIK4Ax2Rs5aokxDEj6MtHi4ILx9eWK+5yn28KEVBiHjaMelg/321FNLgehZ4q6vxRQpgwW
 MkEkkyfi0FwBYIdDMK++zIWs2zIt94YpHOhZUOKe5Wme+hsal8D2LPwGz2cfXq2/ynTGt5Ki9iO
 9tCWyftwIAUI79SQBBRSL9kATcSvTvkGC1CEbQaLRGKVUzmwcbXczRQXyv9+t3piw0wXmlWf2jf
 T/YVP5aNEsJ2MNqmH5F3F4pFqzCUtjxutaTJItTO782IpArBml6cp+2Q+8jyYivE76stySY+3DC
 o+SsiuvbA2lhrfhAEAypXQhvaYTgI6zqAqFy844bpbHy3byR78ctzTX9oinTBwj0cAH5AzAKnwB
 YP3dkXIIymqr4HA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/max9286.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9fc4e130a273f8547d7e7ec194cade5b5e9c8df2..1d0b5f56f989874e46f87db4a49d935049e6e7ce 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1193,12 +1193,12 @@ static int max9286_gpio_set(struct max9286_priv *priv, unsigned int offset,
 			     MAX9286_0X0F_RESERVED | priv->gpio_state);
 }
 
-static void max9286_gpiochip_set(struct gpio_chip *chip,
-				 unsigned int offset, int value)
+static int max9286_gpiochip_set(struct gpio_chip *chip,
+				unsigned int offset, int value)
 {
 	struct max9286_priv *priv = gpiochip_get_data(chip);
 
-	max9286_gpio_set(priv, offset, value);
+	return max9286_gpio_set(priv, offset, value);
 }
 
 static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
@@ -1220,7 +1220,7 @@ static int max9286_register_gpio(struct max9286_priv *priv)
 	gpio->owner = THIS_MODULE;
 	gpio->ngpio = 2;
 	gpio->base = -1;
-	gpio->set = max9286_gpiochip_set;
+	gpio->set_rv = max9286_gpiochip_set;
 	gpio->get = max9286_gpiochip_get;
 	gpio->can_sleep = true;
 

-- 
2.48.1


