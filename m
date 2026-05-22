Return-Path: <linux-gpio+bounces-37319-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /NaRGZ0IEGpXSwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37319-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:41:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C4F5B016E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF7DE3076B9E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 07:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284B637CD34;
	Fri, 22 May 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P548Ir46"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6035AC2F
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435378; cv=none; b=hG/QAHrFWD7uVtwAfVOkytmPeeTuFJHlRQR4RDLoB7F7m6TsjpwqXfbYDVi4cOn8v8AdVzQWTKh9kzIDkeRSP4MFrKu939V/imPux8Hbj6LE0BSaEm9mX8XeppalxQhfdfIWA/gJVLFxBC+P+bJ2HoHY6zwNL0/p8rHCN4GFPKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435378; c=relaxed/simple;
	bh=Ea3XV+dKV4Orms7U2I4qh6m58NppCJj1ndAja2DdoDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MApjNkS84ETXh7gTXrKrkZR23B2pPEMdjqPjQ4mOqN2Brs6oNdNaJv+4VZ/ZgouqkVQfvlQTnrUG08PezjJkhFTx67Hrs5PMkDXZTGqCEtTai+zj8/k5Yn07sMnSZWDqgPTNDPNJvgxujdRruIr/tIkVwJXuecJa3DwSYSDVkdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P548Ir46; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73021F00A3E
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779435377;
	bh=2DfSUWhNAH30IVTIaZzPdR+dwWsLL2bbkMZskzSZYW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P548Ir460RYMXIhxehmKWFtNFSaIKJMU7c6n6CoBw6vZkuvdQ8itaOjgYbCA5Nh9i
	 KJM77gGpbiGOj3DpTOQfOyXkQT3Y99b5UKpe2ongm5BWOSjI3kG1D4Sp0RjgUvUCSC
	 1nbzaEsgYq5FkLsXsTCrzks4ievbtsT/EJ9xKU5SbVleRSv8U4WYFU0fbcYn4zbbRc
	 0ZIlvKwgmX11311v9DbtIlDG7Wa5jV2C9wvShqgbv47yJgt7xoKbNRsrPpmtx0TMk2
	 4lEau0+uiHqC6Kn3dZT6J9AkVQfgfVv7U3npTyE5Kk7mpt5EEjNP90l9zoLP6HOl+W
	 DaNvrIb+hIQ6Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-393925cb1baso75504681fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 00:36:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/4AnxA8gQA9jI94NMRl5H0XgzVZEEbquinjUgFMTt3tP2NHv6e/vssw+W8tOMWMtcpepFSSGTU2tC1@vger.kernel.org
X-Gm-Message-State: AOJu0YyUmqf9Jxz57iHeNU5qh9I7TMG9r0uyzPIj8F68eI+jpozUnRnk
	7BGlwIApk0FPvAbJ8QWMBKASyz7a43uE6L/ERkh8833NHYMNqcvNgYqyF1IWZUlgLpFt/KGSVwv
	HZQYNFbLC3guvnIZZIlqj5GXWqSbIIYVfpYwUXKWJvg==
X-Received: by 2002:a05:651c:2101:b0:38e:27f6:41e2 with SMTP id
 38308e7fff4ca-395d8cd9920mr7937021fa.18.1779435376395; Fri, 22 May 2026
 00:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306-gpiochip-set-conversion-v2-0-a76e72e21425@linaro.org>
 <20250306-gpiochip-set-conversion-v2-1-a76e72e21425@linaro.org> <cde2abb2-4cc8-4fc9-b34a-0c5d2b95779f@baylibre.com>
In-Reply-To: <cde2abb2-4cc8-4fc9-b34a-0c5d2b95779f@baylibre.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 22 May 2026 09:36:03 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mc+gmMv3pSZo6vU365bPhyZ86-JHZKshUj9ky4HPVafCg@mail.gmail.com>
X-Gm-Features: AVHnY4IYEd_xjpT0UHosDqWcYrQyCLyYPmoiKpczTgONNk_61tbDDFeYlPik_8s
Message-ID: <CAMRc=Mc+gmMv3pSZo6vU365bPhyZ86-JHZKshUj9ky4HPVafCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: adnp: use lock guards for the I2C lock
To: David Lechner <dlechner@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37319-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linaro.org:email,baylibre.com:email]
X-Rspamd-Queue-Id: B4C4F5B016E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 2:46=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 3/6/25 11:19 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Reduce the code complexity by using automatic lock guards with the I2C
> > mutex.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> ...
>
> > @@ -248,32 +232,24 @@ static irqreturn_t adnp_irq(int irq, void *data)
> >
> >       for (i =3D 0; i < num_regs; i++) {
> >               unsigned int base =3D i << adnp->reg_shift, bit;
> > -             u8 changed, level, isr, ier;
> > +             u8 changed, level =3D 0, isr =3D 0, ier =3D 0;
> >               unsigned long pending;
> >               int err;
> >
> > -             mutex_lock(&adnp->i2c_lock);
> > +             scoped_guard(mutex, &adnp->i2c_lock) {
> > +                     err =3D adnp_read(adnp, GPIO_PLR(adnp) + i, &leve=
l);
> > +                     if (err < 0)
> > +                             continue;
>
> I think this unintentionally changes the flow here. scoped_guard() is a
> for loop, so the continue now breaks out of the scoped_guard() rather
> than the outer for loop.
>

Thanks for catching it, I sent a fix.

Bart

