Return-Path: <linux-gpio+bounces-15558-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53350A2C7A0
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB1116BE59
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F9824635D;
	Fri,  7 Feb 2025 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUmVpxDC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39351EB18D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943114; cv=none; b=NPmnUo0jdSKO/A3Uz5xd2+1KrlxkLqN1omamzaX6Au4jZYHyHcdPCKbY6y6DVl9GpJ0De819L1YP7lm1H/zQ5isMHG1VYWQ5Hc3syjQSuwWL3MJae4KfDZAW0g0SholenMVyFiwJo1hF12PalmCH1EKZbX6+ZkF5soGp7Js3uYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943114; c=relaxed/simple;
	bh=QycRRgHIxy4ETSckeXSh8sPqcwHBpFjBsFaIG1HJqjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+r6ZbDHgcUyAXPxkyiC0bvYjC6y4mrK9U2N6a+WphroIbFASDbqhmb7aRi82z63tkQ5Fqmw8BemdldMXAIZ4raLcnZEWGbiHEQbgZyZYJD4NFIVghD8HZegU51bFLgft3RbDaNBraOtUtCF/yA1xeOteqqr/QbPL1hmv9oowv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUmVpxDC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21bb2c2a74dso5381595ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 07:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943112; x=1739547912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZjhOSrdirDierZy/P7aAvFWbtfQfMSSXsi+CBuznaQ=;
        b=BUmVpxDCZNIZO3ZB+zzUTbdVz6MrS7w3yHw+0nBFEQmP+TazCe8+i2VTzwQiP6VcyJ
         0EDblDhtw0PWSJhDdzlfTeZin25fp7YH7Or5dEUvuFXzBXYUfKrrEBK3ZjCcaGhaxIdk
         MhdUIueOFr0qC1QmEVMwaC6n5S8gII+jrPe6ZjIBMPxikEpFaU4DQaV7bB3uEiIfpQah
         0fgT2V8k1y7Jn5QQNTaqn1qSZhmmLNiJgZ+EuLTM61SlGbUX5zgHH+9cpUY4z33K0Fm0
         pz74fd/BxzLPqBo3FWhj1+tPxjq8yPmdIP86duWql97+6HS+mPH8VKnCSuOBfMqmu3oS
         JUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943112; x=1739547912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZjhOSrdirDierZy/P7aAvFWbtfQfMSSXsi+CBuznaQ=;
        b=Nf5ee7cw3+0yg+Osxwce+IenBG49EyuqoWE5f21c0SRQ0D1OQvPDLBN8i+WTpuDhBu
         JTXd81Z6nchGm+8ijquKojFHg/UiKQa9h5rtHVTzXRIDhjXURkAIa7U1hMVDSEMjU5jN
         Qz16LN6DVgciyW/1XDD4/IZK4cQN389Wx3u5fWl28LASrQBinEFiZYsRs4rhqAL9dK8d
         WJBOLkVwoPaMVzAvW6cN0krsIPYJO2iGLUpzcUgSnZCHOgCwULKpvMEptbCAi/9nS4Aj
         6+xl0ULZL8WLCV/Db1tuEYeyn+7Xa1CkK2tHrptWellpZfyC1jzaScREXvIxZYjAWHHM
         1csg==
X-Gm-Message-State: AOJu0YwcvzTuS0uAo2p1lNxNgm2u8n8aiomQUmj2s16jt7w5meqiHgIr
	6LbFIAH/ynocIsEjR8Hgjo1TRZwR8A3tgvL4zeg7ca+VrIdYBBdaxW+CMAzL1WhAurAp4Sf2UpJ
	IX+zWZuXfy8IbEmL8bK1upraForU=
X-Gm-Gg: ASbGncu/J4YfaFqGcU09R4uzXkjnxS/muT/GiCXuXgIXy4jNTB1IcxeyFYTX6chnFJI
	tpr86e6YJIFMslMNNHHUAvC4R0D51CxxynAskcZui85CofcMc+QKZD0kKJW2DQ+UNuab0f0x1lW
	P6mtXJlMoML56oR0XmjQreEuYupgpw
X-Google-Smtp-Source: AGHT+IGqQ7BA3BP9uDJNFumsU/C5HC5TYYjNqv07Qv7yIfvdQjrlb0Bptc50NN3sPNmuB6wV4AV9bOGuPqa17sEKlZw=
X-Received: by 2002:a17:902:f60c:b0:215:2f19:1dd with SMTP id
 d9443c01a7336-21f4e772a58mr21198625ad.11.1738943111946; Fri, 07 Feb 2025
 07:45:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030164924.3276981-1-boerge.struempfel@gmail.com>
 <CAMRc=McDR+hK8t+dtAc6i57_JgozkwCUmYwpTtx=heF8v13fAA@mail.gmail.com>
 <CAEktqctbreLjq2fh27vW8YSob_ooQTDFCFda6HHmxbS8AQ0exA@mail.gmail.com>
 <CAEktqct2w3FBdce5993s9PNf+OtuCT_T69q5tSn6y_hRwuiNVA@mail.gmail.com> <CAMRc=McDT-apAk2=Me0Ahz4t_EWvhzGF8uemtuEbBtFT2Nu0Ww@mail.gmail.com>
