Return-Path: <linux-gpio+bounces-9821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA1596D080
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 09:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D816E28768D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 07:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8251193408;
	Thu,  5 Sep 2024 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mbHpdxtD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB018A94F
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521785; cv=none; b=K32pO+OhXcvW4Mt1O9S/sHvSqWPb59Csqr5BCjK+5RdHttgm1gi9il1b9LHeWee1wH7rDD4BWEvIJy9b/CFFIzWhRY1bz4Fe67O5rJf23Xz8GkhVyurqNZFgVhigkfiw+3T2Ev7DYQYq8hfsrlN71KX8QXVMmxymOQhbTWye0J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521785; c=relaxed/simple;
	bh=FUz2zipuVYqzvvtdAanUOfsPTtvU6IBXLfvtb4GWT0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plLHiYVwVg3B4luLp1FqkSbrNMzCjjcum337y89C9gjSq0AMZCJajSZY+84AAxEAqz1DDwRG/RHppoA1VqzIHf21kAXBw13LoikIRm+aiAVtQWGCBRh4sxliDT8Vf30N8XCQu4hEayF63fsZN0y41e1arHtYBU7CtAUo+h3MGEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mbHpdxtD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso3933055e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725521782; x=1726126582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UgiBpP1y4jB76x2buT4Zz9lapb/5/ADgusFn9ozjPE=;
        b=mbHpdxtDziThzAjoEGZwnpUnNsJdy7EnO9ChrxmD6shVEYfDHTu0OcNK43uS4TxU1L
         r1+RbMHF3Fqsv3gZ9cXgTdsE7izRfYroA8CPuA3B8GWqlhDM9OK9YeYpSmXQtepTIyTM
         NYIOkZH7OQD6+4O7YSyDcntyhkIRaPqN/brXE5aCFZK9CRnELjsGoMPOXIrA0TWCJLcy
         /i2+3zzfTsTmD/PO4lqkAXHMErSONKsfPx0idW9RFcOqLXcRngCUNZxW2Cww4gi86BAJ
         STyToG8CcCoyA4qy2pyH9DLsRxyLdb+aEH6S0nA7ysFxGfDGmc+62QR5N+7dYB5Z9H3+
         XwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725521782; x=1726126582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UgiBpP1y4jB76x2buT4Zz9lapb/5/ADgusFn9ozjPE=;
        b=JUzQkEu0tz5o3EhGXfavx8f4wlmpEn0GFiMDePd0Tb+DsPCFKOJ9er/WvsraLkPfLC
         u6I836wzoQYUt30V6Pgr07SzXgWN4l8Vsh40qArELGhci4X9T0qanPi5xW7JvbfMJBTG
         MRxKVZ1aM2PwdtzKKoUojjwouoDXOUL1gANuWzskIoqWoGfe57LvZcD4Vf6K7ca9fQ95
         zFQjpE2ZXGpmc9rOUeAT4jiyyLzRQQsipJ9fXFrvk7kRFDp6l23j26loZvA8J1G6YlX3
         C3ShWD1DxQC5n3dwluHs9GeSLYPwda3Zp1hDBvfYM4RP2gJJwCdv8c5T9p7Bxq5T24cM
         VRCA==
X-Forwarded-Encrypted: i=1; AJvYcCWbj3C+wvm+D21yroyVOxRGccDp0sHBzg68EI3RRwjlwxj85jo+d3kD/5CFbC+8sIR8au8f09495v8t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhg1S/T+U1r01qFPrLsbXazEeHzkUu3Nn1vdd5e8TEf1YeLqzX
	FrrvNUTNwwlJ7nlrG51WNh+b3V6As6fH90We/PNRH6chY6ECFaBThgnD3oYx61A=
X-Google-Smtp-Source: AGHT+IEwpsagyxvcmmAQd/Vo6anBEot+qSZPWwS2VnuiqVTJxMFJNzr8gj7qlyFeLk3wxMSUZ6swGg==
X-Received: by 2002:a05:600c:3c90:b0:426:5e1c:1ac2 with SMTP id 5b1f17b1804b1-42c9a366417mr11786645e9.8.1725521782356;
        Thu, 05 Sep 2024 00:36:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cbe4:ce99:cb33:eb1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b67ff88dsm15754059f8f.26.2024.09.05.00.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:36:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
Date: Thu,  5 Sep 2024 09:36:20 +0200
Message-ID: <172552177868.28435.4071190094207246356.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904090743.1204593-1-andy.shevchenko@gmail.com>
References: <20240904090743.1204593-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 04 Sep 2024 12:07:43 +0300, Andy Shevchenko wrote:
> Use the mem_is_zero() helper where possible.
> 
> 

Applied, thanks!

[1/1] gpiolib: cdev: use !mem_is_zero() instead of memchr_inv(s, 0, n)
      commit: b1da870ba36b3f525aee9be35b2f08a1feec61a7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

