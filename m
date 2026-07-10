Return-Path: <linux-gpio+bounces-39856-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 39HmA9ZQUWoMCQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39856-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 22:06:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0924473E00A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 22:06:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WD0uMvEp;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39856-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39856-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5BEB3008443
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0ED13921E4;
	Fri, 10 Jul 2026 20:06:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A472392831
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 20:06:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714000; cv=none; b=s4VlWmXm+gYGC9czuTvtmnjGs6aMWboz7+ggrLHxRCa/x4Hc22baYaqq+rL0wWwzg6z5iP12uLXaqCnhx2F8/8VSbVzIUAaQ1QkOFGE+sunui8j2zhxl+/0LSCpXe1WYwQYk+ZnJbbsrOtwJyjSBZYVAfO16tMlyaOR7QkdEooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714000; c=relaxed/simple;
	bh=VTtJMkoIE7aY9ADQYgKgI9tia/pJhvsGnk0AWgm65VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUSOR6iEPamyOy9XkCPH2pk9LDmPz+wSdUGwxcwJyhkkxHO4YAM2uFMcH00YgoSbPotWoE5OhR/i53uF/YbHbwZzpub1RyoB5jVbj1oTs/92/qBjHFJNHHLU71vGgMFRqohuOepC7mv+TOPBe9K6oiZj25FnKTqZgavXyVDRcK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WD0uMvEp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E2F1F0155D
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 20:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783713998;
	bh=B9Kk8b2yeKJda2bcD7uscL9OAXJzdAoXShPD9wofJ1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WD0uMvEpmZ4hjD/0FYhelcJkG2V8mh5HWOkjkEDVb+ET9E29v/9HpaUWFL0KG8S1c
	 tWXnEMY+7mgl00OYFq4k+2h1AdtW0B6YwVQCN9m0kaupFYZbmSrKfdSR4HESs9vtJS
	 IH7B6PdHTJxE3PB5WY2YBFyoLvJu1AeOomuPwEQjCHP7UzLiezOyi66t3HYde6crCJ
	 XjWxgov+Ts4Ut1zJ/WpJJlRPASZGEDilLzeLl9Fcz/wROM5nagZves8f0FdBjBFhUF
	 lsUb5iPHK9+u2ZPCmxxX71TYTz6Y72MzwuaGciu7sIYOLVtLJzTYbKj7eHojZHoh/x
	 ndvoTXlgEuJ6w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so200275e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:06:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpakINxcrsjNbdsGXEppE7jpbAoApy3AkjYHF6S/e0lDpfF4/WfbZZplwkVDaNO0b+JRjZ5LGhSOXJM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5wmhP4sdYummPkkgHqXDE3RScZ64LX65wqgsXZ2qce5FiXPH
	INRIHRAcEqQlXGe3tEX2wpMwa6LTEUY7YNFUNP1rJnq9OFjSWAZPjHDlSIA+eNtrw3Y6Qxe1tOP
	U94rxkgOiJRaaEM7bKVLOAOafNj0oRp0=
X-Received: by 2002:ac2:5547:0:b0:5b0:f9d:f7b9 with SMTP id
 2adb3069b0e04-5b023564b81mr79634e87.2.1783713997465; Fri, 10 Jul 2026
 13:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com> <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
In-Reply-To: <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 22:06:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=iqrJV=Qbe=O8iycMZZVmVbjzPG47Bf_SUVjUb+4AcxA@mail.gmail.com>
X-Gm-Features: AUfX_myotWGi2qG-MCbfVtZjA7xuips9ZVSbzGCI_OB1AcLKfs_3jsKmDONnS60
Message-ID: <CAD++jL=iqrJV=Qbe=O8iycMZZVmVbjzPG47Bf_SUVjUb+4AcxA@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver
To: Janani Sunil <janani.sunil@analog.com>, Michael Walle <mwalle@kernel.org>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39856-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:mwalle@kernel.org,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,kernel.org,baylibre.com,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,analog.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0924473E00A

Hi Janani,

thanks for your patch!

On Thu, Jul 9, 2026 at 10:51=E2=80=AFAM Janani Sunil <janani.sunil@analog.c=
om> wrote:

> The AD7768/AD7768-4 ADC exposes 5 general-purpose I/O pins that can be
> independently configured as inputs or outputs. Add an auxiliary bus drive=
r
> to expose these pins as a GPIO chip, registered by the parent IIO driver.
>
> The driver uses the parent's regmap for register access and delegates
> runtime power management to the parent device.
>
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

(...)

When I look at these functions I see they are very close to something
the GPIO_REGMAP helpers should be able to do.

Bascically all that stops you from doing this is:

> +static int ad7768_gpio_direction_input(struct gpio_chip *chip,
> +                                      unsigned int offset)
> +{
> +       struct ad7768_gpio_state *st =3D gpiochip_get_data(chip);
> +
> +       PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);
> +       int ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);

These two things.

> +static int ad7768_gpio_get_direction(struct gpio_chip *chip,
> +                                    unsigned int offset)
> +{
> +       struct ad7768_gpio_state *st =3D gpiochip_get_data(chip);
> +       unsigned int val;
> +       int ret;
> +
> +       PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);
> +       ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +       if (ret)
> +               return ret;

Here again, etc.

Can't we just add a

struct device *pm_dev; to struct gpio_regmap_config, pass
st->parent there at init, modify drivers/gpio/gpio-regmap.c adding:

static int gpio_regmap_pm(struct gpio_regmap *gpio)
{
    PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(gpio->pm_device, pm);
    ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
    if (ret)
        return ret;
    return 0;
}

And call this in each of the standard callbacks so gpio-regmap.c
can handle PM as well for free? The above can be an ifdef stub if
runtime PM is not enabled.

Yours,
Linus Walleij

