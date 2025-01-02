Return-Path: <linux-gpio+bounces-14439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2EF9FFFD2
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 21:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0B45162916
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 20:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8541B4F04;
	Thu,  2 Jan 2025 20:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dqam795d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9413D508
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735848525; cv=none; b=Q0iP248gPEWklvb1l6njqx7t1s/tv/qmJW37UlYsYsjlS5Lfdk6lcy6PWQqr2fKjgxYosNnSC1zI6QM7i6HKoZue15e+qqSt73Y4MYgZk+lu8s4AFmRi9/L+LUf/9caVhkC4eH2BKH2Q8zVF+BtmTirBbmhRWLQUX1a4ADN3OjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735848525; c=relaxed/simple;
	bh=BPrD2esN7sgeH5q7/Usb1BBjFIx8JCIsb7XDRxCQQ74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHEeY/yT8OONlw1IiXPuE+SECh0lZorTBKWxQfS/H7FBoA/LVETpQTp+IgFly6ny3J30AgE3h/4l/L++2B/tIpkUhZRnDDEeEHo1hE9ppGht5jlO2wZoox38s2FhIR4kcUdsqyzz/7VRfalJuDPq6dXtOEKRzkGkfVXfozOt6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dqam795d; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso14207598e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2025 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735848522; x=1736453322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPrD2esN7sgeH5q7/Usb1BBjFIx8JCIsb7XDRxCQQ74=;
        b=dqam795dglZvqLfHCOjC2iLu0y/CN2oRxWOJ5IrM/mypPlACNJGDQNgpa8sDSxjekJ
         RIpoGkGqzaxwOtzIlbnSijQIa3uE1R9rezOKxLQdPWwXt4s/snyI7Dcm+0Q6yNK4sC7N
         Dk/dEjV8adTJM0sReLkk5IUiHxhP574dQnBngQdhWMHWf3B713DOg3Q6NsbWPm61HoNe
         aamSzRoypomoQHjQWOSbXNhjSW5eXZWoqsIzpb8Na1oJWqyyggg6LNyhh5n0h8C50B/L
         bnSU8FPM6IiIXC1h9HbWtzOgbbLnsaP/iQbfRbEAYASZ4DF5Lkzdg2ZMO5qRipsOgbGJ
         OU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735848522; x=1736453322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPrD2esN7sgeH5q7/Usb1BBjFIx8JCIsb7XDRxCQQ74=;
        b=KWroRForZ3PuO/UCN7oig17UKlLMozBlORUTwoN9MvaiCCZtHLei68PCNBDKaT7lnZ
         Aox4ocpk259sYXDx8LFDjg2NWrDjHXXSOZ34g2MXJY4xTSFGDturWwLR9emyyt6PnWaw
         K7LGcMl/Nf/sx9Vcrd59QLAkFasyoJULm7NE2DITxZBOvBsKdseOvoz0CTjQQdyH8iH9
         g1fz4/QAA90qTmYZXso1e+y10SmDKPlMwj+HGDmfzAGajyyrbphyF/+ZZVUdCpewVFN/
         E26rBYROz8PCaPvXtTvSUtxB3Lydpjp8jzrOXL8WF9NqsJmsbr3j11kvf/F2rrwLO+Hz
         3Y9w==
X-Forwarded-Encrypted: i=1; AJvYcCUytqzbXlof2YUgVq5sJsnRnhW2O4fu5EaI0HhPkzjKPlPrFnaF9xbwJpL/QTml7hDX0j4zRM3WH40G@vger.kernel.org
X-Gm-Message-State: AOJu0YxhxREuSQDBsYGo7NtUJsPiME8Y5DlS/cxvl+0d+W7EBc+5GBDc
	CTAF9Xq/ugsh/RzQK1dqqzWCFrPFt7k6bwbgkH7WFJ3UMFTL6paJftKmVH1b78HwdCKajaU+3bk
	+v7DvkpMd25T1Tl3oDYhv8zZFwXuXHFipDVx8Cg==
X-Gm-Gg: ASbGncsOUPK+xe8Y75U4vzAbZscIuFUAY6rO0CdCjkNwEPVT9UxLRHQPs37rwNFTzmD
	KDKT/8MuSyZKG/sJxVjy9VUgWkjMx6YaoRrOYwS2UYdbRic0KVICRsWCZ3gN30SqXoWGscA==
X-Google-Smtp-Source: AGHT+IH+c2xqa9nlHNVJq6qtXtI5390P8FdB3hiSEeZk7bTUlzj8NdemzvUUFO0C/COfN/u3PCwMLOatNVVijfuo5bI=
X-Received: by 2002:a05:6512:10ce:b0:540:2fbb:22fe with SMTP id
 2adb3069b0e04-54229474ebcmr12767754e87.26.1735848521494; Thu, 02 Jan 2025
 12:08:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
 <20241220-improve-docs-v1-5-799b86991dec@linaro.org> <D6RR4E5JUME3.21P9OBSIQH21V@linaro.org>
In-Reply-To: <D6RR4E5JUME3.21P9OBSIQH21V@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Jan 2025 21:08:30 +0100
Message-ID: <CAMRc=MdUhD06ZKqr7u6WPi3o9R3oqznyRw7tVct-jh7q9B=5Ag@mail.gmail.com>
Subject: Re: [PATCH libgpiod 5/5] doc: use sphinx in conjunction with doxygen
To: Erik Schilling <erik.schilling@linaro.org>
Cc: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 6:08=E2=80=AFPM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> On Fri Dec 20, 2024 at 5:46 PM CET, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > -All API symbols exposed by the core C API and C++ bindings are documen=
ted with
> > -doxygen markup blocks. Doxygen documentation can be generated by execu=
ting
> > -'make doc' given that the doxygen executable is available in the syste=
m.
> > +The project uses sphinx to automatically generate the documentation. T=
he system
> > +needs to provide doxygen and sphinx-build programs. With those in plac=
e, the
> > +build can be invoked with 'make doc'. This generates documentation for=
 the core
> > +C API as well as C++ and python bindings.
>
> I also lacked the `breathe` package. Maybe worth mentioning here?
>
> - Erik

There's a v2 on the list and it has a requirements.txt.

Bart

