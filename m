Return-Path: <linux-gpio+bounces-13775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121D9ED333
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 18:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8D52188B2AE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 17:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BB31DE4FC;
	Wed, 11 Dec 2024 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="v6qnJvjp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F211B6CE5;
	Wed, 11 Dec 2024 17:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733937430; cv=none; b=ddLVvMZ4EUiSB4JaZrKibbkVnX8VE9wIDTI8XN3DXuG5BRHoruuPdokWfS6v1lg8ghq59gL0YeaOk0GeOXJ+48e6zau/XVzf+mwKSo13C7zDoKb6sfYqzyaMSpy2aiCeyox+b7UAnp1v62VbcloLt9BiBzb3g5mMbmrm0D7ZRCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733937430; c=relaxed/simple;
	bh=4SIngLCG3yDTZDjdiqP/MeS4m5QT1yFJ7WboilOjKAg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Ub+J0l2Fz6RwPUFp4ipCcBYWyJWEowg5TIlwJP4xAWjZ0FDxsPaujDzqWxAf7odfPQEYt2BlHtky007mHpj6idPoQFK9b4r33B9NAaaIa+pheuZGwZT4c2hJYHuIPkrMp2Hd/EYJNcte1vfr20w5T6cCIhBmg2M9Pl9jD5RmTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=v6qnJvjp; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1733937426; x=1734542226; i=markus.elfring@web.de;
	bh=Zimhx757dBpdou4rx5e/nznxFtFPCTlQ5e0cfAPltok=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=v6qnJvjpkgpHTv6HYjXsd6z6cx6k0ry9OmGjycMhonDtA3LIpWMlrKeX0TJJrWc9
	 b5RnQVvzOnI0zMn34rsQbWdfywsTE1cgbc2aJrlTP7CPXLRDySltMDJUdQ83p5h1G
	 A2l+/8F2JZdZqdnSO1bVOY6+2Z2n4K7xlkpbQY1GlBiGSjbFQA/BNcvliixvA0svO
	 mR5BqasEQQxvwy11fCAMVbRedYR+gYD/pHfqzvvYtCc6Jq+K3cI5vmBogitPb7k9g
	 /jv9oqmDM09bQRP+CGHCa6l8ncKxPlRy1A6the/2NHxNySMX/zSH4clpSXJ46E/Ja
	 XdSFh5dAmFfGA+WDWg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.70.80]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0LJ-1tSske3A8j-00DtHC; Wed, 11
 Dec 2024 18:02:49 +0100
Message-ID: <384bdbaf-15f1-4cad-8f77-371ccb67d952@web.de>
Date: Wed, 11 Dec 2024 18:02:46 +0100
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
References: <20241113101124.1279648-7-andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v6 6/7] pinctrl: s32cc: implement GPIO functionality
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241113101124.1279648-7-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sYQziQhyPbFUeFB9qpQjC6BoEwbQQIqiifnylPG79vzwLT8YREC
 A5NTtxja5YTyknXGZ2YbsK1H/54rERWQj4ZjfGj8XSAYu5Fb9eyv67oSNno6v9VPWpl3wGH
 TC9pQEdGJcQDSsYFNXJm8ngnb8oVIdklg9juHxF+KmtYp7UF2qombbq7aViWfgL9Ji4JojI
 EOMaWZM3Ldv4Ni/sqgIIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dPdIMoIfvhE=;NSNfNEnZExuiF2FdcTNoV1kkvk3
 WFn8x9RNaJ0eX7pkmhHcXRqbJtQKwLpy2rDW0BQDNwHjqAhnC+0s3xinL8mFXutTF/ziip2wW
 gInALZvO53Hj3QoOdyHJxcVpP4hgERpulptvxAwt3Si2POjyT/zpQYC3iI5GX0kv9c6pPOho2
 lS7vq1qJDM7mCleD0Q5s3FFqEXYjrm/4vgy/z/xyX2/RXZa6fK7Dpb+8VX+OWR4JTsT6z8jDy
 cRA9gavnDwh+uR21C5aE09P/y780O7rwomNLmlgWDqaDvsAg6t972guVoxDmT95PSPmEBAtJR
 2axAexMy22hlgTHhYbbU1Gg4f4Z6Pg1XAbdajOx6gr2XNI5mrSPBCMJkZCktIICAFRvtHbZ+f
 TRjIdF9chwd6OtVltoPBKEuzGjN7y2aIUmL1GSDb8l9mOW3iY1FVU68CtFonJaiVMz+pvzmoS
 wEB2lt0HuyWm4jlxaekyz+fSe/bUz2WGsxgDq4xuH4B1+eC8Ajrqs34J+/5FRlZtmh8dkVJd0
 ySYs2mMORwfcRXe7OZux2rKXsZxyKkHZzPNqvk3NogeK/Q8birOZMv5wB+AVk6XXDhFwHQtE4
 +HEJkHIv02uM8/xsOJ2Xz/jdAAbEnB75pHpV7DBUyaZVzv/mluvWX2UxBSxGfG4hIJyZvk0zB
 TcUtu2SdZ/3GSyqpZ7pU20LY8cA0k7vIIgB2BoPX6KgkfqzDpxpNuM/eeaF6kt1wSqvZPbeXw
 w9VUY58aHeJcNx+ldLuXhXB1DbM3pj2uEBap/6G8h+LXONvdCQJrfr3FzSg4qX6NBsfklVArv
 TLMqvcc0579n0cn90M/p7n6Ho5rj+lsz1uSCcX75w0/EZIrTPL9l00nO6k4fi+mSQLUk7DPeP
 eDomF5OMVllIMTmOINKcsTDd3fFlq6KuKNtNTgcX9gCxHzkVcfoNtY1tarEhNyMS/ZP1VGJtr
 uGJjuH0/2Ax732mGIwJ+vrFpF4zCmO5cM95osLqlG3SXvRtp+qZf/gn8CD+yWIy0nhbyEefYW
 xWgWbvKTrhyTVobhQ0pWImf1uDNaXT0y0EhYDlwgoP1WRXBXy364fLVcqBDULr5ogzGX9gNz9
 k4pSxbCcI=

=E2=80=A6
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
=E2=80=A6
> +static void s32_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> +
> +	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
=E2=80=A6
> +	}
> +
> +unlock:
> +	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
> +}

How do you think about to apply another call =E2=80=9Cscoped_guard(spinloc=
k_irqsave, &ipctl->gpio_configs_lock)=E2=80=9D here?

Regards,
Markus

