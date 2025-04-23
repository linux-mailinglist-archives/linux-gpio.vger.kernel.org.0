Return-Path: <linux-gpio+bounces-19216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A5A989A0
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 14:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D5F87A12E0
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 12:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FD71FF1A0;
	Wed, 23 Apr 2025 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="loNoDGht"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4728632B
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410845; cv=none; b=D1Fah9vY/UvNZDrbBxJ4f2JRtx5DJ4vZZ5UScnxEU1YFLYkFhfgZXnjJAfCd0t9Yh3EqeApLqDOqix1dA0CYkDhPcOyIteglPadF/JtieBNI1prLBdG2bWf50n9/bp/dOsoNbVWwOJD4V6QpDKLVRwU5/Yr8vKuzKO33F8H3kMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410845; c=relaxed/simple;
	bh=JWIAObcKDCSS5jaLNcTcz91pENIuWUJrYuOG5yyP5uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxuWn3eCwKaDoPrTyPcZwIa/MG9pYiUCrAK8IzdwtKzXBP1/Za5VviGe71BeEvbDjTOdRNNKSlv1I5v7WxTQKDSyjy5MaGdE6hg/GUSa8oM3n3+zTMTg78KzUYGtkKyMYF26mMYRyOOSSCOTV5FJyrQ88AS00GN5BC+dfFgKcZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=loNoDGht; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso56055581fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745410841; x=1746015641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWIAObcKDCSS5jaLNcTcz91pENIuWUJrYuOG5yyP5uQ=;
        b=loNoDGhtPFDwLtyn6lTEysmHBdvdLLrqHgGNyAVB6bHomhivdQMs4bkrqjHcKuvfpi
         8FrqcxSArQ4hHI0A1wsttMEjR4nbfK8Y2Ayq503riRwPj6lnMaPKU9FTzot9l4LoKCHj
         E0Ma5k+UHYAcj0IJHnnMAoZ9W6D/JTLJLWWlFkHqC48914M6ebbd/ZY1JTRTlyDinAlG
         CiIPRbFQle5xk27Js3BWki9878KnDuOfru2Mew0lqdd6Fu+Y0cR1EF+V8OIZyYlLq7VP
         NJ5MXPgxDJZrDSl/PAn03cjudkNYlhPI00vwFWMqY2fKKA2NAUW404A/hZRdkZ0RJ7Ta
         LxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745410841; x=1746015641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWIAObcKDCSS5jaLNcTcz91pENIuWUJrYuOG5yyP5uQ=;
        b=ebrwXvUlY/pJFfuBCXZEFQ/DzMvqfXxdnMiYuJBobPbRD9XCxNyfBWG1CxBvj1eXLM
         QJ3fmx7Stfs3E+cENwdLOo+zkO+pxjTY8YobSkP1iEWotAvJXHO3R2HTjF+jtQ0T6xNi
         D0nIiKSzCG9Z4CtvrCy9fjKN6EaZuxlzBEHpNVjxJfTRRVOQwvo9MrIUuHWyaEEYZz2U
         c4X65uZH9NIo7xVusGyeg854wkX6n6N6tLtKc4ZqJ4Ga/YbBRRnigdZ7NDM0Fq2kzJ18
         6MUncCBRNMss/98WINHBeQPi4PQ+q9LW8VZShknuwaEAIpvK0oBLjQVG4YY9JcoklpZ8
         Zqhw==
X-Forwarded-Encrypted: i=1; AJvYcCWO3q/4yNYl2tAyvuOOQudYQ8r1Ok4mN5cUaIzOqSNi3nWUlfJernawDoXKoESeuNS+88xH1Mte4C1O@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpf2MhJhThbLTKK24qgkGbOjjs7fThxckKZYuUJ+W8VLqBE2cF
	BgXNR0sLMsTY3zj8TnJjnRL9v9scmRJJOaWaH9a5ifXwYFGw4Xsa/WE/2jK9RQgkJiDvqhirIwe
	nrJL+b1HE7m4C9dVog6FJklE7OwyR08fuIkSTlQ==
X-Gm-Gg: ASbGncs9ypYt9K/BuB9haSoiuQIdtsbeH0nu3wkLt0WU5qpFhIm5J8GgsFuxLDo+jZM
	qQvgvrb8k3VvMBp+ckJ5xiKrBZKhU6Cq7euYC/+gbuXkkLquo92nVeuYvGyqpgLQaiY5IDH4YoV
	ir84l6/vMZordgGNU+YDhQ4eEa5G6BMn9EO/74sbe8/wBhLITIut4hwmvRc51OQsYH
X-Google-Smtp-Source: AGHT+IHdOy6Vd80a71VsBDq9vq4NcDgqMFfcNVJIb9jbOrQ25R+2kyWaeho7dLvnMD7PoIkydcR5flY29jmHWUrtlnI=
X-Received: by 2002:a2e:a814:0:b0:30b:971c:96e6 with SMTP id
 38308e7fff4ca-31090544994mr65437581fa.26.1745410841172; Wed, 23 Apr 2025
 05:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk> <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <CACRpkdaBNVyXUwErHTtGBnUjh4+6Ojb6fu9M4E7LnRCu_Oovpg@mail.gmail.com>
 <CAMRc=McFBAG9Gi3UBfsdoQ=78fL3sTK+ZMToXWGF=KOw6zwPiQ@mail.gmail.com> <CACRpkdaKBDyd44xPA_kBxR9HVFqfLgcSnd1UDHumyB=m5-B3xQ@mail.gmail.com>
In-Reply-To: <CACRpkdaKBDyd44xPA_kBxR9HVFqfLgcSnd1UDHumyB=m5-B3xQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 14:20:30 +0200
X-Gm-Features: ATxdqUFPfchZIqBJZBy7vOjihOhPD3Ut0RnZdl-eHYA4dR5GVziVhoOlmDg3B_M
Message-ID: <CAMRc=Mc9fMrx0bek1mE2kpoxXVgD7GATaeQWZnL1eDW5oZ-FTQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 2:05=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Apr 17, 2025 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Tue, Apr 15, 2025 at 11:33=E2=80=AFPM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
>
> > > There are precedents for this type of semantic IRQF_SHARED
> > > is used whenever two devices share the same IRQ line,
> > > and that is something the drivers have to specify, i.e. the
> > > driver has to be aware that it may be sharing the IRQ
> > > with other devices, and whenever it gets an IRQ it has
> > > to check "was it for me?" and in case it was, return
> > > IRQ_HANDLED else IRQ_NONE.
> > >
> >
> > First: this flag has existed (as SA_SHIRQ) since before git days and
> > could be considered legacy. But also: it's a bit of a different story
> > as sometimes you get an interrupt and need to read a specific register
> > to check from the status bits whether it concerns you. This never
> > happens with a GPIO so I don't think it's a good argument for this
> > specific case.
>
> But at the same time Mark describes that drivers using a shared
> GPIO cannot really be opaque as to the status changes on the
> GPIO line, as it may or may not need to update register contents
> depending on whether the line has actually been low or not while
> being disabled. Maybe this can be fixed by a per-consumer status
> flag in the descriptor such as bool was_toggled;
>

The few use-cases we have for that use regulator notifiers at the
moment and I think async is the way to go here.

Bart

