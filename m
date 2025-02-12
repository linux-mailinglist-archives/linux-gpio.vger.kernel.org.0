Return-Path: <linux-gpio+bounces-15850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B8A32748
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D105A164650
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D7120E6F1;
	Wed, 12 Feb 2025 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u3eew65Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A820B800
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739367691; cv=none; b=NPBn4ZnP5gBa8sGyFUcqn4bhb+UsaOujl+4UtACBm9kYjDRRi5lZ7wTR9chYUKUcZroizFmwk3MrBMH6YrUCTiPlawALTl9Pccdj1fasUVdq0LlYoqtLEG4r3BHLx5g/Dn6uXBz8EOoLXjjKJJujOrXRKfTHB8G2a8LEiNRkYYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739367691; c=relaxed/simple;
	bh=2CTLfdBdfTu0vH8KNTtXTuFNXRv7qZT8sUXi/tpcPmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVCO9dDZ/7wy8tMEfEzAeylh/AMszhQj5VYhRxAnKDM0oel2iyxFb7azCNDCfc9W2aQsZHn/FqTV47nKZOLYebifT57ZAql4H6vy05LfP10c8zdGkyr9tqldn9yZfK/ygwPvNNrOan9Fe/yiEIPpRTxkgAlOMfRYDlMVOqMAC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u3eew65Y; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so7525418e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 05:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739367688; x=1739972488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFW7Zf/G9aYLbYdFAgCdEU0qw4fsxOkvthrfUHE9V4g=;
        b=u3eew65Y3NlzcFP7XCtU7J3F8An42gJHBlvusFbQpjLD3baXR+M/hH6TQ61cdIEFYs
         j3R40ZOqaRLXKov83edYD1GQEkwNhg+pNIC3fwPEwPQtO6aWL8V76XdtHgFuRf5CLuQJ
         gAbmy0OcBmD6d0kc73WBPAAVAv3cudgreNooNpy5cQuWug54jK8MQl8J4/hIuE9THy2r
         EYkSYO2zt2O9BRkodNPHaCIw1wOh5USJ5ezZXaVVAzv1jKBXR2gJ7hAFHp1CZVvEhvIC
         39M0fTPdfWzVf9Shcxw8OPbJH5zurLKMrlAaCVnU1VM5upuDwgkkUMzP7B1h0v4OhynU
         yhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739367688; x=1739972488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFW7Zf/G9aYLbYdFAgCdEU0qw4fsxOkvthrfUHE9V4g=;
        b=iImaFR3L1LRXaqYtQqxYm9bMPLRWPtGlhD9XSRrxi076ehhAwiKDkMvIWvfztxB5NS
         AZcwSb565U0wGMPxGFLxM3KowgU+GkttIE+QQ8n5cJAa4XchVskICmXlC+dIaze9VtDp
         SL5OEuRL0DBrGeX5uk2TFLgiLoFC82IQrGam5hAH5tS3Zxy3kcs9VFrJT4MkqbeNOObe
         O3BNqt9BlczbkLdnKW0Rc08hOH3VbBy1UniY9XIYjiI+eu/P5iSRVzl0cEMV6A7WpvJu
         bxPpSHvsNFJvlAOlaf3d6QzKQlbp2jUYSGsX3/8XwiqtMFzhL+Oq4+2t+SMspYpD6na7
         UZXg==
X-Forwarded-Encrypted: i=1; AJvYcCVqKUa9VlWhKjFHn8E/dumUDOIxANWGugo7YnC6zHgQXSJJDd+RYEOLzLJ5sVVMOuYCQU6HwSm48zfw@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0Q6TEbH0XgXy6XCXSRiiMYnHtPHDc4uRHMSWmvOW6BAA2EEa
	epud1hIJtvlTK/BVDDa6M0HPnBw3LINDJGPkdLGIenF5lEaWP7W6YdK9ZzPtDC/sm5qqttMTKf3
	OE1EurNzHCXzteeykPgk21nYBMRt/Lm+/1GfW9A==
X-Gm-Gg: ASbGnct2Yacvae7vjuCgUqVwtvH6+2EnaValrGxjIohQ4xB9PXweN4+taiVhDg1If2x
	Jh2bzmjWhXPAmBNLV0EeRKBrkqk7l0prPsCv9McVjGiaM9WmkhLpIVmS6N3fLRmg60LmgWzjnPI
	GlIobUx9EGdldGa5ft2vWP0cTOk0fA
X-Google-Smtp-Source: AGHT+IGUG4BxYF8PfiDJLuPEPwUA/0Cj1U6h+A36XHcqDet0ky/ms2/iEljBU5tRlJ7+cCE69odWLx46YJvzJDTyeZA=
X-Received: by 2002:a05:6512:159d:b0:545:ee3:f3c7 with SMTP id
 2adb3069b0e04-54518116604mr1078573e87.30.1739367687512; Wed, 12 Feb 2025
 05:41:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207151149.2119765-1-andriy.shevchenko@linux.intel.com> <20250207151149.2119765-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250207151149.2119765-4-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Feb 2025 14:41:16 +0100
X-Gm-Features: AWEUYZkgSVoql_Wb24JaohMVS1BV24troUxuieR-cx43nm9CPoG_I9p7yv1dJkU
Message-ID: <CAMRc=MdDXY4vLSO0+ubanGxO3=wE+MEvcUM96X-0UsS=q1MDbA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpiolib: Switch to use for_each_if() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The for_each_*() APIs that are conditional can be written shorter and
> less error prone with for_each_if() helper in use. Switch them to use
> this helper.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/gpio/driver.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index ae93f75170f2..a7e9c1d3df71 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -532,6 +532,7 @@ struct gpio_chip {
>
>  char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)=
;
>
> +#define for_each_if(condition) if (!(condition)) {} else

This is already defined in drm/drm_util.h. Please move it out of there
and make it available globally instead of duplicating.

Bart

