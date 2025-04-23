Return-Path: <linux-gpio+bounces-19165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2EA97E5B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03ACA188D673
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 05:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8AF266B4C;
	Wed, 23 Apr 2025 05:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7SzZfIq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E13EAFA
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 05:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745387499; cv=none; b=QuXtMuoQl3lU691IhBVXqUn4l3M7C06EZU8hRAbAEh65j5SEDMe/pG6UvE52hbbFk5nHbZmBGbglnQYcreWsJvA9ZuVKq5+1LJ8zzX8IxOYtGVTOZo/xT/Yu8HicUsPCR075ntxtaeK3O+Fwheb66RGq200XrKZYq/n5nnYbNrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745387499; c=relaxed/simple;
	bh=EbARthzwo6CmpaACSRUBcysKz6P15FgNuWPJk7iIMCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vsgb+UEy1dW/pmoBkiDyUiEM2S/9KLTBn7wjEGBi0xl4iPvEpG0XSzWz18iRksuhFps8Xixh4CIY/5mpVnRMrZNYn+EzpV3zFDd+Ss1Ng6RU5WBqukdL+7z0WaTvj4ndGwYtV7KZOBusZbMzPu8jp58rq5vKF94/9eKRlW9vXVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7SzZfIq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ace3b03c043so119216366b.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 22:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745387496; x=1745992296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IMZdh7tIEa3y9OiX1Cf88d+MEUqAQYnmxAkd+TarAs=;
        b=a7SzZfIqXtbGyrEmKgQXkKNQEXRZyGqtsZVAbBxytN2WF0EU2Wz/20ZeSVfQd4Fu9o
         7RBMDNcZKfqxoDR/MJvFOx5nB3bjBNRv4lnBCYPnxXF8fu9n8knTDtuzkU9yj6Hr2Loy
         mBA09B28lbNVIpu47jSEMl99DGOEQDTRitNj0GkAQvL75EySvAbXgUhXgkB+SjX7G387
         zcBB3HQLbYQMKAqfqVeiTsSOsJnFVAgLNVy4fLTGt2OtQfWNi8qsBrz9TSBwYyck5Iz2
         /5rB9whtcl12yudP9alA927sJv3Pf16ZkiHpssMpLoEixiepOYkAJ/3zHJCg1fdDPhwL
         N7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745387496; x=1745992296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IMZdh7tIEa3y9OiX1Cf88d+MEUqAQYnmxAkd+TarAs=;
        b=M6cULg362MciSmUAjjwIhhPYG4rTqqKPSqs9MLIl7oXQneQ5zVVkNoOp5Lu1BYlE0d
         cdgkNTBNpDJRXKwT5at49e8B/1uGeTNuq0F0F9dD39yNMgWr/qC6hoHjddNhj1f782uw
         FIk6foZwZQW5W4ooGoX9KXoM99pctYQOTG0E4YeN+BsVL+xbU2LWcwwUt4E0yeZJd9ln
         pg+6XJrKemavPzbF087+talrIZbRmaJLBjdxJF6WnYXclkIOWZTMKbZj81D6KlJmFv1D
         v8PqZyjr3/N7IcUO1sReaw1oy7FR7EvzuRXAcILKkvMrfr4VT6taUANQy+GiWXieYBob
         MzKQ==
X-Gm-Message-State: AOJu0YwK6ekQx5FqZK4rxnbLv70u3A6F/1N8gAWn4q2SzoQ+LroTU196
	ewKYYGB35feT2gZiq2r1bNQDRKxLlifbkfVlwi4Om8/bOhwYZjuiO/kR58GKfDTXUR9ED60ivAq
	CTEhcZF7d34mbEAXX572N0wt+yd2s/jVWS8g=
X-Gm-Gg: ASbGnctteUBylwJtjl6F6u09HcGSpJ5ukvy1qAtoQlzAzu/MZ8OOh0Thm0ccvDdh34G
	CbshQ8jja3Gab/Y2LCCx/l1qSV0U6JVSwc+ZWH5XyK6hZbpKFxjB4MNixMQ/fmtho6ObHb1FdzZ
	GF3xKpWz/6x68SodiduHkeKg==
