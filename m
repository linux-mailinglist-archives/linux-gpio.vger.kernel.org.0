Return-Path: <linux-gpio+bounces-4171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E48737F3
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 14:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C858B23AB2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6610F130AFE;
	Wed,  6 Mar 2024 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YV93bZ62"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E831E519
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709732465; cv=none; b=O2QxQ5poozt5h7F4TSER8om+B35vrzCL0tZF52MWROpEiU0w9cxaDIesdo4cUB2G4Aj0OnfxLYVeOTrPgI+ir9osE7JRk5z5re9HkCZPMyUlFROi6OcJtAaR05rGq0w/Gm+N27bUW868zH8bmQZ4xlsjyFvWGW5kdb8XSeepxI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709732465; c=relaxed/simple;
	bh=H5GpHOsYCpSMN3/akkts95UVt0OpYJkeytlUjVEwcnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTdXAWUG1mQY/MX/3y3MxL6oKWUCR/SsGxj0JEErnbN/I44020O1560tNhCFY5YuRbL3N94xXJ5CGnZ7idpPmX4dycYdxd/s0a618jtAhmeBI9yY3ZzCflNwj0PVbcakJLIUrQyFtjDlKTV8WfQhASosU9KODFDLpKFcjj/R+kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YV93bZ62; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76815C43143
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 13:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709732464;
	bh=H5GpHOsYCpSMN3/akkts95UVt0OpYJkeytlUjVEwcnk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=YV93bZ62J3SSdGw8pr/1YkKyNeitzq7hdO4zXq0czId8uqJ20tlMptKvsUR1K0HlU
	 XXHfNXIvANOfr9Kuj59/PB8NTeYau+AvBvQlJZNw9VrvFp1TK1XHDd6eVexZBmhW6m
	 8KCgtBI5K6WMo4nTDQgcCsLK1mmblKQXMq0vcmf/2pSTAl+8F3kYT3uhyLzjFz8w/M
	 61LDb0TIFBq0nEwoU1d+xw8EJ2qrr2fCOsu/PVif9Ab4hvWsUqi5DRRsyQE8hWLpiD
	 lSPFyuqZqYVVstiAJkY5prmeLlWHKuGwLa8myOLzQYbMwygakZoyjB6lL+1XuFBl9/
	 D3nosU59n5jBw==
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29b31254820so2832488a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 05:41:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUy0dq+Ep0jQ6QHB6GSCEdu+86BzHhvffydMHFy3zB043ZEtsJ6S3uTtz3NAs1wi+yeBXLUIac77kb3a4iKeAgaDxVEws3QBqKlaw==
X-Gm-Message-State: AOJu0YwgjfTayHTz3v7uUKUC7qPSqplxCN38wWQhVbEnnS3m/HSU6qwq
	RKLuek77fjVqsAj4eTRll1snEX7uYX/YUzAJmF0lZXlcC3P9iMK9Alm8ViLL5DUwaXY44BweRZy
	FanQC9gIMaCOtIPvUD2E+9eN9ick=
X-Google-Smtp-Source: AGHT+IG54lf9f8aNuFOqv/gHJu5Amwf1SjSTlMDCco/PfPZPgRpCFKptAwoYWHAiNxFRdqCCDz3igWAGaEV+ZAbmzKQ=
X-Received: by 2002:a17:90b:4d8d:b0:29a:83da:efd1 with SMTP id
 oj13-20020a17090b4d8d00b0029a83daefd1mr12053295pjb.6.1709732464002; Wed, 06
 Mar 2024 05:41:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240303140137.157522-1-wahrenst@gmx.net> <20240303140137.157522-2-wahrenst@gmx.net>
 <CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com>
 <CACRpkdZX2WHCggT2hvS86eLUq3pH6jYYpEFLbY4WwN6_Ya+mQw@mail.gmail.com>
 <CAGb2v67TFYZwCk1KViDHFVzuYX1QsA2E69UcJ-ZMMmw5UAxH8w@mail.gmail.com>
 <CACRpkdZ-6neizSv-F5jEJPZ-a_emoCbxM9AFqfzYSHTZFGnM1g@mail.gmail.com>
 <CAGb2v66Op2zSN1JrFEUCfBKxRL-W0cX=Pj18yym4FtWnNeGiXw@mail.gmail.com> <CACRpkdbni-oN5mNT9Z3GMueWaCjxDcmvjGHYet3YQubDowg58Q@mail.gmail.com>
In-Reply-To: <CACRpkdbni-oN5mNT9Z3GMueWaCjxDcmvjGHYet3YQubDowg58Q@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 6 Mar 2024 21:40:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v6497xS8OQgDssGYw+7aNGeP31FGanJOT+sfZHF1ybAnEw@mail.gmail.com>
Message-ID: <CAGb2v6497xS8OQgDssGYw+7aNGeP31FGanJOT+sfZHF1ybAnEw@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 8:57=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Wed, Mar 6, 2024 at 9:55=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> > For the MediaTek device trees, the only two occurrences of "output-enab=
le"
> > actually describe conflicting information:
> >
> >     pins-rts {
> >             pinmux =3D <PINMUX_GPIO47__FUNC_URTS1>;
> >             output-enable;
> >     };
> >
> > The above asks for the UART function on this pin, but based on existing
> > driver definitions, switches the function to GPIO output because of the
> > "output-enable" property. Hence the confusion.
>
> This is actually also driver-dependent.
>
> It is only conflicting if the pin controller has .strict set in struct
> pinmux_ops,
> because many SoCs are perfectly capable of using a pin as a function
> such as UART RTS and GPIO at *the same time*.

I don't think MediaTek falls in this category. Nor does BCM2835. It is
quite obvious, since GPIO in/out are selectable pinmux functions.

> Details on strict mode can be found in Documentation/driver-api/pin-contr=
ol.rst
>
> I don't know which Mediatek this is but:
> $ git grep strict drivers/pinctrl/mediatek/
> drivers/pinctrl/mediatek/pinctrl-moore.c:       .strict =3D true,
>
> Only the Moore family is strict, and I think BCM2835 is not.

While that would be true for new drivers, I believe we do have many existin=
g
drivers that cannot set the strict bit, as existing device trees already
have their pinctrl options selecting the GPIO function in conjunction with
*-gpios usage. We also had this on older Allwinner platforms. We ended up
only setting the .strict option for new platforms, not because of any
hardware difference, but because of backwards compatibility. Otherwise
I would love to clean up many of them.

In both MediaTek and BCM2835's cases, it is quite obvious from the driver
that the hardware cannot use the pin as a dedicated function and a GPIO
at the same time. And we should not give them more options to shoot
themselves in the foot.


ChenYu

