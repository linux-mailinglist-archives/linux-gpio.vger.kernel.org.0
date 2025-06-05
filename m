Return-Path: <linux-gpio+bounces-21052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BBACF0B3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F56C7A2640
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58444234971;
	Thu,  5 Jun 2025 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oO89MaWR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55732231858
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130419; cv=none; b=g9KaNxXAQn8fSyb7FzuqNLof57rbkK0ls1b22ACw0w3y8ynypqRbpLhxnImbOJsCOLc+bIcM4fEd0N3rL6oKXdOZXRGSUjEsAMsp2nmmEOKNnvzw3qzz+kUWQCzSkMBzgGgmcacAuF6gfk2I5vMLEd0HdRBfHQq3+VZLFYx5ChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130419; c=relaxed/simple;
	bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RshFKUMTjCZqv4m8MDQzIxkNBuJV+BIfel/Rzl1ckvAmiME+blDxbH4Na8X399+hL2TRSW94TAfrZranbub6w6FLXHv2E+h72Jjmr9zUO3aqIpau4tecJDLdqa+ShTX7ol4OflCQTnDbbEaqIB1Etf3zTwoIjgm3TGd4a+TXuSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oO89MaWR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54998f865b8so937543e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130415; x=1749735215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=oO89MaWRZQYYIdAXI0QboMa2M695ugR4shKTGo10iJ0LW2logpiSHxfroMIGzb4DcP
         R6oCTjJdKjljUutH3L4DnXSQP1xbN9nXmb2HAPstu7YADkVy7q+iqKaa6CJD2tbePkBg
         zvIk5VnvXTeA2NosMkH0zF6zDTHNSwhGtmOApci4nQ2epnN16XL8fMKNrBNzsMq1xPHq
         /0FzV1Kc4MyBQ4+67xvYcS+Vp/qxCnd0I4GCfFmID9lGAquHmQXz0M+b837i2Aa0Mcv3
         dQn3LX7yzeHuCpLjHdBwgh7mcffoq/DCghjebZli08LnmYU00WifHt+uVauxSTUgORtL
         DZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130415; x=1749735215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=HszYttv3msq1zFoLdBM9tP1o8bwaSFFGG3CGo5GMpMR31lJnGAW6ORwrXiuRWNRN6Z
         FP9ynFMZcVCxpzVTZBMtAbCSHmOtw//3p67plcO9UHKq9XMerlerBofgMVN5zR8YmORh
         RhJiVbgcTCZ8ku8QnQziyX7dsNxeVDSwH1IdZh76UpatCVjmsFHYzs8ICJJQapuimT8o
         61xf6VVLxF8m24CWs1IcID+XrGLZfH/NyqGO2JrBLe5nZAyeZOP0j1fTqnqZC4RiuU0+
         eOuYQEkHtX/kteeDf1nPjJ61lbz3DxcSUyh1eHituJ+29rdvpE+oRgMvzWv8e25LGbJH
         UjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmy795u0KtuoDNsQBpnjzHzugNFowyao/AggN0EhjvZpMfbGyzJh+BJApdHIJwaS/MrnPwkulIhkNf@vger.kernel.org
X-Gm-Message-State: AOJu0YyE0ezxWUQZY5yGEQLIREAn9ZR+UUhF0RzSM8d0c4yvKHvRD95y
	P595QThDgEfo2HcWT6pEp9z0Nouk6HUtt7Hr2WHEN/UrbbdpxoEhmsbPsuUx1Twv+6KUcFeoUMJ
	iv6B0BcEBcOEQczjPvsLoAoQk0IBtTkLH2EMmqYF1Yg==
X-Gm-Gg: ASbGncvd43qtXHLFh6hj6D5nEAd9ih1f+8Zeoq5ecVxZr7XRTx9p7SCFe7JseYbPjGq
	ngELSGUmtHstBxw7bvtUWlLW4WOWlGQujf4ru1bTh3XNvVbPf9BHPnG6y1AtFIr+X5Hu/WfDsTh
	pBWFwkPdEIQs2QcZgXFRvINXciU5pC228EpRx5NNwy5y4onyiladmwtQ==
X-Google-Smtp-Source: AGHT+IEgjC4fcmg+OD5IGVLjZUrIMPEfYs/w9+6VTW1vagtiTaUcBabncwsUcBazgBGF/ZYxoheFQtZJR4MPvZFNfsc=
X-Received: by 2002:a05:6512:3c85:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-55356df1e50mr2121333e87.55.1749130415411; Thu, 05 Jun 2025
 06:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:33:24 +0200
X-Gm-Features: AX0GCFvHxiWRpP5cMCB8iSavv_JwXNB2m6sizTI16LHxsIHw9CZ-Y-5vnZK5ofQ
Message-ID: <CACRpkdYD1F_AGXkeEhKcfS8BZxgznmfj_r3BBaK8LJLQJkDMvg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 11:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.

Excellent cleanup, as always!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

