Return-Path: <linux-gpio+bounces-27415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 171B1BFA56F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 08:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27EBD40113B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 06:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE0E2F3621;
	Wed, 22 Oct 2025 06:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="G2SblonT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD92F2918
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115849; cv=none; b=ErgWeJiKL+gOg2/p880r3y3EOstUcad+DkuvM4xrGr/orBpXZxfnSKnhPBDFgBa7xpmDE57rtOilU8TDUQAgiILfCDrzIcyLIujUdBQhljMy1ThPtOLTcMUjFc6q9atTVt62FnipViT861n17cOgSXTaUF1IxkT2LcVUwxo62iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115849; c=relaxed/simple;
	bh=98PAuLdi5bAL91h4qCl8dx1pL2En1aNP3Fd0W9MUOXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTAd7GrEBOJTL5RK/53bJg1KuyChBQhxd6sZ9wkFA18g2t8Iq+9HbgbferxW6weO7vdFXnyWLjLPAhx2wBxWY+Cv+0sl1CErchJDQAJAqUBIzdIIlobJJHNpI0zwg8PF3zmNCEghjLdUiQTeDKXOdb9gOXLXtG2B9i25I2ZmuZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=G2SblonT; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-586883eb9fbso7981454e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 23:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761115845; x=1761720645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98PAuLdi5bAL91h4qCl8dx1pL2En1aNP3Fd0W9MUOXg=;
        b=G2SblonTD+zIs/XsqYGOF6Ti/V1CReKuYkzBOP1SuUtgTrEziaWZX66J0NV6Sj8tL9
         OtEVUmckZVsP3Q5/EJAFqafD6bvdxk6nY55LAArQY7IFYei5c3f11IGkrkwNfgoNrfri
         NWGSR6q/+HuZI8YnRYQcwzOYM80vIKpah9C07SMtYpP0CEcOuM4f/hQG8VIRAh3iK8XD
         VMlzkfJFNICGexHODWZyLRQ6O5dy5V3iOnyRlMcB3L04M6JtA/UpaLInqHjgzO6UDtjs
         eVFV0AOU5svhNjIpMW69cb/OvgBjeMRF1Udzo2R65nDIQWRCldu+yTPAU78Qag3X6Mif
         jGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115845; x=1761720645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98PAuLdi5bAL91h4qCl8dx1pL2En1aNP3Fd0W9MUOXg=;
        b=Td425vO2HgUvmQ7q0dVateOFkw4D5HDMX9Vjm4dsz83GAWOY+VRVxewB1lOoLQEBUO
         pWxhhFg8PP7ip1stjyeHF22YdU+n05M0XxnLaugG+nj/5Fjf+IWx9cXYbmIXa9YYclli
         ov0cYsrzc7l5ipEhtSXAQigW/ZF5sZ6lkR7vMYZBJJdn02YM5fSWsUuL3LrDk0zfbBsV
         sThDiiEN/U6n+cKITarv2K7D+avfgSXV0bHSnQt98Ww6xpiC2r1+UhrkovAc/DD9i1Nu
         rIYJ8OMcgdcE92w5fXur4t0wSPsDOr12YiA313kfrE3XfNx1aB9BuHhOVkpeggn2ww5I
         RQfA==
X-Forwarded-Encrypted: i=1; AJvYcCXxSgzI0rFqWqc6f6/RxeqGzNiQVlyU2LK+9q2z1G3ud27/DHrremAdRBHIIcrep4F0YyJSt9Qz8GTd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx39qzUTgnNbcR6Rakq+XdUVZwgyvprlBJeUhrFehmKGTxXNoF7
	RCtEWeZ+fWHosv68B0DTPgfWkzpxU6LPqrJTRsBszOAlZp1nk5bGOBuxxnmxZN/owPmjvHtZRY7
	CLeDi4580ZusdGNGKB5TFVs9ojMUpXU4nDGeZ3ZYyiQ==
X-Gm-Gg: ASbGncvwFXU+tcH2T5grqA6QS40D3C1keUlQYeWOZM9N9dh2Ua5ihAyFwbjGu2iL45P
	E3RJn2mQoryQzS/56Bk9Z8+TqFY0vAdKFwm2chcmyEB4wZPoV58nRZiA7J5OcEs96bkysV12Gv+
	zHNUwYoKICj4GFEnbO9VsUGFwQb7sMqoQJP4cwAEwfRyGdgXEyE/psE6K2XW/9MNbD21CEV8q2C
	FMRkmvLZGnv/1ztyqNbzI/NAgDEQCit2D1PS76yRk2lrcpldphcuVIJLcy/5tfPPop781tBzuOp
	Mc/o0vgkBtccz9BIS7IKupVgdHY=
X-Google-Smtp-Source: AGHT+IGr3zukKNYzeyIqR+TYPmYQbS3OFcssWzGNvaljz37h2jEpar009J9nuKk8lRLqnblAhVZVoA4VbyVfP/oprbc=
X-Received: by 2002:a05:6512:318b:b0:579:ec3a:ada2 with SMTP id
 2adb3069b0e04-591d84cf71fmr6407192e87.4.1761115845419; Tue, 21 Oct 2025
 23:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=MeFZTDk4cgzEJNnkrJOEneFUBLwtKjkpV3-cLSm=xsxNg@mail.gmail.com>
 <20251022021843.6073-1-wbg@kernel.org>
In-Reply-To: <20251022021843.6073-1-wbg@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 08:50:33 +0200
X-Gm-Features: AS18NWBBs20dJ04q9W8nyqQ0zArr1FQChkJ-T0_854tkBtyhYXLfHhbwUGei9wE
Message-ID: <CAMRc=McqqxWTf4CbZJRSBSD1BnLNZmed_G0OsMNob1wTZmj=pA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: idio-16: Define fixed direction of the GPIO lines
To: William Breathitt Gray <wbg@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:19=E2=80=AFAM William Breathitt Gray <wbg@kernel.=
org> wrote:
> >
> > Turns out, this requires commit ae495810cffe ("gpio: regmap: add the
> > .fixed_direction_output configuration parameter") so I cannot queue it =
for
> > v6.18. What do you want me to do? Send the first two ones upstream and =
apply
> > this for v6.19?
> >
> > Bartosz
>
> Sorry for the confusion this caused. It looks like `b4 prep --edit-deps`
> will add explict dependencies, so I'll use that from now on to hopefully
> prevent this kind of problem in the future.
>
> So we'll need this fix in v6.18 as well because the IDIO-16 drivers are
> completely broken right now. In theory we could revert the entire GPIO
> regmap migration series [^1], but that would be a far more invasive
> solution prone to further regressions. Instead, picking the commit
> ae495810cffe dependency with the remaining patches is the cleanest
> solution to this regression.
>
> William Breathitt Gray
>
> [^1] https://lore.kernel.org/r/cover.1680618405.git.william.gray@linaro.o=
rg

Eh... Ok I will pick ae495810cffe into fixes, send it upstream with
this series and then pull v6.18-rc3 back into gpio/for-next and
resolve the conflict.

Bartosz