In-Reply-To: <CAMRc=McDT-apAk2=Me0Ahz4t_EWvhzGF8uemtuEbBtFT2Nu0Ww@mail.gmail.com>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Fri, 7 Feb 2025 16:45:00 +0100
X-Gm-Features: AWEUYZk7A1KP8lmgN1mrIA8Q82Llpcpt-2iE8INjcP1drhCNCvCYQPB4c8NmWKM
Message-ID: <CAEktqcu3+to5VBA5SSM51gsZqCROyRtRXCW09_6L16vXaWhAnw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] dbus: manager: fix linker not finding libgpiod.so
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Boerge Struempfel <bstruempfel@ultratronik.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Thu, Feb 6, 2025 at 9:48=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Thu, Feb 6, 2025 at 12:46=E2=80=AFAM B=C3=B6rge Str=C3=BCmpfel
> <boerge.struempfel@gmail.com> wrote:
> >
> > Hi Bart,
> >
> > While preparing a patch to add gpio-manager to mainline Buildroot, I
> > encountered this issue again. That is, I can successfully compile the
> > gpio-manager manually (using autotools/gcc/ld provided by ubuntu 2024) =
however,
> > when using the Buildroot infrastructure, I get a compiler error, statin=
g that
> > the libgpiod.so.3 cannot be found.
> >
> > After further investigation, I'm increasingly unsure on how the
> > libgpiod.so.3 is supposed to be found by the linker in the first place:
> >
> > From what I see, gpio-manager depends on:
> > - bindings/glib/libgpiod-glib
> > - dbus/lib/libgpiodbus
>
> Correct.
>
> > - lib/libgpiod
>
> This one is an indirect dependency, it's already pulled in by libgpiod-gl=
ib.so.
>

Yes. You are right - there are no direct calls into the libgpiod
library only via
libgpiod-glib.so. I also verified that the libgpiod is properly build and l=
inked
against the libgpiod.so.

> >
> > However, I see no direct reference in dbus/manager/Makefile.am, nor can=
 I see
> > an indirect reference via the Makefile.am files used to generate:
> > - bindings/glib/libgpiod-glib.la
> > - dbus/lib/libgpiodbus.la
> >
> > Am I missing something obvious?
> >
>
> These are generated in different directories, the Makefiles in there
> take care of this.
>
> > Furthermore upon review, I believe the solution I proposed last October=
 was
> > flawed - I should have used:
> > LDADD +=3D $(top_builddir)/lib/libgpiod.la
>
> On Ubuntu, I see that gpio-manager is only linked against
> libgpiod-glib.so and libgpiodbus.so. However if I cross-compile on
> yocto, it's linked against libgpiod.so as well. I don't know exactly
> what the differences in linker setup are but yocto is able to find
> libgpiod without problems. Before we add an unnecessary flag, may I
> suggest looking into how yocto does the linking?

Here is what I have figured out so far:
 - whether libgpiod.so is linked to the final execuatble seems to be
at least partially
   dependent    on the version of autotools and/or libtools. (Tested
by backporting
   yocto's autotools and libtools)
 - there is a fix in the yocto recipe for finding the libgpiod.so bit
it conserns only
   gobject introspection, which is not the problem I am facing with buildro=
ot
 - The behaviour of the problem I am facing in buildroot does not depend on
   gobject introspection as far as I can tell, since the error happens
independent
   of it. (which is good in my understanding, since it is what I would expe=
ct)
  - there is a flag in the libtool "link_all_deplibs" which yocto sets
to "unknown" and
    which in buildroot is set to "no" after the configure step (I
couldn't figure out the
    reason for this yet) If I manually tweek this value in buildroot
between the configure
    and build steps, the gpio-manager is build successfully (with or
without an explicit
    link to libgpiod.so depending on the version of libtools used).
However setting
    this flag to "no" in yocto, still leads to a successful build.
Therefore I don't think,
    this is the root-cause of this problem.

By now I fully agree with you, that gpio-manager should not get libgpiod.so=
 as
a dependency even if I don't know yet where this error is coming from.

Kind Regards, and thanks for your support,
Boerge

