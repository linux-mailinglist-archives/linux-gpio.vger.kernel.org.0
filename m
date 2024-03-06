Return-Path: <linux-gpio+bounces-4176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C9D873CF2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 18:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F486284B0C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 17:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D234E13790A;
	Wed,  6 Mar 2024 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qH2jkgbB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327560250
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709744883; cv=none; b=GFpJvmypZMEd4WLwcwgf5GodHgfvLBvf/icezYIuK8SFpN3wkShr8KxvTbt+4sGC6OpjpkilABL+/aSe6nPNsT1cl4bLnVdjnPD0sVLowFO+aDmSY51xnH9yKM3JfNhVH+k3+YvdMl7jSFP4Sz24HzN620XFD6/9a3SrS0Pv/eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709744883; c=relaxed/simple;
	bh=QMTWpBPdRR1brg8XtoAvJxWPGcoUKfFaIjux9JQw2o0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xxtq/DOvlieDkv3Ta75Jx7n4LK+8DGTlNpfjI3zdy/b1TzjkVkucDo56Iw8N2FbLTJm6SOYf+MJq+aojcCDbz77Sbq/MaojkZ+vJhOHQZVolf8LXFnVun7w22n8RtbErd88pSDzFHkZOIKfqgZm/JbVejl8gqktN+19l9p2rbl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qH2jkgbB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28558C43394
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709744883;
	bh=QMTWpBPdRR1brg8XtoAvJxWPGcoUKfFaIjux9JQw2o0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=qH2jkgbBd07FBwn3RSFfdsUg7dEuiuKhdt51/it1Gz27bCE+PR2/vdylRScuSwTFq
	 CHv6r9PX9UI8yFZAPlmGfO/mHuIGjMIPOnnqKmArvOC4hnwAFdQv+vmkyrQT4eplSP
	 89CbpKuM99QPf/brhzZ0rFPJzoYmPi16j5/3oJ+me9wzyuLN5e2aDg9A/8ncl8xtEL
	 P7sPXP0NiG28hWpcG2F0yMWlIEygLHV8Qw+C7vTnlnGsxzzVbFsNfyAh0nGN70b5mT
	 TUwghiTb+kqilp/dR2vuLWk6NvVkPXbKDppwA2q3GkS5we6DcsLZRIWGMVdiYJLjOC
	 4AJRj1bUeRgWw==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-29954bb87b4so4703166a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 09:08:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/BeHKTuVjb+7uTTS3sFI86yh6akuKFLw8meCrhxnzZc9m4Fco2Ww78qA2zPaQvN2eYrXPaO1GVdovl7ziwK46182wOdXxHMa7ZQ==
X-Gm-Message-State: AOJu0Ywqd5nB5BuDkEcNaGYz0y8kQkwnqbbuDj88bv0HpitPXaNl5D2t
	JKd95FRPFQjlQ83Vlrenx/UoA9eFLpqNAA2muC0w7mnnteniII3Ytea/wAXz5jovW07V00Af57p
	KxAtHuopg5DzlkMoea5GEZFDofQg=
X-Google-Smtp-Source: AGHT+IEoEAO6ImxIyPKYKi/q61blmD9grxce5Mgm91MeGA668YHv8HU/5z57FxarEJ6Hj4PCgh+vMKhDH/JkpInC1d4=
X-Received: by 2002:a17:90b:3c1:b0:29a:6903:e6d4 with SMTP id
 go1-20020a17090b03c100b0029a6903e6d4mr13176909pjb.39.1709744882667; Wed, 06
 Mar 2024 09:08:02 -0800 (PST)
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
 <CAGb2v66Op2zSN1JrFEUCfBKxRL-W0cX=Pj18yym4FtWnNeGiXw@mail.gmail.com>
 <CACRpkdbni-oN5mNT9Z3GMueWaCjxDcmvjGHYet3YQubDowg58Q@mail.gmail.com>
 <CAGb2v6497xS8OQgDssGYw+7aNGeP31FGanJOT+sfZHF1ybAnEw@mail.gmail.com> <54e7cce2-5111-4fbe-920f-692e27e2b6fc@gmx.net>
In-Reply-To: <54e7cce2-5111-4fbe-920f-692e27e2b6fc@gmx.net>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 7 Mar 2024 01:07:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v66y4KbBzXW-gkyn0WHCpTh6p0OX=Df9WsAEi0jTe5p5Lw@mail.gmail.com>
Message-ID: <CAGb2v66y4KbBzXW-gkyn0WHCpTh6p0OX=Df9WsAEi0jTe5p5Lw@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 1:04=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wro=
te:
>
> Hi guys,
>
> Am 06.03.24 um 14:40 schrieb Chen-Yu Tsai:
> > On Wed, Mar 6, 2024 at 8:57=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >> On Wed, Mar 6, 2024 at 9:55=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> >>
> >>> For the MediaTek device trees, the only two occurrences of "output-en=
able"
> >>> actually describe conflicting information:
> >>>
> >>>      pins-rts {
> >>>              pinmux =3D <PINMUX_GPIO47__FUNC_URTS1>;
> >>>              output-enable;
> >>>      };
> >>>
> >>> The above asks for the UART function on this pin, but based on existi=
ng
> >>> driver definitions, switches the function to GPIO output because of t=
he
> >>> "output-enable" property. Hence the confusion.
> >> This is actually also driver-dependent.
> >>
> >> It is only conflicting if the pin controller has .strict set in struct
> >> pinmux_ops,
> >> because many SoCs are perfectly capable of using a pin as a function
> >> such as UART RTS and GPIO at *the same time*.
> > I don't think MediaTek falls in this category. Nor does BCM2835. It is
> > quite obvious, since GPIO in/out are selectable pinmux functions.
> >
> >> Details on strict mode can be found in Documentation/driver-api/pin-co=
ntrol.rst
> >>
> >> I don't know which Mediatek this is but:
> >> $ git grep strict drivers/pinctrl/mediatek/
> >> drivers/pinctrl/mediatek/pinctrl-moore.c:       .strict =3D true,
> >>
> >> Only the Moore family is strict, and I think BCM2835 is not.
> > While that would be true for new drivers, I believe we do have many exi=
sting
> > drivers that cannot set the strict bit, as existing device trees alread=
y
> > have their pinctrl options selecting the GPIO function in conjunction w=
ith
> > *-gpios usage. We also had this on older Allwinner platforms. We ended =
up
> > only setting the .strict option for new platforms, not because of any
> > hardware difference, but because of backwards compatibility. Otherwise
> > I would love to clean up many of them.
> >
> > In both MediaTek and BCM2835's cases, it is quite obvious from the driv=
er
> > that the hardware cannot use the pin as a dedicated function and a GPIO
> > at the same time. And we should not give them more options to shoot
> > themselves in the foot.
> i tried following your discussion. Does it mean i should change anything
> here in this series?

I think support for PIN_CONFIG_INPUT_ENABLE and PIN_CONFIG_OUTPUT_ENABLE
should be dropped from the series.

ChenYu

