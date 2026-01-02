Return-Path: <linux-gpio+bounces-30081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E37CEEAF4
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 14:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF0033013545
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 13:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E631FC101;
	Fri,  2 Jan 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZJoR2dh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61B9242D62
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767361095; cv=none; b=sOFn9GXO/HWsgAUCz5G3tPkCQrPkhHxSHcFIjeaKFZ6AJBwSBqkMZ63L8LSIng0ClbIDd32kZusTPeO/0NLHuQ0Twd2XQajMmOBA4CO/UWd+uPsdVjP5LKBp1CIj3gKbcKe89GPIN0+ZmDAU2pBq72174y1Z/6+ubfAy360cdTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767361095; c=relaxed/simple;
	bh=gq+78Fh/gPAKqoWALmYCs3Wq8SZnDyUWpmAJ14Lfa9M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBgNSJZjbT9n2Q0egrIfA5l8nhUj3hYpcrgJQyLX6JxTSg8YvAuBSYOeqce0w6wtRQn5RZWQ0rspESdOxf5nFede0g+mNvIEsY2lyhMWl6tOqOGHVfXFb86quPqHqxqzMGKhzUCJds7HEmedE0eITXHF4Rfda6Qzs07g6OuIVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZJoR2dh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548AAC4AF09
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767361095;
	bh=gq+78Fh/gPAKqoWALmYCs3Wq8SZnDyUWpmAJ14Lfa9M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=CZJoR2dhd3AvgA42ulIUoDPndc0HhGe2/B0lTkgiorXqXwGPvO1J46zmiD1zATfEF
	 JnmANo/5dpSiK3Ipj//Et47GbCRIWLhKHUXdVMoczQjHSD/IdwILNB0xe4tkulTAW2
	 FCpsVjHYIAfjAx98lQDVVuW8NwT6GtA5nWfR2n4HAeyp9bExaiEfmip/JdYPyZdhnO
	 sYJ0Ig/x5ENnJhEkBxB84BnjAhC3etu+UG926KsZFhBwBEuNxAUrb3aylZTZ4MjypU
	 eU2UB2dOYatljrVaJY7Asy1Wj4avkc8/532VIn0yaz4gQ4Q2oGLTz6+0GTQ9OJCf1Q
	 HYRrk9xTRpZVA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b97e59520so105043301fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 05:38:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWl7tCukvFXL27XIfFpviIjzniyiuwmCLQa3SkpjQcYm0zXKQM7Mt0dgjuPy4/wnGacwd2qZHxxrjm7@vger.kernel.org
X-Gm-Message-State: AOJu0YwUpTfD+TuwnMXKmv3msM4Sutq0ZKQVNefTtG2fAqwc0Qd4z2JL
	YABnXbDP1vjTnMhE4S6/XDbLVnxdRaP85HZtH+QzH+BQyQIrm6FzySZguOIC+JDKsIqHoZDQx+u
	fi29Rg+ViOyCvG2WdTYEaKLwomtQzS8SMxJNPj3fo/g==
X-Google-Smtp-Source: AGHT+IGuDMXwA23bDwSJce/Vd9d45irhKXefXohA/Hh2xht/kdpdJ9akMojcELSe93u+/GpGxclkCRihGnFWklcOYY8=
X-Received: by 2002:a2e:bc18:0:b0:37b:a32b:ed41 with SMTP id
 38308e7fff4ca-381215c5edemr119052751fa.18.1767361093846; Fri, 02 Jan 2026
 05:38:13 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Jan 2026 08:38:12 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Jan 2026 08:38:12 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260102122045-GYA2060493@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org> <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
 <20260102113643-GYA2060252@gentoo.org> <20260102122045-GYA2060493@gentoo.org>
