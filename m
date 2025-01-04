Return-Path: <linux-gpio+bounces-14509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7816A0160D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 18:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30F0D188456E
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 17:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1658D84A5B;
	Sat,  4 Jan 2025 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUJslbs7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF51C01;
	Sat,  4 Jan 2025 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736010165; cv=none; b=k2ubUGwe4IjbMYdJi+L1aic2wlZSZsGLIe4X1eVy81Cs1tD+7xIkX288a/zK9V4YGUUArentvhN4NM274sJnU4TwUdHzX2NlUGfrU+T33Coo8Fzqldb6OwEYbzYJZ9gg5qoZjnvjQhzD8DiLxM9vaIfaXu+xpQA0H0f9mNByOPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736010165; c=relaxed/simple;
	bh=hEzmAPDH/52cDU+ucdu5ERhj90OuThiUw1I3y3S9P7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3E8WLtF14WTp4ulNz1HHsVdYpG4wr0EFMlosZfV1QOt1MBlY6GdxsiOIjTfrFBepruVcpHLRQo9kdfDuhNsK1Iq+6DgWFNKSqhKhs2qqNH+EVTUKnx1f0pk4sZrXpKEarq14rKZPcogDGJfQNfifDMSqdqx5aFoNxo1t8KirRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUJslbs7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215770613dbso136806575ad.2;
        Sat, 04 Jan 2025 09:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736010164; x=1736614964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEzmAPDH/52cDU+ucdu5ERhj90OuThiUw1I3y3S9P7Y=;
        b=DUJslbs7UEWx9yk00jkzYDVs53sQoopXgq5cTRB6hWyoGfvRwGULn0P3i3apeoYnyb
         4egEejncZM2xgR4XegP8+uGG5Od7wJ4AfGd1zWFjw0ujIfjWPhx6AIxgX2dy7E/YGTU2
         zO4UZNuAqFg/dABfpWUok+IcMiC2BhbWv0prTeCkJ5idi0sOOVt2mIl5ybCHktSUNcMx
         IKy6miE5kBnE7U08Qn9E6pLf3fZMyOcdQ2FhV9DWPZuYsIIHHHah2MqHqQOeWy9ZXZPr
         GUJ6o1ZrKw7BSp1ItGael+5vlI9KRl/ErvUObQ4lvOpyof25soh24kaEIDTELN2BkGmh
         G06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736010164; x=1736614964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEzmAPDH/52cDU+ucdu5ERhj90OuThiUw1I3y3S9P7Y=;
        b=m4ufoCETN0Nh59OKmUH3hj3krkZhYgreJle/nUSyllbkBTkystKMu7PoUXLrWT0mZo
         5+TxYIx/Z4sTmbxXWI2NvQt8EBI6GZRJ82vauv/il5kse7jCBUheko9ksQVR1n8z13LQ
         oaWECG+Xq0LsKYqBkgx5N6no84BW6ZEF7x3hhuEq4GhWbyNU7lh9JGNrKAWmz+4ESLGz
         8D33DI5ekMANj5AyC/MoZabxNJEI/Do/leH20NrTDAanLAnWFPjC9yPZcTEu+1NR5Wbk
         AGyNVqUI6XbspXg4+Sjex9WaBRakektdEjE4zu63rvXS6+FADuYvkGl2VUTfvoIdLY64
         lHfw==
X-Forwarded-Encrypted: i=1; AJvYcCWhnzlotXwHAR4Xo5vvuRPX+tpHsDUqNLVYUpsT2YNQYI4IMfiOOlKQ0t5fmJwL2XJWZ5+XGbFEOMn47TSs@vger.kernel.org, AJvYcCXd6AD2E7GXOuwGytEk9k9RQ5KUyvH329cNmI13NwQg2bWOwiQgnvp/ARBqQbfAq1uSelhBeXt2QpxR@vger.kernel.org
X-Gm-Message-State: AOJu0YynpMeGUpkgMmtUXE166/K/RoELbivyN7PTmS8lIkF2zebW/ZqD
	dIJkt+VmB/1HvTc6c6H3fPG/UIjJXyAT6M2ji+06Oh0fONNJMwW3Wn7VedtnEx0YYef+EYNz+rN
	zmRXu0RtQxZVhuCPwH90Gec/RVZc=
