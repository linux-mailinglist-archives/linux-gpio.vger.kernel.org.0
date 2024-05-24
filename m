Return-Path: <linux-gpio+bounces-6613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 897568CE96B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 20:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7891C20410
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2024 18:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CF83BBD9;
	Fri, 24 May 2024 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q5QYtPxr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311C11CAA4
	for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716574939; cv=none; b=RMIbDc5X/EPwNOb1IXbABE0uod+whGo1Ftnu+R+FmqIsDPOu8b3ZICkHgAEK1p+nXOL6SQ6xj7EV9dqGwyykbEIEn4TrYvk8u2fhDvvWI5SScv6hOLvqM6Da86QFEOiWQmSn6wYS3ja5HH2Li7g4K2XQmiSCAJQSswviWyo9w4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716574939; c=relaxed/simple;
	bh=DBEuJllGRMmsGDtn5RfgkcpQH6/0UYcTg3JQe/ltgTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuOeegelcY5UCrHN+w4ue+g7OOGbNhGfQJF8etYMZLv+YdIYX9nfURGxGr6aChQF2ikEJKeVKgCCobeFBI07UcJNRgeSnrjcnR3G2f6iKNBYJTLqtKmcJ8t4SdVIeaRxgDHWzCfB1Dwpp6tyuFwfQwvwxi6Otbzg9gqAlxN8EoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q5QYtPxr; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5295c65d3fdso1120409e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2024 11:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716574936; x=1717179736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJNJ4rhMr+Arz197wwoLuaEKZyBWw20ufNqeneZtnxA=;
        b=q5QYtPxrq3f0ibCyOEtDQIe/pt++3ib34iWKrt1TdC98+qaAg2PII95rVDyC0iGYlq
         raw22/4+CLdNvwb0wjeFK7xz2i/HplXv+L+SFzJtY7tLiEhZnK3qV9BP09WsOQrj2Qne
         kX61PjnLbWrGPrjKQQeYXszw1amk1dRf4Fv6T0DGxuwTjHfH8DDgQsEg8sbfSFJ9+iKY
         4EM30gHf4ajYorMsPNx0Wq/zmB5BEWRB9UKEEq9BRIcrd4J3jSrDFt0AilHKZw6E2EEL
         17TuvVWAo4xlk8EhzCfW2g4ytfjxxS3xi/yH5ukDCbgD81gXvyXRooeI0ZRq/ru7wSJf
         dIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716574936; x=1717179736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJNJ4rhMr+Arz197wwoLuaEKZyBWw20ufNqeneZtnxA=;
        b=KGVrPhdXntj/wxNwysQC/BlxLJFzhc/zRT3QyzeJYRl8D+EzlX4afI/l1i6grrV2UP
         R+WhN6QazN0gbqw1qbbVXPzK/srxLW5wKytA2yQw52rZtHkLpLXDml23FPkH4snl8KJ7
         Ve1WOKcanDe6EFJjNnRuM/shbvJ46KkmUEmo2cBRVbBdv9azrEMj2MIRECwlF5dkWxJr
         xb6iWTebWmTMJ8GE78OlEJ7UASPv7t2jm5rQxyrbL12qWHyKxbo9Qyd5XkfGNWdtvqtj
         K6lHKjaVMKWmdhO3WM+Vn2LO4m8Z0IF3YAwgTpWrLH3eFZ7Hpkk9yQwdwr3JhaXckIs6
         flSA==
X-Forwarded-Encrypted: i=1; AJvYcCVljnWzL2Jpnp3BRDl2vgH9wRYEMXRs3iiVHwEK6rmKr/METlM6WHujTVkuOiAjhYG0R9i+oADs2j2sD/7ghQPxcMXg+/8q/AILsQ==
X-Gm-Message-State: AOJu0YzAAZThZ1XYRuITHQPRypI9KHH141Amv9mohGf1ZumFLgw3zcyw
	TmYsbrgt8aMVae1kgQJpVZRB1UQOd+n0Q4zvZxX/JUzOI0IQuReapr2DmjGbeZbhdndRaiAwVFJ
	Wy0MsGhoyl71JerpFTmZ8kLmqoBra/7p5lweLAA==
X-Google-Smtp-Source: AGHT+IHv7qIelG+kwfpU9Kgn7dbnftn6iYOGo2HMF32FM6tRTZjIabXXNwlbWHiimkJf8XqkYavHy5wJhzREphaNNv8=
X-Received: by 2002:a05:6512:3c86:b0:51d:8ff3:f835 with SMTP id
 2adb3069b0e04-52946483da9mr1258530e87.26.1716574936313; Fri, 24 May 2024
 11:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412122804.109323-1-brgl@bgdev.pl> <20240412122804.109323-7-brgl@bgdev.pl>
 <Zif8qBoZq7I3Xrbb@smile.fi.intel.com>
In-Reply-To: <Zif8qBoZq7I3Xrbb@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 May 2024 20:22:05 +0200
Message-ID: <CAMRc=Mdp1_faK8_1GmyJZanMCDpW_503fRFsigg39+XPoV4acQ@mail.gmail.com>
Subject: Re: [libgpiod][RFC/RFT 06/18] bindings: glib: add examples
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 8:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Apr 12, 2024 at 02:27:52PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add example programs showcasing the usage of GLib bindings to libgpiod.
>
> > +             ret =3D g_gpiod_chip_get_line_offset_from_name(chip, line=
_name,
> > +                                                          &offset, &er=
r);
> > +             if (ret) {
> > +                     info =3D g_gpiod_chip_get_info(chip, &err);
> > +                     if (!info) {
> > +                             g_printerr("Failed to get chip info: %s\n=
",
> > +                                        err->message);
> > +                             return EXIT_FAILURE;
> > +                     }
> > +
> > +                     g_print("%s %u\n",
> > +                             g_gpiod_chip_info_get_name(info),
> > +                             offset);
> > +
> > +                     return EXIT_SUCCESS;
> > +             } else if (!ret && err) {
>
> Besides redundant 'else' the !ret is also redundant.
>

Indeed but isn't it premature nitpicking in the grand scheme of things? :)

> > +                     g_printerr("Failed to map the line name '%s' to o=
ffset: %s\n",
> > +                                line_name, err->message);
> > +                     return EXIT_FAILURE;
> > +             }
> > +     }
>
> ...
>
> > +             direction =3D=3D G_GPIOD_LINE_DIRECTION_INPUT ?
> > +                                     "input" : "output",
>
> One line?
>
> ...
>
> > +     settings =3D g_gpiod_line_settings_new(
> > +                     "direction", G_GPIOD_LINE_DIRECTION_INPUT,
> > +                     NULL);
>
> Personally I do not like the open parenthesis style...
>
> I don't even know why you have done this way with having a plenty of room=
 in
> the previous line at least for the first parameter.
>
> ...
>
> > +     req_cfg =3D g_gpiod_request_config_new(
> > +                     "consumer", "get-multiple-line-values", NULL);
>
> Ditto. And so on across the code of the entire series...
>

Personal taste.

> ...
>
> > +     ret =3D g_gpiod_line_request_set_value(data->request, data->line_=
offset,
> > +                                          data->value, &err);
> > +     if (!ret) {
>
> ret =3D=3D 0 equals error?!
>

It returns gboolean where false means error. This is a pattern in GLib.

> > +             g_printerr("failed to set line value: %s\n", err->message=
);
> > +             exit(EXIT_FAILURE);
>
> Don't you have something like err->code to propagate?
>

What for? err->message is the human-readable string of the error.

Bart

