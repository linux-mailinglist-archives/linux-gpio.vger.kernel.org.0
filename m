Return-Path: <linux-gpio+bounces-4293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1787A73C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Mar 2024 12:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FEDE1F2109A
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Mar 2024 11:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708903F9CE;
	Wed, 13 Mar 2024 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="is1MNn0M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F753F9C7
	for <linux-gpio@vger.kernel.org>; Wed, 13 Mar 2024 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710330492; cv=none; b=KFB1gbJuKqmG0GK7/CdRzC3kSGtL7oBIljZEAcAOCABtC2+7b4PXncoXKzZGYXw+53neaQsDe3EYynKMtrRVFjXpnk5mIXFwASAAwaupt+OeBhhUcHdKoFxYYch4mMCnaqFV9yLX0bPc3+rGpuDq23I2YyRVdJ7tH1hQc/K4+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710330492; c=relaxed/simple;
	bh=DNFni+XUTW3FICrmk/m7hXGzpOYHOb0w8uarqKy8hAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kf8e+LkAE4g6lf8s3nVm9DLXqFwWHyTU3039KYmd4d/O9AJFj7hzNYdUq9ggY+kD8D4Piz7Wg40OSkURfkuA/IrF61UQLuKkmH0jFO1cUZA65WG7dLFVC9ve4Ub/I/xQnTsWjYYECQGKtVo+KpSPv6p5xAHpCXxee1Lg3G4sFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=is1MNn0M; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7d130979108so3589917241.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Mar 2024 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710330489; x=1710935289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNFni+XUTW3FICrmk/m7hXGzpOYHOb0w8uarqKy8hAQ=;
        b=is1MNn0MzDh2bNxd/Mu5MUtXha5AO9+HWfGhIwfIZQEiAlvyH+p2N5hq6MG1aVtn1G
         wjWs+GLQ3MAKVmHnmFI35vIpBINl6pFOKcxI6y/6CXNpnTqUbC9cwNYt0rNWyC/qcrjs
         MsQkCqn8GvYtf5+PIYTSLM6H7J2R9fyq+d9se5je5HiD5BpGYsRW7Z46GZQnWenOMceD
         RdYq6Dw+i1iDq6gb3Fgc6YB8CyApeJs7X1u0WtdmDUCk372RLxhrhhiNZcwNPWqjtyIx
         4g/Zm2pkeK9gpNzUNFoqTujAsWjho9ieUkMkoo4DQawydOThl01CRRJPgYDzhtmTe2uz
         iKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710330489; x=1710935289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNFni+XUTW3FICrmk/m7hXGzpOYHOb0w8uarqKy8hAQ=;
        b=qNeoztmdGbPu33vHuR9HBXh4UuzsFgeM485zEul2dQBEBWi6YLrcgb7mBBaKLHPcdO
         GDyPxOY+0pn/QCTxsxo8e0mKUIyx3PQQVzfwE6JTum6WK4Vpsg+DGnl3ob+pE5LGm+WW
         G3Iw26LNiAjFHQ4UyD2hjErqBwFXxM9Rwdh/DYqipze7ftluG8oVmhdwKjQvyv6vOvyv
         lmM3nByAotJIdZ7L37e4D/T2BLml1NSDkCiAGgdaqP+YYlY1BrnLf6IvDb5nvxwrNEby
         28LqEbwPOXIoTym1mWb3DeF8RhnpQOd9Zp6cvd5oMs0m2sDU1tJw/PSD1k8VcTg5EiSI
         IX5A==
X-Forwarded-Encrypted: i=1; AJvYcCXvKQyrSCFUvPsnYq6t3WlW6ThtnOkyF5NX5l4wZJLjEi6p8FJ0KX5kJM7ZKRGNMfgiRASD2IHsCC6QEgXIxg4vBr6hR9dkRIv+Qg==
X-Gm-Message-State: AOJu0Yw1DuQGBCVAAreg8vQlQ/NAdWefRe3lUX41s81YSFB465hW0Ug/
	GvYIGCHAaKwdV/5mbA9bCh5HKt0+ygXVEyOksgdsbNJ96NhmvrUYTZNGQILQrSaTgKpq6Ji0x3O
	007YcK8TI0l9HJQb8D/T5SrMuIZviDSRmT1ju6w==
X-Google-Smtp-Source: AGHT+IGluT9xzhiFMWC0Cc9+B6tkk59Ep9zHKSImJGtOuPJFypPJghuHNvH8l+0pIM+ELjCSmDlX3v320pWMu4ltdjU=
X-Received: by 2002:a67:af02:0:b0:473:2066:6df0 with SMTP id
 v2-20020a67af02000000b0047320666df0mr9214696vsl.33.1710330489649; Wed, 13 Mar
 2024 04:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307135109.3778316-1-andriy.shevchenko@linux.intel.com>
 <CACRpkda6bykOFY6gcZqRKLAnprUooZooQ_g7Rj_63da2akbwtA@mail.gmail.com> <ZfGKkjxIT9AEd8dy@smile.fi.intel.com>
In-Reply-To: <ZfGKkjxIT9AEd8dy@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Mar 2024 12:47:58 +0100
Message-ID: <CAMRc=McjYKCLGKk42SWdCy3Lc=B4B21WpS1kvx_d66itHKsQzQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpiolib: Get rid of gpio_free_array()/gpio_request_array()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 12:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 07, 2024 at 03:36:18PM +0100, Linus Walleij wrote:
> > On Thu, Mar 7, 2024 at 2:51=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > There are only two users left of the gpio_free_array()/gpio_request_a=
rray().
> > > Convert them to very basic legacy APIs (it requires much less work fo=
r
> > > now) and drop no more used gpio_free_array()/gpio_request_array().
> >
> > That's reasonable and makes the kernel a better place.
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you!
>
> Bart, do you want me to take it via my tree or you want to take directly?
>

We don't have Acks from the relevant arch maintainers yet. I can pick
it up but I won't do it before the end of the merge window anyway.

Bart

