Return-Path: <linux-gpio+bounces-3959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 669E286CA38
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FCC1281C60
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24217E572;
	Thu, 29 Feb 2024 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zCjzg7KP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9418EFC17
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213162; cv=none; b=KlOaumUdNVbxjTIEp0oVkunxO7EU5kJNtKof4RWH5BvNT15j4/I+GclssRgMfgGkprsqRuOIiSdE4rarIGPawP492hmkp4g4ZfUPE3Hiv6J1D2z2zKY0S4YG372hF5i8JJ4sHzUFb5XvSmpRGIK3RYFDW3Rb3Y0EgldAT2HlCQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213162; c=relaxed/simple;
	bh=y/tJAMxQ+cwfsfIHcfgUj4FeCiOFwidgLKZSboa1EpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGThpx12/An47mA4Y+Int49IoWAN2LlSYItGR088IZp++wIEirVDXNVwUpHHTfLbAZH7EZxqTDT+0KWuAp/AHOiPcYrgeUbmXbk5Uo/FXsRKonNnYkmae1WIfDhV8/ncwsFLIOrI7yE4gPLpsdQOCKnEr9n9kcye0Z8PLhGjvHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zCjzg7KP; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-47259486a1fso228909137.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709213159; x=1709817959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/tJAMxQ+cwfsfIHcfgUj4FeCiOFwidgLKZSboa1EpY=;
        b=zCjzg7KPpaSkPJmlIcMfZ6I5tnLcK238aGGRKY4JCSiG31hRm7S6WYoAAI2nQFRfku
         1fI/Fwin1Rxk4DoPb5xJCpJMdNrEeZEw80OS3AgMlnwRf9blx63GCDvtM2zAAwCvhapG
         0TlOrKcPKDkDPgCUyhftSUvG2SWYLkcnLSSS5k3sAq7cQFRrWYIilOUj3yx2FKUneBw0
         KBp6HN6nR/KtFb2Mbf7j7Yko/Pz9IvlWkDlg3EFB5oanvV4xtUWK1zYSdrQP6ppihy3l
         aD1QI6ftXnNhjc9icqfUNS2Ps1TMsaNvihsTCzUBDixxcXm1fJKDcdOPpUzqVkYdC3iY
         821A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213159; x=1709817959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/tJAMxQ+cwfsfIHcfgUj4FeCiOFwidgLKZSboa1EpY=;
        b=Igf71yH7u+VXXxQ4Zxt9g9+xWLWZlzKc7m7nZsQryiwrwhKVK37QDDIegomXIWyR6G
         er5nCV8F9Uz68k5UuPJKs4zrfHoAWcYIHx6rAXaU2uCmQhsp7MNoY7SIsFsw6DAZvTG+
         2u/8pRDF6ksP///7Upjh5jbEQoDxwKwpOz2gyoCvf5GjWOUANHGxZjk0JnNSMQm44m5B
         WgsG90LPexp/3pCpgCCGK3K+uKhvv7n4IIitzUHKXGbiLXoulhry0SZCHG6of8+yPPo9
         G+DvCje4kBD+NJ9/i8Hw4ZXseIoOXoGMs6s0hWvE40dDJhpLG4cAx6udoinKbfxfvP+n
         ORpg==
X-Forwarded-Encrypted: i=1; AJvYcCVeGYIgj6BG+fAiYQ2G2fv3MA7CkwNmswtQpgMDB+ep2ABEUYO6EOZmW+bA27Jys6+NWWlhcUYaCMkOJ9NqrUIpmeeHOvinXqimcQ==
X-Gm-Message-State: AOJu0YxxX2sSD0SimpwiSOCjBQAvNVSqt+RobizyPf0OSrOJWWbCRf+r
	Qd3dq1XArt/MoJQVHt3PQQ86ZFObRCtLOjFxY0jkfdCOzsZoL1So9YP7qne3ZqiPy6yK4N+akMr
	GBZUyt5AUm2eMjYapBwEVwCPusdjeet3n79eGBQ==
X-Google-Smtp-Source: AGHT+IHpZJTPqPtuphv4MbQgWX/SYRurm8+qWjWUCKK1fle3TARSJNd38FEfyew1FVh4MnnHAs6G/0Ts5OHCM0Na6J0=
X-Received: by 2002:a05:6102:f0a:b0:472:6e61:8df9 with SMTP id
 v10-20020a0561020f0a00b004726e618df9mr2240745vss.3.1709213159474; Thu, 29 Feb
 2024 05:25:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229084555.43701-2-arturas.moskvinas@gmail.com>
 <CAMRc=MfTo7MnfMhRQsjeFsLv3yjEtP0C3ytqACN+nuGw0Sr-Bg@mail.gmail.com> <15e6e45f-7398-4703-8154-35e769bac94a@gmail.com>
In-Reply-To: <15e6e45f-7398-4703-8154-35e769bac94a@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 29 Feb 2024 14:25:48 +0100
Message-ID: <CAMRc=Mf__-sbAV0xuC2hsxm_-kQWqgxSLRYLKqt9-ce+8_Kf_w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: 74x164: Enable output pins after registers are reset
To: Arturas Moskvinas <arturas.moskvinas@gmail.com>
Cc: linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de, 
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 1:23=E2=80=AFPM Arturas Moskvinas
<arturas.moskvinas@gmail.com> wrote:
>
>
>
> On 2/29/24 10:54, Bartosz Golaszewski wrote:
> > On Thu, Feb 29, 2024 at 9:47=E2=80=AFAM Arturas Moskvinas
> > <arturas.moskvinas@gmail.com> wrote:
> >> Chip outputs are enabled[1] before actual reset is performed[2] which =
might
> >> cause pin output value to flip flop if previous pin value was set to 1=
 in chip.
> >> Change fixes that behavior by making sure chip is fully reset before a=
ll outputs
> >> are enabled.
> >>
> > Use imperative mood in commit messages - make it: "Fix that behavior
> > by making sure ...".
> Chip outputs are enabled[1] before actual reset is performed[2] which mig=
ht
> cause pin output value to flip flop if previous pin value was set to 1
> in chip.
> Fix that behavior by making sure chip is fully reset before all outputs a=
re
> enabled.
>
> Bartosz, does this look better?

... if previous pin value was set to 1 period

Bart

>
> Arturas Moskvinas

