Return-Path: <linux-gpio+bounces-4157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B645872D5D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 04:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CE791F26CD1
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 03:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3021ADF44;
	Wed,  6 Mar 2024 03:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgNDufxv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF4D52E
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709694625; cv=none; b=twncbWmf4IubAKQZDDHyB23yO7MseLbhGLaID3To3dmHsgWVJWnDsBXCD3GKp9+VvEM0lexlFJqTFahNFUf713UqbD/00Mu/Xq2Q4Lq2rXmwm5SQI3wwkmAzTwGOiRFL9BTChjPe42KwiBgNZbRERYj34g/7lorezDqccWZykYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709694625; c=relaxed/simple;
	bh=ZNhVVJo5Pko3BjX2Ki4jPIr4Hg3IGMyl8IKm5P/A0oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARJXhNkaMNoNmvfYIv4c65nfHgeSen1VIBskIzsO+T2iT18YHA//hr42OXfXWJ6S464Qc3k587eDDMRrYrDXnWJ4HdQEoLe8ewo+P9ptfi01rSLpU1lKGqU01VHJM6O00u6fVfRnq/T/8tTNbgA/5ELlok4O7l7YFi8Z+p9DffU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgNDufxv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F20C433A6
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 03:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709694623;
	bh=ZNhVVJo5Pko3BjX2Ki4jPIr4Hg3IGMyl8IKm5P/A0oc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=VgNDufxvL59UIOM3tys/IsJHq/ZGf8oNBUAyoAHwwPeKuvVwXV1h4CjexAUJ3RT4c
	 GBL7DKjeTGfxbeo3n3Sw8tuH5mkIAJDgcPwj1HN7AjP3/SsqahUaPuHWPuDWLz1x7y
	 jEfDwJl4KRdvVVUmDn8m5hG1GWyFo9QvouwKczAPySTkuGGsn/tp+Ic//mlhnBcn9A
	 7wOaByXd/9Ps0DeDDbCnvGdiORfhXu/UHQStlmYbU9HigKgi0NgA8u5FbeXwL+gBcN
	 0xgpT1HVaCzi+hiAkRBAlrGyzICxsxqL24MIPwj3qSDobTak3UBmE59iCGD6WW3yzv
	 z9TQNWF7IKQ4A==
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso4429612b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 19:10:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUD4wbPKebEhm3o6f2F8OyLS/rkO8aHvXKeY9rmr9I+gcu/dJrKluMf/ZPQ5CNwVAy808WSwJb+d1g5u7vSrLgm8efNB1HvFV1aTg==
X-Gm-Message-State: AOJu0YwI1kn2pZZU3uRVPF598kaUcjyoWs/IEVVAwWT4XSHUX/RUh/Nx
	JuZAA4ka/daCjmDgy4YrfR2xDzd/Pk9m0m0cAiVaYmYg3gosrJ84r/xDII9WsTAIzTP8x+gE6eH
	Bqs1tSUuTmU+fILo9n8AKFfcgYbs=
X-Google-Smtp-Source: AGHT+IF29ennlcpypSDALKKLXxQ+eHq6A/qsj1jlX1lMcFk1ojVjAtTCD+LwyFRu7wRi9ulGYkEnj9t40z1nRtxhZcc=
X-Received: by 2002:a05:6a20:914e:b0:1a1:4b62:a60a with SMTP id
 x14-20020a056a20914e00b001a14b62a60amr4257793pzc.7.1709694623130; Tue, 05 Mar
 2024 19:10:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303140137.157522-1-wahrenst@gmx.net> <20240303140137.157522-2-wahrenst@gmx.net>
 <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com> <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com>
In-Reply-To: <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 6 Mar 2024 11:10:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com>
Message-ID: <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 6:38=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Sun, Mar 3, 2024 at 3:19=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> > Hi Linus,
> (...)
> > I'd like to take this opportunity to ask about INPUT_ENABLE and
> > OUTPUT_ENABLE.
> >
> > AFAICT from existing comments in include/linux/pinctrl/pinconf-generic.=
h ,
> > these two options refer to input and output buffers or connections with=
in
> > the general electric path, i.e. it allows the signal to pass through in
> > a certain direction. It does not refer to the current selected directio=
n
> > of the GPIO function, which is covered by the PIN_CONFIG_OUTPUT option,
> > and by gpiolib, if and only if the pin has been allocated for gpiolib
> > use. But it seems multiple existing drivers do this.
> >
> > What's the correct thing to do here?
>
> It's really up to the driver author: the text in pinconf-generic.h does i=
ts best
> to describe the intended semantics, but sometimes hardware will not fully
> match what is said in the documentation.
>
> I guess in this case the PIN_CONFIG_OUTPUT_ENABLE and
> PIN_CONFIG_OUTPUT is not two distinctly different things for this
> hardware so a reasonable semantic is to implement both in the same
> case and do the same for both of them.

But that doesn't really match the intended semantics. Maybe the driver
should just ignore PIN_CONFIG_OUTPUT / PIN_CONFIG_INPUT if the hardware
doesn't have matching toggles?

On MediaTek hardware, they have input enable controls, but not for output
enable. So mapping directly to GPIO direction doesn't quite make sense.

ChenYu

> +       case PIN_CONFIG_OUTPUT_ENABLE:
> +       case PIN_CONFIG_OUTPUT:
> +               if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
> +                       return -EINVAL;
> +
> +               val =3D bcm2835_gpio_get_bit(pc, GPLEV0, pin);
> +               *config =3D pinconf_to_config_packed(param, val);
> +               break;
>
> Does it seem reasonable?
>
> Yours,
> Linus Walleij

