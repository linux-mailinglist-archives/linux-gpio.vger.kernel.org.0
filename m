Return-Path: <linux-gpio+bounces-3636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C5B85F7FA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 13:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B5F01C21CA0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Feb 2024 12:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1C85FB8C;
	Thu, 22 Feb 2024 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wATGqZg1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D374546B9A
	for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708604489; cv=none; b=QILJBR34rhAfD41NoQXRop2mYaeVHXVcq9ieIpJyKBR2u9TB2ZGpdGypAXu76/0w3JKNyaNvb/fmBKgeXiJxcVABW8BUtDl8sNyByLi7aYhTUaZikoULzrhtIBjYgVyVpPG0FoXUr5ecBWRUblpHPxpkiziWvIHkiG/Q/AYGNOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708604489; c=relaxed/simple;
	bh=ODq4sS+qTVvSkducYBgBKWajHXIyXHD5mvo5BqH7Q8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5UmdNHo7aOiRfCrBNIeMgF7SnQhbGX0A2143zDEbhpZCZHTLaLxw2+s5XA0CNbiZAUwHe6JyrUssbCu5vxtl2VDTcPOiLtG+/lOO/fy5+8ZOimJKAYr0XPucEk0oi2Q6G5zDZcs12mHS7/ktnOxsdL64HBYWjUTLUSHxFzEUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wATGqZg1; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4ce2cd0cee2so1089597e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Feb 2024 04:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708604486; x=1709209286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY73Qzd5NKScutqMmg27V40VmxlS7yZwlMksBph/4Ek=;
        b=wATGqZg1Bo3sYbLEykMRD3x0ZnK8QoFjOP7mnidE/OkSDWWTXNkGfn0uaIf/KcLYwR
         pAUD1SCOW8hpaiz9KVtmWTgPyrVJdcUjKry9W2s0+S3n156UDwUYPKtl6n7NNwuJ5HLb
         ZzDs918bXbZWGsS1A3qCLZ8ib2INBrNP5gkfpsm38uoMh87o94FFddzsiJ48YqBRLhhh
         rS/fL3iiTSp2N0Liwl5eC8x5HbLlkAktlHhTvVShdELnj80et1NVL9YC3+4XV6R1q/Oz
         0gGk1Xb7hBL/nbLlNiYNXIyea8P8+tlzhTW3NIj7VCqAoiRUmai2m1XkArNLgZLGb+o3
         oMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708604486; x=1709209286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jY73Qzd5NKScutqMmg27V40VmxlS7yZwlMksBph/4Ek=;
        b=qrCkAaN3lnDWA+YED1CBOs6ETawlxqVAAZmyaxeEhMWGlZKxbN3/dpTMY3SR8Hk35C
         1ZOGJglRHJ0PswOyVuxAx4H4nwcLkkYlvTsVfHOaqn0Y6xIYv7XsY61zUnCIOzLtyJNf
         UShl17u+cSFhSHu8hzb/GXbpQIkwLBhUSgwDUfwZarjNanIucsAjhasqfdr1xGXKDQf6
         YOiHm2X9dD2vEw4wb/8EDckofFMYErKbOeK5AmFfQg3tKcDdzVaMxmfa95vG6b8hLtsj
         cUKrJL82lPKK7Cdd+Opzt+QF4ux23QS7Rpg8gNGmI8OwKnIMVhmb/KPQjLQaAYDAkGpp
         DS1A==
X-Forwarded-Encrypted: i=1; AJvYcCV9/V8R6UzogUYWkLsq0xrGZ93MBiEvuzPwG4zcs3J+u6/Or/nmGnyDl+6Il5oo93+WcSlFAFScAD3yS9TSW6Kc34ryDGgwYK1rcQ==
X-Gm-Message-State: AOJu0Yz4MN2q10h4b1MQhkwNyJVQiHOKxCn7VgdPmH6zNZrOF47L9K2F
	a7IzrUaEKeEGIFm31j8mPz1XOoFZHLwdWmCFqsJG6ZImQfinSmX1kphSqUh4x8LFmR9fdq9KxSX
	tHO/9xl/WueKP/mScG4VYOalHEBdaHU+RrD2qgQ==
X-Google-Smtp-Source: AGHT+IGGC8QRJX7MjB53W7O4o/T3yucoVkpmjaIA9A9jnZMw8XaEmYljztMGSywli1UA6PFRI1Q4RHZtrlSQ9UMS6xs=
X-Received: by 2002:a1f:d784:0:b0:4c0:2bdc:250f with SMTP id
 o126-20020a1fd784000000b004c02bdc250fmr4290574vkg.7.1708604486511; Thu, 22
 Feb 2024 04:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220111019.133697-1-herve.codina@bootlin.com>
 <20240220111019.133697-3-herve.codina@bootlin.com> <20240220142959.GA244726@rigel>
 <20240222005744.GA3603@rigel> <20240222010530.GA11949@rigel>
 <CAMRc=MdCm4UXMkzvG17Vd=6ajE+feihgYc66qUNTTKXhN0--dA@mail.gmail.com> <20240222123615.2cbada98@bootlin.com>
