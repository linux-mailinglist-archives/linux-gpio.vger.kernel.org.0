Return-Path: <linux-gpio+bounces-19862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66152AB154D
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85C117B96E1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 13:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CA32920A0;
	Fri,  9 May 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EnWyqmwT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4D4290BBE
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797617; cv=none; b=KIJ6GkjdhJsQTSzk+KvIxKScnPngPb7g2NsxfH00C3KC6dhcrKFprds1I/QmDs0cB0OuT2SDCw366EinpiQJSZLNHitHKddHUPPamfSww34uUgpxN2PyBjfc7iXucjh2JnqnjCmjM7bzw0sxxWz0hDOCiBi8Y68N135lNKk7X64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797617; c=relaxed/simple;
	bh=TlkSYuqs+traWUaA3K1HwpXrmTQmXOWxUyVb6ntrqxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAlTTU1kuyfZ4b1o5cEkcF5XCjAAlGVQS1z0ToqKljRvcupHfo0Tcwp3c5KE9XZBd5ZKKW2BN73G0jkTJAQIZ1mI5ZX0HcIedFpHwNIgdY3UowbKi0W/SHy8PC1axYzYSowTYa3P8x7KGrkVVFNiVGMIarSO7JlZ5rpWjnnnxn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EnWyqmwT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549b116321aso1699838e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746797612; x=1747402412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyTEj+ygo5+Kkz2DMrVi7Q4tbRBWdTGHuOvCJaygYnA=;
        b=EnWyqmwTTH7t/lJXqovsbpnUSYBu1TblFw2aQjlPtSGPusPIJaAQ6aMbf5Qq8nGKRu
         PC+YRHDTqN4i8gdl3szK2ghVP51R7nXzPzu+L0MjnXLdCXovoIHe9otRhdH1P31mw/5z
         g5JYyllS/bUYNTlmRjX6WBBEk1yYh/QzMZi/tvOX4dj8uBtqCAdkSheA0Gn9hd5JHO1j
         GcZO/njv1AG51XHRLg6gWHdjHmE6Ki2YvXbWtDlbwIl0XQH+juBAd7G5E30wz5nVEFlK
         YU3Us9E32Mkn8d1vhUKjsjThXixJOKMqMfCBWf9nEWdVToSZfGUeqBDABCEZL19Yr1FX
         joVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746797612; x=1747402412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyTEj+ygo5+Kkz2DMrVi7Q4tbRBWdTGHuOvCJaygYnA=;
        b=L0C1z4h2dd38RLQyJ83yXzp3SH/IrfiGQf+aGPGoM07MCtb08nIb6qm+jY6kzfl0kV
         /nDuzOk28fmVMTzFOk/j77j3GzBNnziO6occleAYkMoWo2fzj3Thkhgd44Yykf4VK+Mf
         XZztz5YQ9NqX9i9r1ukqv7csObbcW0AwRmfq8E7yg3qkt/CccwRsGKPpF74vrNQ5z8vQ
         rd+ruExQ2baZynLOS1Jgj9Lt2nwqbCdqpeNIUY9IE/d4ap7xBNVhB2js+4fcGXr9tH+u
         5qSDTIx6sy6Kvx+cMXesfMUG70lB2IsoCjrk+cY2SCyFuLN6U3STSIBECHwZ72SxF/3/
         K5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVLiov6AVQQBoNZazt46hK6aQAhANBl/dYC7uPIbhaa4Qsp6F56KcTt1oAT8iQA4R/4/BvGmYjpqHXL@vger.kernel.org
X-Gm-Message-State: AOJu0YwIPOMfPU0ts2aid/cbL1XXfPtlToYmj4oRFTbxyoc/5IJOJleb
	ksf+Fnq1VYElUCaBdg1GM7LaX5dNQ0ocvdt7LwTsrTcbnLzz7V9tK4wB3ifQS4lBePD1kuHKMBV
	qZDZ1+ucd3hsJ6zcf2vZr3vUTcYLsNU81q8o/Sw==
X-Gm-Gg: ASbGnctH1g5I4AEGOpp3Yp0AlFiQwcbJxj0YgPj4/HJViKbaQ1VSKikJnHzRmUU3Thn
	b802hF0i6QNfQVGl2tR7Jwv8PRM8wEj2B1YESyHeJiVmxL9tsfYOiDegvo5LZCVoBckdP8j0oW4
	CBw9TpNHSiIcph5INIwmVTs1nM/0BX0ae/kjgOb9mF8UpYgd4OLff06A==
