Return-Path: <linux-gpio+bounces-18331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D67A7DC3C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3100188F80C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 11:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F96423AE64;
	Mon,  7 Apr 2025 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZVDY1fVP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD442239090
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025188; cv=none; b=T34BLr4S9flROaNeCjs0VLu37J1qGbFmQuEHFUbmk3BmyyG9eIF/ALBDw6aUm//JRYoDvAh0RMhn3L08s7O2M3Wtg47gC+81srx+afile8B9SnuyVMlQUkqxDIjGcM5nRYGcnwP8tQzBB3uv8uwmp5hgRlVb9Npwr4IyPc+PNQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025188; c=relaxed/simple;
	bh=RviIKAswlPvNGRsEWdEPn05fxHOsZa6tlhHIEII4Ung=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ku1l4YzNfJMWKKfvEQONPCIGw2xF8zYZwoyGyHprdsFVWZf5TRtVtZkL6AjLTsiJ55hwR7jBgydIbXPeEh45wkrvg3vU3dR7zc3Jnfweaule/FT3S3cXmGT6QAPK79QWfNBd9AWk4o1HZyDvYDuH2ok2PgBOmjz5ouLa0tTQ8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZVDY1fVP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-548430564d9so4830735e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744025184; x=1744629984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=;
        b=ZVDY1fVPITL5y0lB7xs6qqdEmtD18vOXeZpZXhyeAyFOCSNBGjAm4XuAhqYobZnDco
         RxkPpNI0MUCHaufv1teJaf7fQj/vCnq+c+HTUf0dpC6VkY/+E/eisw3yXTNPhbm9U4Vf
         S+hzaBrn2iesr9OfiGbTS5stgARF6StqOofTz7csKLN+d8PAFD4CIUpZkVUoqm/gSeRA
         HME9yR4Bft++hjU21ReXNXDNUA58q4+N86Hx8qjg/D8wns/4Z+5QjK85WRyVHGBomWmU
         zGD9GpNIg4EtXkrSEnOms5jOp1yasb1qSQduVT7eydqXaYCPTMUKj+haUV8lbcIP0QYr
         Hf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025184; x=1744629984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=;
        b=kMynBqybo+VFr47OFwhidI2c+MehKlq+C9uEEK3MfhvN+2z9gc9+Mev3wm9/5yqvXY
         LufHNq11hAK9aSAq9u781LZF6Iid6gHUa4okV8WCeQBkOHfNIueeYCn5LoCPA+hEHSjs
         DvloA0DzUqiY3GJNo30/1ZouosdOvDojRu6j4cMInLzDt7mIfM6BWVNa+P+6kv+/f1C7
         tt4V8+tfLaD/zuBkDVFxofDNiJMc3KiY/490Sgks/RQfzonR5F1pQGCkibgKhd952nPA
         AmyKbudd0Fn09oHpfKrhNSAGb4aIc1VwJxFfgMx00zucBRsG/0w4yelOkrdgc3ZDYKnU
         yUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq7KK2IBvt+W0SvW6+MSnwAQSfvoA6XTZC2eNIOM/9KkGI4R+76GtlWYgGwPlQYRqHjHCY6PbxQJgL@vger.kernel.org
X-Gm-Message-State: AOJu0YwJTW6FS5gj3xOQa9enTM6T+YZ1NUsN3d92i/Kjh0H0pTqP6YKJ
	QpTdsqHuNohx700nNldCPTpaCxB8pYhh5x9Mim/Hah4dcdqR2GjPrjE7E+pWXhFjPISVxhp4g0b
	EwVmvCTpsVnodnhwxVoJtOsFmMT84hXoZl15ZhQ==
X-Gm-Gg: ASbGncufogvStWE+R6eOIVjJKYY6vEg0IzbeZhsrV6WRxS8gQ0C9UfHVOwYpqLSYPRs
	k5kWKeoTdXlnPLLvuBBcUtb2IJrgCb7kWrE90d6uk3KA4eKgsrpEkq5iD7VY8j1t7AzUGyDbmf4
	NasiRHI0ZCVxJIyJ+Lg3jGs5mxzG3dPWCSfuLTU7VoiEjcVBX0URh3zTlRZZavNFJH8iFd
X-Google-Smtp-Source: AGHT+IEF0Umob27acb0T2mBiL6aYslIf1iwF0v4IeDnV4GdBZ6Kni8wcccQPNxQv4mkDvYKKandIkloAlzt8S6od9ac=
X-Received: by 2002:a05:6512:400c:b0:545:48c:6de2 with SMTP id
 2adb3069b0e04-54c297d099bmr1645433e87.13.1744025183610; Mon, 07 Apr 2025
 04:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org> <20250407103320-GYA13974@gentoo>
In-Reply-To: <20250407103320-GYA13974@gentoo>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 13:26:12 +0200
X-Gm-Features: ATxdqUFdC84fNZAgdG0QB3uYh3FcHqNCfMgI5v2DW_l-kU6Xw4akq4WaqW0KsIA
Message-ID: <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 12:33=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Linus Walleij:
>
> On 06:06 Wed 26 Mar     , Yixun Lan wrote:
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > so for specific gpio irq driver, it need to set bus token
> > explicitly, something like:
> >   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/gpio/gpiolib-of.c |  8 ++++++++
> >  drivers/gpio/gpiolib-of.h |  6 ++++++
> >  drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
> >  3 files changed, 32 insertions(+), 4 deletions(-)
> >
>
>   I'd assume this patch [2/2] will go via pinctrl's tree?
> as patch [1/2] has been accepted by Thomas into tip tree [1]..
>   Additonally need to pull that commit first? since it's a dependency
>

No, this should go through the GPIO tree but for that I'd need an
immutable tag with patch 1/2.

Bart