In-Reply-To: <20240222123615.2cbada98@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 13:21:15 +0100
Message-ID: <CAMRc=McTkVPD-1_5vvPcM2Q15=w+ocki2xTmvQzU-o395A930w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: cdev: release IRQs when the gpio chip device
 is removed
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 12:36=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> Hi Bartosz,
>
> On Thu, 22 Feb 2024 00:31:08 -0800
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > On Thu, 22 Feb 2024 02:05:30 +0100, Kent Gibson <warthog618@gmail.com> =
said:
> > > On Thu, Feb 22, 2024 at 08:57:44AM +0800, Kent Gibson wrote:
> > >> On Tue, Feb 20, 2024 at 10:29:59PM +0800, Kent Gibson wrote:
> > >> > On Tue, Feb 20, 2024 at 12:10:18PM +0100, Herve Codina wrote:
> > >>
> > >> ...
> > >>
> > >> > >  }
> > >> > >
> > >> > > +static int linereq_unregistered_notify(struct notifier_block *n=
b,
> > >> > > +                                     unsigned long action, void=
 *data)
> > >> > > +{
> > >> > > +      struct linereq *lr =3D container_of(nb, struct linereq,
> > >> > > +                                        device_unregistered_nb)=
;
> > >> > > +      int i;
> > >> > > +
> > >> > > +      for (i =3D 0; i < lr->num_lines; i++) {
> > >> > > +              if (lr->lines[i].desc)
> > >> > > +                      edge_detector_stop(&lr->lines[i]);
> > >> > > +      }
> > >> > > +
> > >> >
> > >> > Firstly, the re-ordering in the previous patch creates a race,
> > >> > as the NULLing of the gdev->chip serves to numb the cdev ioctls, s=
o
> > >> > there is now a window between the notifier being called and that n=
umbing,
> > >> > during which userspace may call linereq_set_config() and re-reques=
t
> > >> > the irq.
> > >> >
> > >> > There is also a race here with linereq_set_config().  That can be =
prevented
> > >> > by holding the lr->config_mutex - assuming the notifier is not bei=
ng called
> > >> > from atomic context.
> > >> >
> > >>
> > >> It occurs to me that the fixed reordering in patch 1 would place
> > >> the notifier call AFTER the NULLing of the ioctls, so there will no =
longer
> > >> be any chance of a race with linereq_set_config() - so holding the
> > >> config_mutex semaphore is not necessary.
> > >>
> > >
> > > NULLing -> numbing
> > >
> > > The gdev->chip is NULLed, so the ioctls are numbed.
> > > And I need to let the coffee soak in before sending.
> > >
> > >> In which case this patch is fine - it is only patch 1 that requires
> > >> updating.
> > >>
> > >> Cheers,
> > >> Kent.
> > >
> >
> > The fix for the user-space issue may be more-or-less correct but the pr=
oblem is
> > deeper and this won't fix it for in-kernel users.
> >
> > Herve: please consider the following DT snippet:
> >
> >       gpio0 {
> >               compatible =3D "foo";
> >
> >               gpio-controller;
> >               #gpio-cells =3D <2>;
> >               interrupt-controller;
> >               #interrupt-cells =3D <1>;
> >               ngpios =3D <8>;
> >       };
> >
> >       consumer {
> >               compatible =3D "bar";
> >
> >               interrupts-extended =3D <&gpio0 0>;
> >       };
> >
> > If you unbind the "gpio0" device after the consumer requested the inter=
rupt,
> > you'll get the same splat. And device links will not help you here (on =
that
> > note: Saravana: is there anything we could do about it? Have you even
> > considered making the irqchip subsystem use the driver model in any way=
? Is it
> > even feasible?).
> >
> > I would prefer this to be fixed at a lower lever than the GPIOLIB chara=
cter
> > device.
>
> I think this use case is covered.
> When the consumer device related to the consumer DT node is added, a
> consumer/supplier relationship is created:
> parse_interrupts() parses the 'interrups-extended' property
>   https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/of/property.c#=
L1316
> and so, of_link_to_phandle() creates the consumer/supplier link.
>   https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/of/property.c#=
L1316
>
> We that link present, if the supplier is removed, the consumer is removed
> before.
> The consumer should release the interrupt during its remove process (i.e
> explicit in its .remove() or explicit because of a devm_*() call).
>
> At least, it is my understanding.

Well, then it doesn't work, because I literally just tried it before
sending my previous email.

Please try it yourself, you'll see.

Also: an interrupt controller may not even have a device consuming its
DT node (see IRQCHIP_DECLARE()), what happens then?

Bart

>
> Best regards,
> Herv=C3=A9

