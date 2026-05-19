Return-Path: <linux-gpio+bounces-37155-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBE6Fc9pDGo8hQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37155-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 15:46:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8F57FF41
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 15:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3876300D722
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383E9348C4E;
	Tue, 19 May 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2KzpCSy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55F6348C56
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198411; cv=none; b=Bh47pLnUz3yT3cCKhA+SXRpBKLl6TCYhCsttAYOWD6wyrdg50KPkL2haH5ybsuROyf+LHUx4GciqMtUcdFHyN+wLV2PXtPVtStyfUQRNFNGtpFKaAPv/o00SfGdKNFao7BA7h4qYA+U+3z+Ueyt1CO59Ihf71cAhrNU70MREpZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198411; c=relaxed/simple;
	bh=pBfk7nuhR/qWW2veAEgptg45ls+eePbFHXkSPmw5YKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJKbvYfQbWIJnyoHeerJCbNKnoSB6dfBmL+QGEZP1NHzDm2fNHkjTfN8LhcoDP54ZX67AtUn7KGwR7SY/+dR03mZEeVgNiUqR6e0o4ppsBTjPfzM7Xv9ea1OUhK6TObPZnrTYeJwZAsp25p9m3CzBuNf50amDcz4UP4k9xI6zsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2KzpCSy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CF4C2BCC7
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779198411;
	bh=pBfk7nuhR/qWW2veAEgptg45ls+eePbFHXkSPmw5YKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p2KzpCSyQelF5PtM9ynAkbsrvCXr7TaTK5J0035tkIZf+UB09F67HddE9Y+HvkQbH
	 yJHjn9pzefqdOnmSSf3L8IYZ9WRqoW2VKj4bYbLUf/KLjrPGZYXY8eoe5qX+3kzXG9
	 bSDMRq/Xd4bP4Noj6W8kWM2qDujz4lobR+kG9slWqUP3zhvknwiX2ABNu7y39tlZFe
	 d8KmqO8VxVxuDf7KKgW8R9xgXZOkUU0Ra0MHxieFMPMdDJLYvld/TflzeaQNN5vXup
	 j72RrGaUn1SUKy5uwT+vV+oabCQJqD8nB8RCb0ea4n18Gx7HQD7ao/wj/5AnYAsNNk
	 m4ekChgs1NVnQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so37672171fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 06:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9kW1od4Awt+oOrjuDSr6RtHpN9HtxZY34HXLpIrRz/+Z635L5PMtLnE2PNrESngAxQikzAwJrzCqJY@vger.kernel.org
X-Gm-Message-State: AOJu0YzSVhPvZ3Evk3e2MWcnlI/Tn59zZYTv9nTyG2IS7oU0M/UkZ1lX
	iWh2LHGLmXJWvQBkTKY2A73rNMqk2TFidkwYDSsSgOPYQzt5b0CD63NFx+gYHd6yQ8b8S0kVm2P
	H6X8UI++8G0R1n3e9YTLwdCsGyAqEKlEvxXIGxBEITg==
X-Received: by 2002:a2e:a803:0:b0:393:940e:d5eb with SMTP id
 38308e7fff4ca-39561adf7cfmr66952741fa.3.1779198409986; Tue, 19 May 2026
 06:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-gpio-cdev-attr-padding-check-v1-1-a0c6d4a698bf@oss.qualcomm.com>
 <20260519134410.GA93030@rigel>
In-Reply-To: <20260519134410.GA93030@rigel>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 19 May 2026 15:46:37 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdfYJmbG7d5ucn4=PhJGM6wo0oF8hmTSwKxM9fmYSQz0g@mail.gmail.com>
X-Gm-Features: AVHnY4LFybUAKuZgelOymGZ5AvczaKR0REclvZwjb9XtrVhbkO1fByU7p77nJSU
Message-ID: <CAMRc=MdfYJmbG7d5ucn4=PhJGM6wo0oF8hmTSwKxM9fmYSQz0g@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: check if padding of uAPI v2 line config
 attributes is zeroed
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37155-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E8D8F57FF41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 3:44=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, May 19, 2026 at 03:14:53PM +0200, Bartosz Golaszewski wrote:
> > We check the padding of other uAPI v2 structures but not that of line
> > config attributes. Add the missing check.
> >
> > Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and=
 GPIO_V2_LINE_GET_VALUES_IOCTL")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/gpio/gpiolib-cdev.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index f36b7c06996d70b2286edbd181899e4c572b9086..f6f49376a36288cdf444933=
34e766d6340294ed7 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -1184,6 +1184,7 @@ static int gpio_v2_line_flags_validate(u64 flags)
> >  static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc=
,
> >                                       unsigned int num_lines)
> >  {
> > +     struct gpio_v2_line_config_attribute *attr;
> >       unsigned int i;
> >       u64 flags;
> >       int ret;
> > @@ -1194,6 +1195,13 @@ static int gpio_v2_line_config_validate(struct g=
pio_v2_line_config *lc,
> >       if (!mem_is_zero(lc->padding, sizeof(lc->padding)))
> >               return -EINVAL;
> >
> > +     for (i =3D 0; i < GPIO_V2_LINE_NUM_ATTRS_MAX; i++) {
> > +             attr =3D &lc->attrs[i];
> > +
> > +             if (!mem_is_zero(&attr->attr.padding, sizeof(attr->attr.p=
adding)))
> > +                     return -EINVAL;
> > +     }
> > +
>
> To be really pedantic, how about checking that all the unused attrs are z=
eroed?
> With the loop here reduced to checking the padding of the used attrs.
>

Good point.

> Also, the attr padding is a u32, so is mem_is_zero() is overkill?
>

The intention is a bit more clearer this way IMO but I'm not going to
die on this hill. I can change it in v2.

Bartosz

> Cheers,
> Kent.
>
> >       for (i =3D 0; i < num_lines; i++) {
> >               flags =3D gpio_v2_line_config_flags(lc, i);
> >               ret =3D gpio_v2_line_flags_validate(flags);
> >
> > ---
> > base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
> > change-id: 20260519-gpio-cdev-attr-padding-check-7e52c98a3de7
> >
> > Best regards,
> > --
> > Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >

