Return-Path: <linux-gpio+bounces-34211-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIinNoM5xWkP8gQAu9opvQ
	(envelope-from <linux-gpio+bounces-34211-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 14:49:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40616336436
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 14:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDB7A302A068
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 13:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104D92EDD70;
	Thu, 26 Mar 2026 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2KyNYNG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4F2DCF61
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532477; cv=none; b=NDw0WHkGkbr5GndhHdOOR7uX2WvIdwV++ITH9K4+lCRjSieTCmvC3ZZERmin+1XOYcIgR4SdE5ylKml1H0yvw41LFajQ7Q5k5v5+SuZPHmI29qq4akG+2r5x/zLXiDpkdWukkhWAkj2BmGqm70GYF8kG6l7ASxkLgcbXVIrKRDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532477; c=relaxed/simple;
	bh=yLi6gSkvZgDST6h/LgdKw6L2y3+4y4KXIJxxfqvEhkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0Gut1M6HffXIcach3TUQCCSoasotkERbmzqsBdSNTVxHI//aLWUN1dMsgbDbb+6VLcV9raeoz0MzXlsVBng8qQ9QP5TCYEqhBxHm4wGR7PThKToH7sAxlramvgxtvgWYD9uqi5+9fF/xIg2cqSk1P2pYyIeotet4rDR1TB4i9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2KyNYNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC394C2BCB3
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532477;
	bh=yLi6gSkvZgDST6h/LgdKw6L2y3+4y4KXIJxxfqvEhkg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q2KyNYNGrt0Go2tZX6WEcGEYUisSyXMpfloE7/sSB3WoeLBAeHQJdEQtm9EEwm+GL
	 RrgHohn6XpCFjTVFkUlBFL5qJ0WsHN3+MPsNDFA+Y0BPZaV3fEkvJ2V2oW0x0pYavo
	 pIWVfJWJ1ZU4y9h9YPlW5rJafVJC2Zw9i2AnS3ZRLjljUV76gHY1hXHu5k3yTwcRmm
	 hnMa2TQ2hC5qUXU70eaWgdIrt3xCNLc9lRW7xh0Jt83LKC//086GUCguRLTFG7ydWf
	 9GYK+VuVKa+6mg1TrksFEUYytYSj/F8kystLGEgpCvUjTu9tr/GQCy2f0HlV3CZLOz
	 fweTQdYSEjHaQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a283c44478so1113340e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 06:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXk5g3JB4w/OWKxW5QSI4ub+WwHvXlmFVbi8Bawz2mTZxZ3Pfko6CySSi9cjpSzzVaYFwnDmnUqU1TV@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJJFlcln4Vv55CcxjsMt9jU6vRnKPGN4cup2nvmuXe3/P+uiU
	f41P/E2/tzR27nFPmEb5Wnim0iSXlCFdkUYelq5MYSzSgC9MEoheo+6bJ2Ri3m9BIsdy/xotWTB
	TUFoam3G85sbuxvz1Ks6VolmH6RgiEMWip6QgyB4TGA==
X-Received: by 2002:a05:6512:10c6:b0:5a1:1862:67a0 with SMTP id
 2adb3069b0e04-5a29b9a4f1fmr3491718e87.45.1774532476295; Thu, 26 Mar 2026
 06:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-timberdale-swnode-v2-0-ea0078066871@oss.qualcomm.com>
 <20260316-gpio-timberdale-swnode-v2-1-ea0078066871@oss.qualcomm.com> <20260326105239.GJ1141718@google.com>
In-Reply-To: <20260326105239.GJ1141718@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Mar 2026 14:41:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=MePWvTYXk8pmpjLKkGA8-pOK00wv+NkW3UPp-NBaTR=hA@mail.gmail.com>
X-Gm-Features: AQROBzBJasaXltuOl3-gLg3u2gPdwC1Adp6dITfzZnQvPFiLdyxR1_BbFOyNVk4
Message-ID: <CAMRc=MePWvTYXk8pmpjLKkGA8-pOK00wv+NkW3UPp-NBaTR=hA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mfd: timberdale: set up a software node for the
 GPIO cell
To: Lee Jones <lee@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34211-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40616336436
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 11:52=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 16 Mar 2026, Bartosz Golaszewski wrote:
>
> > Create a software node with device properties for the GPIO cell and
> > attach it to all the GPIO cells.
>
> Could you elaborate a little on the motivation for this change, please?
> I assume this is the first step in a larger plan to convert the GPIO
> child driver to use device properties and remove the legacy 'platform_dat=
a'.
> If so, it would be good to state that in the commit message or a cover
> letter for the series.
>

Sure, I'll remember next time. It's not really a larger plan, I'm just
trying to clean up various GPIO-related headers specific to individual
drivers. Most platform data structures can easily be converted to
device properties.

> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/mfd/timberdale.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
> > index a4d9c070d481a182890a58e4b8c850c4c29f7f17..8d7dfeaa76258d02e50528e=
39c4f7125d9201388 100644
> > --- a/drivers/mfd/timberdale.c
> > +++ b/drivers/mfd/timberdale.c
> > @@ -181,6 +181,18 @@ static struct timbgpio_platform_data
> >       .irq_base =3D 200,
> >  };
> >
> > +static const struct property_entry timberdale_gpio_properties[] =3D {
> > +     PROPERTY_ENTRY_U32("ngpios", GPIO_NR_PINS),
> > +     PROPERTY_ENTRY_U32("gpio-base", 0),
>
> This appears to introduce a functional change. The existing 'platform_dat=
a'
> sets 'gpio_base' to -1, which results in dynamic allocation. Hard-coding
> a base of 0 here is very likely to cause conflicts.
>

Please look at the definition of struct timbgpio_platform_data patch
3/3 removes. It also sets base to 0 so I'm actually avoiding a
functional change here.


> Should this property be removed to retain the dynamic allocation behaviou=
r?
>
> > +     PROPERTY_ENTRY_U32("irq-base", 200),
>
> This magic number should be defined.
>

It was not defined in platform data either but sure, I can fix it in v2.

Bart

