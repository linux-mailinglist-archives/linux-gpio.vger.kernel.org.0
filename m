Return-Path: <linux-gpio+bounces-23171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263DB02353
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE2AA40683
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C35C2F1FF5;
	Fri, 11 Jul 2025 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQwzFBCb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE9E2EF2A8
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752257234; cv=none; b=nK95cHNEIfjTwBxzfcF9dPdx/Rw6dpopz3su8H2RtjptZvINrvYK2Ibic+bYGST5d5rHXN1rlVqvGq25ifFbNtj/ZbCdh7oQWZzpUhqrJfbLImjav2IFTWGjZ+SioToKtrIS0XIpWLWwiSZo4ZCrA7PC11Ft7iRe6P75V5FBs4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752257234; c=relaxed/simple;
	bh=yExFakHAJfI3qosFSAAl5RB1xxS2y15BsBL7kfeIt3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eA8AaOG8CilyluSj1rhTZFZvRz+0GS53ZFSyuFqfB1a0VLhhi4XGkRAVWzyHSXHoYjEbvCdOwI+7IHzvSQSL/olXUVrd7StKOftUuiCa5MpTi56wu8oy/O7/GLPP7shKQeJESAE+RWbZ6O5MkxL9VG7QGnAfViUr4VoZx4HY7Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQwzFBCb; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32f1763673cso31324921fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257230; x=1752862030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nv3w+fmUK+KORgHTnerP5clwh8BNPjGSYNzQTi6VZkU=;
        b=FQwzFBCb4AjO/Z2QecOvAJhHUdUr6ikaoVpRID4LuKF7AOIijQzOYyu7LeXC9ecPLi
         UzvqHJ8oyGt1gZYW7NRM3cejh65tT2CBnMdurxkRziwQXKnTbDxK1jBNNGyGph26EoNB
         gF3tOkT73OW/NRcDkAeHrPs5SKS/jAD6rxnErxYX7WzVw3iS325TJKsj5M9ARPpHmSaI
         nXxqTdl6WxHbeu4Q15vu7/tTZ5KGx7vALBrftD51EGcL8rVkHqA8fwR6SRVgWh2zcan1
         2HDsuto7H36hgTSsVNH/w8TFX3Vh6DuKKkeCNoVZsOCoJDPCnnNkR6EuKwqi5BcXF0zc
         yatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257230; x=1752862030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nv3w+fmUK+KORgHTnerP5clwh8BNPjGSYNzQTi6VZkU=;
        b=hfPE1D2EPeURXrGGBojTEwLAGob5dLksf+aalhn5i6jmKvp70tcGsWlorZAKWi+emt
         jm9tBnmUj4Vy6Yj+j01vKoqGt3Gjt1UUlAy4cKskzuelfGAkKlP+fv4WQEOJgXavUwf4
         goeHK9pmaZnIbnyw8NS4gu8Jga/8NxtDE4rboQkIxVKj0q9UU6tWYnWZAyQCVXijIt2M
         UYHkjBxcsxY2YqfIeXlfeAOYRb2c2TtQyr+AMLgfkQxbNkY1AnqvmqV6isnevEMoKTlV
         vgemrOvE1ZsatgfqzbTF1elUdn9mK0aNahSYl0Jdk7Op9rB3HbM6sQKTo7BmvX5+t4LE
         uT+w==
X-Forwarded-Encrypted: i=1; AJvYcCUDmxAY7CBxWYXOYQIpZjMvcZJf1P/aPTe4tpOkToUOtHKOpVqeAWYAgUM526vZB9Usk+Xw426cVhRB@vger.kernel.org
X-Gm-Message-State: AOJu0YxkHhf0jIFptGtq/oH0Q/THxciUdCuLp+ALiwSs/1QXSOvHq1vX
	+2Azs9eC5fmW613oCQEWOx942MDCFScS8ySSd8aVVC/JwefqV8X028db1TyefNboWT2kBZdAj2r
	U1Guikv7n/sv0/zgZRsIz7PXwyByBpy+ykqOKplnYdw==
X-Gm-Gg: ASbGncttv+nazdhD6ak9Uh+QplF6aIXdgjc0XDZVwfAlrRjYptmMwmptI3sV2pAnb+e
	dx8soKlIeyy6R8eW7zsLA0eYzttZ1HsEsakEjI6Dj0fm/Mf9G0o5bxapXl9OSkIYNsrwFA9E8ao
	gWTJlNUhCbkB1GVoKcYsOfdFGZ2RqfFVvDWZs2etHfQ587btToNfzgt5KfhaXSi4NDMARgIbVyG
	trxNlM=
X-Google-Smtp-Source: AGHT+IGIM1KxPQRBzMcvjUyIFovix8JCnhDiSC9t8kuenx33aIRcaw671XqV4qF75MRVLZo1ysDiT3HOSqWRKHB0f9E=
X-Received: by 2002:a2e:a592:0:b0:32a:5fe2:81bf with SMTP id
 38308e7fff4ca-33053411628mr14813671fa.24.1752257230460; Fri, 11 Jul 2025
 11:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com> <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
 <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com> <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
In-Reply-To: <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:06:59 +0200
X-Gm-Features: Ac12FXzkmFH9ARMnDahmUtA_lkqp-uVRKNUJ3trz8WzNmuV5X5nO7f8132IvtH4
Message-ID: <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 7:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> On Fri, Jul 11, 2025 at 07:43:13PM +0200, Linus Walleij wrote:
> > On Wed, Jul 9, 2025 at 5:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> >
> > > This is not my area, so i will deffer to the GPIO
> > > Maintainers. However, it is not clear to me what get_direction()
> > > should return.
> >
> > This callback should return the current direction as set up
> > in the hardware.
> >
> > A major usecase is that this is called when the gpiochip is
> > registered to read out all the current directions of the GPIO
> > lines, so the kernel has a clear idea of the state of the
> > hardware.
> >
> > Calling this should ideally result in a read of the status from
> > a hardware register.
>
> O.K, so completely different to what is proposed in this patch.
>
> Maybe you can suggest a better name.

If the hardware only supports one direction, then .get_direction()
should return that direction.

What the patch does is to
read the direction from the hardware and use that in the
set_direction() callback, as if all regmapped hardware in the
world had fixed direction, that's wrong.

I'd just add something custom in gpio-regmap if this is
something reoccuring in regmapped GPIO drivers.

bool is_fixed_direction(struct gpio_regmap *gpio, unsigned int offset)

or so?

Then the core can use is_fixed_direction() together
with gpio_get_direction() to check if it can do
a certain set_direction().

Pseudocode:

mydir =3D get_direction(line)
if (is_fixed_direction(line) && (mydir !=3D requested_dir)
  return -ERROR;

Yours,
Linus Walleij

