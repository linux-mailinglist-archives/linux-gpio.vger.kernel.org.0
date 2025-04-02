Return-Path: <linux-gpio+bounces-18167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA2FA78BB5
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 12:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F20B3B10CC
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 10:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B86233D85;
	Wed,  2 Apr 2025 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Fmn+kWFN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC83A92E
	for <linux-gpio@vger.kernel.org>; Wed,  2 Apr 2025 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588339; cv=none; b=K/ivE8tQUFVfHKlDSDTx2RbKBm64Y5HcLwgrc/2Kk0/WI9JG0MlxHj6NJAqIe7omv7ogpUiAeuu1dyA6UEadtFaUNF0XizBz4SsrbBawxOielcgni1oClxJ6dY8XPgt+nIh4reex4vxdamH0gOxBd35sidvDKPjVZDgkC7Vk3ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588339; c=relaxed/simple;
	bh=wuEudmfT+UaCFRR0buvXi+PfV+9lKQen0q6Dl1nOL7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yodzeh876kH92uEuINhC+0FwhrOetHt9+OO+VStIhnNm6QDjOEzsO/06k5ubqOx6iqde/Xty2ZH14GK8ChUSt85bw2brf9hOUB7skLYp/UP6EKc5JIbpmJxg6kqVg9eBE1PuLAgr4fGCa78NJnjil0LyfExtHsau5Y9/GNYsR+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Fmn+kWFN; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a04so66307011fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Apr 2025 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743588336; x=1744193136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45OLyXeTgKUOUsJtTp3PVAUqi5d9Bj6zKNzxi7O5qYo=;
        b=Fmn+kWFNvVGzw8QlUdeT8/aSCBPyb6vrvE4UCvV9JhvQ1GL9Av8Mb0ljAEklOiJIW0
         7pOuSqmc3Ch8IO8wiZZFcPVUi53jLATKXQjMkECIxUNcXFtB8Fbpcc+/eBdC2Vd7Yk3e
         6v+t8yjS1QdK3EJTryqasAOnrZp2c151d6HzGuZwzgI4uc4bYi5iF6cv+1N3sGDdYsug
         LWm7VpKutSYNZ8uJJq8m4HS+/ghHY4Tw+u7ByxSqN3h3Idcp8t13+NudFoXIOUK44nOg
         TlUiIheGAqC1ojC0jYdPB4YQLH+xPENJ3oACbwjB2YprnoigdwCoT3tCLXWjkWrdlab+
         IwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743588336; x=1744193136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45OLyXeTgKUOUsJtTp3PVAUqi5d9Bj6zKNzxi7O5qYo=;
        b=IUb9nm1GTl+nombsLC9inqJ9MnFdK63whE5kn6elwFjxfjrN5A/dYw7K/kj8gnEcsr
         j+biKRQhXn4Yd27OvX0CGwkeVKVZ0t5aPE9agC1CXKnEZKW8wV1Mqtz8z2I9BKIl2ydR
         WkzrNUtCT0RLielJ2BOjqsuk54qnlfPCgSH3fROVhpVkS9VUNtOsB+SfT0RoHOybPLfs
         5I0LV/P3r12M0naY6/gnCwP/a6g/nm9r3tmMKOvLldkLWrRUGEuhGVo3/b/laRstNVmc
         vpOG73PjP9qzPaFJjxkno5C8KwfD9eRNmMn/qwxMLQA2sH/d9GpyeGwmQXkA51m777d2
         IjoA==
X-Forwarded-Encrypted: i=1; AJvYcCVEksd0GP2PLvaoRiwN2ChV5UfI54Yq0H53NzhtJwtowp4UMVjdik2jL80kJ/BAqOWYZ8x8ZDWWIFHU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlzz3TfTul0dwEAhZph/qgq8rCiG6YTHAhOe65fluhIdMvYC6X
	aiF+pjY3kuJp3kCbe6f082rMvnMaDdMggqTjadLDipMxDNrLGtvwDA//LLRFCph0AYQjiFy4Qsg
	bkAGgj4zRlyH3ZXANwFr89RaQ4VZnmJG14cpWsA==
X-Gm-Gg: ASbGncudcy0OtMsvEkzmU3V1OuUsBAPjLviYEE6DQ0j/HtbaSKM2Zo14XagaINp0fVc
	I3mBUmgsbc8EFipAqJsJdyViQ0vgSG+us8aZm/mR9Z4VS5PD6eDr57UPQu6l3fXJPWu4tdgtoES
	DaIIJZAUIl3D/7JCuhkCl2pbMyGVV2eB4Bng59449OWO7CW1BzdDGsat74Hg==
