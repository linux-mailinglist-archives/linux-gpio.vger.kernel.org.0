Return-Path: <linux-gpio+bounces-7741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6EB9198F9
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 22:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 067971F2287F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 20:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8583192B86;
	Wed, 26 Jun 2024 20:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcThmRml"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3028A14D6E0;
	Wed, 26 Jun 2024 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719433523; cv=none; b=GSKzs5uLQhoNeGtBXGQeivoMwbXnZbjA1KFWbP+8Nw0bxBe3rgy4aecMc4cT6y/QGo6fSy/EnN8a6IAv2k8YefwHmR8AI60kyTMFypUU/7oE2if+rk37B+kcEGcg8fPmzwxRWgFUuRchL3SlNi2knKmwXPTzcnzhJsjQvrKvc6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719433523; c=relaxed/simple;
	bh=bXnsKoQlFRWKE/Kqj3rG+nEV/FIbGm7+0IElUdQkPh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F++NoXSCR9bPSR5a7nPUO9I/2ek4h27TKOQdhL9dSTCXVQHGez5d32r2rwYINK/T1H9wDe0my/lcDFZ1maJQpJkolUcXahvKlCiCQ5rYtBcyEVSwMNfbbZLsPb+jOCFaaxHfEULI9Pcl9Wrnyh6rhVkdKD4A3sS+vrjGfOHjk8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcThmRml; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-70b2421471aso5100774a12.0;
        Wed, 26 Jun 2024 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719433521; x=1720038321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C25YYiC2WNu21T1b0cVtI4tk41q3wRpCVhNSAMWc2DU=;
        b=FcThmRmlg34msxCsA8Ts7VzgO2h4Z+0LN4e461AXtDYHvvlUxpWNYqOidi2CgzV5Er
         Wiu21aFDrZJm45lQOrc7zt0ew9X19JlUJsZtjWgMAH3+StnxbICJjFiUNpjuzqpugEHj
         RFV/BXZM8hLO6r1rqeAAeBzdYMO5oUG1ajHmd6KTALwXDPzFcgFQUfT0XHVOKrmENJ/d
         W4DWmJfJEr2fdVi28NEMRi8pRSzrIuafQjDWCKVyRrAv4dj//cNAX1ng9r3b3EvI7ugl
         9qOva9epCzX9cT1RCRsU6JzusJ77AZFLOMpP9hgwxd/rrTv4CjPLYn8Pbczt6XOQIID1
         q16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719433521; x=1720038321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C25YYiC2WNu21T1b0cVtI4tk41q3wRpCVhNSAMWc2DU=;
        b=XgmI159AT+SdCZCZYI6KWLFWdhM3F8lt/1QWqhka9/Dp+qQjcnfyCSg/U2f+cb+/Os
         /1DGcTo+lFrlOtFAd9nzGSdZPZ2zSZCRumLPm2tYD97TUm2xj6VhIEynbmCnurcMnejc
         ulIGn2o9z7dG+No5zYv1Rhzuz8h3D9J9Hx7ix/G8iGObC6vzlkXdZrTtGpQbaDPpraXc
         KKt1KjRxar2OvsqyGQThxT2xd0q56zMC+J2PVasRdJv0M8ZUCsg7MmgNpuDNX2Ft9CBH
         A/MBDsklX2a8E1ql21qjaKXr2dclfsyU06s2EKY4I3XtMwhpoNEKU5wd68ayANv7mrCs
         G/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Xi+XZmhDubtkHUv9sW3PUgJ3f1J3KWjNAxVsSixdvWny1Nbvxt935DjursC+JqDYdo0TXJfHdk5egEYBsyyMPp/jkEBjDJ1knPOOMPqD93kS7Aj6iORkjyv673Tshv6AoHqZFitupw==
X-Gm-Message-State: AOJu0YyT97MSv+/NFPfANuZW+ROEyOE5QYXPC0kl+KeB/DtsIXO1VSTU
	YHupHPo4yfGLadvOoQjw2a8s9VZkJoBc3o9kCyuKLRxfEsJeoE/v9q1Enl1qdlsO9GAxhS8dGF0
	t2naRm++AmdVDfSFugwBHUCd4GOI=
X-Google-Smtp-Source: AGHT+IGnaYA28KwX1u4NDP+03cR0Lmwca3+23l/9sE55l7W12h7tBAFS/aH9uLvii8tyYrhozhkpdFkMoQJ/KiY7MJ8=
X-Received: by 2002:a17:90a:602:b0:2c7:146e:a207 with SMTP id
 98e67ed59e1d1-2c8613ee72dmr9948526a91.22.1719433521336; Wed, 26 Jun 2024
 13:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
 <PH7PR12MB7282BBF9E42265E18CB72E09D7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
 <CAOiHx=nssvX-VYySmpLZ8bvBmitT87bX2AYspdkH3y9iWTB+kQ@mail.gmail.com> <PH7PR12MB7282028713977D608DBC046FD7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB7282028713977D608DBC046FD7D62@PH7PR12MB7282.namprd12.prod.outlook.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 26 Jun 2024 22:25:09 +0200
Message-ID: <CAOiHx=m5bqsCV984L6M11rsWgrW-wDj6jFh9tSBDyKq3+ixOgw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Shiji Yang <yangshiji66@outlook.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Mentovai <mark@mentovai.com>, 
	=?UTF-8?B?TMOzcsOhbmQgSG9ydsOhdGg=?= <lorand.horvath82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Jun 2024 at 21:59, Asmaa Mnebhi <asmaa@nvidia.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jonas Gorski <jonas.gorski@gmail.com>
