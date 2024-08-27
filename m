Return-Path: <linux-gpio+bounces-9220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57921960CDF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 16:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5AC1F24046
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 14:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD901C4612;
	Tue, 27 Aug 2024 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiTF6NH1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A041E1C3F2C;
	Tue, 27 Aug 2024 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767330; cv=none; b=bpErd0Ze3P71D5FzrMURHSS2r1r2nhIq4/gDeKogZExmIDSXWWZNUfCOY/ojp7v/qjRoj/Vnu/LpmBGOdXTvW+x8UEtZGNi9GiRR+h1/BdEdyu1G+LdxplDmroorEWhP/p1t0Juv2kjQTw2ynj2FU/P8RwuL8aJbuVJZ1cf+sSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767330; c=relaxed/simple;
	bh=7yRBxiOXezCwSY7Zo6rPGXupOtGhuPE48GQ4UkVeR0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kh9Hk2iXj4PGY4Gj3m2mystSjimPvsYWNN9PyXFqwp5eUBr/ljpj+yU4eDWj5zVBxk/TRc3D9XAnj5mFzypwcfYMFgxcMtE8YIfZXcFsnlRziSqSTolBhwcXWOInKhnCHD30X7EoKAy73RAfJvLsJzBCR9652meFEphm+/Qc7KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiTF6NH1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a868d7f92feso701395066b.2;
        Tue, 27 Aug 2024 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724767327; x=1725372127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfvP9RYHd1FR1CL080PjrehIUnmJ4bC1RaX4tkg0sOY=;
        b=PiTF6NH159buU1j3C5TllfLGgdJ+YnVxlp1KbtNnxRnuFKB6Mbhc+pVMkYTOj6a2bf
         kkpBMBjEUx+BDZD0V5dyM2lXC0o0G3/d1BdNVXUFmq2LpmeWjTEHblqAZLRW7Y7r5a+A
         oPGe70t2nGAqk27gpb3pssW6WMsY2MNWSrTVjJhVrahYfy2IYko08LI0nXTNQTEAgrZ3
         pDS+kmeSXIKAzga6cRtICvlXBS0/zadUlRg7xZPTuZgB7LICtZuooYX6X4wXwnh8C3uz
         LN6NuYUdnXYZB2VR6Vhvzsz4B2A1xk9CcTkrcI+KQIQ+UX5l6K5+r+IDzmc978kNF1PF
         NGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767327; x=1725372127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfvP9RYHd1FR1CL080PjrehIUnmJ4bC1RaX4tkg0sOY=;
        b=TCYv5QkrkquyLWkOtGb3S1BzkQwZQ6OyMPKJ30Y5MlYtLW99fe/L4WAcksMTMFiyxq
         a8Ef9vRYlDeTZo6SloGoL1xipYKbbjCT0OL4GgvAVS8Fi3mG9G0L+RhqSwH7yMN6HUB8
         Ro78t1nWTTIwfpdlUAdwzx/xefI/Cqt7FpW2inZyDuIJ3lhIBxNlrqMTcEUPWRNKgP+O
         +zPgj8bTcWkgm8tzANm9aRLBclheWlfy35ZmxTvdvtMn95IQvdMrD3FskoadwyrW8AVS
         q6oXghdbL7D9PYDBsp41cVBhTx8/cqmFGref4lUyNK+2w4BfHgm9G1DXfdsRfKSOZ1VY
         BGFA==
X-Forwarded-Encrypted: i=1; AJvYcCVyI+9WirpUYIV7Wqpdubbd9CokC1+5K77qFivtuCZXNanWqNqIvE2XkNDDQSmMdDsecSd1z820APut@vger.kernel.org, AJvYcCWXB25ETqc/E3o0JubUUWLZh4FAUwdVajfbcc/Z01zjlWh+rbJfr1Zc+xxytXvGZG9Ax1u+s/8t1x1NrBVk@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrRbwtT5HP0ZAgdY0Lqk9UN5fiVt7HrLj+Wtg0VNg8up1doNt
	H2FrOLDhsvShW7uuTcXMeoFxFmjXkSwFiR4ri+snYO5j+xC5eblrqi/658cV76XN4z3vwAWWNh2
	1AtuW3picznLuTz8svaRLaPyKdUU=
X-Google-Smtp-Source: AGHT+IGeqUBa7dOIl95YwqIOHzpYNv/mbjjI3YO4/cQxmnf/KqTurcXFf0QCsay3cogGEqQZecz7eYFwOhhKlfV4Zww=
X-Received: by 2002:a17:907:3da1:b0:a86:9d3d:edef with SMTP id
 a640c23a62f3a-a86a5188f43mr863092366b.12.1724767325832; Tue, 27 Aug 2024
 07:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826161850.74447-1-krzysztof.kozlowski@linaro.org>
 <Zsy6pZ9LYDk0LOHs@smile.fi.intel.com> <0187710f-73c1-4ee1-87f9-384101f0c32c@linaro.org>
In-Reply-To: <0187710f-73c1-4ee1-87f9-384101f0c32c@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 27 Aug 2024 17:01:28 +0300
Message-ID: <CAHp75Vfq0kEN-VDd=aTycHH+oEkUHt260nH533UWnkoEnGRhjA@mail.gmail.com>
Subject: Re: [PATCH] gpio: kerneldoc fixes for excess members
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 4:55=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 26/08/2024 19:25, Andy Shevchenko wrote:
> > On Mon, Aug 26, 2024 at 06:18:50PM +0200, Krzysztof Kozlowski wrote:

> >> Drop kerneldoc descriptions of struct members which do not exist to fi=
x
> >> W=3D1 warnings:
> >>
> >>   drivers/gpio/gpio-pch.c:101: warning: Excess struct member 'lock' de=
scription in 'pch_gpio'
> >>   drivers/gpio/gpio-syscon.c:46: warning: Excess struct member 'compat=
ible' description in 'syscon_gpio_data'
> >
> > I prefer on per-driver basis, but since it's simple and I have nothing
> > in my queue,
>
> These are so trivial without impact on the code, even if W=3D1 reports
> them, that it would be quite a churn to handle multiple patches.

Even trivial changes may lead to Git conflicts if managed separately.
But as I said, there is nothing in my queue (at all) so there are no
chances for conflicts.

--=20
With Best Regards,
Andy Shevchenko

