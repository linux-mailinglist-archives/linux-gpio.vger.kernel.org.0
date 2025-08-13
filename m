Return-Path: <linux-gpio+bounces-24350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5BB2446F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 10:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D5776870D9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8932F068A;
	Wed, 13 Aug 2025 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EjhftdbD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86AC2EE614
	for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074032; cv=none; b=qySVtJ5OQ3NIoBP5y0y5mo2l8FCaVZXPZw6I7fe0yB7/2RJcSW7oOXSG0PBE4K9DQFIFh07mMxlJ0ji6lkExMudyEXnVC2DVy1Gpwkw0tY94Q1a3gTCpHW+ugTDb7R709pQTTY88i/uzXLCcvX0WZgnM1rXKtPBpST7SSQVASus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074032; c=relaxed/simple;
	bh=sCf7KKtTvsdiwk7eFFlcTiDc4lwkLf5rvzdoWXciLcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMt13ivevaKu8TSN86Kr9NGNNgO0qmJG+UEFUaYkqZ4oiCefkleBiFc/xYsGl9qM7MtnK6c2dJXEYeZJ/QD7bWXKNOXlB5gPgE7wVCEZTaEGzdvnrJMIOehs4DrEosKrYX3DnbimFF4dgGXa4s2qQccFyHZUo1fkTCb7Al/mWms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EjhftdbD; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32e14ce168eso66676091fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Aug 2025 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755074029; x=1755678829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwdeE3y8IspnO4N0Qa9L+YqaBm5/ozrfYmq+imS/0vM=;
        b=EjhftdbDocdQDhY7ZvWLSAaZO/KIgklklXk7jlsw+vTasea7BbliHqud/jvdDZvAcY
         V/48NNRxNVikAclokfuLnAIyHbQoxNdURKD+PhFez2PKVJ8pfYbTD5dbr1USFW2D3sVR
         MnT2EkSj+HfExVRtzfX1s85oFmwkxAE6wpKbDvF0h+3/jyh1Ev84kszhsKVRN3XqFdtQ
         0nSYR1sQnBXwyCcDATi+FDT3NVrTnVs8j7b4dnRGHVT9+/EtbIGhVZJPn9xotpaGbldw
         80ODijyfm/qIlvHC3P6DJG4pr7e/N7MJv2B+T3Z1Iq6auERGhuUzYorwJNJBAU0WUAhf
         D6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074029; x=1755678829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwdeE3y8IspnO4N0Qa9L+YqaBm5/ozrfYmq+imS/0vM=;
        b=AeRR9ogjK/EMjk23642rnbXsDDTlRnsFEnU8ZELlLxDix1Pn1x7qhOV9RSEmF2pJJt
         G7G7Jl09mVxfpUVDOIy3iou3tCKkyX+ju4UV+IGpMGMoHF5njuNmu16Uk1pdFZIoztdp
         NsDr97G4ap+LaRORViYiq87bsTUK6prpZfSYm/0C5iO/laqjhFNg3jfvil/H0PF+IASs
         uhsw9OGx/QIPd+UMdyooEihIiJ6LeJw84mBP92PAIPr99iDe56bIaqQLxtoNAUMEps0/
         ZR8ieDRykTxVGNEdcUzfIxWN41SicbSVy8loxN3rfUjFIIEnztlXeaxEDfGWKomB7LLD
         IegQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqfSRLbY7qwHsi1Fn9PRx+yuWyClIXEVFxckcBByLjzpEEt2Y5yePt8e/8LqxzpwxYNrXTrMZdZZPX@vger.kernel.org
X-Gm-Message-State: AOJu0YxFDakFxpGuRwDrLkN9vP7wjf0dE90SFvsxrQ0MvJE4wB5RlBRb
	mlptkdqdI1c0GE22qvuOcSYgY/vtOldhkztDyxVA3D/pgyuTnfVp/XNtYrRzgfpNTVyDgO+07aP
	2dL5OiXJ61kDOPPl+4RJtGTOHAvmo0YSqdtJ1bIGRxg==
X-Gm-Gg: ASbGncuk5iFHbJPykaizNAIZ7AMMmCwTfaftyrZ/T6J1pfX1YOTSYffrSodPOglaxgW
	GG17fIgZV/ZJBL3NQooAUsTiZfAmhE3vWMWyHdCOBqvDzhcsDYGmqCySkF2McymeCd1h+j8zY8H
	U7lplpcVANw2LRwX2XUv2x7BdIDB/a0tUh7XAQWJF429JeZ2ngYHhV68XRf5MoYqhKJdqwpvm5H
	IS+8PcC0PSNN4eav8/rztn4Z3Su4a0HqEbXgZw=
X-Google-Smtp-Source: AGHT+IG3bHkJsQG8D66FYhLpPLvHCosnSw4JBCeMmsq3fqkd6JWc543laS5aAaAUhD7ZOEc7/jPWxJl4dN7izAsMJjs=
X-Received: by 2002:a2e:a550:0:b0:32a:74db:fe73 with SMTP id
 38308e7fff4ca-333e9b40a52mr6287921fa.28.1755074028587; Wed, 13 Aug 2025
 01:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
 <20250812-rust-1-0-0-release-v1-4-372d698f23e8@linaro.org>
 <DC13QYZSZI3M.11FB0H4NH0O9X@riscstar.com> <CAMRc=Md7ACESEbp60HtzS-4STev_4Uk8N9EOadXgHdDwivBHHQ@mail.gmail.com>
 <DC15MDR9KTV0.3L7D9LGTQUWKA@riscstar.com>
In-Reply-To: <DC15MDR9KTV0.3L7D9LGTQUWKA@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Aug 2025 10:33:37 +0200
X-Gm-Features: Ac12FXzavo_QdBfBnE9w3UBRtPBNlE-ejf0nRE9udR2CZgOEDvq5jt200KNHSC0
Message-ID: <CAMRc=MfQswoLZPU4do1s4pXVxw0jyv03Y8efpa-tcNmhv0rypQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod 04/10] bindings: rust: update errno dependency
To: Erik Schilling <erik@riscstar.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 10:24=E2=80=AFAM Erik Schilling <erik@riscstar.com>=
 wrote:
>
> >>
> >> Hm. Given that we expose types of `errno` as part of our `Error` struc=
t,
> >
> > Oh, we do? Is this correct? My habit from writing C libraries is to
> > hide all symbols coming in from external dependencies.
>
> Apparently we do through:
>
>     #[error("Operation {0} Failed: {1}")]
>     OperationFailed(OperationType, errno::Errno),
>
> Not sure if I am a huge fan of it either. I wonder if we could simply
> use the std::io::Error::last_os_error() API instead? [1]
>
> [1] https://doc.rust-lang.org/std/io/struct.Error.html#method.last_os_err=
or
>

Errnos are something I can probably live with. At least in libgpiod C
API, errno symbols are implicitly shown to user over the errno
variable we officially use to pass error numbers from libgpiod
functions. I just hope that the errno crate is just as stable as the
errno.h defines.

Bartosz

