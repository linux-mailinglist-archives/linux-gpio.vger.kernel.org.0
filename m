Return-Path: <linux-gpio+bounces-30583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B6D218AF
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 23:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31C163005017
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 22:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584313AEF5F;
	Wed, 14 Jan 2026 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNeV3FzN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0773AEF4C
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 22:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429303; cv=none; b=RGDYD46X1esg5xx/UT9R0/YvCi+lcf5MrHDNBwAnu+o+74htchsg08SS79OaybfgUwatEQAXu4UdKdz04xN0xKLe7BWss/NCzcKLtnp2MMr6uJ5m6U+PE/3to0pYt5nK+C5fmQMVZTc5a04NneO9ElAPe9vMQ9Ju89HgdSivPik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429303; c=relaxed/simple;
	bh=1uICaEb6OaakZbfgQJZ6sepanwumAw5+/pv8oqexxKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ui/7vAv6OscBPqPcLy3wtdD1Qx5gBjgB8JldX88y1MATU/h7JLGcoAKTY4NB43YgZjhM/6KSzD5qHgiwztVoMeMo+YF1d+9/A1daiHVY0tKcg24G+921LXLCfImFdqDqiYfgS8oa82uoi0qQSoUIrMUy8dzrl8nVj26lOSfD4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNeV3FzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9CAC19424
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 22:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768429302;
	bh=1uICaEb6OaakZbfgQJZ6sepanwumAw5+/pv8oqexxKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FNeV3FzNf3yO6sliU7cbpJEZbwrGhxNRUgkILn9G9nUkC+QKdGdm7F1LYOj8lfR6O
	 VmDqYtvvZ9klRNVBaRbum0MEyFmdz0FQHbfBILgVea0O/wEU1xgT/bD4as+r/V1hmq
	 RjOPkCJGLejpPaVDIpC+bsPLgbYJjA5fbKQfM4BeqfwY2Sgbkl7bIpl/aeQ2EDdIcA
	 DzFFINt7S0tT2H+hIVmHPAgz5m/rfjtwomNVVQgoty+UgF0JgRVTvkNrATZ/kZFXDt
	 Ag5/BWPLi10vJRe6qay5o02BQGTfX5ZfVAgF3wip2SWlY/qRl/y2c5MG65Og8rldxD
	 lXF4crLQCU00A==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so407599a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 14:21:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWFw787NErFDvMyAFtfqBJHDvTxmcyvclgCH+KBeEtgHUNQYnabWCS6zZSt6IfqSkc8trR+dNwaHAf@vger.kernel.org
X-Gm-Message-State: AOJu0Yynuz7OZrVvdnNNDqVL8RFD9+VZQH4tgC7lazjV1LhS2199/YKR
	NvyzsH72XyWjQ2Sox2EVh14VfWlQ7mx9Dr1+FQY3DCDoFDiqDlmpX5thyEmVqjtt/UhO6dipvBV
	ntZomnXKBFAuS5sXS14F8reGDys9z0g==
X-Received: by 2002:a17:906:f586:b0:b73:210a:44e with SMTP id
 a640c23a62f3a-b87677a8468mr300295266b.30.1768429301486; Wed, 14 Jan 2026
 14:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
 <aWdp_jMVUBN04is3@ninjato> <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
In-Reply-To: <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Jan 2026 16:21:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJwGLXPCtSabkeD26Ct3MrzFBdU-3-gJbGEpRQcmL1LWw@mail.gmail.com>
X-Gm-Features: AZwV_Qgepzl3NXcY14N0bKPFohUKoPG5P0kElijySGepW3maAOssqN5G33HuGxg
Message-ID: <CAL_JsqJwGLXPCtSabkeD26Ct3MrzFBdU-3-gJbGEpRQcmL1LWw@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 4:47=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Wed, 14 Jan 2026 at 11:03, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > > Rob, Thomas, this series is blocked waiting for your feedback and you=
r
> > > acks if you are okay.
> >
> > This was a little hidden between the other text, so let me emphasize
> > that these acks are needed. The other option is to send the irq stuff
> > and the SoC stuff seperately.

Reviewed-by > Acked-by

And if it has either, I stop paying attention. So I was assuming this
all was going in via not-my-tree...

> The irq and SoC stuff depend on the of stuff, so doing so would
> delay the former by one cycle.
>
> On IRC, Rob sort of agreed to option A from my proposal (see v7 cover
> letter):
>
>   A. Rob takes the first two patches, and provides an immutable branch.
>      Then Thomas takes the irqchip patches, and I take the rest.

Until this...

> Unfortunately that part hasn't happened yet...

And then a new version came in... Why a new version only to add a
Tested-by tag? That sends you to the back of the queue in my normal
workflow (which this is turning into anything but).

Thomas has now provided a Reviewed-by. I think it is easiest if you
just take the whole series via Renesas tree.

Rob

