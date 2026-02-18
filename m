Return-Path: <linux-gpio+bounces-31814-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ML7I+wflmmZagIAu9opvQ
	(envelope-from <linux-gpio+bounces-31814-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:24:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E72A9159695
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 21:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 315ED302591B
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18C9316193;
	Wed, 18 Feb 2026 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="po6DRJzz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75293283FF9
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446234; cv=none; b=ZsyxO1kZPP1NMBTbGTcRJYQHS5Hsx8gTOMfljV9Kg6bIW2014+r5475I8WHuun5xopmWYtu4nmrSIBR/adDMa9KJ2pumlyyZ+0UllC4e6GGjp4/OdVqPBZe9nTc6YYgxjucd9fR4KQo7QZyDB0AzGkI7PtsNwE4g4iDua1OxCNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446234; c=relaxed/simple;
	bh=6DOqMKATFBcgIPhFXm5K93BluiRuATeQlojb9l+Hi5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXbV/3tLYVSSwpDE/p+X9U0LIQF93bLqQ9tq4DZEHkcks2ATc2gxfNTn/mV5ch+DsERhgu9TsjdBtPRPUo9OYPq/pe9iR6baLT/RsWy7St5jbXUPM3k7SjE6FnhscKUUyHHG78uyqGQSKWrdqFv3bU08ARUbFx1YsDSZEaHcPVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=po6DRJzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31045C4AF09
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771446234;
	bh=6DOqMKATFBcgIPhFXm5K93BluiRuATeQlojb9l+Hi5M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=po6DRJzzAfKo1ylsKpGD/BSbxMopgS8TYGOAIzwFWajOmHzx3zvqRr+XoFS3XJBQS
	 Gq+6Av6NbKJpA1Fgrn2Ox1hkExJHmIXFNy/gK5y8oEBaPxo9d8UkSWkuCKxyrTyCAg
	 bHw2+oGcIWSr+m99n6BBVbzuDnvqgIzydjjh7FaYQw99AF0kcDiceHP9mhY6Djlvm6
	 neNWF58NhtAha4WCO+UOLLQpUjHR34XLR5lWJq6bkKcY8FdrTcPWKkDDhhHrKi82qM
	 MqyQNgdzDNl3qI/bhiwaDl4In0fxZfVTdzm7kxhq31Dk3uDYPFHnw9UMB8EMsJdTiX
	 yoPCWvbMfpHrw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e5f52b13eso300169e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 12:23:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQk8zcGpvVvAE6Buq8ormUdUaKhEk75Lla5EJ77tDbfdPgYNrDcc7naGYMUCYyzq2/7am3trXkxlQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8ALveg6t8by35fRDpzQrANtreEgKal1U1yOC4XA3fGqUNWDB
	0YMOXHkG4N8Yen2unbRpeVqxiK1DXOSL/RKlbB5mUkrwCXitEm34bnaiXqwy0tFWjEiOVpYzWwO
	EpN1+j3XTKxQh0mPkw0Le1L4mxKnLRjls6H1fB4/ixw==
X-Received: by 2002:a05:6512:2514:b0:59f:791a:e7e3 with SMTP id
 2adb3069b0e04-59f791ae9f6mr3364758e87.5.1771446232858; Wed, 18 Feb 2026
 12:23:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 21:23:38 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeZ9AmM4uMdFf=xkq+XuHxi7ObkZonihZmHnv3w3SdsFA@mail.gmail.com>
X-Gm-Features: AaiRm51IfTQj0crOIUFIDiaD_56L4kAwAF0q9LA_NznLYvh7TP58M7sejx8UinI
Message-ID: <CAMRc=MeZ9AmM4uMdFf=xkq+XuHxi7ObkZonihZmHnv3w3SdsFA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31814-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E72A9159695
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 8:07=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by bd9571mwv_gpio_get() is
> normalized to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpio-bd9571mwv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.=
c
> index 7c95bb36511e..cc5b1746f2fe 100644
> --- a/drivers/gpio/gpio-bd9571mwv.c
> +++ b/drivers/gpio/gpio-bd9571mwv.c
> @@ -69,7 +69,7 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chip, u=
nsigned int offset)
>         if (ret < 0)
>                 return ret;
>
> -       return val & BIT(offset);
> +       return !!(val & BIT(offset));
>  }
>
>  static int bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offse=
t,
> --
> 2.53.0.335.g19a08e0c02-goog
>

Thanks for doing this. I think it would make sense to backport them
all the way to commit 86ef402d805d ("gpiolib: sanitize the return
value of gpio_chip::get()")?

Bartosz

