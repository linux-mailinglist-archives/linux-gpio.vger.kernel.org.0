Return-Path: <linux-gpio+bounces-33575-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALtaElEzuGmvaAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33575-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 17:44:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4B229D94C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 17:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1E5E3062F88
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807E0332EC5;
	Mon, 16 Mar 2026 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKsGxBEp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419F33264E7
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679120; cv=none; b=Lw+f5HzNJPVijy6ZNkacyFKWIkGHbpf0mmlUZZNr7/igOLokdMS/IAeGRjk2hh3Q9qswgocMnilmGn6pCO7fRMb4HIdOkOdkRvXNn37Qynyuh6vxfbGw8GWDce6vrG2NfDp+CDzP9c1qF+ieCPEu18P3++Ip4hNRVjkG0+LaFhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679120; c=relaxed/simple;
	bh=WjRKcPX2nSZFIAsL9u41UKk0xj40ZYukny2MNWHY1RY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fj1ZhhLL1XhqxjxLkHjnoHIZt/aT8Sm5PkSgP4y+bH1Agm7S3YIMKV4uRmqMKiRQoAeiMVsHDq074cLptZHYfs+AkRC13SJRdSFysisrJ7EE52iv1dn391ccgroxpRoSQvFQKi4W+YN6n5W+xDqm4GbggZwVqn8Z1qFHRWM7dEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKsGxBEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C20C4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773679120;
	bh=WjRKcPX2nSZFIAsL9u41UKk0xj40ZYukny2MNWHY1RY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=mKsGxBEp6h75iJZzNhCxdVIVnWbF8LCzPPxMjkLa6ZTcqnd87h4sDB6H7Zo1JmLbg
	 yzL9YRI3KfzZA+AerScuZ4vutXDs1p024BEI7DLuHMyqN4FdKCwJpUC6PGyL5ZqHf5
	 U9UdRxq64mOmR9l3Nz00XuU8CkpO/+qiCHE3XL0U3CHwCGmgFgvdRhEiF75IsA7XVH
	 NT2QTFh68EA3lidx0t/GNkZ6wgH0yCZ2Hfr1uj9XQRSUvcFhhpqm5jqM+ypRJV1gNO
	 JmnJqF+3dsuiQq5Nyz82yEvnRHjfDeV6STsRnaUvpaY3swisuDeoTXqcDE8XGVdoWH
	 N4GOfSZd6ib1w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a3990e87fso32394361fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0zh+EU/8tih5fB6i9usmsDkk37BgM/rekuyXgBH++LR3I51Mde6nsJOFeJsxen0Bn1pLm0jZfoYCF@vger.kernel.org
X-Gm-Message-State: AOJu0YxZoo3tnJ8EgulgBIpD9IQ1eKFP2pjr/InOimFsqckpWaWTNaB+
	svy1eIAjnCv8emQuXygoLpy/Ry5RnLohLx6GWXJDWva/IgimtKt1FTGLJnLd4DLaLAUrfm7jjkW
	LU/kaVbYQXKHjkrq/Ua8aUCjzt8r9C4w=
X-Received: by 2002:a05:651c:2115:b0:387:c1a:70bd with SMTP id
 38308e7fff4ca-38a8966895amr46258671fa.2.1773679118307; Mon, 16 Mar 2026
 09:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl> <480b227c-c85b-4ff0-a825-3e82f64821f6@arm.com>
