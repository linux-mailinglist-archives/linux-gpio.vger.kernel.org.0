Return-Path: <linux-gpio+bounces-15420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BDA2A380
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95A04167A16
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 08:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986D72253E1;
	Thu,  6 Feb 2025 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Pe6Co932"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB03224AEE
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831726; cv=none; b=b9fAJGe9ByvOY5HcGp+ssQg/CGGQes9wsYnAjoNGyvn4DjAbUEG3TbAKkwEM9pXwOz8hgCnozoNRVnjtM4h/EcOjkO1N8jx6erGkdmlwK6sG3iW15JgGGb6AESBUGfRpF6ydBk2tVDyMkA0C/BAb6tNDoM8EZBivS6uESUL/SFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831726; c=relaxed/simple;
	bh=KG4acCOIksqVff6BmhrkBsGcmXyuuHsKTA8JB7oENjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Of3pyFTjGX1itobz1zXoKSDWO/ZjMsbI0dEwz13MBgBFDkZUWpwWEW6Co/tkCtlRCBneVxtlG4vQiKfXHI0J3aj1UE7qtvZnaMrwRIa/ceTtz3fcL+9d8A8ZE4xb4hlozZ1tyGECPtU6lUo9Gyq3X434/B89VYIlwSCVb9d+NSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Pe6Co932; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-543d8badc30so810559e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 00:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738831722; x=1739436522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KG4acCOIksqVff6BmhrkBsGcmXyuuHsKTA8JB7oENjQ=;
        b=Pe6Co932CuekqCwNZXvqRK0jNHh2pUpO8U23+CjMJOhwjC2RZcY8TDksMuhYYHvIkE
         bC7j3WfanNwfDgKPYnF5gR/mHj4DZsRSCUS0ew6yOePNV2Gy8nR1nYY1zm3E9cnEPmjh
         MvETfGrMWtxcMAzZU30E4OWXeveg4WvkpEnEu+s0oNi0LUbYn5vkWx9wJELI7U4jxwMS
         7wcgIEzk3sYDBO0k34ucQjN45THg7/NFR/Msr/8idpj6D7RZeR1FiazCGBC3FKlT8/jA
         eCD4MKDCAc1owAbQAatVx83whCr81eRciXiu7PlLNbtVvw7OPmMB/VwGfitpMh6D9Z8G
         t53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738831722; x=1739436522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KG4acCOIksqVff6BmhrkBsGcmXyuuHsKTA8JB7oENjQ=;
        b=AnqFwLHWmrue4P4AvxaMWzzWTKQDENnPTsAyS7B/sRLCT8zSIB5jWAtLu++Otu+Pr+
         ogY1xkkZCZgpysqNaHNgnfpx3i7uc5HdgaMPbPBaLpEvupTkqGh+QCkheV0/IB4i2FIb
         TagVTbX3fX+yh/WfSP0Wwp91yw4aQhmFaUCvozlHPeCIJwx73IZsphqRJhi/SIEruOJY
         9OE5zMQEZZ4mWKpZlThybTRTm/75mQF4FdQWum/aUgwcGFnHY3FNGnsoZWPiXmGqvmWW
         X2C5RwNX8NsUxOIvMtJOXLv20pN1kHCbsbfhu6t7GuHJlQNQfGGhMrT9AomjEhsCygEJ
         eH7w==
X-Gm-Message-State: AOJu0Yw3wnCvoTsuX92yfZsgDmlU0jKZfiXXTI/UcMfIz5fO3m0W1XIi
	5Nw9qMSNHxXBTX4aO6+7n5D3a4QtVnrEcudyyyyhhogfbBBa3A3bAYAYPtXXsl1fmruASVH5FSo
	Ump7oYBeXRyHYrrdKHzwHNrQI2T8ePnfGFLdVgPncQ0cWKT6C6iw=
X-Gm-Gg: ASbGncv5Gogcje7xCZ0zpeGRuoNZy5Ul8IXtAu+dMngseZNj+V7WhRzDb53RC6rPeQa
	e2CYFEVLnV9aR+rvrVif1o2QgUt40EbGTyTWPphf6QV+SJgm6mAjJgfzvlgfojWGEC4W+SMzBmw
	iJU2gqhtnehlT2/7/fwqgReDe/Ww==
X-Google-Smtp-Source: AGHT+IGJ4JjXv8pRiDAJeVlL1JbVFvZQtZRjnuEOB3gUhURu6veuOtd/kO9hEfmM5u+lyZbhbkkt6eSnTr8cU5qpZKA=
X-Received: by 2002:ac2:4e11:0:b0:540:fb1a:af1f with SMTP id
 2adb3069b0e04-54405a68294mr2487163e87.39.1738831721551; Thu, 06 Feb 2025
 00:48:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030164924.3276981-1-boerge.struempfel@gmail.com>
 <CAMRc=McDR+hK8t+dtAc6i57_JgozkwCUmYwpTtx=heF8v13fAA@mail.gmail.com>
 <CAEktqctbreLjq2fh27vW8YSob_ooQTDFCFda6HHmxbS8AQ0exA@mail.gmail.com> <CAEktqct2w3FBdce5993s9PNf+OtuCT_T69q5tSn6y_hRwuiNVA@mail.gmail.com>
In-Reply-To: <CAEktqct2w3FBdce5993s9PNf+OtuCT_T69q5tSn6y_hRwuiNVA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Feb 2025 09:48:30 +0100
X-Gm-Features: AWEUYZl4qH6IndohvwcXMoKKafY-4I55bY3oNPlYdO50K9Y1kAEE943z2S-ws2M
Message-ID: <CAMRc=McDT-apAk2=Me0Ahz4t_EWvhzGF8uemtuEbBtFT2Nu0Ww@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] dbus: manager: fix linker not finding libgpiod.so
To: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Boerge Struempfel <bstruempfel@ultratronik.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 12:46=E2=80=AFAM B=C3=B6rge Str=C3=BCmpfel
<boerge.struempfel@gmail.com> wrote:
>
> Hi Bart,
>
> While preparing a patch to add gpio-manager to mainline Buildroot, I
> encountered this issue again. That is, I can successfully compile the
> gpio-manager manually (using autotools/gcc/ld provided by ubuntu 2024) ho=
wever,
> when using the Buildroot infrastructure, I get a compiler error, stating =
that
> the libgpiod.so.3 cannot be found.
>
> After further investigation, I'm increasingly unsure on how the
> libgpiod.so.3 is supposed to be found by the linker in the first place:
>
> From what I see, gpio-manager depends on:
> - bindings/glib/libgpiod-glib
> - dbus/lib/libgpiodbus

Correct.

> - lib/libgpiod

This one is an indirect dependency, it's already pulled in by libgpiod-glib=
.so.

>
> However, I see no direct reference in dbus/manager/Makefile.am, nor can I=
 see
> an indirect reference via the Makefile.am files used to generate:
> - bindings/glib/libgpiod-glib.la
> - dbus/lib/libgpiodbus.la
>
> Am I missing something obvious?
>

These are generated in different directories, the Makefiles in there
take care of this.

> Furthermore upon review, I believe the solution I proposed last October w=
as
> flawed - I should have used:
> LDADD +=3D $(top_builddir)/lib/libgpiod.la

On Ubuntu, I see that gpio-manager is only linked against
libgpiod-glib.so and libgpiodbus.so. However if I cross-compile on
yocto, it's linked against libgpiod.so as well. I don't know exactly
what the differences in linker setup are but yocto is able to find
libgpiod without problems. Before we add an unnecessary flag, may I
suggest looking into how yocto does the linking?

Bart