X-Gm-Gg: ASbGncsNl44KN+e4fRIE9+r2UCZxu17n7yWDTIu+z4af+x81qhBv08VMUG3YEMQz2rn
	tC7S8trQ+FoqFeRvIEaRrVtZmQwx2Y4+VNcV8n/Q=
X-Google-Smtp-Source: AGHT+IE3bzvqI3HpUO2xjiJQFOPU2FsP430Bts9EQVpWtYJZlZ1sGUHTio/ZZ5ObfrJP/+eWYgfkVHLEtjGGvuabnsY=
X-Received: by 2002:a17:90b:3cd0:b0:2ee:a76a:830 with SMTP id
 98e67ed59e1d1-2f452eb3279mr81708050a91.24.1736010163716; Sat, 04 Jan 2025
 09:02:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
 <20241224103645.1709996-1-noltari@gmail.com> <CAOiHx=kvsCx0cd5C8eza-V7H+ML2ff5zB=vjM6zDmb0A7d16+A@mail.gmail.com>
 <07a21d3f-539e-4609-bc60-ff320935db8a@gmail.com> <CAKR-sGesWUbxQY6SmeW4mGM_89=SkNMbL=TJJQtAiDKMjC6y+g@mail.gmail.com>
In-Reply-To: <CAKR-sGesWUbxQY6SmeW4mGM_89=SkNMbL=TJJQtAiDKMjC6y+g@mail.gmail.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Sat, 4 Jan 2025 18:02:07 +0100
Message-ID: <CAKR-sGeyRkJ2Mo2rObVyNRcupo3FXvCn0vbZPW0rzyCdjxK-+A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: Kyle Hendry <kylehendrydev@gmail.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El s=C3=A1b, 4 ene 2025 a las 16:44, =C3=81lvaro Fern=C3=A1ndez Rojas
(<noltari@gmail.com>) escribi=C3=B3:
>
> El vie, 3 ene 2025 a las 4:04, Kyle Hendry (<kylehendrydev@gmail.com>) es=
cribi=C3=B3:
> >
> > On 2024-12-30 08:42, Jonas Gorski wrote:
> > > Hi,
> > >
> > > On Tue, Dec 24, 2024 at 11:41=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez R=
ojas
> > > <noltari@gmail.com> wrote:
> > >> From: Kyle Hendry <kylehendrydev@gmail.com>
> > >>
> > >> There is no guarantee that the bootloader will leave the pin configu=
ration
> > >> in a known default state, so pinctrl needs to be explicitly set in s=
ome
> > >> cases. This patch adds a gpio function for drivers that need it, i.e=
.
> > >> gpio-leds.
> > >>
> > >> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> > >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> > >
> > > bcm63268-pinctrl implements pinmux_ops::gpio_request_enable(), which
> > > should automatically set any requested GPIO pin to the GPIO function,
> > > so explicitly requesting the gpio function for a pin should not be
> > > needed. Is this not enough?
> > >
> > > Best Regards,
> > > Jonas
> > >
> > >
> > I assumed that as well, but nothing I tried worked with gpio-leds.
> > gpiochip_generic_request() does call gpio_request_enable(), but gpio-le=
ds
> > uses devm_fwnode_gpiod_get() which looks like a different code path. Th=
e
> > only place it seems to be configuring the gpio is in create_gpio_led()
> > where it needs a pinctl node in the device tree. That's just my reading
> > of the code, though. I haven't set up a ftrace to verify it.
> >
> > Best Regards,
> > Kyle
>
> As Kyle pointed out it's not enough and gpio_request_enable() doesn't
> get called from gpio-leds.
> I will try to investigate this and report back.
>
> Best regards,
> =C3=81lvaro.

I've performed some tests and so far I haven't been able to get
bcm63268_gpio_request_enable() called.

Even exporting a gpio from userspace doesn't trigger that function,
which seems strange because in that case we won't have a "gpio"
function on the pinctrl for that gpio, even with this patch...

Best regards,
=C3=81lvaro.

