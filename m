Return-Path: <linux-gpio+bounces-26192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A03CCB58F5A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 09:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C84C1883D7E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 07:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED8D2E9ED8;
	Tue, 16 Sep 2025 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEENcxvQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0B23C503
	for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758008388; cv=none; b=ArEnpwr/r0j/doCacB9cMczqD+HHb2gm7GV6Tjx2cxhbolu6mH/jZOVaCushSdEkMrKj1Fw+FVsl/IaWZzvJsb16K4TimxPmbjV8RBsBiaNXggsrFQh9znf8Z8DanAKS19bsfUifZVYMWlEKhFHWaDQSq70dBozTyqHumsCPlq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758008388; c=relaxed/simple;
	bh=XoB+OzhyLjMMIrMA0rQ+0OXn6lzikVJHp7B5+SOH7dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjhzYfkCRUwGOvTWu8yiBnOGCIlQApwV7lE8ERMSADcIA/cHe6Sy5zoC6XBV5+GIV0LmP0CWjRzcxPlGQ7I1Di/voQSAcwY78LAXPfGw4YRnq2R41re4r9LdPJ9InhEF+EPw1wQ+lVURfrXBXGlyaWIa4tgcpLwnleMEqrruMSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEENcxvQ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b07e081d852so507417466b.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Sep 2025 00:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758008385; x=1758613185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3XTiMlvJO8mlmTHYf2uSmSxyHM/WA6fLtiUKALlvfQ=;
        b=kEENcxvQsEzIaa7UW9Lh+kWmCaAnic8wO6MCUpOIdbK9OFwa6S6tBBRtkI5bTUd+OZ
         gAFmI0CIJWZyznK7vkS2Hjb8cqYqCn0kPiOsQGh/0+b8Amfu1jc43dYev4ZJjpa7vcMP
         ggMz72O4n98U60u1alAiaMA3Kfy31Pf5V0bwlVWLrEhwm5tQ0XmmT8nrLw5NlMHlZ81O
         9Zs7CCU69CvxFB4xAAQqJ4+0lGtA1nwpKhiQWGudST7gIFEsuzeqguC4Go3RvFtYIA3o
         TQc9fAQvciC39eCR63ueB0H1KcbNaSDHkdBymbv4k6M+43aS3KQtqF7gMtGlvnDG1zuW
         DMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758008385; x=1758613185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3XTiMlvJO8mlmTHYf2uSmSxyHM/WA6fLtiUKALlvfQ=;
        b=fxpIFL0d8Ox6dc+mDbIkAJ7zOOiIobI1yTRAx6cvQJUFqZLyol+qPMxt/MvicYa3eB
         t7Rxumj17fSeVLK5xjhvo0ZEQlGCAXgHKnO//+SoL7ugzv48hbcEIgSgBGZ1KqgYCF9g
         X1A/JqkuMiTZTXpg6BpwDnnYnuZpzk6GDCa7a9Ti90VGhgP7TwbHsNGCcrYJ348hoZxe
         XhbxK41a0XAeWYXT6cChjDUtD0KskdvbcoGI8YWcLmw365O0EOpm2DWhh/Xkooqm2gHf
         LxFmQQhAwuvawm+ptKgoqkJj/YOoiFUltUs0pgbhcxYX4k+cdfSv/gFO38sX89YiCbLu
         1qIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCdMFT+xPsmQurqAbv4rTPoT2bTzNBHrRHmtnoInwI/U5U0BYAz+9v9oqEWY2CrpfyOhxFaCXxicBm@vger.kernel.org
X-Gm-Message-State: AOJu0YwNu6NV/0Wspv9jEIJZ4cJMd6rUegCd6ViObQfDWepunJeVwna2
	HHo2XMQ1G2p38zXb7k8AXjOtBN+F52c4j/dOOv9AGuffyhqoULi0L/1QG7ThEScqmrBTMDWZdlg
	GaK7bs69Kar9lkfn6rZCbvYdOksEQSuU=
X-Gm-Gg: ASbGncvslf4cj+xpQkyzoI2TuVsyDu1nJquNlBxN175D8UY7Gqc8lfuQv6LNBAh3PR/
	+66o8JJX2fuRLvIwY1YkCaNiQjkXn1XW0wdSsESVgLJ39LsG5ZuYQEEEkqZkY5skqO4X7bHOE9x
	A+2a8KPS2je6vRWAK+CNbotq0orYLxhZsjnY8lmgACRD0j2yeLot8YA2khV1G2N1/c7sW/XFA7f
	wzHpPM=
X-Google-Smtp-Source: AGHT+IEMnYQLIWob4dmtm+nj5rKSlVWXqa7PK5rY3AyWbww75K/iBnhDUqGxeMEe+7F3bHj2pnYgfITn4IVVtFW+MaE=
X-Received: by 2002:a17:907:3d89:b0:b04:5a04:c721 with SMTP id
 a640c23a62f3a-b07c35bb185mr1622963566b.20.1758008384475; Tue, 16 Sep 2025
 00:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915-bd79112-v5-0-a74e011a0560@gmail.com> <20250915-bd79112-v5-2-a74e011a0560@gmail.com>
 <aMge0jYwYCiY72Yb@smile.fi.intel.com> <0b97adc3-4d77-480f-ace9-a53403c62216@gmail.com>
In-Reply-To: <0b97adc3-4d77-480f-ace9-a53403c62216@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Sep 2025 10:39:07 +0300
X-Gm-Features: AS18NWCL5eaiU9kjPmoeETzN5n1gY3q0IV8sS1nCkCD9VoJ4-xbLUPvGwjaVww4
Message-ID: <CAHp75Vcwy47iqNYd4Q4A_X+BSLrFrHyqA2E2kcwbshm1badFqQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] iio: adc: Support ROHM BD79112 ADC/GPIO
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 7:48=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
> On 15/09/2025 17:12, Andy Shevchenko wrote:
> > On Mon, Sep 15, 2025 at 10:12:43AM +0300, Matti Vaittinen wrote:

...

> >> +    data->vref_mv =3D ret / 1000;
> >
> > I still think moving to _mV is the right thing to do.
> > There is no 'mv' in the physics for Volts.
>
> I can see you think so :) For me it doesn't look good. This is in-kernel
> C-code not physics textbook.

Yes, and the science is superior to the users of it, isn't it?

> For the kernel C it has been convention to
> _not_ use capital letters (or CamelCase) for variables.

That convention is for normal variables, the variables that uses real
physical units can be better recognised as such.

> This convention
> is strong enough reason for me to avoid mV in a variable name because
> the capital letter instantly requires my attention and makes me need to
> consider if this is "just a variable". What comes to the vref_mv, there
> really are no true downside. It is clear what the _mv suffix denotes and
> "there is no 'mv' in physics" is really an artificial problem.

Common sense should be used and not some stubbornness over a
"convention". Convention is not something that is carved in stone and
mustn't ever be changed. And here is the exact example, that sometimes
conventions also suck. And the problem is not artificial, the units in
physics are unique in a representation. If you make them all in
case-insensitive, it might be a room for a collision (I can't provide
one from top of my head, but something like 'k' for 'kilo' is not 'K'
for 'Kelvin degree')..


...

> >> +    devm_spi_optimize_message(dev, spi, &data->read_msg);
> >
> > And if it fails?..
>
> I am not really sure under what conditions this would fail. Without
> taking a further look at that - then we just use unoptimized SPI
> transfers(?). Could warrant a warning print though.

What is the point of having devm_ variant for it if it never fails, please?

--=20
With Best Regards,
Andy Shevchenko

