Return-Path: <linux-gpio+bounces-7562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6558090E955
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 13:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE4CD1F240A1
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 11:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DABA13C679;
	Wed, 19 Jun 2024 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDGEUrHg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF0E13AA44;
	Wed, 19 Jun 2024 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796259; cv=none; b=i+rVb3eoUYSVRa9aH9o7y1brMoMVynGfi/HqaJ2RoH3ACTcnSvr0cyztQWUJhzN0FLzVlFAei+lpurGldjKZ3/+NrUue71JeyNNEFHaaGDHpp8icrA1di5unvSNuNpdu6M/1DrHhsoDnXdbisAY5DVTFVeup6AV6///I3txRXKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796259; c=relaxed/simple;
	bh=QiNpfz9gXpNGbgWK+SSf6RLJwU4D6RbIRzy7KzqMSu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5KyiDNJQ+2rjAN0NWnB5xpySNlbBa+kT4vaB3/144aFJplj5ETIN7ofd/NYb7GSzL1fJrXqsmPEaPTIUctLmFJIVHfe/jmdRShP6FyikmpQ1NLrq0TatqZWqhp9kAyebAv6gnz9/GpEz0n93vLRfKC5PsgSp58Q4VzvyJrTeHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDGEUrHg; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so73318991fa.3;
        Wed, 19 Jun 2024 04:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718796255; x=1719401055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AhLMVJiVMssdXrymxDZSsXEoYz8lpEaRocGgJePhUg=;
        b=cDGEUrHgW68M0mI5vAofXCTVPuFXxNXZiBPWshQEHajFIlOt1papTvJOHR4TmEINa4
         a5sAy1VbWDKCrQB6lw3KeTyLXXeLaIwf8eLk/ktxDTCi2fRbh7pvWeSBu+4gIC70qPo0
         IwFwdM8e4zxmGTlvi5/bnjx0epzxxv0Dp6samdpVhRLP2oD6z8YBy7GHCBuYBp23npRQ
         pya1/tzxNL3gKIEScKWQgdZiTN5uf/zqfQQyqnHxVork6n1Au02vryaEfOk5rFLZVWaI
         c+2BfAlpZhzoHO9TiL9ZOd6eVbiAI+KyOwd7Gr4oH0DsOKGT9u9qbMUJK6+Se/CHfNZ6
         RFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796255; x=1719401055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AhLMVJiVMssdXrymxDZSsXEoYz8lpEaRocGgJePhUg=;
        b=T2YYzWlNKn+llhyF7RoouWxsF/yntXSXOoya/ZPDKlNypQoHwm0Xhm7c9jsowljGKs
         GWox3gVWUUGSwgR0SvrLU8A2zExikOa5WWBGBe6Qw3rIuguiW6v9Rgy5jXblNbic3mYW
         bYCI4PWnNPbS0iNBF7moC5Yga9a1TgBHW8BbVwlQp4Ght3RkQ+hCjQu8dnEgz7P9aO69
         4zVaG7sDJiZkKMjN0NF6oXA1d7ew4liP2E/Kw7WO0ChwtbdZ3ZN1UEJUlEGjCCUty/Ub
         5SKJA1ZMu91tQxmennJsQGVb2VJIg6VnNeUIBIgOMuKBFxUXvSlxys/B103AKvJd1E5X
         zwXg==
X-Forwarded-Encrypted: i=1; AJvYcCU414d00RXPUhTyWATGT07fYu2QvLu0O+NnaPyIq5Lc7MXUhMoZGjiqZKBM9I8ahsdgkO2mL36v2KCQqAu0hevPmKtnB0NYOLLQ+cqUU+7jL+4CDtob9LTaPJ48y8UYyo2aFjYfidpG2Q==
X-Gm-Message-State: AOJu0YwGA4k4G+R7INg/r2YElzpVbeDGXzpgQf9uGPuwJuTyKz3MFZjt
	YbjQ/qM1nLS+6Sn4pYWkCsMWdjcWMl+jV99ntQKV/ni1Dc8zQ4EWP9RXWFLlaI3xdFBMBUoN67i
	Z7bOCsqe58GUK559ma/itpTQWfUk=
X-Google-Smtp-Source: AGHT+IEQww8Sc0Jg4gCddWh2kVTEqz+WZu5WTjkaJSzaRVJjX7JNi6gjqMvrxWj14/018FjLROHZoPp/GakSEWmq+uw=
X-Received: by 2002:a2e:9b08:0:b0:2ec:21f3:b67b with SMTP id
 38308e7fff4ca-2ec3cfd6744mr15635501fa.37.1718796255250; Wed, 19 Jun 2024
 04:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613080725.2531580-1-potin.lai.pt@gmail.com> <946f44526e3016f595bfe463cf0a7f5b4eaa084a.camel@codeconstruct.com.au>
In-Reply-To: <946f44526e3016f595bfe463cf0a7f5b4eaa084a.camel@codeconstruct.com.au>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 19 Jun 2024 19:24:03 +0800
Message-ID: <CAGfYmwVJvyEJ6sbvr=_OqNkiRSDBXn2uqMr28gN949NZd=5dcA@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: aspeed-g6: Add NCSI pin group config
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 3:33=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Thu, 2024-06-13 at 16:07 +0800, Potin Lai wrote:
> > In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is n=
ot
> > needed on the management controller side.
> >
> > To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLK=
O,
> > reducing the number of required pins.
>
> Hmm, I'm not convinced this is specific to NCSI (and it's an
> unfortunate mistake on my part), but we do need to call the groups
> something different than RMII[34]. Did you have any other suggestions?
>
I don't have better name for now.
In ast2600 data sheet, it also mentioned "RMII" & "NCSI" together most
of the time, is it ok to use "NCSI" as a new group name?

Best regards,
Potin
> >
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 7938741136a2c..31e4e0b342a00 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > @@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
> >
> >  FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F=
26, F25,
> >               E26);
> > -FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> > +GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> > +GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
> > +FUNC_DECL_2(RMII3, RMII3, NCSI3);
> >
> >  #define F24 28
> >  SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
> > @@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
> >
> >  FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B=
26, B25,
> >               B24);
> > -FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> > +GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> > +GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
> > +FUNC_DECL_2(RMII4, RMII4, NCSI4);
> >
> >  #define D22 40
> >  SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> > @@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_gr=
oups[] =3D {
> >       ASPEED_PINCTRL_GROUP(MDIO2),
> >       ASPEED_PINCTRL_GROUP(MDIO3),
> >       ASPEED_PINCTRL_GROUP(MDIO4),
> > +     ASPEED_PINCTRL_GROUP(NCSI3),
> > +     ASPEED_PINCTRL_GROUP(NCSI4),
>
> You will need to update the binding document as well. I've poked Linus
> W about a series I sent that re-formats the binding function and group
> lists - it would be nice if you rework the patch on top of that:
>
> https://lore.kernel.org/lkml/5bf8e1dddd2b958a102e7b1b9f9c080a34f9deff.cam=
el@codeconstruct.com.au/
>
> Cheers,
>
> Andrew