Date: Fri, 2 Jan 2026 08:38:12 -0500
X-Gmail-Original-Message-ID: <CAMRc=Meq8T_HJwDvf3wm5W2+ZFuHezGjqQx6sj-6HNJhThKjhg@mail.gmail.com>
X-Gm-Features: AQt7F2qd6dFpn0yYdBOT3j_jTKwwJxkbKKmPhd6nOCJ-bhAWcdN7_KfX3YW0ch8
Message-ID: <CAMRc=Meq8T_HJwDvf3wm5W2+ZFuHezGjqQx6sj-6HNJhThKjhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Jan 2026 13:20:45 +0100, Yixun Lan <dlan@gentoo.org> said:
> Hi bart,
>
> On 19:36 Fri 02 Jan     , Yixun Lan wrote:
>> Hi Bart,
>>
>> On 12:10 Fri 02 Jan     , Bartosz Golaszewski wrote:
>> > On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wr=
ote:
>> > >
>> > > SpacemiT K3 SoC has changed gpio register layout while comparing
>> > > with previous generation, the register offset and bank offset
>> > > need to be adjusted, introduce a compatible data to extend the
>> > > driver to support this.
>> > >
>> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
>> > > ---
>> > >  drivers/gpio/gpio-spacemit-k1.c | 150 ++++++++++++++++++++++++++++-=
-----------
>> > >  1 file changed, 106 insertions(+), 44 deletions(-)
>> > >
>> > > diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spa=
cemit-k1.c
>> > > index eb66a15c002f..02cc5c11b617 100644
>> > > --- a/drivers/gpio/gpio-spacemit-k1.c
>> > > +++ b/drivers/gpio/gpio-spacemit-k1.c
>> > > @@ -15,28 +15,19 @@
>> > >  #include <linux/platform_device.h>
>> > >  #include <linux/seq_file.h>
>> > >
> [snip]...
>> > >  static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
>> > >  {
>> > >         return (u32)(gb - gb->sg->sgb);
>> > > @@ -60,13 +70,14 @@ static u32 spacemit_gpio_bank_index(struct space=
mit_gpio_bank *gb)
>> > >  static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
>> > >  {
>> > >         struct spacemit_gpio_bank *gb =3D dev_id;
>> > > +       struct spacemit_gpio *sg =3D gb->sg;
>> > >         unsigned long pending;
>> > >         u32 n, gedr;
>> > >
>> > > -       gedr =3D readl(gb->base + SPACEMIT_GEDR);
>> > > +       gedr =3D readl(gb->base + to_spacemit_gpio_regs(sg)->gedr);
>> >
>> > Since you're already touching all these register accesses - can you
>> > maybe provide dedicated wrapper functions around readl()/writel() and
>> > avoid any file-wide changes in the future if anything requires further
>> > modification?
>> >
>> can you elaborate a bit further on this?
>> I don't get how a wrapper helper could help to avoid file-wide changes..
>>
> here is my attempt to solve this, define a macro to register address:
>
> #define to_spacemit_gpio_regs(gb) ((gb)->sg->data->reg_offsets)
>
> #define SPACEMIT_GEDR(gb)      ((gb)->base + to_spacemit_gpio_regs(gb)->g=
edr)
>
> 	gedr =3D readl(SPACEMIT_GEDR(gb));
>
> please let me know if this follow your suggestion or not
>
> --
> Yixun Lan (dlan)
>

I was thinking more of something like this:

enum spacemit_gpio_registers {
	SPACEMIT_GPLR,
	SPACEMIT_GPDR,
	...
};

static const unsigned int spacemit_gpio_k1_offsets =3D {
	[SPACEMIT_GPLR] =3D 0x00,
	[SPACEMIT_GPDR] =3D 0x0c,
	...
};

static const unsigned int spacemit_gpio_k3_offsets =3D ...

struct spacemit_gpio_data {
	const unsigned int *offsets;
	u32 bank_offsets[4];
};

static void spacemit_gpio_write(struct spacemit_gpio_bank *gb,
				enum spacemit_gpio_registers reg, u32 val)
{
	writel(val, gb->base + gb->data->offsets[reg]);
}

Bart

