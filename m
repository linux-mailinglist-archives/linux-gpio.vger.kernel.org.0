Return-Path: <linux-gpio+bounces-25722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20154B483CE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 07:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF98189BA54
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 05:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5154E22129B;
	Mon,  8 Sep 2025 05:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAzQLqNv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43D45945
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 05:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310832; cv=none; b=TOe0PnN/gQyCaYLXqOP4hr2YsUeSr88EzS6mxqz5RKX3PtsHWLTnwtzMpJZ1JOWeZJOp3RLs9keNahr4Jc14Sv+SdQDzeIanrMbtBr2si1G+2z5wqI6YkazLplDWmB1f4MXpTHnxt3oq3HO/Oc5pWSprTyDkCZiaO7D8L7Bv49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310832; c=relaxed/simple;
	bh=ZqrX17bonRAwjOTuMiYVq+TPaLNTG6ggeRB6AoUMNaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XW12dAbk4EZSetqDSS3vr9/RvCPLXqejlsKKdLDnKBVVsFZ4JJg0d0t0vex3aAP4IxqDO1I/2JoJT/UpCFGqhJ59HUXgbEH6yBbRfyBPYKaJWDfccmlr/aRGY5YWfwv/NedoYAruj2FvxM11x5dkS19uHlkldOF5xs5gLErUZ6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAzQLqNv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33DFC4CEF5
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 05:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757310831;
	bh=ZqrX17bonRAwjOTuMiYVq+TPaLNTG6ggeRB6AoUMNaU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=gAzQLqNvEwFvLyv+u+YkhomHi0XARpr8yUzeYEVBLuTOyUVr7jrj3wJnt6zLMmjd/
	 ngYVzt+Uq+ULc6DUl7JbPvS+AE72YHdL2r+g3Dqk3KAWWb/IZJhxyBJlxpwyhh+uZG
	 bAUU78kS233inPdjrHCsFq726T/hdrKUVTTrymfWJ9/XWSeLCmsU0f9z6GH3NsopyB
	 SeHuxgPIofBW3IINC25vd97iYZVEXVXPFRBd2f8TAoZ4A8d7V9Q+Op2IPxZmNbPGSc
	 wai6i+VmRw0i9UrbxEvkq6Sw6p8BuuXFCk9xjLHxUW8h92qjjJNRLmCVMtspx8cbqD
	 fzbdzS+CcF8mA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336dc57f562so35385491fa.1
        for <linux-gpio@vger.kernel.org>; Sun, 07 Sep 2025 22:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy+EFAxjhVfGXjZ3QSX1iO21OMGKScnuXI6BpxMQUOnNNQMXRZ01P58k4Lf3iEfHTFRggzEVx40qyd@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWwOeDSaKL53bHzRJ7dmH8BIVj95pMhqt12eG5AdZSiFhm4uq
	efP8FeOMWkODMi1Ez2DhJEdChUUFUifjSEqv6rlQuN/PtXxiw381xR7nw9SG7zSKJUsOAkNGK/8
	cJj/ydqBMjQkB1uhPP+slgVtepEcwpxU=
X-Google-Smtp-Source: AGHT+IFoIRqBP+beoRTtdEhddDMBEkPHoidtmb9upgIqwtKQKv7AfSn8jlVDO+Lv30NWUzvwXcrdYgDkKWvsvnC3um8=
X-Received: by 2002:a05:651c:1117:10b0:336:cf86:d405 with SMTP id
 38308e7fff4ca-33bb00c67dcmr14316821fa.18.1757310830040; Sun, 07 Sep 2025
 22:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru> <6789547.RUnXabflUD@phil>
In-Reply-To: <6789547.RUnXabflUD@phil>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 8 Sep 2025 13:53:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ihFehEwSc-rX=U-KJdvao_588G8iVEoSXuJ_-gnd50w@mail.gmail.com>
X-Gm-Features: Ac12FXyVWZLt2noIJdj4yJ6V9YrgLg44Go_24vJRtuEdKpX8GT8MNMLbwaZezyo
Message-ID: <CAGb2v67ihFehEwSc-rX=U-KJdvao_588G8iVEoSXuJ_-gnd50w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in rockchip_pinctrl_parse_groups()
To: Heiko Stuebner <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 1:32=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wro=
te:
>
> Am Mittwoch, 3. September 2025, 21:48:54 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Sergey Shtylyov:
> > In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that th=
e
> > "rockchip,pins" property will always be present in the DT node it parse=
s
> > and so doesn't check the result of of_get_property() for NULL. If the D=
T
> > passed to the kernel happens to have such property missing, then we wil=
l
> > get a kernel oops when the pointer is dereferenced in the *for* loop ju=
st
> > a few lines after the call.  I think it's better to play safe by checki=
ng
> > the list variable for NULL (and reporting error if so), like we check t=
he
> > size variable for validity further down...
> >
> > Found by Linux Verification Center (linuxtesting.org) with the Svace st=
atic
> > analysis tool.
> >
> > Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>
> Assuming that the DT is our friend, really is a bad assumption :-) .

If this is invalid, perhaps you should make the "rockchip,pins" property
required in the binding?

> While I can't imagine what 12-year-ago-me was thinking then, simply
> checking the return value really is the better way

I think some of us have thought that guarding against incorrect DTs
is not what the kernel is supposed to do.

ChenYu

> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
>
> >
> > ---
> > The patch is against the master branch of Linus Torvalds' linux.git rep=
o.
> >
> >  drivers/pinctrl/pinctrl-rockchip.c |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > Index: linux/drivers/pinctrl/pinctrl-rockchip.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- linux.orig/drivers/pinctrl/pinctrl-rockchip.c
> > +++ linux/drivers/pinctrl/pinctrl-rockchip.c
> > @@ -3488,7 +3488,9 @@ static int rockchip_pinctrl_parse_groups
> >        * do sanity check and calculate pins number
> >        */
> >       list =3D of_get_property(np, "rockchip,pins", &size);
> > -     /* we do not check return since it's safe node passed down */
> > +     if (!list)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "%pOF: no rockchip,pins property\n",=
 np);
> >       size /=3D sizeof(*list);
> >       if (!size || size % 4)
> >               return dev_err_probe(dev, -EINVAL,
> >
>
>
>
>
>

