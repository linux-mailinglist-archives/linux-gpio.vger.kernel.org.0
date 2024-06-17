Return-Path: <linux-gpio+bounces-7512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4068490B768
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 19:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8896283C7F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 17:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E1016A924;
	Mon, 17 Jun 2024 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpOcFt1R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CA2168490;
	Mon, 17 Jun 2024 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643952; cv=none; b=LwGOssjvtvxYuYVJ/8GXviDv55bjEyCJjIOr8eX6febpJY+uEWE/TuTIO8jdbC+sRT3MRCsZ6arFBhra/rXTFseeXj1qMaI7c/evPMbDMrVHbbX2S85di6mpEcARncE+qf/kPLH0X3kpRBbroh+vhgLyMAbcz8A67PK1KqjQ5Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643952; c=relaxed/simple;
	bh=6aYNHlBapcGADaFqbEC84oIMDYUs5euQLPaIqBToM70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gj1aYHDB8AeBl9GGjEBsuo+TrXS0vSwzj6NrLas/GfAfa4Dyvnz3DNCpuUBRugwJXqjaT2Tf4irNn9wdLKqhbjkE60VsqjjkZqB8BQRWcb7G2ydhEC0CCRhKu3yp94oYclFMKFSi4HKxCyt9sjSGQbgtTYZfclC+LVCZhCA8eBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpOcFt1R; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-24c9f630e51so2293975fac.1;
        Mon, 17 Jun 2024 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718643949; x=1719248749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iADTCnpy+t+rN6jI67ep/KeHBjtwxRejqJ1fEPq5f8=;
        b=ZpOcFt1RWb34mvw7owevmL8Z5hKfV0jQF6CKRLy7K1Ly9piz7lvTOHW8p8CA6mGRpL
         KOCoCzVUgS/deqyCQ95KTKvmroRttFEcaok+/YEMay9MOelMctSufxBWogZBK9KtWWpr
         9rixPxxYrwOGDfu80If5Csj0XkqSvRigYFGBnhrSqZ29Q9owcdfP/JM7J2ktpejLgolw
         OL3TbDs0rem3ngF5bQNoQ8zAv4dGxfqsr5uhsC0i6WCfht8xnFqmMdA4L6Kvq22SNQfR
         k1lpPwsc+l8Ii0mE62tnxHXtROmcPbu6tf7ku2N47KrDwtx++kHm7qMvZIai+nWNT57M
         wCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643949; x=1719248749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iADTCnpy+t+rN6jI67ep/KeHBjtwxRejqJ1fEPq5f8=;
        b=Eq0gpD+nrlGXdRMAKoh8QV6Qm0OiP2KLB/qUN10ReFi+Tlcc0gZom9muujL2s4NjUK
         8pzJzIbKNy6bph7zHm8XkmY/V0mEsdtM9sBGoUXRqwKZjocWnUD8cp/zmx39UIL4udxs
         UdL4iPJiSiQ+2ji+62daBkJY4h41Yhj/Vuf0hyGCerL3FtrFNxdMiXejdDg1eyDeDpU3
         s2X/chNmGKNl4HFqYjsfGhSAlKWx+Hsn0sKv30Li6IK91LWvpLnlTdfehbPxFy9SShwt
         KaEdM6JEQCF1l+53U8h2U7HncTQUGI18woaEyOtft2DoZefbdukE9jgm2hn4zZBA1ZWm
         3AmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjdLeE46Vku+I3bO99UKIJH1acaVX6YhYnHi83eWZIo1ZcA6/78b2L+hAQsW5+sUywfJ5bWGLvCGC+ZZKhvtNSg5k/2epBCdUJ0EW/LYhiET1daPRJHQz3nJSI+tEg4QTuij1b3DPjdyAyqZ5vqt4uajPCSY5I//sQPRH/2RKB3GBshPmY2nRpdVsp
X-Gm-Message-State: AOJu0YzQa4rkWnbzCLMaawIerf12PF+4EiRv/hYHeKBmUybZsBmK7LWo
	lbypS7E/T1B5gFQ/fdjCYm67S4SuucBnFZIHN8iBjsZFZ2AYv6gvndJqodznn+pouPFFd2aMQI+
	ExeJNtC9X3HGrhQWycCkBgBUsMmI=
X-Google-Smtp-Source: AGHT+IElr75fQXr9hLEZJMbzELPf7t8W6367P0lDP6bs/33bYj1T/2Q4J2nwH+bQ7Jz1mzQzSYTE2PI4NZ27/iltqdY=
X-Received: by 2002:a05:6870:d183:b0:254:e89e:fc1d with SMTP id
 586e51a60fabf-25842b836bbmr11807148fac.51.1718643949492; Mon, 17 Jun 2024
 10:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617131511.160877-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUDDfOeQUwmuYKPvAXaXBJCB17ecH8sfpC4=7dTVKthhw@mail.gmail.com>
