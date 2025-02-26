Return-Path: <linux-gpio+bounces-16613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB88A45B91
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 11:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FEFF175E7D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 10:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0E71A0BCD;
	Wed, 26 Feb 2025 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LV+kBunC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B4120E302
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740565172; cv=none; b=sBSQ0xrOTFZ/Gzjagz7zepTXk0L9MBUDDLydoh+X0a9Guf7iQ/FpsiC7x8bSCdJZPYRfTqxzTr/5NZQUYHqfAGxTBrNGXuFNEKXEXlrL95U9EWG9KKd37sh6vtixyMtfCQbRdDlTnDqBRcTZjJ4CPZrsqrFv9z9jh7/J0qAY4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740565172; c=relaxed/simple;
	bh=lsqUHQiNLeacHnEbKXQeLViXVU0UgO/D/+5OdoncwL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FkZGkWxOW0+1o0VqdSzrSa5x7uTpFQoa8wEZA1fHqjZDkhSFoT2d5flWQFx2x1hovF/9mFN5GYybXBJhYqeseuhQEAyb1AmNEQaIX46gEeGW5lBUbIQxWGocsbt/wA+aIBtloU56sDpM3cq7BaiEcuKihfRvqc/xIOYutcSnfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LV+kBunC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso66514535e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740565169; x=1741169969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvejRLHxI7cWJHZ6jttnlknQfuM1gunX4QyfWK6KcOM=;
        b=LV+kBunCODO6lNpe09E6YU70eUNp8Tz73QMd+pt+hmBjEkv0FDY4BvWPdAHJeTYc1W
         MXqHgtWsyiXcw98aAlKPEDufMvqYEhTq/jymcrYd3LPLrhRAKyvw8VII8vS6v61gLheV
         auVt1V9scAqQAIB9COd2ZG72QRMo/hRBjiFqSRpKDRuXVXrHNdOlE6z+RU02f3ETnZe+
         QlBwm6B00fkMSpZZgvre249Vs/eK3hc3xC18xidHfAVq95P7fbLp+k1JXo4FBuEIzdXQ
         SU2yruFaEXzF2gDZmZpxAlllhKBjwOJy5Uo6M49pPMvoXJyJomldEztFujZa4WD7NUpD
         glTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565169; x=1741169969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvejRLHxI7cWJHZ6jttnlknQfuM1gunX4QyfWK6KcOM=;
        b=OxrX7RqEfLS6FQTqfdp1JNbB9gRlgbx6yCNqTP2mlXI0XCbDACoAASoYd9GUCIBXoW
         5je/1qpfuTOlD5JVzINBFDVki+iClJgUQCSDQk3JEheoLn1cWQWGdX6NgCae6P520dD0
         C2Gp0COx+iRvCRELL9t5bI4hUbywPenVAmuTco+Sv+ucGjlUeh/Viu2p6VgZ4eX7QxFO
         ObEnGWPYJjpghjyk0UxhATaUoQnorzKjjRR1Oz5fQfqCCSFsptCWMnGiw7s3GFoZC8Aq
         U6trIJBIcAsX2NRhkE9JJt/WM7+kr+jKvX2Kzh/LMGeHhBpYM4q6i9sWzvA7Lf0R7vBb
         /E0g==
X-Forwarded-Encrypted: i=1; AJvYcCXmq056oUjHWsE4U//Wdp2Hi2VHcARf3KTHj8ACzkxamiIfow+xSXk9Nf9aHJiB4Tcc/20FXehgWDlf@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1yyWt7YsbmH1ArwHpxbv6COg9NAkKCxurAYI12zDyXyAmfwl
	ZwSUTY9NFIS6TovF9rq/75pxK/UvF5fWzRhXW5xnaSXKEejBipFiw/yTA7DtBwY=
