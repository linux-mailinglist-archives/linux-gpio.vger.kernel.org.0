Return-Path: <linux-gpio+bounces-31803-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBhYOkUAlmlHYAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31803-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:09:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 953531588BA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AF123034669
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 18:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E78346A15;
	Wed, 18 Feb 2026 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eA3dQ8Lh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478553451CC
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438118; cv=none; b=AH18z+5av3fricJ+OTj7Bcu0OdGlqeJYApy/8IkNJ3jDGkLWg8wI8T2pC0jcj7AmDETwEvSeEXmMijx2lgw3moDtHCh2QCC/jdz68CdhaJATnP5ZGP5BLGJCc0P5vR0bBv//snBaSYVXQzNeVqJIwQDy1eBDQ/OxwKBL4sVVAHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438118; c=relaxed/simple;
	bh=t9LLJ5ZLhg7RSq6Wov+CACF8jsXPmZ5bM8MaUkL9FAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWxwBMv2sNNqKb5EWJiiwOqDlw+RfhdQQYjL15DvL5e7GEDHdKownWt81TTlDsf87kk0QZlahj62/wHpC9c9Li4BgMT06JsTS9z7hY4TKv+KAtqFxGUpkUME7qf2viiLBV9hHDUEHyFB9FezuliC3bu6NXiKt+9eYF3GQlWnChI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eA3dQ8Lh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136FAC2BC86
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 18:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771438118;
	bh=t9LLJ5ZLhg7RSq6Wov+CACF8jsXPmZ5bM8MaUkL9FAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eA3dQ8LhFQ19qN13YZ02MxPzxlm5tKFx+g3fdxfVxBm2cyqylmhreDbXpqvnsGhNq
	 Llwx5v/7n4vThpxSyaU4KpDJgQTjkUJQFFZj94VEWdL8phcf7lHt3Jp9xTZeBWP8ms
	 aG768b95XzMk8boJLT623f253DthHq8OSlUgoVrSlM7DlvtJ9z1vaNeGXAFk5BHmYs
	 hGXmqLmjV7qB//5Jdd3nGVFWzEX9DJj9E2uDwu5JeHwRoK6FGpMBwqXE+7qE6ftT3c
	 FTzdp9dJj+5hzqN5qdtrJKyE0S9UODmQkHn+5vYzFW0g8tD4oot0Lknan1ucnzqPMe
	 eIbL0CiE/QkkQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3870c7479c0so1373281fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 10:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVsEPjUeny8gyvgqInd1WbG54wpoVI6FmgDFUr2Go0L6KVmNk7V39hVeoTRcrRoEVXH2jQRUsxHTdG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi4cZNPlOKEtrNjQO/P9f8IZVOOlg+IkPu9KJRUXUm5yOl/p4M
	OpfFUKl2kSybJKd+qjSisHlgszmC/sXrOlVDU+RTEnf/d532nJECuVtVsutwc7+MLKkQRek9D+3
	4vrzDAmYD3zxMdKLPQAvWG0VItv4ky+YBPRBmuif4Lw==
X-Received: by 2002:a05:651c:542:b0:386:8f97:d0b5 with SMTP id
 38308e7fff4ca-38810572293mr53666421fa.29.1771438116448; Wed, 18 Feb 2026
 10:08:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
 <aZUIFiOYt6GOlDQx@google.com> <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>
 <aZXyPjIjIDKCBLvs@google.com>
In-Reply-To: <aZXyPjIjIDKCBLvs@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 19:08:22 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdQmR-_Yqdh4TiHSzjmGVJY+0guDpFEM6F1QD_SJ2+T0Q@mail.gmail.com>
X-Gm-Features: AaiRm526hzwXVyE0IQxFLC-TydDiQbZv16nPl-C6QGKfc7fvaC3tQavu0gI2ubg
Message-ID: <CAMRc=MdQmR-_Yqdh4TiHSzjmGVJY+0guDpFEM6F1QD_SJ2+T0Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: swnode: restore the swnode-name-against-chip-label
 matching
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31803-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 953531588BA
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 6:15=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Feb 18, 2026 at 09:42:28AM +0100, Bartosz Golaszewski wrote:
> > On Wed, Feb 18, 2026 at 1:31=E2=80=AFAM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > On Wed, Feb 11, 2026 at 09:53:13AM +0100, Bartosz Golaszewski wrote:
> > > > Using the remote firmware node for software node lookup is the righ=
t
> > > > thing to do. The GPIO controller we want to resolve should have the
> > > > software node we scooped out of the reference attached to it. Howev=
er,
> > > > there are existing users who abuse the software node API by creatin=
g
> > > > dummy swnodes whose name is set to the expected label string of the=
 GPIO
> > > > controller whose pins they want to control and use them in their lo=
cal
> > > > swnode references as GPIO properties.
> > > >
> > > > This used to work when we compared the software node's name to the
> > > > chip's label. When we switched to using a real fwnode lookup, these
> > > > users broke down because the firmware nodes in question were never
> > > > attached to the controllers they were looking for.
> > > >
> > > > Restore the label matching as a fallback to fix the broken users bu=
t add
> > > > a big FIXME urging for a better solution.
> > > >
> > > > Cc: stable@vger.kernel.org # v6.18, v6.19
> > > > Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by=
 firmware nodes")
> > > > Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> > > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcom=
m.com>
> > > > ---
> > > > Changes in v2:
> > > > - check if gdev_node and gdev_node->name are not NULL before trying=
 to
> > > >   match the label (Hans & Dan)
> > > > - use the right link
> > > > - collect tags
> > > >
> > > >  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-s=
wnode.c
> > > > index 21478b45c127d..0d7f3f09a0b4b 100644
> > > > --- a/drivers/gpio/gpiolib-swnode.c
> > > > +++ b/drivers/gpio/gpiolib-swnode.c
> > > > @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_devic=
e(struct fwnode_handle *fwnode)
> > > >
> > > >  fwnode_lookup:
> > > >       gdev =3D gpio_device_find_by_fwnode(fwnode);
> > >
> > > By the way, should we extend gpio_device_find_by_fwnode() to use both
> > > primary and secondary nodes?
> > >
> >
> > That's already done on a higher lever for all fwnodes in gpiod_fwnode_l=
ookup().
>
> How exactly? I am not talking about checking secondary node for the
> fwnode that is used in the reference, I am talking about secondary
> fwnode that might be assigned to the gpio chip and you need to check
> both primary and secondary if they match with the fwnode that you call
> gpio_device_find_by_fwnode() with.
>

Right, I didn't quite get it. I was surprised to find out
device_match_fwnode() - which we use in gpiolib - does not do it
already. I'm wondering if this is something we should change in device
core or only locally.

Bartosz

