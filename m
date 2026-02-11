Return-Path: <linux-gpio+bounces-31598-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO/bMNVRjGmukgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31598-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:54:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B09123067
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16EA1300B9D9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7ED3570AD;
	Wed, 11 Feb 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHF5ecxW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4285354AE0
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 09:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803663; cv=none; b=GgY5W0MOqD2fzVVwGLBz6WHoWt68tWOTBaC0r6xn8ngDD8MhgerRmFAoVJD2fFxLLCPAj+7EpakMHMfsxtQIx99pV85Mt0HV0rPk2k2S1OcHqITSfmcOMiKxMm8N/5j5GCkJMwgmb/dKOu8mJk5gPKLTUI1W6kKCpAee2r/ynZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803663; c=relaxed/simple;
	bh=/5pNhKzNp3gbK4Hmr3Rpar8H9OmvtwaUM/lc2peBhvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zb9tN+u3nYQJYbNfAwxYOZpGmXsVORuoQANZHF6xJYw6l/PKsklebx9rwzD8u5tA+c8JjDFo/YewsXdUriAxqGnv3x4MDoRgT5XcmSYyddheCkF2Xl7Zbwr7z4NW4P91zT8esSFXb83ocobMCxHI10LlNJdo8PfKWbfGArwIsps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHF5ecxW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C9FC4AF09
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770803663;
	bh=/5pNhKzNp3gbK4Hmr3Rpar8H9OmvtwaUM/lc2peBhvE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=dHF5ecxW6MPWz6oIIdXjhEW/zYWCvnbowkPEaRjMlG2FC9zvKWlbAjKBkIlXtoOge
	 JHXxd1CVleTVEfLnW2f1dkcvMfNE0V7x/qA4UJvHFxCU5TErwBPiGQF7/LMwrrfz8Z
	 pAac32HubRGk6jL4vcIG3Q/tjrHxLXN1U90sDSu+R7Eu2arKY4bYjptO9+kIwza608
	 pv2i2QDOJT9vs9XYwKjDXwm3honwSlRIES7eepetHRf8rLsItM/nhvHda6gOIIKcFy
	 RwJyrivt+5VrDB0S2pa/MCZjlg6TWmb+HNrC8le/sHxXaXOmbxrzWMdPD+b2QXr5uO
	 2a7Y5sIACOzWg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-387097ae2e3so2227371fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 01:54:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwYpINuKeDRMLxX+K0I+JNrrXs3jRv4U0CER3hOCvmUoWMn92DG1JomFTf2i0neESixt5UAy2y0p/U@vger.kernel.org
X-Gm-Message-State: AOJu0YyRSk+dtJo0skqaT4LQ/CR49jaHqkhu25063pvTAI2DAvo+FrlL
	mdd5iEL73k/ArIgeZPI23ZrRQJr4drLUCyA73UvB02LpwWpgiUfMgjoeAsrJax5XiG6qiCLTfqc
	yUxfiv0h2OSqI8z10m8LMc627tbTij5I=
X-Received: by 2002:a05:651c:f0f:b0:386:ec21:c87f with SMTP id
 38308e7fff4ca-38703200666mr4966961fa.42.1770803661719; Wed, 11 Feb 2026
 01:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com> <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
In-Reply-To: <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Feb 2026 17:54:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v663k0DBqodAUbdgbwbpb2k9qAkFowA_P0HpCUv_mCXG_Q@mail.gmail.com>
X-Gm-Features: AZwV_Qi2y5CAMrmnItBBq7T6t5ZLzWkFIM0u2qt3VdP2YzsuTAzC8hcuXWxIqwA
Message-ID: <CAGb2v663k0DBqodAUbdgbwbpb2k9qAkFowA_P0HpCUv_mCXG_Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: Andre Przywara <andre.przywara@arm.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,vger.kernel.org,kernel.org,sholland.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31598-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 14B09123067
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 5:08=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi James,
>
> On 2/11/26 04:32, James Hilliard wrote:
> > Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> > the sunxi gpio_chip setup.
>
> thanks for taking care and sending a patch! I am still scratching my
> head what this warning is about exactly and why we only see this now? I
> never saw this, so what caused that? libgpiod accesses from userland?

For me it was `cat /sys/kernel/debug/gpio`.

> Regardless, can we hold back this patch, please? As part of the A733
> pinctrl support (and as LinusW asked kindly about that) I was reworking
> our driver to use the generic gpio interface, and I have a feeling this
> would solve this problem automatically?
> The actual pinctrl conversion is done, I just need to plug in the IRQ
> support. I ideally would have something in the next days to post, would
> that be worth waiting for?

We probably want something for the stable kernels though. The commit
that adds the warning was merged sometime last year, so it's part
of the latest LTS.


ChenYu

> Cheers,
> Andre
>
>
>
> >
> > The new callback reads the pin mux register and compares the mux
> > value against the pin descriptor gpio_in and gpio_out functions
> > to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> > If the pin is muxed to irq, report it as input.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 ++++++++++++++++++++++++++=
+
> >   1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index 0fb057a07dcc..424f23be27b2 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(str=
uct gpio_chip *chip,
> >                                           chip->base + offset, false);
> >   }
> >
> > +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> > +                                         unsigned int offset)
> > +{
> > +     struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > +     struct sunxi_desc_function *in, *out, *irq;
> > +     u32 reg, shift, mask, val;
> > +     u16 pin =3D chip->base + offset;
> > +
> > +     in =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_i=
n");
> > +     out =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_=
out");
> > +     if (!in || !out)
> > +             return -EINVAL;
> > +
> > +     irq =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq")=
;
> > +
> > +     sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> > +     val =3D (readl(pctl->membase + reg) & mask) >> shift;
> > +
> > +     if (val =3D=3D in->muxval)
> > +             return GPIO_LINE_DIRECTION_IN;
> > +
> > +     if (val =3D=3D out->muxval)
> > +             return GPIO_LINE_DIRECTION_OUT;
> > +
> > +     /* IRQ function is effectively input. */
> > +     if (irq && val =3D=3D irq->muxval)
> > +             return GPIO_LINE_DIRECTION_IN;
> > +
> > +     return -EINVAL;
> > +}
> > +
> >   static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
> >                               const struct of_phandle_args *gpiospec,
> >                               u32 *flags)
> > @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform=
_device *pdev,
> >       pctl->chip->set_config =3D gpiochip_generic_config;
> >       pctl->chip->direction_input =3D sunxi_pinctrl_gpio_direction_inpu=
t;
> >       pctl->chip->direction_output =3D sunxi_pinctrl_gpio_direction_out=
put;
> > +     pctl->chip->get_direction =3D sunxi_pinctrl_gpio_get_direction;
> >       pctl->chip->get =3D sunxi_pinctrl_gpio_get;
> >       pctl->chip->set =3D sunxi_pinctrl_gpio_set;
> >       pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
>