In-Reply-To: <CAMuHMdUDDfOeQUwmuYKPvAXaXBJCB17ecH8sfpC4=7dTVKthhw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 17 Jun 2024 18:05:22 +0100
Message-ID: <CA+V-a8s8HO4HNjNjs181RR-ffgz68m_+qesP+nk-uJLyif_uDg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Use BIT_ULL for PIN_CFG_* macros
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jun 17, 2024 at 2:36=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Jun 17, 2024 at 3:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Commit 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct
> > rzg2l_variable_pin_cfg") introduced a Smatch static checker warning:
> >
> >     drivers/pinctrl/renesas/pinctrl-rzg2l.c:374 rzg2l_pinctrl_get_varia=
ble_pin_cfg()
> >     warn: was expecting a 64 bit value instead of '~((((1))) << (16))'
> >
> > The function `rzg2l_pinctrl_get_variable_pin_cfg` attempts to mask out
> > `PIN_CFG_VARIABLE` using `BIT(16)`. However, since `pincfg` is a `u64`,
> > this inadvertently masks the high 32 bits as well, which is unintended
> > (on non 64-bit platforms). To correct this, `PIN_CFG_VARIABLE` should
> > be defined using `BIT_ULL(16)`, ensuring proper 64-bit masking.
> >
> > To avoid such issues, update `PIN_CFG_*` macros to use `BIT_ULL()`.
> >
> > Fixes: 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct rzg2l_variab=
le_pin_cfg")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/5c1bf20b-7e94-4b06-95e5-da9f9975020=
3@moroto.mountain/
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I would like to brainstorm a bit about this, though. See below...
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -41,28 +41,28 @@
> >  #define MUX_FUNC_MASK          GENMASK(31, 16)
> >
> >  /* PIN capabilities */
> > -#define PIN_CFG_IOLH_A                 BIT(0)
> > -#define PIN_CFG_IOLH_B                 BIT(1)
> > -#define PIN_CFG_SR                     BIT(2)
> > -#define PIN_CFG_IEN                    BIT(3)
> > -#define PIN_CFG_PUPD                   BIT(4)
> > -#define PIN_CFG_IO_VMC_SD0             BIT(5)
> > -#define PIN_CFG_IO_VMC_SD1             BIT(6)
> > -#define PIN_CFG_IO_VMC_QSPI            BIT(7)
> > -#define PIN_CFG_IO_VMC_ETH0            BIT(8)
> > -#define PIN_CFG_IO_VMC_ETH1            BIT(9)
> > -#define PIN_CFG_FILONOFF               BIT(10)
> > -#define PIN_CFG_FILNUM                 BIT(11)
> > -#define PIN_CFG_FILCLKSEL              BIT(12)
> > -#define PIN_CFG_IOLH_C                 BIT(13)
> > -#define PIN_CFG_SOFT_PS                        BIT(14)
> > -#define PIN_CFG_OEN                    BIT(15)
> > -#define PIN_CFG_VARIABLE               BIT(16)
> > -#define PIN_CFG_NOGPIO_INT             BIT(17)
> > -#define PIN_CFG_NOD                    BIT(18) /* N-ch Open Drain */
> > -#define PIN_CFG_SMT                    BIT(19) /* Schmitt-trigger inpu=
t control */
> > -#define PIN_CFG_ELC                    BIT(20)
> > -#define PIN_CFG_IOLH_RZV2H             BIT(21)
> > +#define PIN_CFG_IOLH_A                 BIT_ULL(0)
> > +#define PIN_CFG_IOLH_B                 BIT_ULL(1)
> > +#define PIN_CFG_SR                     BIT_ULL(2)
> > +#define PIN_CFG_IEN                    BIT_ULL(3)
> > +#define PIN_CFG_PUPD                   BIT_ULL(4)
> > +#define PIN_CFG_IO_VMC_SD0             BIT_ULL(5)
> > +#define PIN_CFG_IO_VMC_SD1             BIT_ULL(6)
> > +#define PIN_CFG_IO_VMC_QSPI            BIT_ULL(7)
> > +#define PIN_CFG_IO_VMC_ETH0            BIT_ULL(8)
> > +#define PIN_CFG_IO_VMC_ETH1            BIT_ULL(9)
> > +#define PIN_CFG_FILONOFF               BIT_ULL(10)
> > +#define PIN_CFG_FILNUM                 BIT_ULL(11)
> > +#define PIN_CFG_FILCLKSEL              BIT_ULL(12)
> > +#define PIN_CFG_IOLH_C                 BIT_ULL(13)
> > +#define PIN_CFG_SOFT_PS                        BIT_ULL(14)
> > +#define PIN_CFG_OEN                    BIT_ULL(15)
> > +#define PIN_CFG_VARIABLE               BIT_ULL(16)
>
> PIN_CFG_VARIABLE looks a bit misplaced here, in between all the flags
> indicating actual capabilities of a pin.
>
> What about relocating it to the "high" half, and moving it next to
> RZG2L_SINGLE_PIN? Perhaps even renaming it to RZG2L_CFG_VARIABLE?
>
OK, I will rename it to RZG2L_CFG_VARIABLE and make it BIT(62) instead.

> > +#define PIN_CFG_NOGPIO_INT             BIT_ULL(17)
> > +#define PIN_CFG_NOD                    BIT_ULL(18)     /* N-ch Open Dr=
ain */
> > +#define PIN_CFG_SMT                    BIT_ULL(19)     /* Schmitt-trig=
ger input control */
> > +#define PIN_CFG_ELC                    BIT_ULL(20)
> > +#define PIN_CFG_IOLH_RZV2H             BIT_ULL(21)
> >
> >  #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
> >                                         (PIN_CFG_IOLH_##group | \
>
> Then the other PIN_CFG_* definitions can keep on using BIT().
> To make that safer, PIN_CFG_MASK should be restricted to 32-bit:
>
>     -#define PIN_CFG_MASK                    GENMASK_ULL(46, 0)
>     +#define PIN_CFG_MASK                    GENMASK_ULL(31, 0)
>
> and several u64 variables can be changed to u32 again.
>
> What do you think?
>
Agreed.

Cheers,
Prabhakar

