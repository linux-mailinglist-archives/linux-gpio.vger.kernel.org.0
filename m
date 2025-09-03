Return-Path: <linux-gpio+bounces-25533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B76B4286C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 19:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18847565BFB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 17:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F003435207F;
	Wed,  3 Sep 2025 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/XGKVsA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FEE350D68;
	Wed,  3 Sep 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756922303; cv=none; b=r6EH+disiK2bRkJqRyEQpXJPja/QO1EsuTxp5x/Kmj2UFkOY6GdNeaSDPjf4ish3y5t/E+jr24H80QQ+2wGDUWdPEFLj6yTCiWbYBpTB10Pro0RN7kotDBmRZbRoFFZkfnsiK4Mlr5zIY1Rpl1SHpNCES5RvWMWiZIrR+t4qQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756922303; c=relaxed/simple;
	bh=wY2bW8fq3Ft+chy83Xdc3EUaRkyWqSV3KeQlYOmD67I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGZcZXK15jqsS+quS5clWaqowRatBccJhvObaTSHfHD4rkAkwWjdrpA4W3m8UewyLduPAv8WeIr8+KCYn3VgveHar0w2JHhfsRKLEH59Xhhqjx55EsuuPa3KlGzyx5kArW8uQ7ZBw5AILxuVFlpBguR6Z0kMvv3eGV+c4uLmmgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/XGKVsA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f6aef1a7dso129486e87.0;
        Wed, 03 Sep 2025 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756922299; x=1757527099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVkerZVITJ75R1A8DbL3xIDB9OLG8LafZy9yCcs7YDc=;
        b=R/XGKVsAjk2uFVa62AQTvsgPPfs/vpYpTsgqy8/7KlpB2EP+Qt418KPUQuk37aaKNm
         psyvyvJ62ItDrZrqflivCqyBcfypp1Caff6wA3h6Z1UwgJhaxFS6cLDkgmmLbqgplwzs
         mAc2N7/NUUaC1Sdt2BAplcMjRPhY6425aGwDpDrewRjeVL+UJkAanqijLv6XwJF9scDz
         v2K71sIQau6hJdgpVPoWhthKomEZbm+lj9bZukBdzBWhPEos+cpD/N+XZk3D4XqwliRC
         EV23Ku6vk5XJOi/2p9ez6A8B3rvSkGM6NBMlB+iZtHuFxyiUOS+yDSPf6IcpMh2Z16vk
         JPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756922299; x=1757527099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVkerZVITJ75R1A8DbL3xIDB9OLG8LafZy9yCcs7YDc=;
        b=OAd4iif4NaB7sHxMwGV7i3L+6S5MqWciG6zOowo/SK0gaUFnrrODB8GzznBUO5Q7il
         gkv++LrqpxB4B5IEBDHVN5JjLgoInDNCnyiiRpkOvfMlAHEE2yQqUSZgQxiN1AMQ5i64
         MaaCFx8YE6nQx3ha7nW5nM0VCzAwQEMiOzhyx759L1zLwj31RGNX2IbtOW+VnLYgLc3C
         +vT9oLM+ib0PgDrz2iyzFuzc6tnnm9Xmi/VIh+HeAYj+5ibF7v8nKS2tNw3nODaFb5TT
         iEEf/qmEUizQ4rUyUtUWCRTqMHHZwaCFoImz+3qXgXpz5HDtBZ9kDsO1Z3pc4Y5jjkE3
         eZbg==
X-Forwarded-Encrypted: i=1; AJvYcCUVoARWKPVBsH6aQOhXt1SLUUs0DwUs+4RicvVL49PkEWEe4ORU5lwR2SaC7y03neI+nMqUm267AdhwbbEj@vger.kernel.org, AJvYcCUhTFlutrGmdNE2QV/dOlfteCIQF9DrJKnt8BJ7G6WxkLUinhWaVn+yr54ifspA4NAXsEKGY7ymrhO0WWc=@vger.kernel.org, AJvYcCUvVwavXIsUCJEp/80XdJ/0SubDTY5BPFlsKliQmnQKAsUjCeQ3GAOWYApGm/rdwbXNFfSfaHh/ZxD2@vger.kernel.org, AJvYcCWBWvcUbhs5zYyb/boeLR7dGVU8qmbx09RDcFwqv/1kVOTiuR2y3CDbDEXbQhP7SU/zguAwdhUoE8OSow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCR/u+5Lt7hc8MjrbdQWgyvCzMktjlA7wNnF8BROtgTOHGDGFq
	SQQcCnwDBcBZp2gFiXFVau+HRaeIcC05Icay3w1/i4xn8i6c0jtm41NVT32RE2eI+A3eFGmz4A9
	0GDOW2SlvZ5xzO8FHPenw/fNt55R+0F8=
