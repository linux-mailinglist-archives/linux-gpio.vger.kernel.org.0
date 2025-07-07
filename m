Return-Path: <linux-gpio+bounces-22859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C23AFAEA2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 10:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 218013BFD07
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCC428B516;
	Mon,  7 Jul 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHhyR4dG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E426E700
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876975; cv=none; b=YflzUlxiN6hHZmZpk/qmaHJ9G7j8pUF56YTX/OONC7S5HkH4Bh4hn4HwKiNQt59oKqDeiC/fvTf+oAQ+R9ZIxx9dVWTRZkdzKzRNHV2Lyz5Y84qGsNHpjvtlMAGf+ksxD5m8bf3BTW4iz6VmNgTxzL0GI/ZYP3yVPjDqx+NNtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876975; c=relaxed/simple;
	bh=ZmuwxEwRz9hvR9dPQVP2ysixcdlQYWY+Fgsp2U0+Nu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvhhIMQmKoiFyq6rmMF+P5bNh/Pn208LIju5ba908LCbr4Yv16U8dPyFTwkaMBdqrEI6UwU88olLX2uiJIeciB9SiiRj5iASD12vJUUhjYpS9VWNqSEoBALE/yMT5zv1wyEnRGT32FnEbn/7l6xpYjmqKmyWxOWJE8SUKDTSqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHhyR4dG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234c5b57557so24227775ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751876973; x=1752481773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WktzVbMCOuSz2XCDiNHlBWqihhwDZRtZkZ7oMJdFGs8=;
        b=cHhyR4dGUf6pU1+2Xk3eD3W95LwPdcIv5Xxma8aSdvJ86PVItbr11GDDuL+JmfjxNy
         x1j/CCC04VnGgAl/SZNwrmokxkI4vNtFd+VgxKJCFdPVfcwGy5sJVN/EbW2I4DCpZ7WF
         kMfjtySOmZjLIBiF1Zdclgl1/EtAsWSxCqh4HeWvB2cf1DnVel3NxMsmhjCZ1EVaf3XE
         /edxwJz48MBvoW+rSNPE5cImEI6RafEdiZ1SrVKsUXZtmWjTRuextcI2GT/tnhfCelkp
         Z74L6njTe/ga0mU7izQlYS+SyAQjcusYY//WCauNRwq5ot0nC14oT9Hjbcy3uLKgH3TZ
         NsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876973; x=1752481773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WktzVbMCOuSz2XCDiNHlBWqihhwDZRtZkZ7oMJdFGs8=;
        b=b8NQtA++ZobjgxS4BDUXv1F+YG0KS6NF7QcaMgry9NS6A2gmtd4jOi9ep1qcywvoQu
         Y0NJ4+Nmfrv331azzgNqghHoPTkCuVJSbuHKeLkm8yvjtP4XcsyAugJi0Y0gKSiimJ5o
         WRfUtH4vQEyBIvipjJcGqm5ZD7dUZgLYeXtdjUVQ91rNyhnYf7itQqD7QZT4HLagyYv/
         1AZcYEE08LuH7LMgDtkrI+2w3CspTUMp4J1Fc5q/dHeDLqu5G8GAuEnUb7o33Z0MI7yf
         rGq3UhQhJaT5MvAmGQCaRlaSn+qC+vmTtFQWct5Rz+0ESOGzwVJlaaxdATQW///WpOm/
         4mEg==
X-Forwarded-Encrypted: i=1; AJvYcCV93D/vkZ1LcnpM6Ao3lTaIXZW5TL1RLQC0yb6X0qNjJ2BMXPyY/b7bUx/nJMEOWDMefmJg6bAR8U1g@vger.kernel.org
X-Gm-Message-State: AOJu0YyOo9RbWwMuYHotREE8h+PWMMlulh5DU0jEn8+qxfd+Ou5EEX0U
	uUd3GXD/pGMVjC8965F4aliIdk4E4y6goQi1AWj1E8JtC43eb9U7AD9SgIzouK+H/jA=
X-Gm-Gg: ASbGncu9r+pZjcETE0CvMMuzhw3LLWeH9qSKMyFNsV8qETt0lx1oIftPksVDKuf4bKL
	Moq+G55qZW4DO08XNiTHZE15PIxgJC/YHNGMxyHRAzet3yhoTPDQe5wp2UmyLGIiKgcCZSgUGYg
	EY9F2qBB0SRAdqwuptlltvjO7UnP5oJkV7iKnX0aNlxhOb0lI1NBNEQMgwaLZDQqvv624xpy76y
	17KctchIWxRf5JJFrmAlO9fmrKviAA26Yo+GqCcoeC8pQS6B4b1xhJJSvsBgc7WBQ3utj/aIrTi
	WYVZ26qC98bLhAlcnOPNLjF7SmK6LZ02LY4OsTKD4KF64CqYIKIDtQQstdg18/o=
X-Google-Smtp-Source: AGHT+IEzG4PTUXHjQ19lS5u/nsqPLFIxy4HYD8J7svSUDedR3HYEqjepBCTrT6erZSMiBmj/Gzsypw==
X-Received: by 2002:a17:903:198c:b0:235:7c6:ebd2 with SMTP id d9443c01a7336-23c85e745b6mr148490455ad.31.1751876973579;
        Mon, 07 Jul 2025 01:29:33 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845894a3sm80048605ad.187.2025.07.07.01.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:29:33 -0700 (PDT)
Date: Mon, 7 Jul 2025 13:59:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 12/12] gpio: virtio: use new GPIO line value setter
 callbacks
Message-ID: <20250707082930.boxyt5lrfmmxjrmk@vireshk-i7>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
 <20250707-gpiochip-set-rv-gpio-round4-v1-12-35668aaaf6d2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-12-35668aaaf6d2@linaro.org>

On 07-07-25, 09:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-virtio.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