X-Google-Smtp-Source: AGHT+IH+RK7/XEa6JiT7pqhmb3oGoQVrhP9K1d8JyHBGzCVXdWspuBYjMtak9HjjuGq6re9lqeqvC3BDvp4KpIO5YTk=
X-Received: by 2002:a05:651c:a11:b0:30c:160b:c75f with SMTP id
 38308e7fff4ca-326c46b1a39mr15861731fa.36.1746797612514; Fri, 09 May 2025
 06:33:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-9-3906529757d2@bootlin.com>
 <CAHp75Vdg2LE885+qjpYLkQrdNqaahJc3=Ki7op=6jJUJfJM+sw@mail.gmail.com>
 <c3b9c494-599e-4d99-8645-589c1c0c106c@bootlin.com> <CAHp75VcKsq5_+uwwVKeq8++H+Rw1giH-TKUErsFmdKPiu5kY+A@mail.gmail.com>
 <2f02284d-2922-4bc3-ab2a-8848023019b7@bootlin.com> <CAHp75VdZuqP_ga_i1=kERQbscu55GFShPK_AhYF1jigoBz8wpg@mail.gmail.com>
In-Reply-To: <CAHp75VdZuqP_ga_i1=kERQbscu55GFShPK_AhYF1jigoBz8wpg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 15:33:21 +0200
X-Gm-Features: ATxdqUF1PrMyfdLebwhfVKGAVlYVaBvsllsiAwoSwuvvCaSGYfX2F5YWtmxv7uk
Message-ID: <CAMRc=MdBwRMfpXG-bAWTAaiD9E7sRzr5RTfMWJ-2wAryJ-EcKQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] gpio: aggregator: handle runtime registration of
 gpio_desc in gpiochip_fwd
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 5:24=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, May 7, 2025 at 4:54=E2=80=AFPM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
> > On 5/7/25 15:24, Andy Shevchenko wrote:
> > > On Wed, May 7, 2025 at 1:10=E2=80=AFPM Thomas Richard
> > > <thomas.richard@bootlin.com> wrote:
> > >> On 5/7/25 08:34, Andy Shevchenko wrote:
> > >>> On Tue, May 6, 2025 at 6:21=E2=80=AFPM Thomas Richard
> > >>> <thomas.richard@bootlin.com> wrote:
>
> ...
>
> > >>>> +       /*
> > >>>> +        * get_direction() is called during gpiochip registration,=
 return input
> > >>>> +        * direction if there is no descriptor for the line.
> > >>>> +        */
> > >>>> +       if (!test_bit(offset, fwd->valid_mask))
> > >>>> +               return GPIO_LINE_DIRECTION_IN;
> > >>>
> > >>> Can you remind me why we choose a valid return for invalid line? Fr=
om
> > >>> a pure code perspective this should return an error.
> > >>
> > >> I reproduced gpiolib behavior. During gpiochip registration, we get =
the
> > >> direction of all lines. In the case the line is not valid, it is mar=
ked
> > >> as input if direction_input operation exists, otherwise it is marked=
 as
> > >> output. [1]
> > >>
> > >> But in fact we could return an error and the core will mark the line=
 as
> > >> input. Maybe ENODEV ?
> > >
> > > I am fine with this error code, but do we have similar cases already
> > > in the kernel? Do they use the same or different error code(s)?
> >
> > I dumped all get_direction() operations in drivers/gpio and
> > drivers/pinctrl and returned values are:
> > - GPIO_LINE_DIRECTION_OUT and GPIO_LINE_DIRECTION_IN (make sense).
> > - -EINVAL (for example [1]).
> > - -EBADE in gpiochip_get_direction() [2].
> > - regmap_read() return code.
> >
> > But from my point of view -EINVAL and -EBADE do not match our case.
>
> Hmm... I believe we need a GPIO maintainer to have a look at this.
>

I went with -EBADE in GPIO core to indicate that the underlying driver
borked and returned an invalid value. I'm not sure if this is the
right one here. I'm not against using -ENODEV.

Bart

