Return-Path: <linux-gpio+bounces-18517-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3617A81319
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 18:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE30D1BA053F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396CC236A7B;
	Tue,  8 Apr 2025 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Bu52mfrR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E5122FF4D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131492; cv=none; b=VFaw6Gpb4dnZSIRdpOu31qxJQ5TwLlVlIMArM4aMAT3EVMy1C4fYN/ui/La1GptUOkSgGunZZbvY97lFLzUjSG5tc5D+h+UKL0MVWR2AHbcphpHZF+YDJ9qNkVCpHtkhkZNOyYA6NamP3CD1y9i56m9DA0/kj+sEA0nPWWp9H+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131492; c=relaxed/simple;
	bh=rV3IzZIww9h+n+TZSLe0bsGFVsLuLTB1QeJQm73XtYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VBwTvvlOUZN0NSnuyENv5tSeFesfT8mbl5v7bCX/2fXI8ENPBV1r4Rqjk57sIixyJNc8BdGzI0EnivJtcN08/jGTDbxpYnyjjV1w3aqdg0Qz22Ea76nWd77PTspk+DkIC2NG6NZ611Mk1JCGM09agYhBPQXNbwGWiqNyd2BoPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Bu52mfrR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso63078835e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744131487; x=1744736287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uGIqPGo3/RzZiaVHiqgzYEtP/BWLkkvzIhLsqEr0Mg=;
        b=Bu52mfrR9gg/GsWJn1mi1Yu52lTp3lnp8bPjxi8/qQofmR7/pZNZE4+q2LQe17kNW2
         k6EjwJlh8RniJlTaPPL2gy+vRgScx8Dz5Tycjow42+MLm9tDvRISje/2wbd2UdcJ+sSL
         vEE6tPLag1/dmvt6UkUptbJqBy0AOUN/uP0Z/hi12ILxsJeDvefkJAZ2IdOJk4gLocna
         3tZwJEeFWfCZVf1UvFkEsRRoppLwQ9ajRtwT/N5Vhhj9IT2b/9uX1VCvmQ0IcPCF+4Qj
         KsUIMnFXlFOzW6HRknABFSn/M7/U9sVEYTYGbdy+/5KAqAQsPVheHvBzqnwDc4x9q92K
         7uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131487; x=1744736287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uGIqPGo3/RzZiaVHiqgzYEtP/BWLkkvzIhLsqEr0Mg=;
        b=Au6JfaEEhETX4ZtVeibbiY5oY83de4gGG2+DSf+ihNh0gtnTJihIAursQOIPtHqUau
         0CQ3vzTa8pMFJFryBtzJIOSb5ZbKIUJ9oB1m7MPKseutqDc2rADwgnmKWVUq23+sQ7VF
         ltqTxB8klIiYeAuso6tKnruR7qa6usVYmYrMXPthHBnit9kPCXY++PHKDIfuGQvD6pH3
         5cnGj4ql+JQcYnlyWsDSXnikZuRoBBn91/QENz9jyx0QUeUmbjjdxdmpNwr3JXLmBioa
         WOJULSW7EkKT5x3vZd9XFMxf1tkynrFHiIbxifYgquTG4cC8YIU8luYlUVhrvAnJyofq
         a8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWhdbDrf+UV5SZJ23eKw+ipMo9clRrmTCyzZEjnGI873dwO6ihL9Mlk0JwZah9AOpaCuD/t5B9X5zro@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLqr19tEXbfuYw+6venrMuxlSrcVkcaZls7nxS0rcjrf8KKc6
	pDSUJyfti4KDpEHL+zEjpJmMwW08WIfYVQHgJi5heu4j6x4Z8kqzHG8IeHIxjq8=
X-Gm-Gg: ASbGncs85xqyBEVp8OJ2EGRvhBwyLfuDZAuqOpfmcwM/cNq4B3YnCTOX5himOIuKeWX
	RjBhUbPalMwcYHvtQPFLy6//m40zqwGn1Pc+GZEWWWy9ZWadtK3mJ0vczDy2sGtFlsFZY8rggjv
	aNl27ZiBTc8gsXxbyQZSIpVHDFWkMvAtaAQYr7RweruAZPCuLaMKQx51AiPbWvulRVCxFSqVnoB
	XsRZVv9IQUFlyXF7Vlq3EfnG0EoZG7syB3Cqsyl2HnUUZfjBALWeShmzC3VJjI/EYc6MdOMoB22
	DBjGEH5my3btjLm4L4G0DgzM5CbW1LitoGdToESCuQo/
X-Google-Smtp-Source: AGHT+IFGsRSNGsLurl8DoyFapSJyV7TtJ4uGe3SGSEX3BrkLYJ/yVCM++z6f1tjo7zrernLeUKYo4Q==
X-Received: by 2002:a5d:5f4e:0:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39d6fd3647fmr10095287f8f.52.1744131486678;
        Tue, 08 Apr 2025 09:58:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6a60sm15141709f8f.29.2025.04.08.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:58:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts scheme
Date: Tue,  8 Apr 2025 18:58:05 +0200
Message-ID: <174413148280.131421.6673320812296091453.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Apr 2025 23:11:20 +0800, Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> [...]

Applied, thanks!

[1/1] gpiolib: support parsing gpio three-cell interrupts scheme
      https://git.kernel.org/brgl/linux/c/27986833e8e675b6c17654d13623590a46f9033e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

