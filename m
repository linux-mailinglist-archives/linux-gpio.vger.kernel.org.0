Return-Path: <linux-gpio+bounces-24771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB42B302EC
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 21:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9420B1BC6D2D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 19:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C612EA720;
	Thu, 21 Aug 2025 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLXP3D0G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D01327280B;
	Thu, 21 Aug 2025 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755804762; cv=none; b=uqmdPyG2OxAmXwafI2TDU/bwWE9oO3I0au7P5zhLIUVC1sTe9wF8OszmOVLTB63zlXKQ7tkYz2tnBRzLcI4CQ1+W6xjOkrBN23yGXJ30fG1Vx3SQB6KZBVNN4yF3F6FlcD7qPjOvKNpqD01FBO6qbA3I1YPhohnG7r+NSEX5u5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755804762; c=relaxed/simple;
	bh=sRLqK08OVMmJdMROYY5gLtmulSbN9W6tBOjQn6amin4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GY9JG7YU5CEpCcPXmxttJ2OtY2cnqsUn7sU8eNhmOhZiiccHoAWoCwv/BzJhOp1VOn+SpoGlEvgdZYFmu4opeKfzEKp9NKLjvZxS8mv8QKwjhp7w3rmW+uQnSLM+/RsekLkGabZTUzLWJSy8DR0SJQ/rVU0zdfEXUFqeGalLHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLXP3D0G; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7347e09so232401566b.0;
        Thu, 21 Aug 2025 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755804759; x=1756409559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRLqK08OVMmJdMROYY5gLtmulSbN9W6tBOjQn6amin4=;
        b=kLXP3D0GdpGn51+ZsUaP2MEHSX2Q33tZZlFswOXBJsvILakqTl7RYgYNQFtA97MXFr
         1lbh8upjt3koMnpNYag2nJRwA7fXW9CUS5njs9dALpRarY90XdFBWUSMRUen24st99eN
         VN5CYGQOcCPk35FqH8yeD0DvUoSCYYCQZ/kdjpDFVq0Dj5P3vC+fPZEQ5CcJMOdaMdPu
         lCy+HPt1LhwPc8RL0ydz0wsuHdm9FVwmZouqDC6PQf6lLI19XSGC00z+MlihY4xHnZVa
         nvsrsxEeCcBPHfUS7UpOkWS+s2OuEU470SRZqn7qrQ9RZ9JjJ8KyTvgTudkp1DOLxYVO
         hs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755804759; x=1756409559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRLqK08OVMmJdMROYY5gLtmulSbN9W6tBOjQn6amin4=;
        b=AkJvQ7p7yotp9kMj7OsWOB2zUnE5ETg8eomEjvvCaUhl+ROqOZ3IDlCuZwAvmWoegX
         EZ17g0+gujjhPKngP/l/qwa2YD8w5svwTeVTnUQfbzH9h7n09R9ZqAio6/kKkZQ9+rjN
         xC6i0f0RBQSDNiYKTzEVOIcvn0Wj1IPw6J0yRTXvBedwvs/gWNsULNqK+dD6+37hpni0
         SCSABf3tmmc7oNfuulKQViInFQRIucefg0g+e7cyZspcrB2yoZ9IJL2Ho/XKWulvvuJa
         h6t6Kn/wGHJyFXhI7qS3IRErUWWHZhXGeia/+Nljh2s4nci+SX8LeylK8Ay24sUFchwP
         ZPiA==
