Return-Path: <linux-gpio+bounces-39432-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +dEZIvsnSGr3mwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39432-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:22:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE77705B86
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:22:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eqsuwvgu;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39432-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39432-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2A58300F15B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 21:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C544034389C;
	Fri,  3 Jul 2026 21:21:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528629B200
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:21:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113718; cv=none; b=tvKzoNHfUKTCxXzKsjW9BUsuzaLq6toKfZQe315TMbw2gPS4pv95SGbOrH7rZYcyLc5Kplgc8RGVBSjWxSNI1fxPvFLrnrL62IzlSECjzQ0x0VqcEExaT+Vi1QWFlTX3BK/2BpFq2+uVmRmKMeMzxjskahwW6jnCJiiJoR0J+WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113718; c=relaxed/simple;
	bh=rDrDwtvaeScAXjFj4zrGQ3f7lkG2XJ+C4605qAmeyMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkblXsEJAMBHZ+ZfsQWH90md9A5RHgkPe50W9bPGgPXUE74BQ4/+PKEoXZk/n+AQyhg8eSjMWPOMGB39PXEtdVErfXesttbdVsuFpi9p+YpmI8NP7rhE5AQaQ7zpQasMIUJhHIfBo3MkccPs93eQOOz65qd0vwDxMlJeBFcqPA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqsuwvgu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AA01F0155E
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783113717;
	bh=UhTL6mkIIS9CmX1cWK4ka4UUv0O2RF/1htrgpMtiz4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eqsuwvgutm/62iECc+VFnOJyrOWKdKsQTMEqdi/NaQlhDiNBuksIONpl6hD8vc0q7
	 F/7lgNYUjVW4oNKpF71w7Bg3uc+Q3CGa2zp+qelc+WmLNIUw+nmttvKcAmMsPwVmMk
	 EyiQ2Nm3yRq1f8It1y9u7OD3zoyiZXPmZonSlQNMuiBj376Mog46m5ntNFWwETkndu
	 Es5m18MQP3okFFixzm4EFwuRhZ/7XUJgGdsyRKTN2gI29BdZthO5kpOgA0E9GKuT9K
	 5V1WwYDyCplPmjvPe5fWxkQYI/UiMWgfNEm+pt+nVfqwd1CLhhjFHTiAr+1z6C2Sfi
	 jdxhkjeOf+3iA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebf162770so1629359e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 14:21:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro63cvOVuBvfkpfgkurA0eDmL2aGJ4tRu/BucmVknqUX/XvhuDimlUj1lXs2BQJY3s/iYXffoFyhgCZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzfjsXCw1cnDAMqgghOXD9SogDkgKtLRjfb+xdqvKxQDRp0PpBl
	jk2U6fsupio8jhAzdfInsQmljWOaWlSpJTMomA7eA4vfcjNBfPgVusV7MxSI5A1i1Oqcd8UkUyT
	1pGNwmgS9+UCr/hbeU19/ny3CKQjaj/I=
X-Received: by 2002:a05:6512:3349:b0:5ae:c542:3416 with SMTP id
 2adb3069b0e04-5aed4ed4415mr168479e87.0.1783113716076; Fri, 03 Jul 2026
 14:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703134833.21110-1-haohlliang@gmail.com>
In-Reply-To: <20260703134833.21110-1-haohlliang@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:21:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Z-xKOpFLXa_fyoJ2K4vXnDPsHMsy2EUM1_Paaic-GMg@mail.gmail.com>
X-Gm-Features: AVVi8Cc4r4tbK93nU4pTMfduHhJ-Kf9AnElJkFEuWRdQJfuIgnAUfYobkfN2iVE
Message-ID: <CAD++jL=Z-xKOpFLXa_fyoJ2K4vXnDPsHMsy2EUM1_Paaic-GMg@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Add robust error handling in interrupt handler
To: Liang Hao <haohlliang@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: hoan@os.amperecomputing.com, brgl@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:haohlliang@gmail.com,m:tglx@kernel.org,m:hoan@os.amperecomputing.com,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39432-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCE77705B86

Hi Liang,

thanks for your patch!

Top posting so tglx get the context...

On Fri, Jul 3, 2026 at 3:49=E2=80=AFPM Liang Hao <haohlliang@gmail.com> wro=
te:

> The current interrupt handler silently continues if an interrupt
> handling fails, which may lead to interrupt storms. Add proper
> error handling to gracefully recover from failed interrupt
> handling.
>
> When generic_handle_irq() fails, the following recovery actions are
> taken:
>   - Write EOI to clear the pending interrupt
>   - Mask the interrupt to prevent immediate re-triggering
>   - Disable the interrupt to stop further interrupts on this line
>
> These measures prevent the system from being overwhelmed by repeated
> unhandled interrupts while logging a rate-limited warning for
> debugging purposes.
>
> Signed-off-by: Liang Hao <haohlliang@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 7b92b233fafe..dec700e3cfb0 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -209,8 +209,20 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
>         for_each_set_bit(hwirq, &irq_status, DWAPB_MAX_GPIOS) {
>                 int gpio_irq =3D irq_find_mapping(gen_gc->gc.irq.domain, =
hwirq);
>                 u32 irq_type =3D irq_get_trigger_type(gpio_irq);
> -
> -               generic_handle_irq(gpio_irq);
> +               int ret;
> +               u32 val_intmask, val_inten;
> +
> +               ret =3D generic_handle_irq(gpio_irq);
> +               if (ret) {
> +                       dev_warn_ratelimited(gpio->dev, "Failed to handle=
 irq %d\n", gpio_irq);
> +                       /* Clear the interrupt */
> +                       dwapb_write(gpio, GPIO_PORTA_EOI, BIT(hwirq));
> +                       val_intmask =3D dwapb_read(gpio, GPIO_INTMASK);
> +                       dwapb_write(gpio, GPIO_INTMASK, val_intmask | BIT=
(hwirq));
> +                       val_inten =3D dwapb_read(gpio, GPIO_INTEN);
> +                       dwapb_write(gpio, GPIO_INTEN, val_inten & ~BIT(hw=
irq));
> +                       continue;
> +               }
>
>                 if ((irq_type & IRQ_TYPE_SENSE_MASK) =3D=3D IRQ_TYPE_EDGE=
_BOTH)
>                         dwapb_toggle_trigger(gpio, hwirq);

Ugh I don't know if that is how you'r supposed to deal with the return valu=
e
from generic_handle_irq(), we better get tglx eyes on this.

Yours,
Linus Walleij