X-Gm-Gg: ASbGncsiT3UtvYg8tEIgiftOjz9qGjufK2nfapUNvekqXf0Qhrg7+2lYgDWDA2vZBUo
	H3CLC8AtHA5Vbu18Z4gQ027buYZlYFUP4XCWb6B2LN0/f2jDCjjpHC6WFw2E3z1ZF150kILH/oJ
	we1NLBGkPeO1b/50AUDa1Q/pdSwokwfz3P4lqXPg2eRiAhSoRyGWXwAeIpBZLUxZIdvTG1CASYh
	Ohr11GjsTDpablEwB6o7Ojp7n+t2+H0fkXI+AdoRbLhdzomi+FoHtxd1RDB1l4N/3MYBpnbIrky
	hdzwJRDwfeVgHmaj8S9LGtw=
X-Google-Smtp-Source: AGHT+IHtX44cvyUZkHpacOhemqLTunu3D50Mgcq1iaIh7ou+6BH/jVVPHw9q66AFLdQeQkeaqpkm8A==
X-Received: by 2002:a05:600c:444d:b0:439:89d1:30dc with SMTP id 5b1f17b1804b1-43ab0f2dcbcmr72336785e9.10.1740565169301;
        Wed, 26 Feb 2025 02:19:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7d02:26:5770:658c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532bbcsm15963045e9.11.2025.02.26.02.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:19:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Keerthy <j-keerthy@ti.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 00/15] gpiolib: indicate errors in value setters
Date: Wed, 26 Feb 2025 11:19:27 +0100
Message-ID: <174056512537.35186.16775359979829251031.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
References: <20250220-gpio-set-retval-v2-0-bc4cfd38dae3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 20 Feb 2025 10:56:57 +0100, Bartosz Golaszewski wrote:
> The value setter callbacks (both for single and multiple lines) return
> void even though we have many types of controllers that can fail to set
> a line's value: i2c, SPI, USB, etc.
> 
> For the consumer API: single line setters return void. Multiple line
> setters do have an integer return value but due to the above, they still
> cannot be used to indicate problems within the driver.
> 
> [...]

Applied, thanks!

[01/15] leds: aw200xx: don't use return with gpiod_set_value() variants
        commit: 129fdfe25ac513018d5fe85b0c493025193ef19f
[02/15] gpiolib: make value setters have return values
        commit: 8ce258f62f90cb2d339cc39fa43e5634594a9dfb
[03/15] gpiolib: wrap gpio_chip::set()
        commit: d36058b89a4aa30865d4cfeb101bbfd1d1dcb22f
[04/15] gpiolib: rework the wrapper around gpio_chip::set_multiple()
        commit: 9b407312755fd5db012413ca005f0f3a661db8dd
[05/15] gpiolib: introduce gpio_chip setters that return values
        commit: 98ce1eb1fd87ea1b016e0913ef6836ab0139b5c4
[06/15] gpio: sim: use value returning setters
        commit: fe69bedc77c119ffd4e27778eec03c89acb8e87b
[07/15] gpio: regmap: use value returning setters
        commit: a458d2309c81902dc6ca19b5037b9d25eb60a4a8
[08/15] gpio: pca953x: use value returning setters
        commit: e32ce8f62dd9c0ec923cfb9c783fc04070edb24e
[09/15] gpio: mockup: use value returning setters
        commit: 66d231b12eb8d39c21835a9bf553299a278ae363
[10/15] gpio: aggregator: use value returning setters
        commit: 468eae4166ab796cd2f9ad2bbb141d914e19c0b1
[11/15] gpio: max77650: use value returning setters
        commit: 97c9b59f6658671f3f13f57de1352ec9d16ad13d
[12/15] gpio: latch: use lock guards
        commit: 14628b692707fa8e61d0a068ef012156d23dc776
[13/15] gpio: latch: use value returning setters
        commit: 4b28762caa7b85609ee1a9a5e1038ae7bbd24892
[14/15] gpio: davinci: use value returning setters
        commit: f01436c2a038fe8d7b69a5fe701ab98028ce5cc4
[15/15] gpio: mvebu: use value returning setters
        commit: 9080b5d1b9c259645cd0e3694ffba85ccdd25352

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

