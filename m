Return-Path: <linux-gpio+bounces-8302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B69F93792F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 16:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85364B223BE
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 14:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6142313C9A9;
	Fri, 19 Jul 2024 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IzuBvltr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE71582D64
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721399369; cv=none; b=UY5dwQbHDWBAltQkM3GwayzG/iCMvd5YWH//JRxqUNy4rphiNhbV8vX6rLqEml//FHCsqvQ55VhmzdA5iuNWefos2IixQBwOUVZA5BmQHS0Nk/nyDagJ4+om5I2anBpylsKoSw11Wtf6p9HmVjJh3G8HkdWBE/VnuhycLH2MQuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721399369; c=relaxed/simple;
	bh=iMZReatiQoXCUCDb4enmqaETvqLaixiQNHffC5I6OHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TxRKgoTh++2hX9SavXi0OttMh0/ilX0UuVmIY/jO8JxJGqBFrc62J5DrfXXMq0pHA0PCx2+oQMgNkOPQ5Z+dddBjYJNLd8swp/3RR0DQy+7OwWUgNR+DMt1pm5YNoQKOxwyx+HbsZazoV2zLBD+EUfwRTuAT7HTP18AyJNoGY2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IzuBvltr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc6ee64512so11483055ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jul 2024 07:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1721399367; x=1722004167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBvWWRz+Z0I0p9hXVMaA4ifSvelmfw5OGbtdTZr/O4w=;
        b=IzuBvltr+EVQKytD3yEAOX5W9aU0NkzTZnWLpF5heaAoino3ZrqZttGK/H9Y6tu8QO
         dPu+bEEgznWMtxLfx+kf6r8u6edYaqHXG0nIvoGIdWdhJr4APrg/gHwhiK/1k4EPx87K
         VSTd6do5alMeErlxd8zRWe03gs3TGf431hKT/zz8oeBJ0DzXRf1YlDnPH3xu1A8c7Npn
         ojI5bBJipWtQtYizL+/rsYm8XqWn3/9RltR763eKDGYlDnFBft0X79XFWqcwX8r58isA
         gKISXBMz8skpsfcSndGodalT1XB2CQLeLSUsSpqzLToRTxN5URPgA+elyTy1hi543Wrj
         J2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721399367; x=1722004167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBvWWRz+Z0I0p9hXVMaA4ifSvelmfw5OGbtdTZr/O4w=;
        b=GL32jfp/wvj6DqqH62Jy2ae+Q0WRtEwCvQOzT398mXTxAje358NXSDAkDHesP6mK9r
         MsMnGwBWHrfOplv4qz7ilXF8TCQaMF8FtDkQuzDTSgame1Xf5azUkBN/EWQUlLC85eTs
         9BfSn+o5ubv/LOnWQEw0/CwSgxXWK5nk1AXod0fJw+ls5hAfOeKIJZrkT4lDcCwHHYUo
         3aTCB26fhBgbO/mewUq1hCHNX3aZkGL/W5TsYGMRCrECMjBtHijWcP/3b1VPgMgJ8zPL
         ToVsoRpCaNC2XEtz7RKDX7XGPG+BbMEC3nBE/7tFQOsb9X5Mo06g+sKJsUvqScmBfZQr
         BDDg==
X-Forwarded-Encrypted: i=1; AJvYcCWXjH8Tluvltcx4NKV8bjFFHzkSwUJoOdSdCQTQ/JBrKYbzQrS9jzoILfWW8L4R/d9rgdzoSplpf6IzmQO+3/ugNcDCRrPaSVMLFQ==
X-Gm-Message-State: AOJu0YyXYEmLwYU4cZh6SEMKIvt1kueVDJ2jmI/PeqmKzYp09+i95uRx
	N5dk2Jl8Sg+PX6ir5GIvzBD1nn+3b4yDvX/5/N/oZPgEEachENwtxDT99YcblIytn7HDtPIVMnN
	DibEis/DRkhOEKumVXxRauVbMJRtz7iMIfqjZGw==
X-Google-Smtp-Source: AGHT+IHqlnH/qq9cgCs0u1oep6yl4EVnty5TdHQ4YvKkwNGd46o0D46seeJ728vOTUuaeVvxAJJMo6Uw7+U7mMdADqE=
X-Received: by 2002:a17:90a:5e4e:b0:2ca:f755:103c with SMTP id
 98e67ed59e1d1-2cb52930e7emr6116442a91.31.1721399367196; Fri, 19 Jul 2024
 07:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719114650.1551478-1-arnd@kernel.org> <CAMRc=MexLwZqoc-ymuu3OSu5YXcqdmfLuX88kK0uR_6WqHgp_w@mail.gmail.com>
 <6eb7d811-5c0a-4d0a-84f4-57323fd794e0@app.fastmail.com>
In-Reply-To: <6eb7d811-5c0a-4d0a-84f4-57323fd794e0@app.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 19 Jul 2024 16:29:12 +0200
Message-ID: <CAMRc=Mdny7t4NvsE3DQCQKs+DWOkp9Ee1XK3XmvVGGhbqQvq4Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: virtuser: avoid non-constant format string
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 4:28=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Jul 19, 2024, at 16:10, Bartosz Golaszewski wrote:
> >> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser=
.c
> >> index 0e0d55da4f01..c55b72e426c7 100644
> >> --- a/drivers/gpio/gpio-virtuser.c
> >> +++ b/drivers/gpio/gpio-virtuser.c
> >> @@ -805,7 +805,7 @@ static int gpio_virtuser_dbgfs_init_line_attrs(str=
uct device *dev,
> >>                 return -ENOMEM;
> >>
> >>         data->ad.desc =3D desc;
> >> -       sprintf(data->consumer, id);
> >> +       sprintf(data->consumer, "%s", id);
> >>         atomic_set(&data->irq, 0);
> >>         atomic_set(&data->irq_count, 0);
> >>
> >> --
> >> 2.39.2
> >>
> >
> > I know this should not happen as the string is checked for length when
> > it is set over configfs but while we're at it: maybe make it 100%
> > correct by using snprintf(data->consumer, sizeof(data->consumer), ...?
>
> Actually I now think this should just be
>
>      strscpy(data->consumer, id);
>
> There was never a reason to use sprintf() here at all.
> strscpy() does both the correct size check and avoids
> treating it as a format string.
>
>       Arnd

Even better!

Bart