X-Google-Smtp-Source: AGHT+IGat+Z5mgq28hdi6/NxDSImvrh52D9hoFmdKI0jIwx96YGLWnxNGezLTeRpDrq45eVB6cVH0ojBLTMTByyD5MM=
X-Received: by 2002:a2e:bc0e:0:b0:304:4e03:f9d9 with SMTP id
 38308e7fff4ca-30ef91b0b7bmr7332861fa.28.1743588335626; Wed, 02 Apr 2025
 03:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk>
In-Reply-To: <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Apr 2025 12:05:24 +0200
X-Gm-Features: AQ5f1JqoCngqlGK07DPic2wMtJyn1bxEpIchjqMW-t59V4hE3p7ylOAGrHnVG0M
Message-ID: <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 11:55=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Apr 01, 2025 at 08:57:56PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Apr 1, 2025 at 6:00=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:
> > > On Tue, Apr 01, 2025 at 04:42:40PM +0200, Bartosz Golaszewski wrote:
>
> > > > You have two users and one goes gpiod_set_value(desc, 0), the other=
:
> > > > gpiod_set_value(desc, 1). Who is right? Depending on the timing the
> > > > resulting value may be either.
>
> > > That's why we need to figure out if there's sharing - the usage here =
is
> > > that we have some number of regulators all of which share the same GP=
IO
> > > and we want to know that this is the case, provide our own reference
> > > counting and use that to decide when to both update the GPIO and do t=
he
> > > additional stuff like delays that are required.  When the API was num=
ber
> > > based we could look up the GPIO numbers for each regulator, compare t=
hem
> > > with other GPIOs we've already got to identify sharing and then reque=
st
> > > only once.
>
> > That's not a good design though either, is it? For one: it relies on
> > an implementation detail for which there's no API contract, namely the
>
> There is an API contract as far as I'm concerned, this was discussed
> when Russell was converting things over to use descriptors since we need
> something to maintain functionality.  I agree that this is an interface
> that is more convenient than elegant but it's what was on offer, I think
> the enthusiasm for converting to gpiod was such people were OK with it
> since it does actually do the right thing.
>

Something having been discussed years ago in times of a different
maintainer does not really constitute an API contract :). I understand
the reasoning at the time but I really dislike comparing raw pointers
in particular and this whole abstraction reversal in general. I'd like
to at least have something like gpiod_cmp() or gpiod_is_equivalent()
that would hide the actual logic. Even if, for now, it just remains a
simple pointer comparison.

> > idea that the address of the struct gpiod_descr handed out by the call
> > to gpiod_get() is the same for the same hardware offset on the same
> > chip. It does work like that at the moment but it's a fragile
> > assumption. The way pwrseq is implemented for instance, the
> > "descriptor" obtained from the call to pwrseq_get() is instantiated
> > per-user, meaning that each user of the same sequence has their own,
> > unique descriptor. I don't see why such an approach could not be used
> > in GPIOLIB one day. IOW: nobody ever said that there's a single struct
> > gpiod_desc per GPIO line.
>
> If gpiolib were to change this API we'd need some other way of getting
> the same functionality, I'd be totally fine with that happening.  For
> regulators we don't really want the pwrseq behaviour, we want to know
> that there's a single underlying GPIO that we're updating.
>

This is bothering me. This is the abstraction reversal I'm talking
about. Should the regulator drivers even be concerned about whether
they share resources or not? It's not like consumers of regulators are
concerned about sharing them with other devices. I'm not saying GPIOs
should become reference counted - as I said in a previous email, I
don't believe this makes sense - but GPIOLIB is a lower-level
abstraction to regulators thus the latter shouldn't really reach into
the GPIO core and inspect its structures in order to figure out
whether the lines are shared. This is where an intermediate
abstraction layer may be helpful. The regulator drivers then just go:

handle =3D pwrseq_get(dev, "enable-gpios");
pwrseq_power_on(handle);

Even if we do it in multiple places, as long as the enable count is
balanced, we're good. The consumers are not concerned by what's
happening behind the scenes just as if it was a reset handle.

