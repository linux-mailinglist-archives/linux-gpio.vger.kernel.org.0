Return-Path: <linux-gpio+bounces-735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 390547FE172
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 21:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F275D2824B1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 20:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0948F61664;
	Wed, 29 Nov 2023 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q9qz13Ya"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA99D69
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 12:55:54 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-4644a04b690so52209137.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 12:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701291353; x=1701896153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI6JHtznXvmxE5PL87iXN1BnHx/Zg4tCgMdyIcxQ2lA=;
        b=Q9qz13YamJMrwWsjqeLFo5h+5Vbr0FA8GXo5AVwhWZNPZ9z6GEjF45I0W3tEFts2fV
         83Qg/42aqwRBqxYO70bAi3+euKE4dCAkdI808ykqIuQaCkiM/htlVtrms/b+IeKcTjKU
         d1AwXtFeBjylbSg5xHTfr7V7RGIl8Isl9lpIxQ0P7P6zkCyRZ2OJpDvA94jLU3Z10E5a
         fixKx3MeL2j2yxYSAZu3ihBahvPg2SPq0LuCiIiUyZPZTAEks1g2kiZqFYkOpC1VltC0
         aD4z12O83brRfboYOAInH9lBLBuZoXAxdvrk1vaiN/cXWSWkGlic1hl0AFIM70ndf3lg
         YxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701291353; x=1701896153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QI6JHtznXvmxE5PL87iXN1BnHx/Zg4tCgMdyIcxQ2lA=;
        b=fNtnFZWlcX2qdR2Vy3B/tJ2iNqN9mkihQk8P/C23sEpRhP8+C8PJS+TUph1jg88Pb1
         6H0mo9omykSJEZDdqoBGL5c2U44b7tLZDICHugHIwFXGCEw3KfjHuaJcvPQYgXGyWWzW
         mur2oOm9UTdHmjC6Qyn/GY4F6zNQ+XXnb2Ca6buUwAjRVTzQlPlnbpLFHHYgXYb3LPFP
         n2Q/rSSYdCgkmszDVTe7mjnNC52nOc+bJju7a/svBacipOZ+ZC/unwtEmQ66a08bWoZG
         9ilB4uB6xJ1eOEMoX0WToxvGcO9LRGNyrmyohOK5LTGmV6Fpx7I8q3LvGr0I5lLkwKL3
         FnmA==
X-Gm-Message-State: AOJu0YzEg2N8XI6ElJ/bv8q2Kbh0sfvwMqd0u2lixgH1zm7MQ/VHnpfN
	r+5lmbYd5XKdRmHVS5E4QYs10r5SzLyZqC8uMO1Y5w==
X-Google-Smtp-Source: AGHT+IFYja56yAWBv64kZZunPEALyydYma3ufW+t+R0uNHZSBEmO8UtfKU/tUiufd3UXP+tq6eccK0k3AG7Z4sn8Heg=
X-Received: by 2002:a05:6102:e13:b0:462:dd0d:d028 with SMTP id
 o19-20020a0561020e1300b00462dd0dd028mr23246126vst.2.1701291353734; Wed, 29
 Nov 2023 12:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129142411.76863-1-brgl@bgdev.pl> <20231129142411.76863-10-brgl@bgdev.pl>
 <CAMRc=MfL2nHF78TUmRjRSUC-2zyMjWotzU7Tv_27mVJPLET40Q@mail.gmail.com> <ZWdQK1kUe3zLqWIb@smile.fi.intel.com>
In-Reply-To: <ZWdQK1kUe3zLqWIb@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 21:55:42 +0100
Message-ID: <CAMRc=Mc8Aahg1gD7DDtMOx77F2N9J10K+BBokY5w2ZDSG0ZJmg@mail.gmail.com>
Subject: Re: [PATCH 09/10] gpiolib: use gpiochip_dup_line_label() in for_each helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 3:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 29, 2023 at 03:43:32PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Nov 29, 2023 at 3:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
>
> ...
>
> > Any ideas how to handle this one? I was thinking something like:
> >
> >     for (i =3D 0, char *p __free(kfree) =3D label; i < size; i++)
> >
> > would work but it doesn't.
>
> Probably you want to ask Peter Z for this.
>

Before I do, I'll give DEFINE_CLASS() a chance as it looks like it
could be the answer looking at how scoped_guard works.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>

