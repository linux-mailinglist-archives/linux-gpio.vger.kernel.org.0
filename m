Return-Path: <linux-gpio+bounces-13694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B09EAE21
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 11:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1FED28061D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 10:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7038113B59E;
	Tue, 10 Dec 2024 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pGkqAsCY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46323DE8D
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827100; cv=none; b=TZAJpD59CdkQNllsp90CV0YX9VxyDjfH+vvZilyOGYppfusCG+ZpNDn1LwiauZHpE+bn9Iw/dGXfr9QSUIJE775lkjQ9QxD5EDQWv6SWq5oEPRqwZu4B9tpAA/HjUI8inukd6NHxYk0Z4Tb5GYVeSY4rqV2fqxahlTYKwK7Ik+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827100; c=relaxed/simple;
	bh=nBNVWzOnzliLculkZAuJKA4HrojwoLs3jNp+vtvw7pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2+7nwLho1V+biqKqM90whZ4VMVjy9KCsrG+UknreJFUHe34RLthFwSovEDsgoOlH+B1M2230HiPZ+mszldeOPNMhaZ47piC4SAfeOWFhhg+WoadQZsAmUXwWTpMHNk8VS8PMNw/Ig5eZzapRnnJwYLr894gGiSkxJ5QfyGlzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pGkqAsCY; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so23699051fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733827095; x=1734431895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBNVWzOnzliLculkZAuJKA4HrojwoLs3jNp+vtvw7pk=;
        b=pGkqAsCYwkV3VNpb6ZnAk8cTA4gjCJorq2SXtHo1tvxQ5sbUPmUl5Gj2J0mfBS/SU5
         ukb27ANNxvplCNdHMjBWbIBKswItGA/RP+eBCDcZdYZCCG4nln4rNZI7TVbhjy+w5Caf
         Qhx9SyDaelrUeaClYAieAAHhyVFkoFHpV8SDRKGD4gWEGiRulJYf2ydnofXk2buxpr/6
         2mK+xr8EXPSPoa5tuC+VEiLP1nL6Kg+keT2hl2yd9nzJgDFQP/PPI1QDOGUw3tvo222W
         N2RuJua0wnfPZQMqe7zr9PZZb/AHuGURhcWh3zO8HKAUHoXTIFTUyWaCn7wEKskGBZ/Z
         FtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827095; x=1734431895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBNVWzOnzliLculkZAuJKA4HrojwoLs3jNp+vtvw7pk=;
        b=Y3aleWvSu5BkMBu1mvu/+5b+WpaYhv0nyKiTRzFYNlasW+ky8LsVIiFiMXLhQ8D50e
         CSdMTuFNuhmwSozpetzKzUji/eLIpgKmH/3isfyjytpO7U4ow6cvBNT3H9maNFKOdFh8
         eUtCgJoeUgOskFkMT6iFTfbUUXOuIkcvi/B7hKtsQkrFKJm1zrhJ7RNnq126O2qziogf
         khsv3Fir/2CjfyZyfYLIiLfe5gB3NxVgjlX6lUVwAv6mzdCXXJ03uKlNRARVOS8ZwVpH
         dcvKXJ4hQQN5o/+iE+Zhty8pFCXYFyuL6okRcEAFCZ+z4PaEbfX9KYKuyLOfOKlM4k9F
         5ryQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRQu55BpGJddX/wAHGPx0mNw+NidvqoM8ACz7qxbTgJlVAOYrIxR+xDDXVtOtFNmKn0LVQ38yen/7q@vger.kernel.org
X-Gm-Message-State: AOJu0YxNSzxxWRDPzb4tZNeUVd8mmTrlSFbDd69hZ/q388IR4fhdKxQR
	hvk3cvG29p0rYb1DKU2yWw9lIP7ZjhLe74c80y8hp1kgHdrH+roIEN5ymVpc6OUUHF6RK3oONlC
	2O+bzKeZQ16XCHQAuQniRpMVruK8lOjneT8JWlYQxO6iUr914
X-Gm-Gg: ASbGncsr4pvzDjf/A5rKwZthJfS2MjRd4Th0pM//RmjJsAPYdh68zjWzMJh5A0bxF2E
	ft/yxOTZGwf99frD6gJ3ZwB5Jx1ZKNRPcGkZHcFopY7aSTs63LVVbjHBF/nWjvH7N+Uk=
X-Google-Smtp-Source: AGHT+IF12xIfbIeOJF0+82vmXvh+EcUWsqba/F8MLnN03jhpTEL5t2xRFaDjcLguN6H8h1TYEhtZNnFbHK36Lnri/B4=
X-Received: by 2002:a05:651c:1556:b0:302:1861:6dff with SMTP id
 38308e7fff4ca-3022fb47301mr11712531fa.9.1733827095103; Tue, 10 Dec 2024
 02:38:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203172631.1647792-2-u.kleine-koenig@baylibre.com>
 <CAMRc=Md4t9QuiCtJ3TswSM-2qdOwR5_yk=kVN7wcvN4jz+yhkw@mail.gmail.com> <ekyhfceyoqkjoyw2rmw5jbasxzx6c5p2ufub6vmtv5xqi5e4fq@3eq7obihlrhj>
In-Reply-To: <ekyhfceyoqkjoyw2rmw5jbasxzx6c5p2ufub6vmtv5xqi5e4fq@3eq7obihlrhj>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Dec 2024 11:38:04 +0100
Message-ID: <CAMRc=Mep2cf3WOp06AqJtJ+7XqHjzhT2RW0AFjEMmseGkGC_HA@mail.gmail.com>
Subject: Re: [PATCH] gpio: idio-16: Actually make use of the GPIO_IDIO_16
 symbol namespace
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: William Breathitt Gray <wbg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 11:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Bartosz,
>
> On Mon, Dec 09, 2024 at 10:28:14AM +0100, Bartosz Golaszewski wrote:
> > On Tue, Dec 3, 2024 at 6:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h=
>
> > > is included. So move the define above the include block.
> > >
> > > Fixes: b9b1fc1ae119 ("gpio: idio-16: Introduce the ACCES IDIO-16 GPIO=
 library module")
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> > > ---
> > > Hello,
> > >
> > > this is based on current Linus Torvalds's master branch and depends o=
n
> > > the topmost commit there.
> >
> > Can you rebase it on top of the gpio/for-current branch? It doesn't
> > apply to my tree in its current form.
>
> Your tree is based on v6.13-rc1. If you keep it that way and you apply
> my patch that you ask me to rebase there, it will conflict when it's
> pulled into Linus's tree as ceb8bf2ceaa7 in his tree touches that file,
> too
>
> So if I fix the merge conflict now to make my patch applicable to your
> tree, you or one of the Linuses has to do the reverse resolution again
> at a later point in time. Is that really what you want?
>
> An easy way out is to backmerge v6.13-rc2 into your tree (or rebase on
> -rc2) and only then apply my patch.
>

Ah, I didn't get that from the commit message. Let's do it this way.

Bart

