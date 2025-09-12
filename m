Return-Path: <linux-gpio+bounces-26001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E368B543DC
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419D956171F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 07:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7892C21F6;
	Fri, 12 Sep 2025 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zhsmURmn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC72C11CB
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757662027; cv=none; b=WzRiwYAHziELbFmP5gjDyCaHdy5YGzs71O7pyZKUpcxc6x7JlpVnxukbn4vH4ibGISwWPNLQ4Zjm7HkrxrFCDit4zQa5+/pKAh3xFue2C6ltf5LPfA6xI+VMwvS1Xll/ts2eVxm28OGCyflA1CCC/UZNUxu8cHRWRsx2gVUfus0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757662027; c=relaxed/simple;
	bh=YXXUSLkyXM4KjeY2HayfH6nkGnEcg3K/wnzkLpbNW/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0q3HGqB2HxZqQNbjM+rYkUOX3wFYM6vyaAVYKAuzfqxp7Q6CK0MzSyCEZZ+OnT10IXpq3S20qE6O2DGBkJzWkBYoA5YkTEznx2lE/VohJE/zwso6DX4WcV6Zcdn10xR2K9zAYtm6nVCHNQPy7NMque9YojA7pV9ONJ9ftbHZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zhsmURmn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45de60d39b7so11305185e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662024; x=1758266824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=;
        b=zhsmURmnvCSO5dRkJ3VuZSMzFZLKsDgjHyFru4rMYvAIfQAv0XMC7xxPLK7s3Yz5m6
         7J9yKVaupkX4dCee6AQPOXZ1Ce9zcGwBUGVnAz7g5hg2CDyIp90GIPqo17xg3PllfcQz
         6Bqkmlu5PF0U0qQDtd99UBayU3r3webAPAGDa7qIgROzoD3mf3rz6PNka1AHyBv0R+9w
         4EJ2ZCb5gPIx9TXUNbfX0yS+mC37+QLZl75wjMnMdl/jrXuGfAATT7ttiqzkJlXsIclf
         AlxgwrIanaXmvi2FtkpKOHd10cS9/Nw0/vJHN/BUeMYwarn17RGq5/r3uy+sh8YHfOW+
         1zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662024; x=1758266824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=;
        b=plMUpBLd0zMnEK9STOammk79JtZVwJYk2xpxAgP/LSI451ywh01sVpeEkQf9naJcl0
         C0jUHPmLKoNH4vMq9rBBNxYsZXXzLWilZYooHNQcQ45iCngoet8jyMWGspyr9EEZDdKO
         WktNJH8GcuVuDeH0sJAnlCjShoGRao4OVzIKf+Vepqog6/2pZuwsK7H6aQq2JFEwXMOD
         qMMCCgC3BcbS1Y6qGdcBopatX+Ft0NkPhDTmd+GXr3XfSNYeMt0vltS/pbCbqYHh2t2c
         Xm3aIMWxvQ7Hbu44402BpAfNvt9HNxdL97K87OanTQ3GF+n/nogg9o6g1T3WfVYfp/8Z
         hcDw==
X-Forwarded-Encrypted: i=1; AJvYcCWza4rIsxrv5+wrh2q2nu6Fyr+/z0VQQhTGCjZtg0Z5b6gpAmwV7RxmhwSN0lXfC+ZgJ7Am7ckaqW20@vger.kernel.org
X-Gm-Message-State: AOJu0Yw717SST1iDYWQhvAkgIJcK8lIxZCX7qO6cL3WxihHra11Ru1Ck
	/ocyTcWVMWYnVkC4ePP0brEfRp9GO7Hv7O8767eok0MmZK6JsaBzsfHghbuU4kjJEgM=
