Return-Path: <linux-gpio+bounces-38677-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AUVQDSnwM2qRJQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38677-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:18:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 831006A0699
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:18:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RvDj8lXa;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38677-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38677-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C35023038A68
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 13:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B07427E05F;
	Thu, 18 Jun 2026 13:15:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D791246783
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 13:15:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788545; cv=none; b=jF8uuQsLR89bsXZOIqMf0yS0f1Rq+gCDdYpVUhWu4luuoaCWq/gU3II/8glUsZpk4m5sdcPW54jRRFZEq2RKbw2T7FPOWMokIh2uY0LQ2gTT8JyGiy+P8np3LqWHZdWta5b9SFpYYm3swFgH+3UiS96coH8k7N5ut77TP4JL2ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788545; c=relaxed/simple;
	bh=Y+XsArUPq8ODdNiyqMZyhNcaYe0u97N3N+XZcJCn/Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpxLt3FEyLyn6jIuWtjdlSAptFWun15AnXDuLcwTWgtY5mlNJtJvwaMqID1cqHUCahWrM/f24N4eI4lSVSzsmVnqVPBZh6Hc9nUr7xRCpTJv5QQXuAMaSTWlZdNPAoP05D1cWVNRa3pUapnYn5wgQWvPKZ+ZbXW1e65EXq9d/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvDj8lXa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D2E1F00AC4
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781788544;
	bh=FAAn/mWJuuN5gL4FlLtNSl6vPNBasbbg1AXB8rDwhzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RvDj8lXapXNOvDW2rf9wVnNlwHPrTLK4sqXVu5/UvcJCFMrFeluBRbB7SYTQM7zqe
	 5j3fADVyCzPW/FMNcXuGyIJkNXAG2eY10J+sPgFludxHZhQliRr+xytCmBOmIqI6rM
	 iP9qCUbW3Ss9yE+rTytVTiMA+bZXsdkNCjy5RuuotGpr2ErLHf6ktGcAr8fWt7G2hv
	 lC6t4g9zYopVfoicscD/Sjs4NJmrkTL0RJF7ejLsBWhgOc6va+W3+fwcZyVeUFoMYY
	 prrIDR80FHzeKc4CM6LUoP7IozLBBYb8Ap5PSDKu2EPiQhuFVVPS/ZL1YEL7Z3LhUC
	 i1SfWrn9Y2F8Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3967726bc47so9326561fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 06:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iCKYWr7Ts0C97joUvyh9W3kOeAdkM9Bqv0DEY9y/uFxnbpAsD33q42CLswElloJGg6QHLZ8vRyRge@vger.kernel.org
X-Gm-Message-State: AOJu0YyJvd0OrLmuj4zXwjlQHuHs2c08msLmNunJXVyX2XFYQdbcTIVh
	9mFT1Xt0ADyes092exhGPPMUwmRWP7YQZ848dN70wHiDED1rfSCG314yut4FQzjYgCyGhTuBN+9
	z7sIeDQW12gqogQXe0wQcYMipklK6b14=
X-Received: by 2002:ac2:4f0f:0:b0:5ad:51ac:21d8 with SMTP id
 2adb3069b0e04-5ad51ac22a4mr687097e87.14.1781788542680; Thu, 18 Jun 2026
 06:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 15:15:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
X-Gm-Features: AVVi8Cd4ajb_jyilwrzYqFD2Tx2XDqLDSoVk9kbdtiibfu6CS572v2FjQevMhk4
Message-ID: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
Subject: Re: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38677-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:ludovic.desroches@microchip.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:antonio.borneo@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,microchip.com,bootlin.com,tuxon.dev,foss.st.com,gmail.com,csie.org,sholland.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.linux.dev,seu.edu.cn];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,seu.edu.cn:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 831006A0699

Hi Runyu,

thanks for your analysis!

On Thu, Jun 18, 2026 at 7:42=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:

> The path we are concerned about is:
>
>   gpiod_set_config()
>     -> gpio_do_set_config()
>        -> gpiochip_generic_config()
>        -> pinctrl_gpio_set_config()
>        -> pinctrl_get_device_gpio_range()
>        -> mutex_lock(&pctldev->mutex)

That would be mutex_lock(&pinctrldev_list_mutex); would it not?

> If gpiod_cansleep() returns false, a GPIO forwarder or another consumer
> can choose an atomic carrier and call gpiod_set_config() while holding a
> spinlock.

I see the problem.

> The local draft I am considering marks only these controllers as
> sleeping:
>
>   pinctrl: at91-pio4: mark the GPIO controller as sleeping
>   pinctrl: stm32: mark the GPIO controller as sleeping
>   pinctrl: sunxi: mark the GPIO controller as sleeping
>
> The reason is that all three expose gpiochip_generic_config() and can
> therefore reach the pinctrl mutex from the GPIO set_config path, while
> their current gpio_chip registration does not set can_sleep.

But that's not the right solution is it? These controllers can probably
just write a register and be done with it, they all look like they are
memory-mapped? That means we introduce sleep where not needed.

Can we simply replace pinctrldev_list_mutex with a spinlock?
The list isn't gonna be huge and all in-memory anyway.
If it takes too much time we need to think about putting the
ranges in a better data structure such as the maple tree.

mutex_lock(&pinctrldev_list_mutex); could then be turned
into spinlock_irqsave() or even better
guard(spinlock_irqsave)(&pinctrldev_list_lock) in
pinctrl_get_device_gpio_range().

This would mean we just take two different spinlocks in seqence
and save state in each so it should work just fine.

Yours,
Linus Walleij

