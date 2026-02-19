Return-Path: <linux-gpio+bounces-31847-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMr2AnPQlmkZoQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31847-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:57:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D7015D25C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 727B83027341
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 08:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E304338936;
	Thu, 19 Feb 2026 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwBfMPuF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F41822759C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771491436; cv=none; b=itSYu7Ati2rR4sFqygKZCQS3uS0fGJafz+pJGu9CO4qjpLpWRztIKxlFdiljl7oBjTF3KHjOL2Nejq2tveeYGKn4f23Y1PfGePJjQ28euBCjvoz4U4yWUKbxPdd7P8Ht/K6BVMypTUXLEQdBnwxJmYd7J97TtzmmysTNNmKkUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771491436; c=relaxed/simple;
	bh=SwQckqwfxcH9zpWYprGb4CWeIhjFjH6q2nGwj1Xt6KQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTTQ9srx0BpoKWpHIat/RfZ1usnVFl00kwJZYq6FsC8Nf/YnDbI9nIz6fn529LxhU5KixpB49lHr/nzogOJucBS62mWKai6ipriQ8wLkEa0JC/3AkJgI+my5IxYk7TgR4Mk07gLKPKm5f9C9nECs9vclnkDSIoKwtfq03aGRcds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwBfMPuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCD0C19421
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771491436;
	bh=SwQckqwfxcH9zpWYprGb4CWeIhjFjH6q2nGwj1Xt6KQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BwBfMPuF33elijsI7QwIfRi5x4/oVhCSra99Cya+BpBWoIRwFJ8/ahZM2ST1HiCh+
	 buZhrgUliMvYbaYKc1yD6SKZTTPi3i2Lqke8+4kkG11tpIvKLQZpLc9fwDDJpMYkvW
	 ZM0wYDK3NrZ9G73NXy+Zx2P9PpRQdwEl+5KEuRdPNuolTWK2YdB8tM4BDFqwv4QX25
	 ZIKUR6DORFqMiYB4fsJ9vebrI0hZ9k7Pl0n2STN+VDpuasxVtGYEKM2LCMT9BdjMAa
	 N3BRXA8B0E2Q9REJtZCbuRY7I569T7HGBBL09Aw0Le8aJBZ3I6+pagQBLuljzGXpFb
	 ygfdCs8kA273A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-388126f79bcso6207491fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 00:57:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnldKP2qb/3z5Tws3Xi6kj9TY/ucZwNmQMym96qWNX7v4ijrJwLVDpHO99WMBACtUu9GrM6bPQUWDB@vger.kernel.org
X-Gm-Message-State: AOJu0YyY3L4dB/PQVeqwUaN4fvzmfjeUAWPKX1v8x7r1aeSAXIzmUZ7I
	I2rN96PQTmOFPHyFt4iD5ujIJa1WJvE2IM4Ppi9SHZBEFeUXgBMBoJmOoPoBXtS3ghxn3OTjnQh
	UZQU/syuIKYFiY/Rj1AfVY76GsJNPMeBthbWw2e6uUw==
X-Received: by 2002:a05:651c:515:b0:387:bf2:da7 with SMTP id
 38308e7fff4ca-38846e4b4a7mr15389021fa.44.1771491434608; Thu, 19 Feb 2026
 00:57:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
 <CAMRc=MeZ9AmM4uMdFf=xkq+XuHxi7ObkZonihZmHnv3w3SdsFA@mail.gmail.com> <aZYoZU0-Ttz8b1s4@google.com>
In-Reply-To: <aZYoZU0-Ttz8b1s4@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 19 Feb 2026 09:57:02 +0100
X-Gmail-Original-Message-ID: <CAMRc=McVwqvmCfLp6SasOzKyZ4+iCnBdbjJm2ECjHk7s0kw+0g@mail.gmail.com>
X-Gm-Features: AaiRm50eROg3lOdc7aqjg2HWw5KLIXVnrH6cGhCclcI0ZCFIp2dA0QxTe59jW-w
Message-ID: <CAMRc=McVwqvmCfLp6SasOzKyZ4+iCnBdbjJm2ECjHk7s0kw+0g@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: bd9571mwv: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Thomas Richard <thomas.richard@bootlin.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31847-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bootlin.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75D7015D25C
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 10:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Feb 18, 2026 at 09:23:38PM +0100, Bartosz Golaszewski wrote:
> > On Wed, Feb 18, 2026 at 8:07=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > The GPIO get callback is expected to return 0 or 1 (or a negative err=
or
> > > code). Ensure that the value returned by bd9571mwv_gpio_get() is
> > > normalized to the [0, 1] range.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/gpio/gpio-bd9571mwv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571=
mwv.c
> > > index 7c95bb36511e..cc5b1746f2fe 100644
> > > --- a/drivers/gpio/gpio-bd9571mwv.c
> > > +++ b/drivers/gpio/gpio-bd9571mwv.c
> > > @@ -69,7 +69,7 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chi=
p, unsigned int offset)
> > >         if (ret < 0)
> > >                 return ret;
> > >
> > > -       return val & BIT(offset);
> > > +       return !!(val & BIT(offset));
> > >  }
> > >
> > >  static int bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int o=
ffset,
> > > --
> > > 2.53.0.335.g19a08e0c02-goog
> > >
> >
> > Thanks for doing this. I think it would make sense to backport them
> > all the way to commit 86ef402d805d ("gpiolib: sanitize the return
> > value of gpio_chip::get()")?
>
> I do not think this is workable since the breakages are not limited to
> dtivers/gpio/.
>
> I would recommend reverting the patch for stable, but keeping it for 7.0
> and working with maintainers outside of drivers/gpio to make sure the
> fixes land in this release cycle.
>
> This way you will ensure that new drivers are not adding tech debt while
> not punishing existing users who might not be running latest and
> greatest kernel.
>

Sigh... I sent a patch[1]. Let's get it upstream and not diverge
between mainline and stable.

Thanks for the slew of fixes.

Bartosz

[1] https://lore.kernel.org/all/20260219-gpiolib-set-normalize-v1-1-f0d53a0=
09db4@oss.qualcomm.com/

