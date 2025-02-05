Return-Path: <linux-gpio+bounces-15414-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E3A29DB0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 00:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A10C618885D6
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 23:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224BE21B19F;
	Wed,  5 Feb 2025 23:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfONi/co"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E718A6BA
	for <linux-gpio@vger.kernel.org>; Wed,  5 Feb 2025 23:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799211; cv=none; b=edF6fjN8nrH2SuqMtAYpv5GDG6hAnfwCiA9meo9YPI/kunVuoJ/dSR4shpxLVYVNyWIPDlhgcWkHYNt9xG6vvLgYg+tG7seHFf96HDEE+/3MTLKrjLWPzmlwzr357CAB2iaQ78e29rYFtevvmTdGDtxt1GgSQ/T1lp9JafbVF+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799211; c=relaxed/simple;
	bh=pzo/LESxq55WPDz5Gj9ufthODnxfXx5t9TOmq6kIMUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewDvtWGSsLK5ZZLSia6r1Ls06xgNnLPUvMWIWS+oc+zWnvyl9lP3HdupLoszyhQfZm1RAiwd9G2k4dTAko2DMcLwpcCQpO5it1osmNkRctU3i4fiJnwXxVlaU8+8ygpoKL73TA1l0qHN+Qim9eF6r7+DLx8XTFNeP7TbksWeC6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfONi/co; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so60508a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2025 15:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738799209; x=1739404009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPgQDcR+KUX6tLQRUEpaiBcXSp3/60ph0aHC8SgS7LQ=;
        b=cfONi/covPcN5YqZOCVDf+eZBGmSahvK1PN17YwYwHGxnNl0ZYMBzrAmiMYipVg9UL
         zfw1Vt/dzg2cwyvXx5xA8/yuAYSaQmy9WpRldgfJvtKNS+mak2bVhGrGOHclpRlxb+5H
         I5+7WRj2ml1eo9arNcVcqddZoV7vNQru5I3mwGgYBF5/1fIxd9OTX/s5oB2+peRgdR5Z
         VqSx7gN+Wkx5B0oBBTxgMPSjdn9smTTTpuA4+AToMpcsECOAgDVaGviF/l7I7rr8k8fN
         f7aXRLMo3XOPzxV2T3QXRu0mKVv3GgGazCTOWe1tg1Eyzzb01Ir08GPA/cp0ZyFSQPRR
         /Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799209; x=1739404009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPgQDcR+KUX6tLQRUEpaiBcXSp3/60ph0aHC8SgS7LQ=;
        b=Uf9DL+ve7IPncAY4j/9kfCfFWiNjhisMSEWzJ4XNnf6m9mWFyRSDKi2uQ86Y3PHXKf
         VFgDVZtFOrdIs/raD35Rm0gqd/na+sLzIq57z5YLCzzOkDw09zt0yTwGw+Yqk9peNRe/
         YRGCKrK2HwTB6972Deji3cc85B/shUJPBUt6N0sYrP2C/JIXNRgKheKZIB25Y599k03L
         1b6Z0wkgqeFDYX8PquL13iBhGLZ0mxUpEyUYX18lvGCnIxtyywEvuda7dV/Q6hzCKTXi
         IipFV3PS2MDzGUw8A/Vvc6I0M0GoOuw/yicfq9DB7lmC4zaXgk9uvsvAA79Bo0Yszsyn
         /RJA==
X-Gm-Message-State: AOJu0Yy3rPlqT4vSOj/3ZCBMZNbt8sBujCrN7+lb3oHUbD/WlOK+RLhx
	UCoCU7LUBEnAg9ICRLkQb8jjKKpBIbdEeAdTEIWz6oMkvocEec0e8SG2lIL43bCS0XVh+J7wvK0
	adb258BNLvxmIRqO5buKXpxKOTo6RfNlnJr4=
X-Gm-Gg: ASbGncvzpPQUMDbhDcZ3MX+0PJ+++jv0eoq/58kKWz51rLVGJ2cCfof5DzgpKgHIH1i
	cZ4amIqf4lWHpEs98UIsfMXhS3kYXMCY3eWrh5NfxiYYKGN13gnkCVR3F1VkkqciO3MXrWXoFn4
	63dRIlCYOvBllI1USdIGcWPudKAFuI
X-Google-Smtp-Source: AGHT+IHY+tprBq8rcrPxx/jsSm0T0j4Sk0pBbt91TGlyG4Nn91kRaQPbjAqlPKT2x7tUF+uXzG6gAn/FlgknHiWxxN8=
X-Received: by 2002:a17:90b:35c9:b0:2ee:ab27:f28b with SMTP id
 98e67ed59e1d1-2f9e085fa8bmr2921079a91.7.1738799209380; Wed, 05 Feb 2025
 15:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030164924.3276981-1-boerge.struempfel@gmail.com>
 <CAMRc=McDR+hK8t+dtAc6i57_JgozkwCUmYwpTtx=heF8v13fAA@mail.gmail.com> <CAEktqctbreLjq2fh27vW8YSob_ooQTDFCFda6HHmxbS8AQ0exA@mail.gmail.com>