> > > That's exactly what the regulator code was doing, as far as the GPIO =
API
> > > saw there was only ever one user at once.  Since we can't look up
> > > numbers any more what we now do is use non-exclusive requests and che=
ck
> > > to see if we already have the GPIO descriptor, if we do then we group
> > > together like we were doing based on the GPIO numbers.  The multiple
> > > gets are just there because that's how the gpiod API tells us if we'v=
e
> > > got two references to the same underlying GPIO, only one thing ever
> > > actually configures the GPIO.
>
> > That's not an unusual situation. For reset-gpios we now have the
> > implicit wrapper in the form of the reset-gpio.c driver. Unfortunately
> > we cannot just make it the fallback for all kinds of shared GPIOs so I
> > suggested a bit more generalized approach with pwrseq. In any case:
> > having this logic in the regulator core is not only wonky but also
> > makes it impossible to unduplicate similar use-cases in audio and
> > networking where shared GPIOs have nothing to do with regulators.
>
> Impossible seems pretty strong here?  Part of the thing here is that the
> higher level users want to understand that there is GPIO sharing going
> on and do something about it, the working out that the thing is shared
> isn't really the interesting bit it's rather the part where we do
> something about that.  It's not that you can't share some code but it
> feels more like a library than an opaque abstraction.
>

The part where "the higher level users want to understand that there
is GPIO sharing going on" does not sound correct. Let's take the
example of drivers/net/phy/mscc/mscc_ptp.c which uses the
non-exclusive flag for gpiod_get() because on one of the MIPS
platforms, there are four instances of this PHY that share a GPIO. IMO
it's a hack, this driver shouldn't care about it. It reverses the idea
of the DT providing hardware information to drivers and instead the
driver knows that the DT may describe a shared GPIO.

> > > The sound use cases are roughly the same one - there's a bunch of aud=
io
> > > designs where we've got shared reset lines, they're not actually doin=
g
> > > the reference counting since the use cases mean that practically
> > > speaking all the users will make the same change at the same time (or=
 at
> > > least never have actively conflicting needs) so practically it all en=
ds
> > > up working fine.  IIRC the long term plan was to move over to the res=
et
> > > API to clean this up rather than redoing the reference counting, if
> > > we're doing this properly we do want to get the thing the regulator A=
PI
> > > has where we know and can control when an actual transition happens.
>
> > If they actually exist as "reset-gpios" in DT then they could probably
> > use the reset-gpio.c driver. I will take a look.
>
> Yes, that was the idea - there was some issue I can't remember that
> meant it needed a bit of work on the reset API the last time someone
> looked at it.  The properties might have different names reflecting the
> pins or something but that seems like a readily solvable problem.
>

As long as the hardware description says it's a reset GPIO, we're
fine. It's when people try to use the reset framework for something
that's not a reset when DT maintainers complain.

> Though now I think again some of them might be closer to the regulator
> enables rather than resets so those ones would not fit there and would
> more want to librify what regulator is doing...  Something like that
> would definitely not feel right being described as a power sequence.
>

Well, pwrseq is just a naming convention for want of a better one. It
really is just a subsystem that mediates usage of shared resources and
doesn't bind to any specific kernel subsystem.

[snip]

>
> > > It's also not clear to me that pwrseq doesn't just have the same prob=
lem
> > > with trying to figure out if two GPIO properties are actually pointin=
g
> > > to the same underlying GPIO that everything else does?  It seems like
> > > the base issue you've got here is that we can't figure out if we've g=
ot
> > > two things referencing the same GPIO without fully requesting it.
>
> > Whether that's feasible (I think it is but I'll have a definite answer
> > once I spend more time on this) is one question. Another is: do you
> > have anything against removing this flag given it's replaced with a
> > better solution? If not, then I'd still like to apply this series and
> > we can discuss the actual solution once I send out the code. I hope
> > this will at least start happening this release cycle.
>
> I'm in no way attached to this specific solution, from my point of view
> the important thing is that given two devices using GPIOs we have some
> reasonably convenient way of telling if they're using the same underlying
> GPIO and can coordinate between the devices appropriately.

I think that logically, consumers of GPIOs shouldn't care about
whether they're shared. IOW: the non-exclusive flag passed to
gpiod_get() should go. If the opposition to using pwrseq here is
strong, then I'd suggest at least moving the handling of the
non-exclusive flag into gpiolib quirks (in gpiolib-of.c or elsewhere)
and not exposing it to consumers who have no business knowing it.

I believe pwrseq could actually be used to hide the enable counting
for GPIOs behind a faux GPIO chip and the consumer would never see a
pwrseq handle - they would instead use GPIO consumer interfaces and
we'd have to agree on what logic would we put behind gpiod_set_value()
(should it effectively work as gpiod_enable() meaning: value is 1 as
long as at least one user sets it to 1?) and
gpiod_direction_input()/output() (same thing: highest priority is
gpiod_direction_output(HIGH) and as long as at least one user sets it
as such, we keep it).

Bartosz

