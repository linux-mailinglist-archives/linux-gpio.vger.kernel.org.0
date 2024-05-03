Return-Path: <linux-gpio+bounces-6022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7611F8BA5DD
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 06:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B328CB21A01
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 04:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D98E1F959;
	Fri,  3 May 2024 04:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4l4M156"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790957C97;
	Fri,  3 May 2024 03:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714708801; cv=none; b=r1bqP1DRlGN02hvCy4ySmZTFe/sAP7dd0nSWXvqu4B+nQU1nW3OzbuYbz/yeuWeZ1gmuUafR8GAjaVI7sc9X8236GfunxtFw/XjvLTn9nDCjdumhJZKzRAYpdVJdbPTZmrPtaF0teq3FnG/OyXsjKjn38h1DiHG09HbPvTY0GhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714708801; c=relaxed/simple;
	bh=aGKiw2tNfJj/B09OfrEFVun/96bRLGZeaAPbQLST/S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CafvlRMwQ7yE0b+wOTtFhDNXhBg45PfZ6AKk8UuvY1sbHC2Qh+De6AvVJ7hC99TCpDZFBS2/2pl+DN7ysXpVYmuV4gAymqt7xJwnLiJiQ0pjNFGuIAdOs+gTAw/TFcQKJOYGepTHWquR1w3RZz0B+GvCvdvrcvAciml93BZMQaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4l4M156; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51addddbd4so1032101066b.0;
        Thu, 02 May 2024 20:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714708798; x=1715313598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV5QJtATJH3udYqZkh4GKglvbY5CEqoLqxh1pEW+0os=;
        b=S4l4M156tI+iwIuWECusIAkVncTCK5saapAJk4JzgC+lCpZI7EHEIRZD4uCjtcJ6nH
         7Q+Q69bhZ1fLOAwFqmUhyn52eJR8ueyQg6lLVnh8CRsD5Nt+ReEpxNMuTO+tIgNBBhSg
         Hskjceb1ypf6q9IN7IOduOXKJvmgeg+nhxDK1M3JjYfVWqRcslytM1oB10cOmpYLuy33
         Esj6TDOxuq1ltwGFl09rVFEJGIaMtJNu6GzvfbP4YzuLmwA/o5yLbcLSfEpwz/eNjm+G
         gx4SDGeCYxut/sKs13GbJSHMBU2FSjFp4GOwny3KphLD+9gOh76jydbqKhOaZity3gqX
         DM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714708798; x=1715313598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV5QJtATJH3udYqZkh4GKglvbY5CEqoLqxh1pEW+0os=;
        b=q6xKFikP2rEawSLsGit8bHQRSB3lvnvM0VkIYfcfhVeLg+qDh1wc1T9zYSDHblCZ/j
         MlHYfLr3V0rpaf6MqXFlhOJd8Frxwg3tROP413YMzy4xtj7Has7WVlpoRWVu+LgHHY1J
         ZLLYcxiAK8wrtxO604gFXif7oOhYC+yQWemAJH88jIwSRGHKXlqXRdY1TFB819ICuD51
         lPA63yOxhWWngpHo75POafnPFdz8y5mBtZQHPEQlZe1rL2pwGgHuN+6K7ecTzd49ZNJV
         WWCz0MltSfO0cMz82U/2A9XTpqhUmVMYoVi4NKMRWoyeiM+SQX5CgC95J+vfZW6S/y2K
         3sGg==
X-Forwarded-Encrypted: i=1; AJvYcCXZkKINdyOkA7s3yIhLUwsEjbNMrdx5mSm5jO+HH9rJrujYi9abI2pSbbO6VwUAblOAdMXsUIjxF6Phj5sFK0GdoqQNJe27e39lAuXdljlDsQP3WUAohjgjCYEXDg6+dx3CrKNyx3DGiW2lU4//Kdie6XgfVmI9h1zNpDexr6xZDmPgLPxI
X-Gm-Message-State: AOJu0Yzf9KRWACWM3mzzra/CwlyEXzm2R2f1tCAmQkybfYIicAlgfjLd
	FRke87dIG9URTqi4L53MAble0K3SNnv1U5o/mWt5uvNsSNPpwicHXArDvVU/c61/8qjOrU1ryp2
	K34jqaaJuvRmAbJKTOXXVtYv7+34=
X-Google-Smtp-Source: AGHT+IFBiPQ7H0X8hwY8QcSaSdp+fVMaQ0cgmNra5IDf6cHwrabjJCBmZEcj9mQ+TgxfPzYxRNuPc0IYidPKogUi6KE=
X-Received: by 2002:a17:906:c7d7:b0:a58:ee4e:1329 with SMTP id
 dc23-20020a170906c7d700b00a58ee4e1329mr784943ejb.35.1714708797860; Thu, 02
 May 2024 20:59:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-3-kabel@kernel.org>
 <CAHp75VcgfvyZ9rcNev9CpQEN3CkUVozEkv+ycaQggPbE4tx+1Q@mail.gmail.com>
 <20240430160507.45f1f098@dellmb> <ZjELmaD3aQEuEa5K@smile.fi.intel.com>
 <20240502184005.fsdbwrbzmv5gshxh@kandell> <CAHp75VfktKyGUNBz18TUQknF-5YZDOTgh2WLJhTs-_Ay-wgQoA@mail.gmail.com>
 <20240502191756.ynwmp74yybat57my@kandell>
In-Reply-To: <20240502191756.ynwmp74yybat57my@kandell>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 3 May 2024 06:59:20 +0300
Message-ID: <CAHp75VcNDv=it_H8xt2p2J63UEqBpX_9qO3LxvQ3V_ZP0eStug@mail.gmail.com>
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 10:18=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
> On Thu, May 02, 2024 at 09:47:25PM +0300, Andy Shevchenko wrote:
> > On Thu, May 2, 2024 at 9:40=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.o=
rg> wrote:
> > > On Tue, Apr 30, 2024 at 06:17:45PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Apr 30, 2024 at 04:05:07PM +0200, Marek Beh=C3=BAn wrote:
> > > > > On Tue, 30 Apr 2024 15:53:51 +0300
> > > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel=
@kernel.org> wrote:

...

> > > > > > > +static int omnia_get_version_hash(struct omnia_mcu *mcu, boo=
l bootloader,
> > > > > > > +                                 u8 version[static OMNIA_FW_=
VERSION_HEX_LEN])
> > > > > >
> > > > > > Interesting format of the last parameter. Does it make any diff=
erence
> > > > > > to the compiler if you use u8 *version?
> > > > >
> > > > > The compiler will warn if an array with not enough space is passe=
d as
> > > > > argument.
> > > >
> > > > Really?
> > >
> > > Indeed:
> > >
> > >   extern void a(char *x);
> > >
> > >   static void b(char x[static 10]) {
> > >       a(x);
> > >   }
> > >
> > >   void c(void) {
> > >       char x[5] =3D "abcd";
> >
> > >       b(x);
> >
> > It's not the example I was talking about. Here should be a(x).
>
> Somehow I got lost. Let's return to my function, where I have
>   int omnia_get_version_hash(..., u8 version[static 40]);
>
> and then I use this function:
>
>   u8 version[40];
>   omnia_get_version_hash(..., version);
>
> If somehow I made a mistake and declared the version array shorter:
>   u8 version[20];
>   omnia_get_version_hash(..., version);
> I would get a warning.

Yes. Would you get the same warning if you replace the parameter to a point=
er?

> So the purpose is to get warned if the compiler can prove that there is
> not enough space in the destination buffer.


--=20
With Best Regards,
Andy Shevchenko

