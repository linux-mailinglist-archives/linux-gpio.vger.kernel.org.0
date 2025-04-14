Return-Path: <linux-gpio+bounces-18793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BCA88B1F
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 20:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5673B4012
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 18:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D6E28BA89;
	Mon, 14 Apr 2025 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jV7It78L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E8227FD79
	for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 18:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655455; cv=none; b=rwKsqlTDfgqtAxzf7RkhbtgxILZ+eUoEVAFzbFVrmvAhgk2iZbXhF2Gb3KtvltapD+6T8AgGXzQd7fsvrfB5f+ztbh8/bLgrhRT/7e8JwLaJhulszmKpCbfKlX5A+eRZ3O3jCVtszDR2jHHTg61t7EN+i2oBB2wsjvJ2+Ahbr3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655455; c=relaxed/simple;
	bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYmHxLGSFdcmkUcq+PGnyLfdPLru87ZN1X6vF3YmrVBQ844kyqFEviECghstuNARWFindngvoyRd2T5Gq4cz3/dig07wjy/nix2OH4N7IzZowpSAlCJUtxBamiea+3oU/PFRJ/yIAvQHBCvyFaBnhL7jP3dtLJv/eWfv+URmrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jV7It78L; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3105ef2a070so19385341fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2025 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744655451; x=1745260251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=;
        b=jV7It78LAKjX1iF+4nxI2oIuv1XZJpt6Iy5uLV46Gb9+mwltTXBYQCn5QtO11ChD1a
         nVbDlaLPq+aKY341lBfHk+T1s/39/OIh2tlYwW3dxrCMKONY5KPzR+2Eaot/xUPWvuHp
         Xjmtk7ToQILSAnf2Wj1axX2rhA5kRnLcZEi986u/DVQ/dRape/WK4Hh5zxUjbzQLGQrQ
         sPHomYTc1sd6IBz5HnDeBjmboGbin6wgG0A38Yi5uuvH8E1cMyUAi2/TJt1/+882IKoe
         At/lDrRIn0q719+Qwof/X8IxSVy+L0BOqMO+aB3O7PoTVnaTPdpOi1K5ycrEcHbcEV0x
         0j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655451; x=1745260251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=;
        b=kKHEaZ257iqR4/e6VonN0NjUMKzFrPUE2A+AypwJK2nP5baJxMNSiEmIurkO0MZlWY
         7/OGCyjdY+y4QHxgJUXjR9USW3t2Nwn4hz9HpwgN1tXGKQg73xRlc7suIV6cfOj5tdt6
         BjI2F5PD6RpEdqPCAhYw0su/T7vt9sGSY32u+tBt9Hyt/oiXioJ5k70mnPWN9AGaFVJd
         wLcdjEwDISPlYxGp0QVGBDyx5GO0oMM/euw2L1f5ZRKUOr54q6VUUUKGg+Q6hUSVdlMY
         KBC+jpFvpzvHEoJQ3hxhsQUwxUOBMfldGCQHH72dW1bDcFpf9gpuznSXsm62UZJQXWzI
         cIxA==
X-Forwarded-Encrypted: i=1; AJvYcCWeogATajcaAMaVjiGYwtnLvj2JEAFzS4MvyilGuhXW2Q4w8kKvm1UOladeCP+BkqWeNqXSIax3pKQX@vger.kernel.org
X-Gm-Message-State: AOJu0YzXEhLP2FJLq0s0jtUs7qcXZ6+imKYmyWiwTGgzWT5NABjIdfTi
	RYx91DZOmH0Z2GIlTgVfgWvxubg417ippg4bwK+EFvFpBb5s1ZUh+Kvkc8hp5oL3PrLjFBtylxs
	1xRyVtgaxmju//FqCpzvNaY+pvUDYphfuZeODBbjPRPJcfWK9XcU=
X-Gm-Gg: ASbGncttKz6c+BRrle+uOZX8rughynzDIzwZxO+JmLpMMvb5Guns0IpJMy9SSn4CrC8
	QFoh0El0mt04CSTMDh/kc6Xu2hByjwc1tW4kZx0tAm0yLtbgWzvJjeF2j8821GDVI+psOrlmBzh
	sxKrAy3QFaHb3Y9I2YSXPihnO4sUNJWa83XdPwD0uk3ehJjvlFrdsrG/XdOWAGc/s=
X-Google-Smtp-Source: AGHT+IGG6HfO0a687DQ2ObWoW5dsDkKpKT5mJSVYkj4mYbmZ4ySEjWG7K8FyQL0/ZDaad7PXpi1Rz3cQhvFr0qElIMU=
X-Received: by 2002:a05:651c:1597:b0:30c:160b:c76c with SMTP id
 38308e7fff4ca-31049a1c6d6mr38019201fa.17.1744655451082; Mon, 14 Apr 2025
 11:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com> <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
 <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
In-Reply-To: <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Apr 2025 20:30:40 +0200
X-Gm-Features: ATxdqUHR3IF_jBbcAtQS5Mjt4i90SIKTxCncQEK71lUbbQWQS1vGZ6vrZEF8J6s
Message-ID: <CAMRc=Md+w7Wp8gS=PvpYkz6z4y45z6QiO7A0i24ESSa8N_byeg@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 2:11=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:
>
> On Mon, Apr 14, 2025 at 4:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
> >
> > As for why irq_startup returns an unsigned int, I am unsure. The kernel
> > Git history isn't enough to know more. The startup field in struct
> > hw_interrupt_type appeared on v2.3.14 [2], so no commit message to
> > explain decisions.
> >
> > Seeing the __irq_startup() code, my proposal would be to turn the retur=
n
> > value to a signed int, but I haven't exhaustively checked codepaths.
>
> Good catch! I agree that using a signed int could be a better option.
>
> Dear Linus and Bartosz, could you please share your thoughts? If
> you=E2=80=99re on board with the change, I=E2=80=99ll go ahead and send a=
 new patch.
>

Ok, I'm backing out this one then.

Bartosz

