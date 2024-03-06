Return-Path: <linux-gpio+bounces-4164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA768873179
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 09:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76F341F25DF0
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 08:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CEF5D742;
	Wed,  6 Mar 2024 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAGqvGT4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CFD64A
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709715317; cv=none; b=hSSrWPStoujub/MESY2SEQ66bN+16AYHGEr0HrdThDICppIjhKOI0OgWQt1ZxwfyUNx+E21icR1iTS0riu/zrBNhB5BjTNOBA6+7ROEzQGC1gBGUYlxmHZIVlxOUSshpaQoTGK+wkps6oK9qx9E9lBJDwvO35gQmDtggQN74ZbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709715317; c=relaxed/simple;
	bh=Y+RkiUR/jB6Sr+6JJx7cUaWIcbbrJwS+vL29h/qVvNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acOZCmKkxOoXayhAG/PheoZj9Vhk/SE7TKY3dFr84sbeZT9rwFLm2KFgzBHge3/SUrb4uS35tBuXWn1mlvlwvz8LlbUUIB5qsKrynkl4kkbEtsdHFuDDc3yIxDxTuSQ2pzhksEaUupFaoUxqtF1QzUkENl/S4eUYOFSmHM05vi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAGqvGT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FD4C43399
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709715317;
	bh=Y+RkiUR/jB6Sr+6JJx7cUaWIcbbrJwS+vL29h/qVvNw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=SAGqvGT4SqT+VzXAfQVyz/HGIfZSpVcHS6MKV6M0cu91crkZ93Q/pu2P4TQO1AoCX
	 JZzlnBV0VtPFiyp44cz3UtNKYzn8D76c2vPQRbk7H5wawqZzmWd1wt1q+479HY+q+C
	 DiOe5EWwIaFisdg3zDmNS1jnf9+WehnwWnpKI2e5wGD8bGvy4a85UQwVdxSVs1KxFf
	 zLC+iQLEcvEe1PSvgLDCLkAYRHHnLYkEp5syC4u8ul8XOFwcP/EUmt+Nyc6GDJoRju
	 NnDW3rE8lvE/mu6UXqTH4qn+h6zlbWlkV0sOEiqlz2jfadrd6VyL1Vlw1PCOE3ISdb
	 1K19InIxcHbjw==
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29b7caa88c6so50084a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 00:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEwNOF6GpE27VclsUJ1A2Brb2NXyHAB97mXi5pHcOUqJvZTP1yLVv6LhtnCpHOUNfE17z9aH3gqsSzyvgDIxkaEtu4anaL/oFB+w==
X-Gm-Message-State: AOJu0YxyOj5ohUGzdv1TyDh4zczbC2TO40BasbveXxc7UyP2kGjPN9oM
	ZV9oxPDni7+XgmtHXNKs0vfvshHfOfkVMs+g70ot6Ah4whmDtb6hmkH7YFaeKx2UO/TQ9GbSIAp
	QPBEhO0jg6iRr90AajRQ9dyy8DSo=
X-Google-Smtp-Source: AGHT+IH0kiahxxmvf9fvlBow852xw7OjzqcP88RinN2hqYbQ7j6HSvBauGe3zTqzqI5vasK/qgdRmOIuoPTTWXWsgJM=
X-Received: by 2002:a17:90b:11c4:b0:299:61eb:c75e with SMTP id
 gv4-20020a17090b11c400b0029961ebc75emr11909628pjb.23.1709715316797; Wed, 06
 Mar 2024 00:55:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303140137.157522-1-wahrenst@gmx.net> <20240303140137.157522-2-wahrenst@gmx.net>
 <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
 <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com>
 <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com> <CACRpkdZ-6neizSv-F5jEJPZ-a_emoCbxM9AFqfzYSHTZFGnM1g@mail.gmail.com>
In-Reply-To: <CACRpkdZ-6neizSv-F5jEJPZ-a_emoCbxM9AFqfzYSHTZFGnM1g@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 6 Mar 2024 16:55:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66Op2zSN1JrFEUCfBKxRL-W0cX=Pj18yym4FtWnNeGiXw@mail.gmail.com>
Message-ID: <CAGb2v66Op2zSN1JrFEUCfBKxRL-W0cX=Pj18yym4FtWnNeGiXw@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 4:38=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
> On Wed, Mar 6, 2024 at 4:10=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
> > On Wed, Mar 6, 2024 at 6:38=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> > > On Sun, Mar 3, 2024 at 3:19=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org>=
 wrote:
> > >
> > > > Hi Linus,
> > > (...)
> > > > I'd like to take this opportunity to ask about INPUT_ENABLE and
> > > > OUTPUT_ENABLE.
> > > >
> > > > AFAICT from existing comments in include/linux/pinctrl/pinconf-gene=
ric.h ,
> > > > these two options refer to input and output buffers or connections =
within
> > > > the general electric path, i.e. it allows the signal to pass throug=
h in
> > > > a certain direction. It does not refer to the current selected dire=
ction
> > > > of the GPIO function, which is covered by the PIN_CONFIG_OUTPUT opt=
ion,
> > > > and by gpiolib, if and only if the pin has been allocated for gpiol=
ib
> > > > use. But it seems multiple existing drivers do this.
> > > >
> > > > What's the correct thing to do here?
> > >
> > > It's really up to the driver author: the text in pinconf-generic.h do=
es its best
> > > to describe the intended semantics, but sometimes hardware will not f=
ully
> > > match what is said in the documentation.
> > >
> > > I guess in this case the PIN_CONFIG_OUTPUT_ENABLE and
> > > PIN_CONFIG_OUTPUT is not two distinctly different things for this
> > > hardware so a reasonable semantic is to implement both in the same
> > > case and do the same for both of them.
> >
> > But that doesn't really match the intended semantics. Maybe the driver
> > should just ignore PIN_CONFIG_OUTPUT / PIN_CONFIG_INPUT if the hardware
> > doesn't have matching toggles?

I meant PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE here. Sorry.

> > On MediaTek hardware, they have input enable controls, but not for outp=
ut
> > enable. So mapping directly to GPIO direction doesn't quite make sense.
>
> I think you should look what will work in practice, given the state
> definitions in the device tree file and the runtime requirements from
> GPIO.
>
> If these things add up and work in practice it's fine.
>
> Rough consensus and running code.

I agree that we shouldn't needlessly break existing platforms. But at the
same time we should prevent new additions of incorrect usage. Note that
I am specifically referring to the {INPUT,OUTPUT}_ENABLE configs. I agree
that PIN_CONFIG_OUTPUT works OK, even though I think in some cases a
gpio-hog should be used instead.

For the MediaTek device trees, the only two occurrences of "output-enable"
actually describe conflicting information:

    pins-rts {
            pinmux =3D <PINMUX_GPIO47__FUNC_URTS1>;
            output-enable;
    };

The above asks for the UART function on this pin, but based on existing
driver definitions, switches the function to GPIO output because of the
"output-enable" property. Hence the confusion.


ChenYu