X-Gm-Gg: ASbGncslr2PuGd/gDicF4xw+r2xE3b87V+a2vE/MGQg1uS/IJviV3PcBZEwFUHQnjbi
	5T5UbdXrH9s+MPnQfI7gZmj44wKIM92Fb5rtVG66jU5psKXHbFRgSjI+i9lCzkHKdifTD1oiaHn
	9yRh0lcg1wpD8phmR8YxUwki5Rz/vMbSobb0qMMZBWU+9UTcIX/3xCT/YLncP9bGQwinlBEhJBK
	XjrnkEX0IVwRbPEVAU1hGQq9KYWtQ8S/NwoTSPsaaJgAc0X5HrhtoJ/DZ8j06lpuf67Cyp6qBU6
	3CRvTnW6KM7cCyZyScMbGWXYczjVHqPB8wTb+3IcgXhxQRIrVesQKU8zgMAAzuDQhwQkw1RoXRo
	0tCTSSkMsJLdn5KjUx0wlDDQ=
X-Google-Smtp-Source: AGHT+IHnJFZvdCCeCxhMw56xuAjolN8GpBM01BpNCjssGvJ1wLlPBDHBDYHA0TwsVBlYSdL7Ex3cDw==
X-Received: by 2002:a05:600c:8486:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-45f211f7aaamr15546025e9.22.1757662024343;
        Fri, 12 Sep 2025 00:27:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its modernized alternative - part 4
Date: Fri, 12 Sep 2025 09:26:56 +0200
Message-ID: <175766186360.9646.5204996164911945151.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 10 Sep 2025 09:12:36 +0200, Bartosz Golaszewski wrote:
> Here's the final part of the generic GPIO chip conversions. Once all the
> existing users are switched to the new API, the final patch in the
> series removes bgpio_init(), moves the gpio-mmio fields out of struct
> gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> the new situation.
> 
> Down the line we could probably improve gpio-mmio.c by using lock guards
> and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
> something similar but this series is already big as is so I'm leaving
> that for the future.
> 
> [...]

Let's allow it to cook in next for some time.

[01/15] gpio: loongson1: allow building the module with COMPILE_TEST enabled
        https://git.kernel.org/brgl/linux/c/80d7319c7a2a9865dc730422ec7227bfcc92e6bb
[02/15] gpio: loongson1: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/116eadc92b4c47277d660271eac1efd4afd33121
[03/15] gpio: hlwd: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/43dffacf6be98fb31aa7790d693adc29276461f0
[04/15] gpio: ath79: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/551a097118391018ddc4079cbcec6fe4e7d64bc5
[05/15] gpio: ath79: use the generic GPIO chip lock for IRQ handling
        https://git.kernel.org/brgl/linux/c/e7a3a1be11d7e786924ed7af3b3411def2e46f21
[06/15] gpio: xgene-sb: use generic GPIO chip register read and write APIs
        https://git.kernel.org/brgl/linux/c/36f30f7ffc4b98dbd49deec8599cf810e7006cdf
[07/15] gpio: brcmstb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/e8bd2a6a5059043a9f13a0723acd48c1291a55ff
[08/15] gpio: mt7621: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/80fd7e96d669d729d9e01bfa3e2b60ea6b500e20
[09/15] gpio: mt7621: use the generic GPIO chip lock for IRQ handling
        https://git.kernel.org/brgl/linux/c/2c1f22fa54fcbf8fbd9c03f5d341c73ef36c6d27
[10/15] gpio: menz127: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/b24489af4500720d8ad57c55111d90e762133c50
[11/15] gpio: sifive: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/8e1c8ccc1df8b802a7a1b4beadbd8b87fff1c3b3
[12/15] gpio: spacemit-k1: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/063411108de622a26b36487a711903443b0e864b
[13/15] gpio: sodaville: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/ae9a52990b2cd62e0555adad92d8fe9e431d1bac
[14/15] gpio: mmio: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/e43e94fa19cf058c4e465fcdbc2f521123058ea6
[15/15] gpio: move gpio-mmio-specific fields out of struct gpio_chip
        https://git.kernel.org/brgl/linux/c/9b90afa6d613b66ec4e74ae75f9bfa5baf386ecd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

