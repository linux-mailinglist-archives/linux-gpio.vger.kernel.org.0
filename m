Return-Path: <linux-gpio+bounces-32776-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T8zhMoaCrWng3gEAu9opvQ
	(envelope-from <linux-gpio+bounces-32776-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 15:07:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E77AE230866
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 15:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9A033006D6B
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 14:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7DB3375A7;
	Sun,  8 Mar 2026 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UalE9LU/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665D23A566
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772978814; cv=none; b=jvP+uguKb3a99SU9ymHdxQggt6y3Er4pCL+xLcpLVK7f/Cjc5rh4KzkBe0xGswi5OeVrYAYxa5RY2yJ2M7PJPjKqgzswoFOlQ331aB+2DMF2F2mySTfB2IeoQUXpjGgWpB1H9onFMbq5SA/p70oF7GTGvIbFPpm9DCF8ZMcfchk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772978814; c=relaxed/simple;
	bh=1w83uARMWyGYvc/JmuNnyMOi7ETtApPzlejCC63kRgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzA7NdX5zyQKA3trqrWbIH4YrKyJEP8HpwOdovmaN6n1HZp7G3whsGWGb2mt4zDfVVhxKqTx0+zhEk/aiCD20EuY4H9T8hGyp96lZT3w/4fcCrhMvxj8za7l/uqTfQDPG20CchsZa25qhhrDgeC9BLw3+UR7T8GCIJUjEN41NRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UalE9LU/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892B0C2BCB2
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 14:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772978814;
	bh=1w83uARMWyGYvc/JmuNnyMOi7ETtApPzlejCC63kRgI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=UalE9LU/eZgvrRqA+FuYt5n9XFHboNIf9MT5oyXSZp4P1qumjycdbefhOxZtLm3DG
	 z2QrLCRWoUMsG29GtKFgoImaQUQoIn7uWJKy3oC1KJhpe1Nvh4mcKG9E+eONPTJw1x
	 kY+kY1/ojnUF3odnJ+bYsiOErkNb5TaObkOH7wiQ/Yptz+haYYv8lok0BwOAwq//bW
	 SjtjwfK64JWRT/zXHJ/CO66AoOZOgrlymTFYC+KQR8GIDhRb16bxhIhaRLtIs67QUU
	 +C0MKojQyMYwkBuyD6aDOWcbnUHlXTXRmsK4FWgkocXMquqpM2P5E3avJ15hx9cG7D
	 bgPRiYTiu13NQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a3066b68bso48274131fa.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 07:06:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIyqKGXreXGuHBqV+rsZXBHUasJKZMfYgQefv1joFbfxd7m7TS7rrUmEtmJQCRWewPP18e8Lm5jq3v@vger.kernel.org
X-Gm-Message-State: AOJu0YxqfLtWIPThbmLlxvCge9/1ivbpzOg+LPMx5QKZ9/x7GpH3qfjK
	FNCGDJNEbTSw0LxQo5v18wV/XI6deNHNn+IpimCbd76jT2TXZ++9UJUeRG4Cmeh2Ojm/3Kjjojx
	woMd2k+IKiSGiey0cCnhapw/kpudOBd8=
X-Received: by 2002:a05:651c:12c8:b0:387:1c06:f742 with SMTP id
 38308e7fff4ca-38a40db0c27mr30556971fa.38.1772978812861; Sun, 08 Mar 2026
 07:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl>
In-Reply-To: <20260308-rc2-boot-hang-v2-1-516fdb820953@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 8 Mar 2026 22:06:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw7F0xQ0bKbpUqch4w@mail.gmail.com>
X-Gm-Features: AaiRm53PKegPTzYpVROQgRjOlGoQDyf6kO6816n6Q7tMTIhfOGBvZddqUzGRf9w
Message-ID: <CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw7F0xQ0bKbpUqch4w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E77AE230866
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32776-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sholland.org:email,infradead.org:email,arm.com:email,mmpsystems.pl:email,linux.dev:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:42=E2=80=AFPM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip::get_direction() which was returning
> -ENODEV when gpio is in unitialized state.
>
> Instead of failing when the current muxval is at default value, report
> the line as input.

I don't really like this "fix". It's really lying.

Also, this problem only occurs if the interrupt is taken directly using
the DT "interrupts" property, as that mostly bypasses the GPIO subsystem,
especially the gpio request part.

If the consumer does gpiod_request() followed by gpiod_to_irq(), then
the pin is already muxed to either one of the GPIO functions and this
won't error out.

I also found that if the interrupt is taken directly through the device
tree, the pin itself is not locked out (like for GPIOs, on sunxi we also
don't do pinctrl settings for pins used for interrupts).

I think the proper fix would be to somehow be able to request the pin
as GPIO if it hasn't been requested already. And then either
sunxi_pinctrl_irq_request_resources() can use that to request the pin
and mux the pin before calling gpiochip_lock_as_irq().

Hope Linus and Bartosz have some suggestions.


Thanks
ChenYu


> Tested on Orange Pi Zero 3.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> Suggested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> ---
> This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
> inability to set up interrupt for the AXP313A PMIC.
>
> The issue is caused by gpiochip::get_direction() which was returning
> -ENODEV when gpio is in unitialized state and its muxval is at default
> value.
>
> Instead of failing, report the line as input.
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Chen-Yu Tsai <wens@kernel.org>
> To: Jernej Skrabec <jernej.skrabec@gmail.com>
> To: Samuel Holland <samuel@sholland.org>
> To: Andre Przywara <andre.przywara@arm.com>
> To: Linus Walleij <linusw@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
>
> Changes in v2:
> - Dropped the previous faulty solution which was forcing the axp313 to
>   use r_pio as interrupt controller as pointed out by Jernej =C5=A0krabec=
.
> - Implemented suggestion from Andrey Skvortsov to return default
>   direction as input
> - Link to v1: https://lore.kernel.org/r/20260308-rc2-boot-hang-v1-0-d792d=
1a78dfd@mmpsystems.pl
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index c990b6118172..e438cf35ff28 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -971,7 +971,7 @@ static int sunxi_pinctrl_gpio_get_direction(struct gp=
io_chip *chip,
>
>         func =3D sunxi_pinctrl_desc_find_function_by_pin_and_mux(pctl, pi=
n, muxval);
>         if (!func)
> -               return -ENODEV;
> +               return GPIO_LINE_DIRECTION_IN;
>
>         if (!strcmp(func->name, "gpio_out"))
>                 return GPIO_LINE_DIRECTION_OUT;
>
> ---
> base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> change-id: 20260308-rc2-boot-hang-269e8546635b
>
> Best regards,
> --
> Michal Piekos <michal.piekos@mmpsystems.pl>
>
>

