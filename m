Return-Path: <linux-gpio+bounces-13467-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1565C9E2DE4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 22:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48F82B3CDFC
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 20:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19661F891C;
	Tue,  3 Dec 2024 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IzKmXKVt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C92500D3
	for <linux-gpio@vger.kernel.org>; Tue,  3 Dec 2024 20:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733257756; cv=none; b=QI9Jh0OK/Pa+W6+RTn5dK/DDnXyYvniNd9ULnLcimLLIbUd8kP53A2ykh+yGsEraqwZ9bxyX3H+zkpEbrc3a72/WFIH6BEC1af9gOD9E67hblSKnisyfBPWUOJ+6j4J52Z1AQ2p95hNfaCBns/14f5mABspDrCJRpme8RqHnQqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733257756; c=relaxed/simple;
	bh=2hSinAL4R3/SHXrjCZlF8ZFTT4TfPUKaRnGo9pzyb+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kopIxiL3t3ObFqW3jAlOrVJGXBt3Rfve5AwAohufBPlQUrlF+GvVjtwBXVWe6H4IxIk7dmObTGjB31m5J+be2z3pro+FTcgAcm4Kq4gJzVCDc+jkO2LnnTLAw7TW9hixYY15zJewBKzWzDmBowF74/euYVnDym1CyoIQKJ0u47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IzKmXKVt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de852a287so6702951e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2024 12:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733257753; x=1733862553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G33sr/zeO/KNwROltqYFJOHkNCcSFcaU2C0F67a9tG4=;
        b=IzKmXKVt7kiUwEbe0LjFN4q755MJZvEdPSoTxxdXXSakImv9JfLm9gfJHgiUJ+Qgzf
         jtM7FvVPA9/CUdeQkCiTfpneQKaGcwz8bqM2eBBBnw/ry791raO7eGdXM4fpDS6CEWIS
         fBDSepHLxTGx+LVl0EHhSYeRKk/oKBD+pCb64sd+AV1WKHzT90/CvTtFn2LH58KbE1lt
         opvAWM/hxzb5nprpy5M92fxjhgni6bx/CIJlAUG1cBRvcZM9NP1Lx1PlRvKgcSHWOzyn
         bi0iFUDjiekvqWWnVQPTq2oVsLCwAgT3NrEfozmd2u2uOciTeb4P21DudNIcLx7urkoa
         xdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733257753; x=1733862553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G33sr/zeO/KNwROltqYFJOHkNCcSFcaU2C0F67a9tG4=;
        b=u2F57bLkA2IvUKhnRqny2/tyUgQ8JKUoT1hMD4FKqCoxdOlGFunRNUQE/hU98JJr2F
         IHGRFvruKozajc6suyrQmh2u8o+bgB+MPzCUQhbq2HE9wSg9+PhlOjTvvnSX98kMezTV
         +LFqIMMHhhD/h850JXziFHwH7FIfhZf5hvhngt3v4+bFqKQg/GCJu5Woo8YFkw4GXBNf
         9q2M8PzkjSNnDmoY8eMQ2DEXzVYy1Bdby4ghPiIvWANOUKoKYX1UsZXTRceFxoLK+8ME
         7YJQlUpD5rOIjhAgRD4cFyZhogeNDNoPn4ss+Oyz4GY9kj5f8l0knwfW03oMaMw4SBOr
         XJDw==
X-Forwarded-Encrypted: i=1; AJvYcCXEIHE5WOhqxNk3ZrWF3PAiUbH8ituR6TvelbeQuRKAxHBpHFWUSnD/o1Q8e1tHxCxBfRyPqqO8n8iD@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKo0f1HZvnPzDq6Q1DZd0letyOvOtv6eb1DcMj6CrmzlV4R9E
	wa0BXhCKjSYmzD5nLQ5wkzT3InPBQDO0uuWXvDxFEdffcJyoHXj6U2XyuTRp2Y/X9cCCZf4YNKo
	buAReNfVZiy9PtyTHLxH1CdUXz9h8qqor3+VSTw==
X-Gm-Gg: ASbGncup/dAKI5CE9R4KtMK9ZzjIhjP9RaME246Ssqn3YyLqjHATDZV5+9n1ndX1a0V
	aIiYQQqw4ziFDfd884VLsxEnCwUtVGkY=
X-Google-Smtp-Source: AGHT+IFibD9nFMNX+0okWcr0jW9dG5zLnrxoOl37S9ED0qKXToBphOFXAaG0TMap6CEbrI7BqpcPt8HoQ70SurfLgYk=
X-Received: by 2002:a05:6512:10ce:b0:53d:a4f3:29ed with SMTP id
 2adb3069b0e04-53e1b890148mr621166e87.27.1733257752908; Tue, 03 Dec 2024
 12:29:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
 <f552b813-1817-4507-9699-fae87575a762@lunn.ch>
In-Reply-To: <f552b813-1817-4507-9699-fae87575a762@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Dec 2024 21:29:02 +0100
Message-ID: <CAMRc=Mfh5Rv8OKWOcPVzJp-_e_bXgywT2=+N2cF1ONT3kiw7tQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when compile-testing
To: Andrew Lunn <andrew@lunn.ch>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 9:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Dec 03, 2024 at 05:23:16PM +0100, Geert Uytterhoeven wrote:
> > Merely enabling compile-testing should not enable additional
> > functionality.
>
> Sorry for being dumb, but i don't actually see what is wrong here.
>
> There are 4 GPIO drivers which have
>
>         def_bool y
>
> COMPILE_TEST is about building as much as possible, in order to find
> build bugs. So i don't get what you mean by additional
> functionality. No additional functionality within the MVEBU driver
> gets enabled by COMPILE_TEST.
>
>         Andrew

No, Geert is right. I have been yelled at by Linus Torvalds already
for too eagerly enabling too many options. COMPILE_TEST is really
about making it possible to build more things with make allmodconfig,
not necessarily defaulting to y for everything.

Bart

