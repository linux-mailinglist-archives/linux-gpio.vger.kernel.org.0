Return-Path: <linux-gpio+bounces-30069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE447CEE5E9
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9747F301A1EB
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35F730CDAB;
	Fri,  2 Jan 2026 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2mYaygz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7C2F6927
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353478; cv=none; b=GiiINomL4NGj8TS3Q8bQslhoejyanBdi8UDIofIMoitBQzutjx2vPiSe4wTMzIhaIi5mkkQ82GE2cARx4VRJ9vTIL/jNLNzS9UgtP70sJxBuPuw/ckZr1Htb9l/qMGuihu4JaoxKFdwYEGV/k+u4sgxJzaeNTdN2gE5TF5Xo1Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353478; c=relaxed/simple;
	bh=ROhxvVpkvk2NNTzKCyZMvMHRdNyQdYdR6kif7oZ7zKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoINm1TJSwuEDKr/AJx27E9GM1l7fjfft8D60xb35m0YnaKtFPy4HAQg/VM4yQmqMKP1BL1IckmtioUmI97VbeQNNYAOF3pQEIZmFGUxEYmfgd9mWH+IoqLM0Jf2ZiqWWMjjT5mYscfYWlpzB8xIoSvWGBwQHADhwTG3fD37+j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2mYaygz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F39C116B1
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767353478;
	bh=ROhxvVpkvk2NNTzKCyZMvMHRdNyQdYdR6kif7oZ7zKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j2mYaygz9113tkPG1kBhLq95nX7jl+LY7V7R02k8TGdLU8y4RtkGcXFV6O1W1VXmk
	 CAcASg5SlXCK5pRSkyiEtgsC4xoMCB0H9/VcX+1zD9xxdi69cqZT5ErPzFjaIOx0Zm
	 vP2GAD1jNFwbi5czlC4LdlkFoA3DJtfskerAIKcCn8JE5UI9hrNocp7sjUKSWaLRwZ
	 zruqyxdJVJgaWJWWQsQ+cxUHnc9Jkw/53gs8h8/1Z/V9b4TwaVXEu/zKep49PVykdt
	 GwFmCIdc3aH1xZOpSG3zpS7U2Y+ivM4K/t4fV+52RbGiSA81VrLZ4sCIaN5nfSXerN
	 QYqB23N4SsKrw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5957c929a5eso17292643e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 03:31:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXibdt/7WoB91rH8lTU20MfeHWdGgGvnuZfhd+0GPDeRsk0vgL3xVWD8S2EOf2IFlEnz3OPifyI/fEu@vger.kernel.org
X-Gm-Message-State: AOJu0YyyRCTLSWLV8lS8IFmKQQNV3cR4qWyvES23r8veFoiMUFrMaxVj
	ChHkUZO3gHIlkG+RX4SpJtMWNCr5Zylno7y6pEkjNvNRa6qE1uRiiYZLS31BPjSIB64zOcIsuGj
	wsqBURewK0JKn8PL7wlBQ993AsFs4D1PENAB58XlNEQ==
X-Google-Smtp-Source: AGHT+IEbJgvQf0S0AYdJ1o/vWH3yctEBEg3X1i9K8uMYnNmXK4rki07iHI0YZGnJamuTAzjTEa9JOs9jbEQROQFWOH0=
X-Received: by 2002:ac2:4c49:0:b0:594:2a0f:916f with SMTP id
 2adb3069b0e04-59a17d5dd7amr13947616e87.43.1767353476806; Fri, 02 Jan 2026
 03:31:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
 <20251227-s2mpg1x-regulators-v5-21-0c04b360b4c9@linaro.org>
 <CAMRc=Meu6-5569rMcV0zf2V+Sz_QZgShoEhmhw41k6fczULcoA@mail.gmail.com> <4bfcb1420b9684f67bd4b8f583313c1a08a1616d.camel@linaro.org>
In-Reply-To: <4bfcb1420b9684f67bd4b8f583313c1a08a1616d.camel@linaro.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 12:31:05 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mdz5FPPY1k73xU3tGJCuo4cgPLJYsaLH+gTy04DmdmA4g@mail.gmail.com>
X-Gm-Features: AQt7F2q5KCFQwu7uajs0NbeYDtwvkd8UutJDKBDQq_cRkDC8LMPwf-EznZs12Mc
Message-ID: <CAMRc=Mdz5FPPY1k73xU3tGJCuo4cgPLJYsaLH+gTy04DmdmA4g@mail.gmail.com>
Subject: Re: [PATCH v5 21/21] regulator: s2mps11: enable-gpios is optional on s2mpg1x
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 12:26=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> On Fri, 2026-01-02 at 11:19 +0100, Bartosz Golaszewski wrote:
> > On Sat, Dec 27, 2025 at 1:24=E2=80=AFPM Andr=C3=A9 Draszik <andre.drasz=
ik@linaro.org> wrote:
> > >
> > > For s2mpg1x, enable-gpios is optional, but when not given, the driver
> > > is complaining quite verbosely about the missing property.
> > >
> > > Refactor the code slightly to avoid printing those messages to the
> > > kernel log in that case.
> > >
> >
> > I don't get the point of this - you added this function in the same
> > series, why can't it be done right the first time it's implemented?
>
> Sure, I can merge this patch into the refactoring patch 15 - the intentio=
n
> was to have incremental changes to simplify review.
>

I'm all for it but introducing issues in one patch and fixing it in
another is a bit too much. :)

Bartosz

