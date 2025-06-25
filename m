Return-Path: <linux-gpio+bounces-22118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D909AE78C9
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 09:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0310F1BC0287
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 07:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC34E222576;
	Wed, 25 Jun 2025 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="srAV+ug0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCA820E31C
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836922; cv=none; b=Bp+WaNUZGefXzAIapr8Q9uBJXX5nwdnvyoY9Ho2X2wggXWkjYVigiv+vfpswZfzQ4Bb2uUOj/lMvCOXu5/fO5CpKXnT2xx4BaiXmyYbKnUtH9+JPMLa/Dp4uKVMaKk8S3qzB3donsw21BVKhHuaUckRNUT/EgYoc2XLMqxBPDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836922; c=relaxed/simple;
	bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scI4YRfYqwJ+WHX5QKTsX8Knf6yvyVICsxHbrJMt0rMxg/MKIfaYSYbcmvu36Dn2jwwaOniVY8cBmc2gjTosAoLRSyCW/7q3NhuA/FKkc626PnNIxd34shihaBWIFFyZKpeUdz5xnSZKkpTcq7KVsbHSjNY3p+o0URoVL0OqkBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=srAV+ug0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade58ef47c0so129569866b.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750836918; x=1751441718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
        b=srAV+ug0q+0w5chyQ7ijAx/duJp13PTzdHzxqz03njor3fxDjKTSaMxdvbKRTCT5gZ
         +Bxeh6VtfhG3bTomX+QdTe81HgGz5BzUDK4udiYfRDAk+ECP7BQim++DL+2cdKRD9aA4
         44nlCEEYK5P0Oodemdw27yZ6OKkgUBVIwqghmLBmMVYPmyGYZ6uKcLr1Hv+6qSuhGcCg
         nYjDl273AZtO8v+TZ1GmQwsTAVWSygvyVr6NnEbWVuhHAXFXlERpkKNdsp+kS4EX/9wS
         it+KDG+SVQlYaintKCAyowNqLIklO3lzyEQpnX/eptd3SY5uZmMOdaj11PQScdVElkxy
         0xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836918; x=1751441718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DymnnvE184jkZ20uTvSiiI7+Y+QW2i9b6WEZQ2DOJs=;
        b=sT31un9Wz8UJx6tBXjx+HyJeISOLG7Qxi1d7+FdcxA+harGXaefK1GOFD6x0jYngqY
         xv/yyItutzD27a2rojJq3YTiY//NxrZ7Qsw9JebKQC0fL3WbKKBUcGbHzZCceUyFz2xB
         FMpyQwE9Q0YYPRIM3JuZxKsXxNBW29Ly/aITeTXwiTwPuOMfHXzZwYZcz1SX/VWk//ai
         jsQ8OyOIgIGgFdNVbEU/6cD9w8ungaHHQwwquA+j+uQJW9aeOAkD6+1YzxEvkmOurKut
         crUNsP90S5JYJGDXpowPFqCFFK+KKgj5U6e6WTxmvdKXBgs6QD5vgHBCP8skTW71Qi8n
         LdIA==
X-Forwarded-Encrypted: i=1; AJvYcCX7EqinwrX6Zripmvm/6vsyQGH9LGfGUE0Xlzw0AOVD4XGFR/0+hxWG9cQUxwa/A263KNttuG4CcyW+@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCH/NLndn5UASTuhlpzPUQTNYKV0VxjaCj7m/pV15kVF68aTj
	nTjcyyoyvTfzLTR+QXG2c87AFkmcZL0kLk9GIjLK0D5bPNeZccX3c2fLrVJPqL9RvtYScL8BLjx
	uxomUMAFRlLTmLB9JT5j8uEDTGqelJGMRjtooBhIzRg==
X-Gm-Gg: ASbGncvSog46I0Vaz3VP48XBQnP5GInBgf8FSLjGu4O8oxx1gMb/WY7yL817ahGApTo
	jh2BJGMrLVyPhIAKspX8DZEKZ+rLqATjLoW0WLf5o/OKE6xkDiXF0ILADSArFQkvzTOEN1XFq79
	Ak91CCC/j013phYTs4bqlecmMtX6IRIvKe8PI9Gtg0BYRHBZTm0qhK0i4QGq3tC6HQK/nmA0YG8
	jY=
X-Google-Smtp-Source: AGHT+IEyXKWCmKWZPw2kgX0twR9fcnM1z7nFPYHArFddxW4orcOtG+t3XPYgPsMNGRzQt/Onxf6tBPeKruUlJC8wqdE=
X-Received: by 2002:a17:907:7215:b0:ad8:959c:c567 with SMTP id
 a640c23a62f3a-ae0c06af8f0mr172746266b.10.1750836918190; Wed, 25 Jun 2025
 00:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org> <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
In-Reply-To: <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 25 Jun 2025 09:35:07 +0200
X-Gm-Features: AX0GCFtyVKN-DtXqrWSfe49kFtB1susJDcQJSJJYWx2PpacFz_0klmfgmBsfOl0
Message-ID: <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jun 2025 at 21:44, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
> > module, let's add support for getting the relevant values from generic
> > device properties. "label" is a semi-standardized property in some GPIO
> > drivers so let's go with it. There's no standard "base" property, so
> > let's use the name "gpio-mmio,base" to tie it to this driver
> > specifically. The number of GPIOs will be retrieved using
> > gpiochip_get_ngpios() so there's no need to look it up in the software
> > node.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This works for me.
> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
> property all of a sudden just because it now exists as a device
> property though... I kind of wish we had a way to opt out of exposing
> this to all the sub-property paths. But it seems tiresome, so:
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

That's not a problem - this property is not in any DT bindings and as
such is not an allowed property in DT sources. For out-of-tree DTs? We
don't care about those.

Bartosz

