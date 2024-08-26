Return-Path: <linux-gpio+bounces-9170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B0995EF2E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 12:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22F6D1C22607
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4C8152166;
	Mon, 26 Aug 2024 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="E7SKQR8g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857614D44D;
	Mon, 26 Aug 2024 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724669815; cv=none; b=RCBjIHjIxDtSWFwoR2svAaxW6h7Jhr7pz8TB3gEj8d5gfR5UGyvHcniFNHjYYso//AUVwbj0e4J8DBmXXsieVojGp1YW22QjZssyn1JioQxNSCf/FAEvedp9O7A2J8XEdDGY5uJKn5hG4IdHntzgOP2JJUglC9sMmxHW5Ih+ZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724669815; c=relaxed/simple;
	bh=qjyKQSfQEdoYMAV1Jmg14iq7QdxPPpOQnSFwYqH16dA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MTC3LFdFoZBxVCnUCILDKTGa9a8aqSvHBc9YfrgzQXEsIW4/Opu8cgH2lA3wAS+AX0pkNJLmRwv0YOBRbXSFmgCYAKbz+Kmg0H5Qk1XoJjsRCUU1EJq6Woo3eB/ScPtMfjX/xU6Bvt7/MuuxTCQRKAg7NubbsHRfDwVNK2GJuAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=E7SKQR8g; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724669787; x=1725274587; i=markus.elfring@web.de;
	bh=xil6lnVYUEIqTfiiA5wBkozdOtnz6IoK/KV8LMP4ZFY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=E7SKQR8gKRp4YBuftuZ7Bb2f7QC7dRuD3r5WmXYmOiff/iy64ZmA8yI47SBTErzP
	 vhKSuJh8IsOHW95QtOsJ38w31sh/5sfygJwLP+eksHTL7wXP8/+wFnaUWh7OQqgA0
	 sjUuBLG0Zadso/uFL0hPNURyh3qL9KXyxkQw9nraepxnMwdxDGx74kx33mL8325Ly
	 zb0F7guw7ASV9X3oYtfWEte3CIndrnhShnzvjsIvR0Zwu+9e0lPzFsmYvinLFsyIb
	 Ojn8pfPCURoYhdxIoWGNAl5K+bgHYYXDjU+z0A1XjSOC0u5TBN5ompmMe+9NK6X4s
	 GEsv8SotILEh2GjOpw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTfkf-1sWfHq1zMj-00UODV; Mon, 26
 Aug 2024 12:56:27 +0200
Message-ID: <42c569f4-9171-46e0-9df3-72c583106cc4@web.de>
Date: Mon, 26 Aug 2024 12:56:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Billy Tsai <billy_tsai@aspeedtech.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 2/2] gpio: Add G7 Aspeed gpio controller driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2ek2bR01HsFIz987VGqUZM83F9xykdulPeTU9R4bJ/Qcy8kSImn
 37EMNlb8QmaQC+P0zBrv8F0DISDkjFyCP/upaMf+zUj09yHC/ZG6pVzen3Tz6B6oFLsn1xn
 MYslybCraX1+4TIqfuU7UWVTh8gAZDiwrKXDwu9WaihYUdTcEi5v8nPIxbT+M8lXXqmf6G8
 1eL1qWm/M6m13Wdfx1s2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/TnAcufCLFA=;FtV6qGLBY4dbFNQUvEEmmtQ7PVR
 UdKX4alIo55qxkmBSMGIbvU8RS1IFZaHFUs73flvzs8iT8POaeriM70t7WDbuLESmIwIn7zQn
 BBe9dZZD87lK1dW7jTp6D6Fargu/ekjVx0nf8eHPMGTNgIMstG4iIB7FVDfI4JrhajRD3AQ/0
 e8AjqTuZkC5IxDCXWnz1Cag8eQWdmtv2STrUrzlTOAIymnvRKxwYqTf3JOtFVpcQEy+Lx1sm/
 wilQifu0Cb1NJmR8JbIEf+BpcyMw8/Q2IziGHSXonMB2dw99ftLZuJji2HmcQz18lUuF5i3HX
 26EBPw06s1L8hO3H/5e2rkCFa5OfZ1Oy6+rW/N8KJg6gSfI4BxPmjMd5jUdNyrvDFxuF0dh6v
 0oPxVk0glFmIoVlRF0DY175BF9JF9sEJ8RIqFwAEepd3EV/5F8mFtuLQp9oAI0UENNIX+y8e1
 Wg1cdSBGz0nEVP9xcX/Kkf9ELgqCoilaW0IIDviYeSy5Ho+t07pvn2saj5//Rt/RCtAZnzuXc
 r3yS9rxyAjAyGsjv3PSuU5ffJB8LzEyvb0JsX6W6D9iZxBQlJ86lbZUGhrNCvSXNt+XBVt/Vk
 T/+SY0++xEoEiG968ecJkrb67OOMiRvPy5lGWVOy7YBBlpqLXfu232dPLm54qPNjJdLG6EWvj
 NUlnaSntLDv23wvGVWmBkLEI5AS4JNs5JNbtoaN5AdUDVwjwLwWjA7LMkdxAkGBSURMJlECUv
 +wQbfn+8UumvxCyqoc+YD5cg0PIQPVZecJLRb1oYzx6jWNie3q8aQtuGnRgQUVzjU81KiDo2B
 Y6aj5yKTaZ5m30tlg61YLAxw==

=E2=80=A6
> +++ b/drivers/gpio/gpio-aspeed-g7.c
> @@ -0,0 +1,831 @@
=E2=80=A6
> +static void aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int offse=
t, int val)
> +{
=E2=80=A6
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	__aspeed_gpio_g7_set(gc, offset, val);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(raw_spinlock_irqsave)(&gpio->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc5/source/include/linux/spinlock.h=
#L551

Regards,
Markus

