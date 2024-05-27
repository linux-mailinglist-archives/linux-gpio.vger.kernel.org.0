Return-Path: <linux-gpio+bounces-6690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EFB8D0E7C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 22:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 580001C21C68
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 20:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED89215E5B0;
	Mon, 27 May 2024 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ewAyE1NA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2172010A0C
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716840126; cv=none; b=keXavH4uVymLcIM7V7I09mXpd0QSgR4Fm7GYGW/mzQsjKySUe69aoO3zcP4rclypjkQ6AjC+6xTvOcTdl6dhatD8FmQ+8HasZl0usoEZBcDTekFxhcofNuWS1U3E90aMqSQwb3BJ2uKphOyQMmkT/8QVkE/EGNz5JjqeQYBKwvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716840126; c=relaxed/simple;
	bh=5W/6o++GYwyp7jIyfN4VEVtNMlwXI5x8pBVC7cXMMiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NICkYe/NG8WLHCoElPh3I8JGUuzrji6vMk/ctL98MOGSzJeoftFAp84YIKcPXuJJaelM28H0A3yOSxKd9yUPn7FLQO2KBNa26bXQMOtm9XRoN2HO0mBM9r+3r8oTiCrIsuH4Sy4GH9SuRTwMyNgbNuN2l8Gpe9lb9N589kV43wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ewAyE1NA; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e719bab882so510701fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716840123; x=1717444923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhec4SaHsNfyUvhcRkfJxFPguwlElEGGDfzSi0j27Mk=;
        b=ewAyE1NAksXFgOmprnksy1OaVY/5NCTEhfFv8r2tmKn+iCKtAeF04j28U0OV2r1wtr
         QtyqJHFvpvEweobgL4jxuQU1F4WnA4AInLsx67wVxvTCSkvKRg92GuBX0T3APg9rmduw
         Z7qz48oXkGwloHQDFYM6m1lUsAv919OlHwDkHA9Cvs3OIATGtcK+wgXuhrDbfJsiKAqW
         Rvo6KTUH0zS4fPk6/sJcpxmZuGS9RRXHmFx104Wu8pRGYSIPcL4RWBU7JNqTnAlalhbR
         SNcCRhujbw13/rQSMl5lNJUsUflUNImNtRv7ogHQ71aRmX0iiJEC+Pl/jLWaMc4TTPBE
         DZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716840123; x=1717444923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhec4SaHsNfyUvhcRkfJxFPguwlElEGGDfzSi0j27Mk=;
        b=v8rfmGdI278K0pyVDEmpXaAmnqL1W6jFHWcArgaVWO2t3kLTw6kiL4I+6VGtqsZn2w
         oeJ4AGAksendeRjagvwEo+LwqM5d/Kt1VR9qJuwvLwapRlQhTLXy/O6IHkC2NyrJmgZp
         Cv+F6YiSl+Zz7Fs8qCZMvJzPXlyqpUmOZcbewiDfKru7Ih5j+j822TZCxHPXdkS2gaeN
         /1QTgJRgy4Vusu4GounbU7f6hhuOn/+Cb+tHS6OCrmbnEREhPEAc0nZJ4ZlBK0IkDSym
         iZaK4NZThdNsw5thr12iLxv+YmPPvUlUmwSqC2wyy6NtzLD30vi6hOVgsYntTGmlxGBg
         psuw==
X-Forwarded-Encrypted: i=1; AJvYcCXBwYUFbLWPYG8HOXEPCqVCxrPsl9jYS7aQ9BKRulFwdXAUyrbxeJrRxWgCU/+Q26ty/NYvhrw2pvco8qRQD3WPkV0fEgfzQAj7/A==
X-Gm-Message-State: AOJu0YxJ9kRI5J6gR0xy5TyK7t1QKH1x09ypVbdR22v8io9tYl6+EKXn
	akY+p04qokaD+KcnFsS+dntlK5im5i8HrTAIs6LcEMQMRzoG/D6Jbc73dCwQ5f0u1f+wl7V9Roo
	fZutdPJ/PD6KLquIhsPHO5wYa1CJawDnjVgOwCA==
X-Google-Smtp-Source: AGHT+IFD7Qg1/KmwCrP+sdWNVrna02pvby/pV83lREH6F890FOuDCkSsWRH8NfH2V5iUe7wKeXINb+HSsS6/eozISZE=
X-Received: by 2002:a2e:b6ca:0:b0:2e3:603e:4697 with SMTP id
 38308e7fff4ca-2e95b2881c5mr63185451fa.36.1716840122987; Mon, 27 May 2024
 13:02:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412122804.109323-1-brgl@bgdev.pl> <20240412122804.109323-7-brgl@bgdev.pl>
 <Zif8qBoZq7I3Xrbb@smile.fi.intel.com> <CAMRc=Mdp1_faK8_1GmyJZanMCDpW_503fRFsigg39+XPoV4acQ@mail.gmail.com>
 <ZlTkMNQ5OGyAgf8A@smile.fi.intel.com>
In-Reply-To: <ZlTkMNQ5OGyAgf8A@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 22:01:51 +0200
Message-ID: <CAMRc=MdHXoTPuXvOy7VuML7GLrGnTt186FaEcQU+K0zv3JLDmA@mail.gmail.com>
Subject: Re: [libgpiod][RFC/RFT 06/18] bindings: glib: add examples
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 9:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, May 24, 2024 at 08:22:05PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Apr 23, 2024 at 8:23=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Apr 12, 2024 at 02:27:52PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> ...
>
> > > > +     ret =3D g_gpiod_line_request_set_value(data->request, data->l=
ine_offset,
> > > > +                                          data->value, &err);
> > > > +     if (!ret) {
> > >
> > > ret =3D=3D 0 equals error?!
> >
> > It returns gboolean where false means error. This is a pattern in GLib.
>
> For booleans we have a pattern like
>
>         if (bool_func(...))
>
> to imply it.
>
>         ret =3D int_func(...);
>         if (ret) // if (!ret)
>
> kinda implies int. Does Glib has that type of pattern?
>
> > > > +             g_printerr("failed to set line value: %s\n", err->mes=
sage);
> > > > +             exit(EXIT_FAILURE);
> > >
> > > Don't you have something like err->code to propagate?
> >
> > What for? err->message is the human-readable string of the error.
>
> If somebody wants to parse this with a script?
>

Andy: these are just examples. The user of the library is free to
print the GError contents however they wish. The main point of
interest in this huge series is the DBus API because it will have to
be carved in stone, anything else is just implementation details.

I am always grateful for your thorough reviews but I don't want to
bikeshed over example code at this point, let's use that energy where
it's needed right now and revisit the implementation at a later time.

Bart

