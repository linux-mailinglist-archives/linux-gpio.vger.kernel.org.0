Return-Path: <linux-gpio+bounces-7843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D2C91DA2C
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 10:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F741F22480
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 08:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED5C59155;
	Mon,  1 Jul 2024 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SFhiiU9H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005675C614
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jul 2024 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823254; cv=none; b=fBYuj4/pDPW8AlJQ5hhvBWQ1/uOU0ymmsdDEinip8Q0tOUHpNhafHq0FTKGRYElW/k4IMAcTKjkgz8eTqXSzY9xX1LVDI0mmqEeaUYvDeFVvdQU0wZZ1AIseqEc5CH2uiXVH01XJIkNHOGKeiQKBsg8SI7n48nWQVmCXAUhO6yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823254; c=relaxed/simple;
	bh=2+Fe9hoW4AploGFoNLLdaAGPuHsWe2F4DTPv9YEapUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P83OvbDDTyC8j4GLKg8x9oJqk0An/R1fQG2e52y4LTCnoeOw0r2SPCAcgdmS+oRx516NYFDPKaEmw+3tmBOtiX0BP4kvOpL4TYtfMPJmO4Lh+wK5d0svxsY+1LUrYB/P/ZcXJ2BfDa0iG2f8nU6XaDEAGZItKqlu0CifxjwEbTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SFhiiU9H; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e72224c395so30119921fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2024 01:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719823250; x=1720428050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRWkczDzQtD/lCQ/Lqw1rFZHPlIxUqfjMcVfnTyOvBc=;
        b=SFhiiU9HWEPzD941u14FfzHys1Fbmk/A7XqYxhcPglAeDeF8hEjNE/yB3fziwpwOvi
         OC4uSGtymqWNzyoawujLLD9WtPB726zw1b/fJE3tHgAVKcysKmDVZAPYwxdJ6rAFLKfP
         PvDZ4Z2bXeE0obYr4b2l/8HQZ4grSGvDGHwrAvasZHRRFBSqMyNimQAKcxlbjEiSfGu4
         tS3ESJmcR8WVMuiTyib3yXBRFjmGzuXY+rLFiZ5ucodTZSSee/lZCp1emN69GfsZD28p
         duBNYhmWLHIZ0X1Dp/iCBP++j969nTNlfcaC5FO6K0rtcVPcPP/g/kXW1SGJSxCb5I6K
         NLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823250; x=1720428050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRWkczDzQtD/lCQ/Lqw1rFZHPlIxUqfjMcVfnTyOvBc=;
        b=wjyCNG22C4zoAXk4JZfM++c0T0Abawr67VW93U4W+Ng2nN8RV5I6x72Jgrm2GtfKPK
         SskdgNN9mOVHxl6fBqATn+9x9/HKWRmYMkaU4ZeQVa96VpbmkSV6ZAih6rfPm/QbD6Bt
         gFLu01rMuEl/wzHxwF80T79ldCMHhPYv6FzvGvraKKlgz4ZKWBAnUN8iKf2B0QqoKmVP
         L2hX0Wbo6T3h8cW6xcKNeOR6Or6Buw3yc+4Zp+BtkH1ZVOQYDMbGZBJ5leb231RV5lUh
         jIMRunxctcmzvwgnXVLgPEVFQg5zefMAOT0Rs2rrKxhoQ6ZShsN75IKGdX6oQKvOtgzg
         Bs6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvkm0+vU3ySF/EpB4nRXVqJDkffhf/jPjp1gaj4CtvIQyYDCYvx0/P3NF/zfTEvpno1JjfEkSKhuXrCCABdzkLJGxaNm63ruK0qg==
X-Gm-Message-State: AOJu0YynuYuJRs39INCTD36BIltkA+m9bWJKyppxwj5uQcpU+glrdZab
	v8/JfCjkHrCK3XFWiBVmtTTu1bv9pYeJwsWkvXNEOMLUWCz3T+FJfHD/Znassz5N3m/I5xQPkCe
	DTIdGjPBmXRpi5T/Bt3Ekjtwcpl38tgrRGEjoCA==
X-Google-Smtp-Source: AGHT+IHJ3vYW9K7jTUWan128mluHZpqXoJ3aFYNVKbmvv+OBMVjSpnJHPcrhrtAnqwO9dkDyPYWw8xMydt+7vIMNaLE=
X-Received: by 2002:a2e:a1c5:0:b0:2ec:4eda:6b55 with SMTP id
 38308e7fff4ca-2ee5e6d74c4mr30333941fa.50.1719823250042; Mon, 01 Jul 2024
 01:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org> <20240628-dbus-v2-10-c1331ac17cb8@linaro.org>
 <1917470.LkxdtWsSYb@tjmaciei-mobl5>
In-Reply-To: <1917470.LkxdtWsSYb@tjmaciei-mobl5>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 10:40:39 +0200
Message-ID: <CAMRc=MctT4bQpCy+M=RRtAHM4Z7L1SjEq7Pm_N9TsjeKNir=6Q@mail.gmail.com>
Subject: Re: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
To: Thiago Macieira <thiago@kde.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Erik Schilling <erik.schilling@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, dbus@lists.freedesktop.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 6:49=E2=80=AFPM Thiago Macieira <thiago@kde.org> wr=
ote:
>
> On Friday 28 June 2024 11:58:29 GMT-7 Bartosz Golaszewski wrote:
> > +    <!--
> > +      Used:
> > +
> > +      True if line is busy.
> > +
> > +      Line can be used by gpio-manager, another user-space process, a
> > kernel +      driver or is hogged. The exact reason a line is busy cann=
ot
> > be determined +      from user-space unless it's known to be managed by
> > gpio-manager (see: +      the Managed property of this interface).
> > +    -->
> > +    <property name=3D'Used' type=3D'b' access=3D'read'/>
>
> What's the point of this property? It looks racy, as the user (whichever =
it
> is) can stop using it soon after a true read, or the line can become used
> right after a false read? The latter could lead to TOCTOU problems.
>

It can be used to inspect the state of the line without requesting it
for exclusive usage. Please take a look at how `gpiocli info` uses it
(dbus/client/info.c). There's no reason we'd want to force any real
action on the HW just to check if a line is busy.

> Wouldn't it be better to force users to RequestLine and get an error if t=
he
> line is busy? Because if it wasn't busy, now the calling application know=
s
> nothing else can grab it.
>

No because the user may want to just inspect the state. It's not racy:
if the user wants to request the line, they will do it right away and
see an error if the line is busy.

> Speaking of, RequestLine should document the errors it may return.
>

That could be said about all of the methods but the error messages
returned on failures are quite descriptive and by looking at the many
DBus .xml on my system I can tell it's not that common to have a list
of all possible errors in the docs.

Bart

> --
> Thiago Macieira - thiago (AT) macieira.info - thiago (AT) kde.org
>   Principal Engineer - Intel DCAI Platform & System Engineering
>
>
>

