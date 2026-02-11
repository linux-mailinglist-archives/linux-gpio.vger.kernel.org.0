Return-Path: <linux-gpio+bounces-31580-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBQiMff/i2lDegAAu9opvQ
	(envelope-from <linux-gpio+bounces-31580-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 05:05:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCDF1211DE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 05:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D314A302E90E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 04:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E464A352FBF;
	Wed, 11 Feb 2026 04:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5e4jo+z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80526341678
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 04:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770782706; cv=pass; b=B0FRcRfHxlrayXwsvTzbyHmQQyw4avllyBZ1eT04zN1tCYXii+4jgE8942uuHP+LwCaM/WnfR0AxZcAmPhvvQoAwDIgdfQlLxhirAc1VFJ2IDc2ssa/33xR0oMwUriH8dGPxXuQnxw5WY2tBd8Wbr+/OyAOevn3k90ECkLThqyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770782706; c=relaxed/simple;
	bh=DjVVMdCfr8AWS+gLkQpMkHNLAd0NWUrUawMagvm1hpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Le8yrPPIAxkUTLooCWl8MVdYDh0yDMDzwHxR6FFVKI78K3mZsSLRdEv6MqMfwTspg41PYrbxPJGCz84jKxPTTjDMaNG+Rc0AYJm2CMelcTd77nXxDv8j2C5rQFZiJAHw52vyWhOFMJCVkmZDtCGa/ICCLTe1DPS+2/bIZl2xbVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5e4jo+z; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-948c2035a27so1310674241.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 20:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770782704; cv=none;
        d=google.com; s=arc-20240605;
        b=Bywl8oXKpSnPv22y/bO7lRgB51Ncqn3oD6A0+dx3uAKhMcwfgyhBPJhlZQbcZln9lW
         7GSg8viBaNye2/2BOqVq+u2gPXBrPcYplH1Mk8iDtEOrKBh21LYf83U3GKic84hLlfTA
         iFw/mSRFRzR+Q0s+1EgwrlTrLN06uqg8U3YELJtgC2bSzr3UHG3j0g6oo08Z5Vs2K0fC
         XuY5x7MkpWFyHuxWJGfRL3RNSGU1PMh1pf7QXRGniD1OPMdy2045XySibq9WQ/yIWBzL
         mIsLhiXUf+lZNhKom/ZTvlqxBFaIAUTYwduldtFyslb1nxKIsBj8v5oxhy85FIlF4BQd
         Dgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        fh=6hAOtPbYDibxXHUz5MvCsF3KDp8NmpRaWrBcSpj5MIE=;
        b=dqf9Eiy16UuLrIIRmT8ZyjMtZBgMz3UbUgv18yjfaHUr6H1vaMrRfynXg2s9K6z/0f
         yx0JNCw1IDiV/Op1WzMCuthY0Ph18SEyoMdzUR6Y321O/zHYq738ufSpuxL6/n+oj8Iq
         J7tkdgwk4Tfb9DDX9FNNO8tcJhQZFbRBMv9JmFPOJOO2t3GgaUg8VorACbDttqJp5cAg
         7WwDsl98pT7qSLCuA3m/P2wTyxXuflMUiTM25yYx1pBg6MUDJq/wqO2yK3MtlqP5zuD7
         +BGFa83VLPOwu/jMKuPo8ugSR28N+mLuXQxnLPm/RyTe+Bbw6YIgQ+uwvKpgXVZSg9AU
         w7Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770782704; x=1771387504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        b=W5e4jo+za3j84Dpt2M7BZb3WyMV/er5fKQysKxk7IcBe2J+/49dEEMLFYzL4PrrrhA
         B75yfjJj+dNLMirgU19h/+SPN1jti3J+7BpUpPb3S3nEQ3vrkDAkNiv2dnWJgujvw522
         4gHWo7HZMbT9hrD5LxqFnaD8JNSN384iFdd5smUIeM7JIlbuj9WEPUyI8VZ0jvcvM3pn
         VuqLmY/lJGADS+5HrebiinDvhpssdqt6jHnEmhwdljWLLodoDwjl/mG6oE67b8tPYTPy
         hh6SJCI5UoRqlFCUx6vCHUQSiBsDTWC0dd2/DWrnP4fNluKv1rwA/ROQgclmdqRlPSBv
         OwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770782704; x=1771387504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        b=qQa8Kj7ykK2ypCNttTrH80bF5tWfwP+ntVxqAUvcrHIkmmaaRF1EGXlgDQ1FKnt7I2
         m33lmbvqjikfTU+pbhslKsBSLEnkjMD5oiJi8NMuvk7fNa7lPUqMlwxtrK0wscUfM5lw
         2CGFHxsCKRcRcImvsVAAyGqA75HqXA+8Piojgn9t1KD0UqjWbygCgRmy7uk2HgixAenO
         gF5knY8HKRX1eiRkGhN0an8pEY6nzCOEP+YpNzTDVHsU2+jmxRZ0o1wOLAj73T5bUc71
         HOiTXg2dxhWf/oHH9pkF351L/JPRWPcTmWNFtF+4GTgSPdUXF8QHk7wi84665Z+kHVBB
         A8mg==
X-Forwarded-Encrypted: i=1; AJvYcCWhn1s78mAHPTeSkvsMIXjHhVW/cNwqNzRlNw9c4nPIXA+ECkuY2OZgQirEXT3GoBmALkhWwTtyz/Sv@vger.kernel.org
X-Gm-Message-State: AOJu0YwZNHBFGFiBhALPDcqxbPjrLJ9s+tGFofmF3/HIv8Ajh9vMI2dP
	yCVPn6H8zlbLB9TpnA2yWJq2nuklYvoMZVExVA+z/Ts8HjbanVVlodJkReqQ31e00SOXqu078MQ
	OXR7zOMNbi+6VW3qPk9JGyLrttaAMVeY=
X-Gm-Gg: AZuq6aLdu47yrZFUX3So8Mmvuk+/w516U0AwbuWXMjZLiXJd6F3DK+fQWhgdKPZR4fd
	HCn4jbEQ6FG/KvrdQQDCEoMe53GOwUiWPnxn/pHDOJzOTT0Lhh01tSMdlwTOQyWxGtKf7iOPDgX
	57h7GFVr5o+47qz5wq6uObNHhg/hK/Pz266XZQvbau4bOtt5sPW3RJaCMWblK6YQPMwX+RAB4fN
	3r7hFAYSNDtgvDm7v9LgMSNC6YX41yVlSMUPCoIsp04wwTCjer9rGCkbV7ta1OpPEVoEdlWzgeL
	NI2Cv+uW1HYRDusmLCsJTt9HHZmIdNghWrm4qleE9DniyZ2suHMUj4ggOicg7q/8HNV5
X-Received: by 2002:a05:6102:4421:b0:5ee:a8c4:18f2 with SMTP id
 ada2fe7eead31-5fde93f801emr137229137.26.1770782704273; Tue, 10 Feb 2026
 20:05:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com> <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
In-Reply-To: <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Feb 2026 21:04:54 -0700
X-Gm-Features: AZwV_Qjf4ObSc92v7jkKvYHFiayN0060eKWYrAhspcIrTjh2lRHs_GV5KWc25f8
Message-ID: <CADvTj4p7YYhz-iZSRX=hDyL2E2JXPmnCJ59wX+9zMt7vnzn8GQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31580-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,kernel.org,gmail.com,sholland.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3FCDF1211DE
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 8:49=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Wed, Feb 11, 2026 at 11:33=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
>
> Ah, you beat me to it.
>
> > Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> > the sunxi gpio_chip setup.
>
> Can you also mention that without this, calls to gpiochip_get_direction()
> cause a big warning?

Yeah, this was mostly just to silence that warning(I don't think I actually
was actually using the functionality).

> > The new callback reads the pin mux register and compares the mux
> > value against the pin descriptor gpio_in and gpio_out functions
> > to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> > If the pin is muxed to irq, report it as input.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index 0fb057a07dcc..424f23be27b2 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(str=
uct gpio_chip *chip,
> >                                             chip->base + offset, false)=
;
> >  }
> >
> > +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> > +                                           unsigned int offset)
> > +{
> > +       struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > +       struct sunxi_desc_function *in, *out, *irq;
> > +       u32 reg, shift, mask, val;
> > +       u16 pin =3D chip->base + offset;
> > +
> > +       in =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio=
_in");
> > +       out =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpi=
o_out");
> > +       if (!in || !out)
> > +               return -EINVAL;
> > +
> > +       irq =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq=
");
>
> This is less efficient, as you end up (linearly) searching the whole pin
> array three times.
>
> What I did in my version was implement a search based on pin and muxval.
> I can send that out if it's OK with you.

If you have a better patch I'll just use that instead of sending
a follow up.

>
>
> ChenYu
>
> > +
> > +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> > +       val =3D (readl(pctl->membase + reg) & mask) >> shift;
> > +
> > +       if (val =3D=3D in->muxval)
> > +               return GPIO_LINE_DIRECTION_IN;
> > +
> > +       if (val =3D=3D out->muxval)
> > +               return GPIO_LINE_DIRECTION_OUT;
> > +
> > +       /* IRQ function is effectively input. */
> > +       if (irq && val =3D=3D irq->muxval)
> > +               return GPIO_LINE_DIRECTION_IN;
> > +
> > +       return -EINVAL;
> > +}
> > +
> >  static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
> >                                 const struct of_phandle_args *gpiospec,
> >                                 u32 *flags)
> > @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform=
_device *pdev,
> >         pctl->chip->set_config =3D gpiochip_generic_config;
> >         pctl->chip->direction_input =3D sunxi_pinctrl_gpio_direction_in=
put;
> >         pctl->chip->direction_output =3D sunxi_pinctrl_gpio_direction_o=
utput;
> > +       pctl->chip->get_direction =3D sunxi_pinctrl_gpio_get_direction;
> >         pctl->chip->get =3D sunxi_pinctrl_gpio_get;
> >         pctl->chip->set =3D sunxi_pinctrl_gpio_set;
> >         pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
> > --
> > 2.43.0
> >

