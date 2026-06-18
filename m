Return-Path: <linux-gpio+bounces-38682-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2IXLCz8HNGoPLgYAu9opvQ
	(envelope-from <linux-gpio+bounces-38682-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 16:57:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C01166A1106
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 16:57:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=hugovil.com header.s=default header.b=GezNigp7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38682-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38682-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=hugovil.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7E1C302834D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 14:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A2E3B42E5;
	Thu, 18 Jun 2026 14:56:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC429AB1A;
	Thu, 18 Jun 2026 14:56:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794619; cv=none; b=N6+1qkyLdEC/2uX8bgNfggcN+OztgQwG57unrpF2VkyLDaAjB/iFpIEWEAnd9ZHvai8b2NxRBINZhxOpKkHIKSu49Af8k9U6vJAzHm5lYlo0eWbpK5BWQjJgcxpAaienJVM6eQvXK/CurQos1X038s50MX4vNCVgnffri55ju1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794619; c=relaxed/simple;
	bh=SE7v8SiyBZABnoZXOdmIMkkUOW5Kkfss8LLCB0b6K7g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=abbiPRPlWV7lBvjDsC+Ah94/1o0Seg6RcO3pfrY0IICdQHtNSVv9ik5Ix3I+HFplxKGTPIcgEuR8KCINBsQHEwWGUg70ZC5B0dJldsMmrdP35JSFWNumW5PEdlXxoFzjm+Ck13xzNaEX6Q8E/lPCeC7IpW4NukPPGyyU/G3Pz/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=GezNigp7; arc=none smtp.client-ip=162.243.120.170
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=Fh1kudYK8zj1d5zm6swhKy85DjK9P4tOG87I7xIQdJY=; b=GezNigp7/wMsDkbbmBPjKzVHz8
	ETxVryMSSeLYw9Pqe5skMOL97SQEnTpZDkXaHHN7KUrujplBJF+Usfd3Qe2Gv96+zgmNGB7PmTeZo
	KU1EIy1loBeyVLLU0sw9nhBJmrjDBrWTO4Kxb+XN7loXZFx0v6yKxkbQQAdP9EkuGSss=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1waEAg-000000004Un-23Na;
	Thu, 18 Jun 2026 10:56:46 -0400
Date: Thu, 18 Jun 2026 10:56:45 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Alexander Shiyan <shc_work@mail.ru>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] serial: max310x: implement
 gpio_chip::get_direction()
Message-Id: <20260618105645.e2a1a4d5243fc6dda0554c1d@hugovil.com>
In-Reply-To: <20260615-b4-serial-max310x-gpio-get-direction-v2-1-4704ba2b181a@vaisala.com>
References: <20260615-b4-serial-max310x-gpio-get-direction-v2-1-4704ba2b181a@vaisala.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,mail.ru,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38682-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tapio.reijonen@vaisala.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shc_work@mail.ru,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hugo@hugovil.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[hugovil.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,dimonoff.com:email,vaisala.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C01166A1106

On Mon, 15 Jun 2026 06:38:40 +0000
Tapio Reijonen <tapio.reijonen@vaisala.com> wrote:

> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even when the direction is tracked in
> software. The GPIO core emits a warning when the callback is missing
> and a user reads the direction of a line, e.g. via
> /sys/kernel/debug/gpio.
> 
> The MAX310X keeps the GPIO direction in the GPIOCFG register (a set bit
> selects output), which the existing direction_input/output callbacks
> already program, so the current direction can be read back directly.
> 
> Fixes: f65444187a66 ("serial: New serial driver MAX310X")
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
> ---
> Found and HW-tested on an i.MX6 SoloX board with a MAX14830 over SPI:
> without this, "cat /sys/kernel/debug/gpio" triggers the gpiolib.c:429
> WARNING (tainting the kernel W) on each queried MAX14830 line; with it
> applied the lines report their in/out direction and the WARNING is gone.
> ---
> Changes in v2:
> - Address Hugo Villeneuve's review: use BIT(offset % 4) and put the
>   return statement on a single line.
> - Rebase onto v7.1-rc7.
> - Link to v1: https://lore.kernel.org/r/20260602-b4-serial-max310x-gpio-get-direction-v1-1-23bf84e8ee14@vaisala.com
> ---

Reviewed-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

>  drivers/tty/serial/max310x.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
> index ac7d3f197c3a5ce3531d5607f48e21a807314021..09b9ab57d2b4479da90fba178b093008f4b57bb9 100644
> --- a/drivers/tty/serial/max310x.c
> +++ b/drivers/tty/serial/max310x.c
> @@ -1212,6 +1212,17 @@ static int max310x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>  	return 0;
>  }
>  
> +static int max310x_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct max310x_port *s = gpiochip_get_data(chip);
> +	struct uart_port *port = &s->p[offset / 4].port;
> +	unsigned int val;
> +
> +	val = max310x_port_read(port, MAX310X_GPIOCFG_REG);
> +
> +	return val & BIT(offset % 4) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +}
> +
>  static int max310x_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct max310x_port *s = gpiochip_get_data(chip);
> @@ -1421,6 +1432,7 @@ static int max310x_probe(struct device *dev, const struct max310x_devtype *devty
>  	s->gpio.owner		= THIS_MODULE;
>  	s->gpio.parent		= dev;
>  	s->gpio.label		= devtype->name;
> +	s->gpio.get_direction	= max310x_gpio_get_direction;
>  	s->gpio.direction_input	= max310x_gpio_direction_input;
>  	s->gpio.get		= max310x_gpio_get;
>  	s->gpio.direction_output= max310x_gpio_direction_output;
> 
> ---
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> change-id: 20260602-b4-serial-max310x-gpio-get-direction-b10ee5be4f24
> 
> Best regards,
> -- 
> Tapio Reijonen <tapio.reijonen@vaisala.com>
> 
> 


-- 
Hugo Villeneuve

