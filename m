Return-Path: <linux-gpio+bounces-9163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB595ECE4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 11:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFBE41C2177D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37313145B10;
	Mon, 26 Aug 2024 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4CbiyN/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8A145A0A
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663780; cv=none; b=n9ntMPFcPDKfJ5Vg7wHJcNxEmR0XvEICwVw9ETjhqzsWjvNSo9ds3ohy8tGaI2nZ//yGrpMRXFVLriP518uTWiOifsKRsU/7r6MqupU/aoyaGAm58BQkhkJ/bJXHqDewgRAiAVNJiGvoKuqVxnw/PlZZsketm2+e0TxTP35kXY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663780; c=relaxed/simple;
	bh=Vj9u1E7DvkaaO4ShELzXZnCJcuqvug4oIsq0JHfrSiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRnEWx05+bEtqu9H5nkFk4PMRwckkrfK9hphj7xIKDlL4mXNgM7+VbjqWFdVvzv36n4ua0ubfy4VwS6iJvFaw7L9svxP2LZnG0l8/0Vr7CZCcz0Qc1MkY4dqJA4F6LTO54WH4HZrFv55w96RSWBedw3FuFPYYcr3+slbK3Y3p08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4CbiyN/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5344ab30508so373330e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 02:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724663776; x=1725268576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj9u1E7DvkaaO4ShELzXZnCJcuqvug4oIsq0JHfrSiU=;
        b=g4CbiyN/kZNqXCWQ1t90HqWG2Iw+KWf42cIuLhxeA4CuZFNvHV5W9ITDqZGG0qDzyg
         wBAK3eqUkQI+brcXXoSbhFjae2pG9a2u9xIXEAG0+cw5Sbo+G2Z+0+kHEvXmYKaQvShf
         ZvhJ2Fc5r0rVBXG8OL9S0CpTlzObccWgI/rNDPIyPfOLMSxONOoWlOUvRgAmmHXuUZc3
         Z3DXKJ8HeDBeHUax9QWTBXB3y/CIh94Atv+3XBl+oQgL6QGagknnweE+G5IwfFwULO93
         GQ9l+AlZ6xuiWwdhCFD/2YoFREaS3YC4fSAxbt/WwBc3TGOYa3z/Z384VHjQimg92m+Q
         aXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724663776; x=1725268576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vj9u1E7DvkaaO4ShELzXZnCJcuqvug4oIsq0JHfrSiU=;
        b=dFdI2PAc06yG33yleQfKsqcebs5mqKHGmZNSz4fbmS1JywqsXHI5Ijui9/72yvJk6n
         JZVMR3jmna/76Z7sSUaGU9al2a/+UfXP0TYuJcqJYWxw7OnUjQuNEB61022KCS+DQSaB
         g83nQxKSXUlbwwi+NaMUrJsWKQHL4R+a4YAPrtihKkHeS+YSsswt51i9CovWB/uIql4F
         HOiOxbt0+wHAo8rzv7XZx4Tz880i/idLANc02PeeQgvjEFb+Hvagz/KNvwyXDrO7jJuw
         TdffrQEhuNpwAh3HHNJQ/lHGKo/mYTKUnnk0oLxkmFrVD5monNvfXFhy75FZonCzukMV
         vdaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6DZnFC1dR7rAz9Bo/OQPD8RCFmzgXiFtuMxBvbP2cb/Dx1sd7WMfneu6W0HH/4B7GaMRXGIeMiZs0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/KoTvSUaobj9dHMbWNIvDn+R8PMdLINn3UbWIaOmIABoI+GM
	A9jZ2Kh/ee1vIQsZjFdBaCmJX+iNLn3L3RWanSX80b0b6bcGjOMKu5R2/Fa8AEuEMsC3v3d4B6p
	JWL0m6yG3ZZaXfa1sqnM9iiGqEem2dg5Od5Nqtw==
X-Google-Smtp-Source: AGHT+IEP/7MkKo7czL7mThajxuutkKh/x1ebSsV0QSfRAVCGaGgrEFrGlRyqUclJ68N87mKHwDeMyBX0EFskxbXmpxY=
X-Received: by 2002:a05:6512:4019:b0:52c:dc06:d4ad with SMTP id
 2adb3069b0e04-5343831fb41mr2840347e87.6.1724663775523; Mon, 26 Aug 2024
 02:16:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CACRpkdbaDW2=R881G9C=r1iW4YNdYpRZ2kHaN63T7EX1A0xVrA@mail.gmail.com> <IA1PR20MB495368D784BE3F977617BF39BB892@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB495368D784BE3F977617BF39BB892@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 11:16:04 +0200
Message-ID: <CACRpkdZ5zAgQyo9y_nO8M0Z6b8zqbkg5H_3ceEJN6z6mHL4TOQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] riscv: sophgo: Add pinctrl support for CV1800
 series SoC
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 1:26=E2=80=AFPM Inochi Amaoto <inochiama@outlook.co=
m> wrote:
> On Fri, Aug 23, 2024 at 05:44:17PM GMT, Linus Walleij wrote:
> > On Fri, Aug 2, 2024 at 2:34=E2=80=AFAM Inochi Amaoto <inochiama@outlook=
.com> wrote:
> >
> > > Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> > > This patch series aims to replace the previous patch from Jisheng [1]=
.
> > > Since the pinctrl of cv1800 has nested mux and its pin definination
> > > is discrete, it is not suitable to use "pinctrl-single" to cover the
> > > pinctrl device.
> > >
> > > This patch require another patch [2] that provides standard attribute
> > > "input-schmitt-microvolt"
> > >
> > > Note: As current documentation is not enough to guess the pin
> > > configuration of Huashan Pi, only the pinctrl node is added.
> > >
> > > [1] https://lore.kernel.org/linux-riscv/20231113005702.2467-1-jszhang=
@kernel.org/
> > > [2] https://lore.kernel.org/all/IA1PR20MB495346246245074234D337A6BBAC=
2@IA1PR20MB4953.namprd20.prod.outlook.com/
> > >
> > > Changed from v3:
> > > 1. binding: drop unnecessary type
> > > 2. binding: use right ref for pin node.
> > > 3. binding: remove mixed spaces and tabs.
> >
> > This v4 looks good to me and has necessary ACKs.
> >
> > It contains device tree patches which I am icky to merge but
> > I can merge the rest and give you an immutable branch in the
> > pinctrl tree that the ARM SoC maintainers can pull in to
> > merge the device trees, does this work for you?
> >
> > Yours,
> > Linus Walleij
>
> Hi, Linus
>
> It is OK for me, Thanks for taking it.

OK! The pinctrl base patches are merged to this immutable branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Dib-sophgo-pinctrl

The SoC tree can pull this in to get the binding files.

I have then merged this into the main pinctrl "devel" branch.

Yours,
Linus Walleij

