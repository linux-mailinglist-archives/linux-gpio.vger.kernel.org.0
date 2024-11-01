Return-Path: <linux-gpio+bounces-12468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E19B94B2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 16:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8EE328211A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 15:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E941C82F0;
	Fri,  1 Nov 2024 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Jj7AcoFU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B8F15B0E2;
	Fri,  1 Nov 2024 15:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730475979; cv=none; b=us+fQbxXTO9+OluWHUgacUg8G9I67tRsPv3aA4IDfgv7t3blsa7HTUwoOGqcurPJdNzN1C7gIwQNgB8SOfzgs1qAqaTO4E42uU6Xx0S0q8nDf3ckQhlgxcrwzE2CsVwq/3iixu89GpP1McEwxRh4e8/nO0qYQn+QCjMLrypEyac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730475979; c=relaxed/simple;
	bh=OpvRx1WWE+WS+DgWenvK+IRNQ2xdgICCz6OcvfsAeVw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=capuxWShof+vRqe9fGLvTnOP2EbgPNimUmvYt93bblFMYeTxy2sXt9b/OiFesVPCXjSzA9FkA1DVqwthBX9rnw+Ov63GxVcT3VNj6KVc3o6J7fYO0eLUI+lOv3OotCY3mVs/pHkxCa+5y0JNh8ua8rqQDg9B6lDRfBWQoqIjUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Jj7AcoFU; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1730475951; x=1731080751; i=markus.elfring@web.de;
	bh=7UB3ac7LBmeqyiSNaZiojKaC72aMNlvAd36yyxNrsRA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Jj7AcoFUcvb5OAlwS4Q6kVYWcKmEuY8+5zpeJ5WTD0pcI7n7grUNKyWlocW9GQra
	 dDwRH3FUXlYsG5Uj85tI3OfDYJZclmbk6kdetDpayUb25hwaXFWbJp5Cqccls30yq
	 4Bow5fsTgQGxApmTaWuC3/FFN8SF+LlPt/kTwzR2tgGWorSev9MEPyRQwVWETEH3/
	 GtpoZuEbKYY6InQcl1dUIGM2lruXn43IX+I0PZJiWlY2Ad18OZQqEAUvwMH3+XdE1
	 x40pyyr5brAHCXQGc9wBmsDNpAetIDAek2pYN9VycXLswWY0AUtMaqBvkbKWMKoEJ
	 2z8PuOlENTEo1CMU0Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6pUK-1tCvzN1kh4-00BxAE; Fri, 01
 Nov 2024 16:45:51 +0100
Message-ID: <fdf5702a-b739-4643-8288-86e6cfb8403d@web.de>
Date: Fri, 1 Nov 2024 16:45:47 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, s32@nxp.com,
 Bartosz Golaszewski <brgl@bgdev.pl>, Chester Lin <chester62515@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacky Bai
 <ping.bai@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20241101080614.1070819-7-andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v5 6/7] pinctrl: s32cc: add driver for GPIO functionality
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241101080614.1070819-7-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jj8tV1/5lvgDluPBwBwySefJgimRcKB6UJMv3JG+Rfhob34M4SF
 zpfZMhDKktYmP84RHCvTGMRiSo8eD0NXIcKYi0iJuMLPMKMkNEDgbDQ00Tu3zLt3yIR5swC
 e48XqFieUY4xPJkF6ksXNHRlO8FG5Rj1fT66cz39pU/OTQDchlM7fOVh76RvLj2jwuEjjfl
 jRgl7k75s3JcQFOrs36LA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7o16wLigwNM=;QX09HEZ8+jEi7umwCR8bn+fcqGK
 iwIJYJcfDDaFsY8IuY+91YTn1TGo54jj9+n48mICBQcofmxdKYke0JIQqJZ5RTaT0m1TOIYVs
 0WYcQY13IvGmPayFCgdk9f98I4hbgbbzdVm60fmcjajvWqCELsqFzIisOKey4dj5AInvLdnPm
 JPnk0whD1ihkVamcU8WuO7BleTB1K2bLnpOJX+rhxeSCy0/hxb0lpZRF0S1DENcbi2czN+vgf
 kMYO0d1heXCAZDam18SRyaGX8UN5b1vxAxvdBZEXRl4IafyjddgXOWU6NSRvarmQul/bmK2E0
 pjv+09sdadnPZSU1M7MxBKDdgxmj0hWRzbSuRsPvY/e4RO8RrvrfEZAyM1DM9/qsuMc6uBl9a
 t9yWvQyXO7qrXhlZSDJ4a6VE8NzakgBTN0Wk2Ob3kKo2DbfvbssS9NaJKjFgNzNkF/u7EiiYt
 VCvtOzcxM0bIERiOFQdAlJESvtnyzqM4fxSq5dFgFrwqPDrmWB3C6z06xziKlr/grIk5r1Jvq
 +3IUGIqsr/+rU04AkX/bBebF/prO1QCGUBZWcBFVMTguLeqRTsBfBvrEAoXBXMByRysar3VxC
 H34HcNDvP0KJ4/AL3Honk9AjXEvhd3wCjnMmY6uc3ExX1zIhmd6WMKX1iy9bNRgBf6khllb/h
 ozXTFFObKmhIzHTnZbMOcqCOjxYGUkOhIZy0hdbhdcD85kEj+KfgoZRcNNDl/uvUf7Kl6zdu/
 BD1t2+GFK9EYQH1oIoBlBxahx2DbN5Rf+K4777Aceclv50hSGqbYrTyBV0TkB4xg57/HQ0QMz
 Ig2svqAtWJFQZJUAp40Pab1A==

> Add basic GPIO functionality (request, free, get, set) for the existing
> pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
> coupled.
=E2=80=A6
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
=E2=80=A6
> +static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> +	list_add(&gpio_pin->list, &ipctl->gpio_configs);
> +	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&ipctl->gpio_configs_lock);=E2=80=9D=
?
https://elixir.bootlin.com/linux/v6.12-rc5/source/include/linux/spinlock.h=
#L551

Regards,
Markus