> > Sent: Wednesday, June 26, 2024 11:21 AM
> > To: Asmaa Mnebhi <asmaa@nvidia.com>
> > Cc: Shiji Yang <yangshiji66@outlook.com>; linux-gpio@vger.kernel.org; L=
inus
> > Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>=
;
> > Andy Shevchenko <andy.shevchenko@gmail.com>; linux-
> > kernel@vger.kernel.org; Mark Mentovai <mark@mentovai.com>; L=C3=B3r=C3=
=A1nd
> > Horv=C3=A1th <lorand.horvath82@gmail.com>
> > Subject: Re: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpio=
s"
> > Importance: High
> >
> > On Wed, 26 Jun 2024 at 17:00, Asmaa Mnebhi <asmaa@nvidia.com> wrote:
> > >
> > > I am not sure this change is needed?
> > > When I initially submitted " gpio: mmio: handle "ngpios" properly in
> > bgpio_init() ", It was specifically because I have a 32bit reg access b=
ut only 16
> > gpios. Initially, I did not add the else and so Andy suggested to add i=
t with the
> > roundup_pow_of_two to stay backward compatible. If your system is a 32 =
bit
> > arch and you only use 16 Gpio bits, why don't you configure that in you=
r DTS?
> >
> > Because the registers in the datasheet are specified as 32 bit wide, so=
 defining
> > them as 32 bit in the dts(i) is the most natural way of defining them, =
even if
> > they may use less than half of the register for gpios. And on big endia=
n
> > systems you cannot just use smaller accessors, you also must shift the =
register
> > offsets. So this change broke existing devicetrees.
> >
> > And as other theoretical arguments against doing that, less than 32 bit
> > accesses may be inefficient, or the bus where the registers are may req=
uire 32
> > bit accesses. And finally, the caller explicitly passed a register widt=
h via the sz
> > argument, so we should listen to the caller and use that, and not tryin=
g to be
> > clever by changing the access width based on the number of gpios. At le=
ast
> > not unless the caller explicitly requested that. Like e.g. make 0 a spe=
cial value
> > for automatically calculating the number of bits based on the number of
> > gpios.
> >
> > If you only use 16 bits of the 32 bit registers and you want to use 16 =
bit
> > accessors, IMHO it's up to you to pass appropriate values to bgpio_init=
(), and
> > not hope that bgpio_init() will fix this magically up for you.
> >
>
> It was definitely not my intention to change/hack a 32 bits reg access to=
 16.
> I agree with you that bgpio_bits should just not be changed. Maybe the el=
se statement introduces a bug/hack in the case where ngpio is already a pow=
er of 2 such as 16 while the register access is a 32 bit access. In this ca=
se bgpio_bits would be 16 when it should be 32.

It definitely does, as currently ngpio 1 - 8 will cause bgpio_bits
will be set to 8, leading to 8 bit accesses, 9 - 16 will be 16 bit
accesses etc.

>
> However, Shiji's has a bug and will break other code. My very first patch=
 for "gpio: mmio: handle "ngpios" properly in bgpio_init()" was meant to fi=
x the following problem (that shiji's code will reintroduce):
> " bgpio_init uses "sz" argument to populate ngpio, which is not accurate.
> Instead, read the "ngpios" property from the DT and if it doesn't
> exist, use the "sz" argument. With this change, drivers no longer need
> to overwrite the ngpio variable after calling bgpio_init."

And this is a very nice thing to have! No objections here.

>
> My v1->v3 patches were only changing ngpio, not bgpio_bit. Please check m=
y v3 patch: https://lore.kernel.org/lkml/202303050354.HH9DhJsr-lkp@intel.co=
m/t/
>
> After v3, Andy asked me to also change bgpio_bits. Please see the whole t=
hread:
>
> > > > >+       ret =3D gpiochip_get_ngpios(gc, dev);
> > > > >+       if (ret)
> > > >> +               gc->ngpio =3D gc->bgpio_bits;
> > >>
> > > >But this doesn't update bgpio_bits in the success case. Can you expl=
ain why
> > >> it's not a problem (should be at least in the code as a comment).
> >>
> >> In the success rate, the bgpio_bits would also be equal to "sz * 8" an=
yways.
> >> The argument " unsigned long sz" passed in bgpio_init is specifically =
for this purpose. That tells the gpio library the gpio register access size=
.
> > >if (!is_power_of_2(sz))
> >>                  return -EINVAL;
> > > gc->bgpio_bits =3D sz * 8;
> >>
> > >If in the success case, we make it dependent on the ngpio value, we wo=
uld need to round it up anyways to the closest (power of 2 && multiple of 8=
) which is the same as "sz * 8"
> >> I will add a comment in the code in my next patch.
>
> >I believe we should use only a single source for what we need. If we
> > rely on ngpios, the bgpio_bits should be recalculated based on it. The
> >expression doing this is very simple. Something like round_up(ngpios,
> >8);
>

Right, mistakes happen. Also I don't want to blame anyone, because it
happens to work fine on little endian systems, and big endian systems
are so rare it's easy to forget that they exist ;-)

>  Now, if we want to not modify bgpio_bits, we could go back to my v3 patc=
h.
> ngpio is the number of gpio pins supported while bgpio_bits is the regist=
er access bit type. These are 2 different entities.

Exactly. And AFAICT this patch does exactly this, restoring the code
to the state of v3.

Best Regards,
Jonas