In-Reply-To: <CAEktqctbreLjq2fh27vW8YSob_ooQTDFCFda6HHmxbS8AQ0exA@mail.gmail.com>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Thu, 6 Feb 2025 00:46:38 +0100
X-Gm-Features: AWEUYZl8KaPrCtzIR58iBnNhBoGondDrpydwqtAVZ3NsdRjVZaabOn9dyq5GX34
Message-ID: <CAEktqct2w3FBdce5993s9PNf+OtuCT_T69q5tSn6y_hRwuiNVA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] dbus: manager: fix linker not finding libgpiod.so
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Boerge Struempfel <bstruempfel@ultratronik.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bart,

While preparing a patch to add gpio-manager to mainline Buildroot, I
encountered this issue again. That is, I can successfully compile the
gpio-manager manually (using autotools/gcc/ld provided by ubuntu 2024) howe=
ver,
when using the Buildroot infrastructure, I get a compiler error, stating th=
at
the libgpiod.so.3 cannot be found.

After further investigation, I'm increasingly unsure on how the
libgpiod.so.3 is supposed to be found by the linker in the first place:

From what I see, gpio-manager depends on:
- bindings/glib/libgpiod-glib
- dbus/lib/libgpiodbus
- lib/libgpiod

However, I see no direct reference in dbus/manager/Makefile.am, nor can I s=
ee
an indirect reference via the Makefile.am files used to generate:
- bindings/glib/libgpiod-glib.la
- dbus/lib/libgpiodbus.la

Am I missing something obvious?

Furthermore upon review, I believe the solution I proposed last October was
flawed - I should have used:
LDADD +=3D $(top_builddir)/lib/libgpiod.la
instead of directly modifying the linker via:
AM_LDFLAGS +=3D -Wl,-rpath,$(top_builddir)/lib/.libs

Kind regards,
Boerge Struempfel

On Mon, Nov 4, 2024 at 12:18=E2=80=AFPM B=C3=B6rge Str=C3=BCmpfel
<boerge.struempfel@gmail.com> wrote:
>
> Hi Bart,
>
> thank you for your reply.
>
> you are in fact correct and the LDADD is enough. There seems to be an
> issue with the sdk I was using. After manually crosscompiling using a
> different sdk, I no longer get the error that libgpiod.so can not be
> found by the linker.
>
> The sdk with which I got the error was generated using buildroot version
> 2024.01. However the error does not occur on the current buildroot
> master version. Therefore you can ignore this patch.
>
> Kind Regards,
> Boerge
>
> On Mon, Nov 4, 2024 at 10:39=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > On Wed, Oct 30, 2024 at 5:49=E2=80=AFPM Boerge Struempfel
> > <boerge.struempfel@gmail.com> wrote:
> > >
> > > When crosscompiling, the linker isn't finding libpgiod.so while linki=
ng
> > > the manager to libgpiod-glib.so.
> > >
> > > In order to fix this issue, we manually force the linker to look in
> > > the corresponding folder for needed shared libraries, when building t=
he
> > > manager.
> > >
> > > Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
> > > ---
> > >  dbus/manager/Makefile.am | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/dbus/manager/Makefile.am b/dbus/manager/Makefile.am
> > > index d1cef8e..32c9e30 100644
> > > --- a/dbus/manager/Makefile.am
> > > +++ b/dbus/manager/Makefile.am
> > > @@ -9,6 +9,7 @@ AM_CFLAGS +=3D -DG_LOG_DOMAIN=3D\"gpio-manager\"
> > >  AM_CFLAGS +=3D $(PROFILING_CFLAGS)
> > >  AM_LDFLAGS =3D $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GUDEV_LIB=
S)
> > >  AM_LDFLAGS +=3D $(PROFILING_LDFLAGS)
> > > +AM_LDFLAGS +=3D -Wl,-rpath,$(top_builddir)/lib/.libs
> > >  LDADD =3D $(top_builddir)/bindings/glib/libgpiod-glib.la
> > >  LDADD +=3D $(top_builddir)/dbus/lib/libgpiodbus.la
> > >
> > > --
> > > 2.43.0
> > >
> > >
> >
> > Can you give me more info on your environment? I'm cross-compiling
> > just fine and the:
> >
> > LDADD +=3D $(top_builddir)/dbus/lib/libgpiodbus.la
> >
> > bit should be enough for linking.
> >
> > Bart

