Return-Path: <linux-gpio+bounces-32798-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGy/KfWMrmnlFwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32798-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:03:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7D235D5E
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64E8B3015115
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059E7375F9E;
	Mon,  9 Mar 2026 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQ101iWk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963F374752
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047023; cv=none; b=H40VWgEmXUMcdOlXDOmwWKadINKfElSwXJQx+FCUd5HZ2XIbGK8LGCbvK5b4UohtOOylWkYqNIa02VLo7QjtpPclAIJQVHo40ztuDyKluw6DlQ4+OwOH0sIux6mdODop1GfeZtac0U+8jn+DURM0E1fREq4J5gaE9V83/b7OZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047023; c=relaxed/simple;
	bh=NHqpSEZVsWbWgIja3kieVVuxwiNnL7EaRmas6HJUsWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rB49lwXCyp/kkts9rfJ4oeWC9Y+m5rQW/YMfW2PZ9O9PxtcIjyITO9vFeWvFcbUrKdUrds1LcfQRZeDACOdP2guQ+uNPP6amdiTr0FBSugAH5hhaOqXBes1fW3FoqRgbJdvCzNmO51VbEXWyCNpm31oa0IWtE9Lyl6jTtPr93BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQ101iWk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7131AC2BCB4
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047023;
	bh=NHqpSEZVsWbWgIja3kieVVuxwiNnL7EaRmas6HJUsWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rQ101iWkne4GQpFROza0W41V7NDreoF6+XeGG7jzew41PPHodNBGCEQSFkylBBJQJ
	 hDc8XJ99mE5qnngXrp1vm3YfpGgcKcxBG+BCbiQQy7lIGEV/ej8ER5JpbRJcpQUV5O
	 GD9znMOb31xlZcaGDM5ctl0lvO9/QKGkze9duLfAIcqd8AxYXvg6dt34D2jJyGLfbh
	 dmqEPhCAbEsk8E7iHQlmnyk6SuF9bIzsAIYWk1Uum7s8ny4tT4hcAvc12ZMFBe7rt+
	 d5zoXA531kIM8nAifg1diwPgQdU7bYuhUV4sYx13PsT1yxks47B7Mu80WhvpQomW9y
	 fLDYdQMJyQcag==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a33070b32so38303651fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 02:03:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkOXxCrYWCsuc1N53rrqUEYYcyCWpUUlrdJemb4Kwf4WHRXjc6+678CJDrXx+XKv5P39AmvNsiMcyD@vger.kernel.org
X-Gm-Message-State: AOJu0YwO7hEIkJeJwr1q3vD1TlVpGkHIpQFLQZU0imd8CGyS4tQ9g3St
	J6386Oo7VyDlwMHUJXl6WkU7Txo9jsV0WqvRGdDB75SWzC4U5zcqYvWeAnnoa+iT7eIXeCVOuNV
	env7NgErNQRTI8wWVXHvnaIpEdbJQBhiPa20VNkzw8g==
X-Received: by 2002:a05:651c:41c8:b0:387:15c9:379a with SMTP id
 38308e7fff4ca-38a40b5ff81mr28921681fa.26.1773047022054; Mon, 09 Mar 2026
 02:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com> <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
 <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
In-Reply-To: <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Mar 2026 10:03:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com>
X-Gm-Features: AaiRm51GDQM7nWXlWiIub7pxCbmgBaQ0riecFovbemyWgkXzu2HGDohc6qR3JdA
Message-ID: <CAMRc=Me+oUX5xbNY7PX43cTH0e5ouu=Ex3TqhvWvoefmR7jYYQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	Daniel Palmer <daniel@thingy.jp>, linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4BA7D235D5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,thingy.jp,gmail.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32798-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 2:27=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> On Sun, Mar 8, 2026 at 5:06=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
> >
> > On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.com> w=
rote:
> >
> > > Use a flexible array member to combine kzalloc and kcalloc.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > (...)
> > >  struct msc313_gpio {
> > >         void __iomem *base;
> > >         const struct msc313_gpio_data *gpio_data;
> >
> > Do you wanna add:
> >
> > const unsigned int saved_size;
> So in the code there's
>
> for (i =3D 0; i < gpio->gpio_data->num; i++)
>
> which is equivalent to match->num.
>
> __counted_by doesn't support pointers AFAIK.
> >

This is a regular flexible array of u8. It should work fine with
__counted_by and I too am in favor of using it as it has become
standard for flexible arrays.

Bart

