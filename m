Return-Path: <linux-gpio+bounces-5770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043028AF5C9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 19:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B46EA28E11B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Apr 2024 17:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD08D13DDA5;
	Tue, 23 Apr 2024 17:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VwCAqKUK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB613CA97
	for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713894310; cv=none; b=KRyAQSzFn7S5bW+S8O3V75UvJ1ib2ht+yTR5ddiIKyuwJdM+1d6zVz8ks0nvgdH5igUXnIPVoOsp/S+gABsMOznr2EIfnl0rbCLhYo6sfbS22EhcTE+V2ljsRkWEx707cPAm9kM1VvUm4EokWklEStwZ7Djaq5rBCXVUWmRAeoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713894310; c=relaxed/simple;
	bh=zsA7HRue7gY4RnWWHVnzkx+08LJRNHJr5PRrv2YFiTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTzMdtzbyYJ0FfP4hHrLvKgzFSkZ57mtUSb8JV1/yo8M1rS7GpSmgp6WFEYQZzkSCBiZ7FZDllZ2aY123A4OnfA6owtg2orKYQ4JLaAH24cL7pUoUZOQDYGPMcbFToJinqSY0qRVc0eQi6PGfwScnoP/YZDuRsMtneVvveQtSP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VwCAqKUK; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-518a56cdc03so7317325e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Apr 2024 10:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713894307; x=1714499107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsA7HRue7gY4RnWWHVnzkx+08LJRNHJr5PRrv2YFiTw=;
        b=VwCAqKUK+3gX/NSMS2vv/0eLmnI/grY2ywN+EIsXreXEqzlM5xb/658awaQNL3DCTg
         ilccuS7ZHzbb7QlqTeUjfrVufgPs4r3PQqIO21QtCMzQ+O8d6FdCrf3o1T6vlU5rpV9S
         UMmyHsg1D4RZH6IaaOsFEd6eG6PmnFWVNsRVRUhrReu0a8LMRD/s2NGYUSN+DhE4spY1
         in5S+6vkbEO7Ncjg4aI4Gy9fZVYwS9sXibQHeZm6E8AhO1OCQlfICceu8rhN+abAYuMn
         Rk55N02osmNHW24ymbOwv7haGt9meZuHEZxhXA5X7LWNW75OuLSeS6cUrfSaYMVsYAd3
         Cz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713894307; x=1714499107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsA7HRue7gY4RnWWHVnzkx+08LJRNHJr5PRrv2YFiTw=;
        b=laI/G19Y+DeGrQY1vNEMiInSGzokXfnqUqfhdceMZEp+NIaCPnQiFMClK8MiiaCTgs
         +7NgxeIZ6R0X1FBeil2mDmfCs7DzlwVZ9IxU6PdQozYoghJKhlOxYNuXwjikL2B/SbBf
         vTHx+2b0HnrFAoGKRsJYzwkPwziV3g/sYne0P9BZlDnUAMkHT2odd4Wpk3ODvnQ6O6oD
         zvoIVWzOATZj4ZTiyj2NnLh6Ie87/27bqHG10pKGsts+FKprxkm0pMeUpX0gWBAtmaqV
         SK1vz6sVtg24/uUBBAOr9twEZfcLKxvATIhQ/7QSMP4FDKEYaCWn4OcJX9m90wFmGgds
         QBgA==
X-Forwarded-Encrypted: i=1; AJvYcCW92fa8UiJUynLIMAAjcVbERm7HArSyjkwE0Nee7cplKYmsOvftsrbnXVN0bY7iK2D50DLt/zG7EFzEo14WAqy6UU/4zt1MPP7fRA==
X-Gm-Message-State: AOJu0YwxXurate3i7FNgbr95Ba55O2AIE9+C69021i0lx20T5w5UJ1+S
	L5Hkf+kVsa7mJhqmQ7noLSUb2Wkwj/jRrN9bAXnGJrqKokPWGMMxuZrcAkNMW1MHW/BO5nyhGGU
	XaqZdzGsmy9MzVUrkXXz5WCCP2leW7BZhEMpiRw==
X-Google-Smtp-Source: AGHT+IFF4lk1rU2NTClOa7jkwDxyp2phdE0cUNSwQTfbR7NX7i40pxAOgG1d1w6oAgHtLSQvhpwQoXvmrNNPFM8D2h4=
X-Received: by 2002:a05:6512:2383:b0:519:2a14:8511 with SMTP id
 c3-20020a056512238300b005192a148511mr200646lfv.69.1713894306562; Tue, 23 Apr
 2024 10:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412122804.109323-1-brgl@bgdev.pl> <ZifyrLNQ9AV0ohBt@smile.fi.intel.com>
In-Reply-To: <ZifyrLNQ9AV0ohBt@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Apr 2024 19:44:55 +0200
Message-ID: <CAMRc=MedcewoMgykmvB1PHhZNVHMVsPJwzuWhhng3bfV7S7OzA@mail.gmail.com>
Subject: Re: [libgpiod][RFC/RFT 00/18] dbus: add GLib-based DBus daemon and
 command-line client
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 7:41=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Apr 12, 2024 at 02:27:46PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > For DBus, most of the testing happens in the command-line client bash t=
ests.
> > It has a very good coverage of the daemon's code and also allows to run=
 the
> > daemon through valgrind and verify there are no memory leaks and invali=
d
> > accesses. I still intend to extend the C test-suite for DBus with some =
corner
> > cases but didn't not have enough time for it.
>
> I might have time to briefly look at this code, but I can't test right aw=
ay as
> I have no setup that uses D-Bus, all what I use is a simplest Buildroot +
> Busybox.
>

It's my long-term plan to also have some hand-written, binary protocol
and a simpler daemon that implements it. But it's going to be a couple
years most likely before it happens.

For now: this is aimed at people who use proper distros which
typically include systemd and dbus.

Bart

