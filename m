Return-Path: <linux-gpio+bounces-33090-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A66HtY7sWkLswIAu9opvQ
	(envelope-from <linux-gpio+bounces-33090-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:54:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA72615D6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9533239715
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 09:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858A83C13F9;
	Wed, 11 Mar 2026 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2cEFI/c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46FE3BF669
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220688; cv=none; b=AUMy7M/oKyJnV3hNdyHslZKOthSHDn+ps/uPySWVFRO0p2lLYlZ0WsjmUMFk5ko2bhc1ljm2q4Wzm/Oh2jwMXZVUOepPPfyRyTVXBIWXu9cX77q7n9StXSmBhdE+MudZvyrRDo40nhA5G6ohQqtK9z2SusohXaLvT2gT+GvtPEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220688; c=relaxed/simple;
	bh=G/0Dlt/xYWU8Y0//hA5yl6tN9D1kjT3kvYNnEHcXos8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJ+t6fO4iZdnzeFbI+waY98c8BEXld++S8ghq+jt+XzV4ZlmoWV7CYVxhT26y7yfIN5vmH7W0FNJgfXNG2IepcwNbkvzFe3QvH12UpifF2xl/ZErZYq4tmmg1P8ti94h3j4Yqr8tdQ5RZa83LLiNEOsIedoUdTt23eV6Pr8CLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2cEFI/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD69C4AF09
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773220688;
	bh=G/0Dlt/xYWU8Y0//hA5yl6tN9D1kjT3kvYNnEHcXos8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=I2cEFI/cBZnHzlinISo0sPUXIKgO/4an6nuLPEzGOQlsPAJVLzm3nIV+aHK403VoY
	 GFs3pA2rsthB5kKjaR4nSg5sCMhd9QLCQ0J0jeqf5bqZ1ClHtC/uwYxGgsfMsStXQx
	 iB4kX1lr1vlJ7X09PiqrlkoL1L5XwBIRZSY2J+kztRjP9k4pNfBBCbTb+gUosqCifC
	 kxuT9zjwSNQ+/Sc0FbY5nKFY29+0QCU5aZ3xVKfxVMci3Sx1ahKsVdUTSPLdWKxmuV
	 X4WXZKw7njGIHzwUjCTE/bTxSNKUJwjl9ZdC699zshAhfCGXqFn2+YjHH30ShyK14G
	 I5pKyiPHR7bWA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a46657a9fso39551891fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:18:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFQyT1ZEnpYq/mBL7rFJRSgz/cJ5DOrunC9pROHc2cb/v4NVl2EZOGbMQsABbU3nIk1YqL/HZWRcYA@vger.kernel.org
X-Gm-Message-State: AOJu0YwRBSbmSSb3P9imfUNbl72eVIJI1r5c8Y7x/aYXUgwNl+f7nN+n
	38tmF+dipc3PmIAXHbc9U53hTsWBwWwTTrCf5b/6YKuUXX1K0NlELA4yLJOm7trabC9EaJeQVxY
	0I8yHTxHUptDS2GiC80XS2Nse2VvM3QyzRE4Vmw42cA==
X-Received: by 2002:a05:651c:50c:b0:38a:51c9:cc61 with SMTP id
 38308e7fff4ca-38a67dae2b6mr8124461fa.2.1773220686751; Wed, 11 Mar 2026
 02:18:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 02:18:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 02:18:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=Mdutv6TyU5SG2uzCgRuvYVmfFB0kwXgj45Qajet+TdBhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de> <CAD++jL=3GeHNirtN9diGc8R2rxczo4UUL9_ON28jOj_DPP2Sjg@mail.gmail.com>
 <CAMRc=Mdutv6TyU5SG2uzCgRuvYVmfFB0kwXgj45Qajet+TdBhw@mail.gmail.com>
Date: Wed, 11 Mar 2026 02:18:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me5Yb_H3oQ7XtWVs+KViL6pkr0b1Qyb7WW1wtxyGkGhAg@mail.gmail.com>
X-Gm-Features: AaiRm52uyXq0J8mbMMIR1bmOYOnyHsKW57kaTw--ELJ_lpg7IYl05ysHO3CsbvI
Message-ID: <CAMRc=Me5Yb_H3oQ7XtWVs+KViL6pkr0b1Qyb7WW1wtxyGkGhAg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 20FA72615D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33090-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,pengutronix.de:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 10:14:59 +0100, Bartosz Golaszewski <brgl@kernel.org> s=
aid:
> On Tue, Mar 10, 2026 at 10:05=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:
>>
>> On Mon, Mar 9, 2026 at 2:49=E2=80=AFPM Oleksij Rempel <o.rempel@pengutro=
nix.de> wrote:
>>
>> > In gpiochip_hierarchy_irq_domain_alloc(), calling irq_domain_set_info(=
)
>> > before irq_domain_alloc_irqs_parent() causes a NULL pointer dereferenc=
e
>> > for slow-bus (SPI/I2C) IRQ chips.
>> >
>> > irq_domain_set_info() locks the child descriptor, triggering .irq_bus_=
lock.
>> > If the child proxies this lock to the parent, it crashes because
>> > parent->chip is not yet allocated.
>> >
>> > Fix this by allocating the parent IRQs first, ensuring parent->chip is
>> > populated before the child's .irq_bus_lock is invoked.
>> >
>> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> > ---
>> > changes v3
>> > - new patch
>>
>> Bartosz, tglx: is this something we should apply for fixes?
>>
>> I think it needs to go into gpiolib for next at minimum, unless
>> there is some semantic problem with the patch.
>>
>
> Looks good to me. I can take it into v7.0-rc4 via the GPIO tree and
> tglx can pull the tag once it's out as a base for the rest of the
> series?
>
> Bart
>

Oleksij: it doesn't look like there are any dependencies for this patch, is
it ok if I queue it for the next RC?

Could you add the Fixes tag as well?

Bart