X-Google-Smtp-Source: AGHT+IF0PlkFKQCHdJ8wuJ9/86uY3KDdSeIqRzFfS2Pmyhowige+PFJNFscUzd15Uh4+VOjm3p+HDVQmTtqUwMkdXUw=
X-Received: by 2002:a17:906:6a13:b0:ac7:cc21:48f9 with SMTP id
 a640c23a62f3a-acb74ad93d9mr1316786466b.5.1745387495310; Tue, 22 Apr 2025
 22:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75Vcgk4QBrt3AskmbFviQmNQ8w2HQRZG0jz2U5DKui6v4VA@mail.gmail.com>
 <DM4PR84MB18295F44324CD9AD83F5810787BB2@DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM>
 <CAHp75VeVQruB7m1WiXTfTEt4ggG9KNLRH3oJ_O9y5A+h=hh+8A@mail.gmail.com> <CAHp75VfUf0LsrMfrcty+hp0RXmPJkS16E_V1o7OS-mXXa5fq9w@mail.gmail.com>
In-Reply-To: <CAHp75VfUf0LsrMfrcty+hp0RXmPJkS16E_V1o7OS-mXXa5fq9w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 08:50:59 +0300
X-Gm-Features: ATxdqUGUKMH-JsmY_FgKfM7Zw6wgYZftsTWYUQ5HjgOiPsUMLfvzqFWGohu4luU
Message-ID: <CAHp75Ve03-pWLqpJiP4oR5UjZku_j1TFpKduJFjD3gau+DR59Q@mail.gmail.com>
Subject: Re: UV platforms to test
To: "Ernst, Justin" <justin.ernst@hpe.com>, 
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 8:47=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Apr 23, 2025 at 7:29=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Apr 23, 2025 at 2:29=E2=80=AFAM Ernst, Justin <justin.ernst@hpe=
.com> wrote:
> >
> > > > I found your email in MAINTAINERS for one of the UV platform relate=
d
> > > > files. I'm wondering if you happened to have a Skylake (?) based
> > > > platform that uses the
> > > > https://elixir.bootlin.com/linux/v6.14.3/source/arch/x86/platform/u=
v/uv_n
> > > > mi.c .
> > > >
> > > > I would like to clean that file up, but I want to have somebody wit=
h a
> > > > real HW to be able to test.
> > >
> > > I would be more than happy to test your changes on some UV hardware h=
ere in the lab.
> > > We do have a few Skylake/Cascadelake (UV4) systems available for test=
ing.
> > >
> > > > For curiosity, this file pokes pin control registers without the
> > > > driver. I have several questions as well to make the better approac=
h
> > > > on how to clean that up.
> > >
> > > I will do my best to answer your questions. If I can't, I will pull i=
n the real experts from my team so we can both learn something new.
> >
> > Cool! This is what I need for the starter, output of:
> > 1) `lspci -nk -vv`
> > 2)  `dmesg` (just after the boot to the point of the shell appearing)
> > when kernel has this in the command line 'ignore_loglevel
> > initcall_debug'

...and 'uv_nmi.debug' which is the most important one.

> > 3) `grep -H 15 /sys/bus/acpi/devices/*/status`
> > 4) `lsmod`
> >
> > P.S. Note, this message also appeared in the mailing list, so can you
> > share it either with a private email to my working address or via any
> > file sharing site?
>
> Just to be sure of the right platform, I need the one that is called
> 'hubless' whatever it means.

Basically in dmesg one should have this:
"UV: PCH NMI enabled" as per
https://elixir.bootlin.com/linux/v6.14.3/source/arch/x86/platform/uv/uv_nmi=
.c#L1101.

Kernel versions starting from v6.1 are okay. No need to have the
latest one, btw.

--=20
With Best Regards,
Andy Shevchenko