X-Forwarded-Encrypted: i=1; AJvYcCWF8FanzAGGZySug5SmvnBrcz6DBuBvKp4eAtrPwhJ31KVmroLA6x0Az2vhswUZ8LBlux5/kf+6MzGk4uqZ@vger.kernel.org, AJvYcCWQx1DEG2XbWtMUZclo1qhrHzLJ4b4cKLSRsayrfhM9un7kYNS+1MErrZy7Ib7YMdnpEB4jvy15EqQ4@vger.kernel.org, AJvYcCWwDNg7dVSgYevvreDJgMY1T4AtjMVG+nSRk4mWBWaqXhykUwTudxY3va5GodzSEn95PqdR8TyP6yOX8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1cKUNakXZc8chc1yGFPjMLzZzwoUZ2jNGHq5nJtbDbpA6E0Wk
	7vM6vNV0remKbqotj4VREciwXu1ZoBEofGPzLmqFp/rCPC7lor3vwce+o/92xRiy4cwefi2oTn0
	V5EzL2ul8p/NmHIs60jBibNML+WlWkic=
X-Gm-Gg: ASbGncsHwmn0t6oUh2y0Gie8M6MS10skwTLHhoNtYdLdISV9F++oE07tQZcschz2grg
	kCCYwbWDxhNGfhAytDHnVxkNHiF05RAvsHgg7QBjeX2gsj9+yguFdrgvc4Jap5hWX9HoAqj8tUN
	4OK/tnzZybdOAJgwYTtnE6faxMBnWdibTz+dFLADGD9iOR5jKWRKpau89alf2Yw7X/mDx4ZYDq6
	FaL+A8=
X-Google-Smtp-Source: AGHT+IGOIbVKqBj+vmRS/jNj35fqo6hWeIQ+/QWsSjigHRPAp04Gjd/a80YAnw+ewLJoCZCFVYccVfOoYsqlgEeXGU0=
X-Received: by 2002:a17:907:9305:b0:afe:dd9:de22 with SMTP id
 a640c23a62f3a-afe29636c7amr26949366b.56.1755804759066; Thu, 21 Aug 2025
 12:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
 <20250820191039.4f8af41e@barney> <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>
 <aKdNBhpNofchexgb@xhacker>
In-Reply-To: <aKdNBhpNofchexgb@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 22:32:01 +0300
X-Gm-Features: Ac12FXyjIQRwKlj3uPfKIF3JpppwdcYeB0_SHnmwLlcXBwK3Cn364srz9mf2Mt4
Message-ID: <CAHp75VfG3mZsBMTeg0nwDJV2PKG=M+UAst4fy05oh+Df4YGL8Q@mail.gmail.com>
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 8:02=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Aug 20, 2025 at 10:04:39PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 20, 2025 at 8:11=E2=80=AFPM Michael B=C3=BCsch <mb@bues.ch>=
 wrote:
> > > On Wed, 20 Aug 2025 19:54:44 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >
> > > > > The dwapb_context structure is always embedded into struct
> > > > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 byte=
s
> > > > > data overhead for !CONFIG_PM_SLEP.
> > > >
> > > > I don't think it's a good approach to add a lot of data for peanuts=
 in
> > > > case of PM_SLEEP=3Dn.
> > >
> > > It wastes 36 bytes in case of PM=3Dn.
> >
> > ...per port.
> >
> > > The driver currently allocates the struct with kzalloc and stores a p=
ointer to it
> > > in case of PM=3Dy.
> > > So this probably has an overhead in the same order of magnitude (poin=
ter +
> > > malloc overhead/alignment/fragmentation) in case of PM=3Dy now.
> >
> > ...per driver.
>
> Before the patch, struct dwapb_context *ctx is also per port.

OK. So the comparison is 4 or 8 bytes per port vs. 36 bytes per port, corre=
ct?

> > So, I can't say it's equal, but I leave this to maintainers to decide,
>
> What in my mind now: this is linux rather than RTOS. After greping the
> the arm/arm64/riscv dts dir, the max port number is 6, the berlin2q
> soc families, so this means current we have wasted 216 bytes memory which
> is trivial compared to the system memory.

Maybe, but this should be clarified in the commit message. And again,
I have no strong objection on this part, but it needs to be described
accurately at bare minimum.

--=20
With Best Regards,
Andy Shevchenko

