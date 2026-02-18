Return-Path: <linux-gpio+bounces-31781-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGyoL7h8lWl8RwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31781-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:47:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4F15443C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 09:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28C04304E734
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 08:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694492FE57B;
	Wed, 18 Feb 2026 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ew+dNHiQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EA131A808
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404162; cv=none; b=POTs5qBsSobNNTnAgWmzHh22KwtdoCQ2EDGDZjZ479lnysTkT3NC2gh0rWva0UPOU7S2hiJvMfLz1oK/G9u6r9+VF9nZs1h9wAdttrzsz7xmAS4RrVVJQ5g82rSG167+ofuAfPGJeg5XX6hbvqEvJTTVO4X4oRhmh1cdqCdSluA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404162; c=relaxed/simple;
	bh=LFVa+bPFu8B7yQthwOHDkUQHzURrFzuOs+tqnZdoRmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IG5+FNVYo7yrRyDE+CGevsqUC+I3n9F5Lccu4Oxzez8nrqn7xQ72CgUtD6s8DSiKGAw6uIrcwqx1DEWtyvuYB+fFPPnLMv2CQ/hgdwviH5nDuqu4beycqMzvy1ifx1tke5F91XnXkd0hq1hK9+nIhpvzG2S9xANEHZmrDJsdgsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ew+dNHiQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6591C19422
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771404161;
	bh=LFVa+bPFu8B7yQthwOHDkUQHzURrFzuOs+tqnZdoRmQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ew+dNHiQBbA9dkY2kI/sjcWdP05teXsBy7UDkqHuByPlCoVjbEyMr518NrNUk6o/V
	 8YztMdR/ht8S90vJ4PWBDXJZJrrABfhNF65z2K2l9F3Ncv39WGmFepNl39h4RnSSuU
	 glbe4qDXFT8nUe7Ry6hJXtDFUCmq/1BqXgkqQlFsvsZuyFTovGAhQHgwLAoxnDDnEh
	 PT28JNhOHHLd7vGDsPJUDCpicV/bR41m8tKlyhhyh4AQLNWFpD5YNz5ka7dwBcWYrU
	 9q5BNWSV+H974LfKpZaMsqinYLWosDKYi08fnipnsHBRTCaCZ0ypSnZJlL9fd8lapY
	 Q4BqsWzrG+t2g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e0d5c446cso5460166e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 00:42:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4igzoKb3TOWIDE/4hSjhhd7nVxToC1yGMxy9PooPpPRbRAmj8A0buXVFxE8o1mzjelMethIeflLxm@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZF0mb59aDOJMANJk2OxqW9aLA4yu/g/RbAF+xQNiVV98e9Kw
	HWeAwEuf91rRNjpu1D9nIl852wxHEJclXlImVbGDDnhYuVupweMxy6UZf12AxiOgZs2l1ial5T9
	qp40WT0RrejRUSQpStUJ9k/d4oYVAHCpNkBNRLfDAzg==
X-Received: by 2002:a05:6512:2211:b0:59f:8158:d7d3 with SMTP id
 2adb3069b0e04-59f83bbc410mr321854e87.36.1771404160483; Wed, 18 Feb 2026
 00:42:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com> <aZUIFiOYt6GOlDQx@google.com>
In-Reply-To: <aZUIFiOYt6GOlDQx@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 09:42:28 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>
X-Gm-Features: AaiRm52ASOTlVFSy1KcC7rXVpTj3xLDZLyVk9gEaUjX0icBzUhT7rA9yV7re9uY
Message-ID: <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31781-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0CD4F15443C
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 1:31=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Feb 11, 2026 at 09:53:13AM +0100, Bartosz Golaszewski wrote:
> > Using the remote firmware node for software node lookup is the right
> > thing to do. The GPIO controller we want to resolve should have the
> > software node we scooped out of the reference attached to it. However,
> > there are existing users who abuse the software node API by creating
> > dummy swnodes whose name is set to the expected label string of the GPI=
O
> > controller whose pins they want to control and use them in their local
> > swnode references as GPIO properties.
> >
> > This used to work when we compared the software node's name to the
> > chip's label. When we switched to using a real fwnode lookup, these
> > users broke down because the firmware nodes in question were never
> > attached to the controllers they were looking for.
> >
> > Restore the label matching as a fallback to fix the broken users but ad=
d
> > a big FIXME urging for a better solution.
> >
> > Cc: stable@vger.kernel.org # v6.18, v6.19
> > Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by fir=
mware nodes")
> > Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> > Changes in v2:
> > - check if gdev_node and gdev_node->name are not NULL before trying to
> >   match the label (Hans & Dan)
> > - use the right link
> > - collect tags
> >
> >  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnod=
e.c
> > index 21478b45c127d..0d7f3f09a0b4b 100644
> > --- a/drivers/gpio/gpiolib-swnode.c
> > +++ b/drivers/gpio/gpiolib-swnode.c
> > @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(st=
ruct fwnode_handle *fwnode)
> >
> >  fwnode_lookup:
> >       gdev =3D gpio_device_find_by_fwnode(fwnode);
>
> By the way, should we extend gpio_device_find_by_fwnode() to use both
> primary and secondary nodes?
>

That's already done on a higher lever for all fwnodes in gpiod_fwnode_looku=
p().

Bartosz

