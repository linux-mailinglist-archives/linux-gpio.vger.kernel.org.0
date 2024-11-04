Return-Path: <linux-gpio+bounces-12508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E59BAFEB
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158241C2203A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42921AD9F9;
	Mon,  4 Nov 2024 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eKgs2VWt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EBF1AC426
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730713145; cv=none; b=mJoVIHiogeZ2RVO1I3IPApKEDicnEYHbJKsYyc2td6p/uXb/osPbDcBSzcvyhdoKefCLj44IapfM3JL0QeUlZlmLOZ0Lf94TMrJ2epqAVqJCv5l3NyMDdkOXYnPu5xVgNGgBbOrCKvCXaBL3JWa5H/aReeF6i9hq4kMH8bPBG1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730713145; c=relaxed/simple;
	bh=lWA4wBjqnudOhBPA3YKO6GmydLEaqN6nawopifkG9kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjRH7f2UFrEd1wUn2PItK5aYgzaTKXWK95Hhl874Hrg0QA6ESHwNFz6JTSYrniuF+S/DmMLUUQimp4cQQCM9r0agio5xLFx1FvBlcvZZbXRHyO7TV+UKvpHjnMwoVejcdWJquyrdmFmODnDhjE+CeSMxIihgRWLtQZvFh7b6U7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eKgs2VWt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so3690599e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2024 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730713141; x=1731317941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpQvt8QV10FkB9FVdzjKL66g/KP7VDUgARS3XzmfHRk=;
        b=eKgs2VWt2CEVU65sKQOLeSMVo92ymPHWFLsasCzOpnKlNcqH0S3Ptk6cFEifwxVkoD
         fbUGwTvhbPZCHklEDINCzC6WM4fFnG2PPhOIh2+xpr2cPiCiCK4lWg9ygF+JtrUImqVv
         6TKvsrBn+WjLblKiIYmNCB8ec0XSa/GXMUqHWlYWyYpTbtMbLntIlRvKbbUDX0dcQaLH
         6sRAoWC8NXp0P3cIxhXuh6LPDlP5a5rI9GZ6xcc/xtJSv/by6ZO1f6Pq1VolPj0gUu3Y
         C9Skbnu405mZu1LP9U36FlUcpWjDVu0hdpJ67ocPZby0in9qIWaHAxlq3gkPmNvqH94i
         eG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730713141; x=1731317941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpQvt8QV10FkB9FVdzjKL66g/KP7VDUgARS3XzmfHRk=;
        b=vnmnBgiDkABiHIF2Y8pr2dpB9np/MOC4gTfj3EVOGVs4ZfqtzaWPW7Y9wKRGjtBhfP
         Yiv8gPKWwHWkRYR2mPc6uFgqlaQIyK4ADP5s6wP8pOp2I5hym99+r6Vk5l8+2ihVgV+/
         AQkhFOwIAfNAUk/Mj8DkJE5vQ/uOR0S7GW4QtEiM9xIVK7lxvuiJnFEow3I0GftWCDGL
         5QTEQJ2oT3fyEpsXV7ihZLh4r5XD0EwECwFnZC21/35LBXRi2SdRvtjYXgoaZFkw4t4D
         kdzLv68tXIiIte/6n4TxnD4+8WriVRLCxgE1r1MCWQrcZSvhZBVQVp1YZEBFSmmam815
         OmNQ==
X-Gm-Message-State: AOJu0Yz90SXA9o1LyMH3gewr9hmwLTeXHwky00ZDabNZSW7T+FBVbvG0
	eokwaEO82BEyS6uKXLod9zHG5VCkQewR+RshmhVa0bN/KnQPzKndUxVypNt151mYXb9FkD3YhWT
	JWMbD8p6KtSmlrd5uZMsyMuMfDgr+6oV00YxbIPxF4ZAsxbHXXws=
X-Google-Smtp-Source: AGHT+IF7J2epgco4OhKtqmpdKWvUSFsqA4LzDGgRurEzjL0LicJzl863tFqh2AsUyP+gBqJMSUOQ5E0HCNfEm6QmLnA=
X-Received: by 2002:a05:6512:308a:b0:539:fd20:c41f with SMTP id
 2adb3069b0e04-53b348c3741mr17381087e87.3.1730713141432; Mon, 04 Nov 2024
 01:39:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030164924.3276981-1-boerge.struempfel@gmail.com>
In-Reply-To: <20241030164924.3276981-1-boerge.struempfel@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Nov 2024 10:38:50 +0100
Message-ID: <CAMRc=McDR+hK8t+dtAc6i57_JgozkwCUmYwpTtx=heF8v13fAA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] dbus: manager: fix linker not finding libgpiod.so
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Boerge Struempfel <bstruempfel@ultratronik.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 5:49=E2=80=AFPM Boerge Struempfel
<boerge.struempfel@gmail.com> wrote:
>
> When crosscompiling, the linker isn't finding libpgiod.so while linking
> the manager to libgpiod-glib.so.
>
> In order to fix this issue, we manually force the linker to look in
> the corresponding folder for needed shared libraries, when building the
> manager.
>
> Signed-off-by: Boerge Struempfel <boerge.struempfel@gmail.com>
> ---
>  dbus/manager/Makefile.am | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/dbus/manager/Makefile.am b/dbus/manager/Makefile.am
> index d1cef8e..32c9e30 100644
> --- a/dbus/manager/Makefile.am
> +++ b/dbus/manager/Makefile.am
> @@ -9,6 +9,7 @@ AM_CFLAGS +=3D -DG_LOG_DOMAIN=3D\"gpio-manager\"
>  AM_CFLAGS +=3D $(PROFILING_CFLAGS)
>  AM_LDFLAGS =3D $(GLIB_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GUDEV_LIBS)
>  AM_LDFLAGS +=3D $(PROFILING_LDFLAGS)
> +AM_LDFLAGS +=3D -Wl,-rpath,$(top_builddir)/lib/.libs
>  LDADD =3D $(top_builddir)/bindings/glib/libgpiod-glib.la
>  LDADD +=3D $(top_builddir)/dbus/lib/libgpiodbus.la
>
> --
> 2.43.0
>
>

Can you give me more info on your environment? I'm cross-compiling
just fine and the:

LDADD +=3D $(top_builddir)/dbus/lib/libgpiodbus.la

bit should be enough for linking.

Bart