In-Reply-To: <480b227c-c85b-4ff0-a825-3e82f64821f6@arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Mar 2026 00:38:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64rerhGS1HO_gk9YxgwRD2DkQaOp2d7+s-AgvbsV6UEhA@mail.gmail.com>
X-Gm-Features: AaiRm53keWjTxhNFEZxuYoh_gy-I4m09ah_LqOADR8F3LM-d3K2fa672mykDgzE
Message-ID: <CAGb2v64rerhGS1HO_gk9YxgwRD2DkQaOp2d7+s-AgvbsV6UEhA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mmpsystems.pl,kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33575-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	HAS_REPLYTO(0.00)[wens@kernel.org]
X-Rspamd-Queue-Id: 9F4B229D94C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:37=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi,
>
> On 3/14/26 09:09, Michal Piekos wrote:
> > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a=
.
> >
> > The issue is caused by gpiochip_lock_as_irq() which is failing when gpi=
o
> > is in unitialized state.
> >
> > Solution is to set pinmux to GPIO INPUT in
> > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > earlier.
> >
> > Tested on Orange Pi Zero 3.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> > Changes in v3:
> > - Drop v2 solution which was returning input instead of error when pin
> >    is not initialized.
> > - Add checking pinmux configuration in
> >    sunxi_pinctrl_irq_request_resources() and set pin to input if
> >    uninitialized
> > - Link to v2: https://lore.kernel.org/r/20260308-rc2-boot-hang-v2-1-516=
fdb820953@mmpsystems.pl
> >
> > Changes in v2:
> > - Dropped the previous faulty solution which was forcing the axp313 to
> >    use r_pio as interrupt controller as pointed out by Jernej =C5=A0kra=
bec.
> > - Implemented suggestion from Andrey Skvortsov to return default
> >    direction as input
> > - Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d79=
2d1a78dfd@mmpsystems.pl
> > ---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 +++++++++++++
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
> >   2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index c990b6118172..7d46f7613672 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -1089,6 +1089,9 @@ static int sunxi_pinctrl_irq_request_resources(st=
ruct irq_data *d)
> >   {
> >       struct sunxi_pinctrl *pctl =3D irq_data_get_irq_chip_data(d);
> >       struct sunxi_desc_function *func;
> > +     unsigned int offset;
> > +     u32 reg, shift, mask;
> > +     u8 muxval;
> >       int ret;
> >
> >       func =3D sunxi_pinctrl_desc_find_function_by_pin(pctl,
> > @@ -1096,6 +1099,16 @@ static int sunxi_pinctrl_irq_request_resources(s=
truct irq_data *d)
> >       if (!func)
> >               return -EINVAL;
> >
> > +     offset =3D pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
> > +     sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> > +     muxval =3D (readl(pctl->membase + reg) & mask) >> shift;
> > +
> > +     /* Change muxing to GPIO INPUT mode if at reset value */
> > +     if (muxval =3D=3D SUN4I_FUNC_IO_DISABLE) {
>
> The "high impedance"/reset value depends on the SoC generation: older
> SoCs didn't have one, so they used 0 (GPIO_INPUT), which is the closest
> to "off" you can get there. Most SoCs afterwards indeed used 0x7, as you
> set below, but newer SoCs (D1/T113, A523, ...) use 0xf now.
>
> Would it work to do:
>         if (muxval !=3D SUN4I_FUNC_INPUT) {
> or shall we just force SUN4I_FUNC_INPUT always, without even checking?
> Or can there be other settings already (for instance the IRQ function)?

Yes, by some badly written DT. Pinctrl muxing happens first, then
request_irq(), so you could accidentally re-mux a pin that some
peripheral is using into an IRQ if we don't do the check properly.

> Not really familiar with the call chain here, but shouldn't the mux be
> set to the IRQ function (0x6/0xe) here anyway?

The muxing happens happens a few lines below, right after
gpiochip_lock_as_irq(). However we're trying to silence the warning
that gpiochip_lock_as_irq() indirectly causes.


ChenYu

> > +             sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
> > +                           SUN4I_FUNC_INPUT);
> > +     }
> > +
> >       ret =3D gpiochip_lock_as_irq(pctl->chip,
> >                       pctl->irq_array[d->hwirq] - pctl->desc->pin_base)=
;
> >       if (ret) {
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index ad26e4de16a8..22c527fc6ae2 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -86,6 +86,7 @@
> >
> >   #define SUN4I_FUNC_INPUT    0
> >   #define SUN4I_FUNC_IRQ              6
> > +#define SUN4I_FUNC_IO_DISABLE        7
>
> As mentioned above, this cannot be a simple fixed define for all SoCs.
>
> Cheers,
> Andre
>
> >
> >   #define SUNXI_PINCTRL_VARIANT_MASK  GENMASK(7, 0)
> >   #define SUNXI_PINCTRL_NEW_REG_LAYOUT        BIT(8)
> >
> > ---
> > base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> > change-id: 20260308-rc2-boot-hang-269e8546635b
> >
> > Best regards,
>

