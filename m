Return-Path: <linux-gpio+bounces-32780-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LWZAuLFrWkr7QEAu9opvQ
	(envelope-from <linux-gpio+bounces-32780-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 19:54:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99431231C9E
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 19:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 089933006144
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 18:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12DD393DF8;
	Sun,  8 Mar 2026 18:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZCqsB3/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E92375F67
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772996062; cv=pass; b=UrVD7qJe+USl5r88jkdNP64jQ8u7j5pcl7d6BgD9UdG/Sq7KcFqIpxvW/TSGFuJoQfimI77mpqsIF8dbgPETbguRTtGFT/UgFsjS4CNKwtktqFyfJaL+BqhId5QD1YbPze65Ac6sXG6mpWCS1eGGIwuI24qOE+9eZwVyB4vuZcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772996062; c=relaxed/simple;
	bh=4WkA3TH3CpqNnjjKk237hd7jy7cuqFxp3MQHuN2Tqiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTwQKo65fUXtJUJXhF6Pw1lbFTpNh8YRhnUeZLsRHphyvCmPe3v0wVVQdYEj8/BAlvIuXuz5Xfcrb4+g8Sn4flic7mqEan1pkkv6YEZE/3URuDicxshtfddoBXSSSTNrB/mX5i39xAD6l9hhb63jbhwCBGxRUaV0QJB2Va9w1G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZCqsB3/; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-660a7aa6e44so8011141a12.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 11:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772996060; cv=none;
        d=google.com; s=arc-20240605;
        b=WLd9sPIoKXJsElYf2LFUwDepdXsYj0px0nN0LWFzpq+VUiv9CBM+gQLGiGY4YUUJt/
         JSONuJfl9u/Z0VMlSBYSlOjxad8kUUYkjjgI+mU3IVX1PAE6a+P8+hy+AWrQpWjRbz5c
         qgQR3RJdHBcA3DbRE7TSIGDGLA9h1MYSJGQBZv8YSGpqt24QeXGT2lm8LJyA9NogRnhg
         G/6DM3FZyYlCU0ZHw66ibLGDXF/mhvmbz/EtsSuCpZr0WM2m9RXd4zp43uCqnQ0389vH
         EhNrAWlzSJIVqyw5KaUNdGPIezsIuXrvFQlWh2PAV6L9Fu+TeOwG07I+r0FDv9JsWQpl
         CGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pzx1bQVa70pFv3Ce8nvdnPUapYfUkF9U6niOOnzrcbA=;
        fh=/RYh3UhkyWgMHuvV4aPzEoKjx4tyjRy+k0XIGNy4K9Q=;
        b=et4uak1epew6UOGMQTlIx/yEUY4xkaSdNaYdywusHtWLdwCWbEcOGXIV8etcCyrMy+
         NbvA214nUsZ4Ry0FBb0vX4yp7m8pP3HFSJroSkbE1VayhuwWyfJF8hj5HRftgwMv2FNb
         g1pOPPqpjNGWpRx3zbHe5XkX0zpKUtd1erupS7A4U2LryQ+Pt01JZqEJwZvygI/zBqCz
         ROSzQ5Ze/GgEdlTq4ZJ/ksukiBdGKt69F/WVekbb34KRtmsExPcM4UkDe9sPn2fDUrdH
         WGSrFTMjOnFm+EPBD0NjP/BGELmR1jlycf1xuX2yZxjsRmolv0a42oSge/SpU2g3HZfe
         wdPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772996060; x=1773600860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzx1bQVa70pFv3Ce8nvdnPUapYfUkF9U6niOOnzrcbA=;
        b=DZCqsB3/fl1li2f1uoIY/YiJjp64MkLs87edWA7ic6DSa+ZTJWEm3bWQ0pFAHkpC1N
         yYNCpFxkrNR4wQXxuYcnPSzany2kopquwsKAG33xXUXOzR+wPpbiZ/v/VhmeDrvBYdsT
         P+O3l0O68dGiPR4HHYmVVvSCi21u88TkUPM5xcfiVXZo/wq51nqOasL+Kd0pPU1ktIKE
         zKbbMvowbbLGaVWJVqJKM9na3z4PN0e1CPsk4qCmaTONa42ACS5sPyv79L0ztuSLhd/S
         yTnQ0lE+5aDCumH0wjDYOCUAC4se9HuU4+/BmmGVYjZX9Cya/YEdQHEMNTL5oNmEB8GU
         p8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772996060; x=1773600860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pzx1bQVa70pFv3Ce8nvdnPUapYfUkF9U6niOOnzrcbA=;
        b=eCguqQGEqtcMdzwpOrqsvPF8N1R4AglHqZ3nJIRfjW3UwBc85ndyqgl6MOZxPtapvP
         eGjAwskw94JZuUe1DgqQOEVhh/Wf0kJ6sIR1EGqZwuF4klVH6plQY7QcH9SVdT+SDIJr
         F2vA9A+K4GvPv3orC61r5Tbex4u2iealTN4A1t7AgWPumS9UmIEvW3WSy0ojHiNOimL5
         mHJlpBIy1S8cfnUrAeyBiN2b8pg2wORFwIK9reXr5v5yGypfwCUhKgDAsh/qF32GC7Xe
         5bUasTZbDi5zgW+3VUbwLeQ10c4c7naG5WQJOP5Tv8sShxWCcbOuVvSVP/g3Kd1kbs/u
         cpVQ==
X-Gm-Message-State: AOJu0Yw4TTWMPN0lKIzAZbeK4vJ2SoGgJtwJdXP9XmQ9fri4tKW5PS0m
	Zc27zViTkQwzJCtHJt+x1dNihKWC2lmf2HxhbzThSsHXGlo3O2yVRSIKj6NgUSbfUOE6SLkTJ0W
	VYOaJbqiMmfFtV64/DJ6KX7XCe7e+tEg=
X-Gm-Gg: ATEYQzx75Xt39AXncuXnd4sInMnGMJaIZ03bc+Qus5h/3wzUIe4mtdYS2RPnRq1+dDa
	ohJV9i8YQpqa2OhUY0l5T5nhgwUQZkP/L7erWBi0Dsad8Nmbl8qKh59wORZS/AOl+72MS7vi/ZF
	1vvwKPsM53l6BvZUcD//fC41/C0CXVUuASNsC1dLZklV0DTNharPUyDlAOiuWJlztHcaDkZ61Vg
	4GpNYUnjxwHbH9S79INnT/sWbUJrALViZ5NmypsJN72+WaCQOeTFP5dRPzBD+DD8pWtmaNO+w/P
	aLq+E8DUWtnaHdMRltESP7U9WKCN25Be9QvL6WOnmhM4EoYJ+1c48aQ6MrGDVksNlbAau505IRI
	0asW2HwbJbDZdrKgT
X-Received: by 2002:a17:907:9481:b0:b8f:e98b:4952 with SMTP id
 a640c23a62f3a-b942e01d395mr456827866b.41.1772996059506; Sun, 08 Mar 2026
 11:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021201.47820-1-rosenp@gmail.com> <aa1pZdYEU8QkI_8x@kekkonen.localdomain>
In-Reply-To: <aa1pZdYEU8QkI_8x@kekkonen.localdomain>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 8 Mar 2026 11:54:07 -0700
X-Gm-Features: AaiRm51QfrWs8BNS_2Luw1Q-fQPrrzLS7J3qivjkJpr7RC7inVJkQajYBh-ovwM
Message-ID: <CAKxU2N9WCtyoEhdZk=GY=3kuYkv3NKrRZ6kNE8-feGYp5AXTbQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: ljca: reduce struct allocation
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 99431231C9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32780-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.901];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 5:19=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rosen,
>
> Thanks or the patch.
>
> On Sat, Mar 07, 2026 at 06:12:01PM -0800, Rosen Penev wrote:
> > Convert connect_mode to a flexible array member to avoid calling
> > kcalloc and to combine the allocations.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/gpio-ljca.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> > index f32d1d237795..a531aaa0425f 100644
> > --- a/drivers/gpio/gpio-ljca.c
> > +++ b/drivers/gpio/gpio-ljca.c
> > @@ -63,7 +63,6 @@ struct ljca_gpio_dev {
> >       DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> >       DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> >       DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
> > -     u8 *connect_mode;
> >       /* protect irq bus */
> >       struct mutex irq_lock;
> >       struct work_struct work;
> > @@ -72,6 +71,8 @@ struct ljca_gpio_dev {
> >
> >       u8 obuf[LJCA_GPIO_BUF_SIZE];
> >       u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > +
> > +     u8 connect_mode[];
> >  };
> >
> >  static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_i=
d,
> > @@ -400,22 +401,19 @@ static int ljca_gpio_probe(struct auxiliary_devic=
e *auxdev,
> >                          const struct auxiliary_device_id *aux_dev_id)
> >  {
> >       struct ljca_client *ljca =3D auxiliary_dev_to_ljca_client(auxdev)=
;
> > +     struct ljca_gpio_info *gpio_info;
> >       struct ljca_gpio_dev *ljca_gpio;
> >       struct gpio_irq_chip *girq;
> >       int ret;
> >
> > -     ljca_gpio =3D devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_=
KERNEL);
> > +     gpio_info =3D dev_get_platdata(&auxdev->dev);
>
> You can do this assignment in variable declaration.
I avoided doing so to keep reverse christmas tree order. I can still
do so if desired.
>
> > +     ljca_gpio =3D devm_kzalloc(&auxdev->dev, struct_size(ljca_gpio, c=
onnect_mode, gpio_info->num),
>
> This line is a bit long, I'd wrap it.
Will fix.
>
> > +                              GFP_KERNEL);
> >       if (!ljca_gpio)
> >               return -ENOMEM;
> >
> >       ljca_gpio->ljca =3D ljca;
> > -     ljca_gpio->gpio_info =3D dev_get_platdata(&auxdev->dev);
> > -     ljca_gpio->connect_mode =3D devm_kcalloc(&auxdev->dev,
> > -                                            ljca_gpio->gpio_info->num,
> > -                                            sizeof(*ljca_gpio->connect=
_mode),
> > -                                            GFP_KERNEL);
> > -     if (!ljca_gpio->connect_mode)
> > -             return -ENOMEM;
> > +     ljca_gpio->gpio_info =3D gpio_info;
> >
> >       ret =3D devm_mutex_init(&auxdev->dev, &ljca_gpio->irq_lock);
> >       if (ret)
>
> --
> Kind regards,
>
> Sakari Ailus