X-Gm-Gg: ASbGncu8BNpiic4mGKJaRUG4/vIua51yqF5w98VF2L9g+lZDdygXUVvFqwJ/PJY7jzA
	cdSO4+jiMb/5W3TjZ4WxOttBBS5Yaq0FwEeO8CByiXlg88dlzKXwOMKb7a1QioUmngOYew8EZlS
	CHo2D0jWYPHpnQIVubmD2HTe6nm8bnd3Zss3vwUXfIAb0VmVuWhctYCSXIulJF+rkFOo8RrS0Ft
	E7hMjbazsFgOoejRg==
X-Google-Smtp-Source: AGHT+IEM3391jGaZ5H7KUN2s6kIYrcivIvySSHlaVz037M26bpuhJ5pwlWQPEBWsLq32weOR5d9HjCh3JN3yqFD4VuU=
X-Received: by 2002:a05:6512:258c:b0:55f:6c72:b70d with SMTP id
 2adb3069b0e04-55f709f6057mr4422732e87.48.1756922298765; Wed, 03 Sep 2025
 10:58:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
 <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com>
 <CALHNRZ-dRvaN_SyHRfAsq2MO-ec8rzkeCy6CtJpYdWTobf1-Wg@mail.gmail.com> <CACRpkdb46OwzNQuSp0+QQVjy2LojMyhdE7XrNwdsyqGi5okASw@mail.gmail.com>
In-Reply-To: <CACRpkdb46OwzNQuSp0+QQVjy2LojMyhdE7XrNwdsyqGi5okASw@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 3 Sep 2025 12:58:06 -0500
X-Gm-Features: Ac12FXwYT3HuWemAngCiQwse3I0_AJd8-Hn-0mwSL6IgfLf-ieUlbAGMCMdMG4Q
Message-ID: <CALHNRZ_+Oh2AGZTvJ66EjBEKEf7PdQsMM_BTNNnjENJpbOKiog@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 1:55=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, Sep 3, 2025 at 6:54=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
> > On Tue, Aug 19, 2025 at 6:30=E2=80=AFAM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > >
> > > On Tue, Aug 12, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > > This series adds support for Tegra186 pin control, based on a downs=
tream
> > > > driver, updated to match the existing Tegra194 driver.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > (...)
> > > > Aaron Kling (3):
> > > >       dt-bindings: pinctrl: Document Tegra186 pin controllers
> > > >       pinctrl: tegra: Add Tegra186 pinmux driver
> > >
> > > These two applied to the pin control git tree.
> >
> > On patch 3, Mikko noted that I accidentally amended the formatting
> > changes intended for patch 2 into patch 3. Linus, since you've already
> > picked this up to your tree, is it too late to fix this properly in a
> > new revision? It doesn't appear to have made it to the main tree yet.
> > Or do I need to send in a fixup?
>
> It's one of the first drivers I merged with plenty of other stuff on top
> so I can't amend it, just send a fixup based on my "devel" branch
> (or linux-next, it should work too).

I am highly confused now. When I went to make the fixup series, the
fixup didn't apply. Looking at next-20250903 [0], pinctrl-tegra186.c
looks like I wanted it to, the base commit has all the format fixes.
Which doesn't match the commit on this series. Which leads me to a
couple questions:

1) Does anyone know what happened? I'm not particularly a fan of not
knowing why something happened, even if it's beneficial at the time.

2) What should I do with the dt commit now? Ask the Tegra subsystem
maintainer to do a manual fixup when pulling? Even without a manual
fixup, the bad part of the commit would fall out when getting applied
on top of next.

Aaron

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/drivers/pinctrl/tegra/pinctrl-tegra186.c?h=3Dnext-20250903

