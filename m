Return-Path: <linux-gpio+bounces-31712-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJmPBdb/kmlr0wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31712-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 12:30:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105E142FEF
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 12:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C7E130131DE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50813301717;
	Mon, 16 Feb 2026 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arQdawj1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136DF2C0299
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241399; cv=none; b=GOh2wGOqg3RXMNz/QUA3NIcRr1pul2PeUwaObJedSqejLDF5ct8AyOwYZGeN5KwUSvwDNXvz5YKKIYcXvvelh8v24nkdEpEwGT52OmJMXwoHGgt6KteZHlZjp4yCv3lREIjgVN0ujyEi689hUUfN4+LpuIYingCA+boKoMrz0J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241399; c=relaxed/simple;
	bh=ffAZQU+7fwh3Tgv1vcT59hiUkdhyiDuXDwmVmN2sUKI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXE8CLFPrpG/yT6kDAggdtpU7yJmn9WxZvvpsYoK1S/VcDa81mKH/3o+/XCB40v0ACP5yvChcVPaEAp24SimFHQ14ADmuxJAzYAScoUcvE88AufvgNyiuY9B5Tka4CEi57azhcNg4n74YmfhUNKhNcllKY0ShOZevn4mGQuUQDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arQdawj1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AF9C2BC87
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771241398;
	bh=ffAZQU+7fwh3Tgv1vcT59hiUkdhyiDuXDwmVmN2sUKI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=arQdawj1zevZQlyxzyBu6mNVjS4touFotGhb9uWSLMvOKFDY+DbS76BNL5TKl+ev5
	 xMwFFieyfb3G3tCpZntm73Yq07TA+sDxJ5Ag1gRU1cIp344FULE00ohP9JO9cOHae/
	 YiKQpkX7gBeoo7SDt95w1wWqmXuxggVvgY4poe+67vf85EaAeYwb+oz541MybQ1Voa
	 7K8Pm79V7tb6QHIYYIwgCcZU2Ql1gxYN8mwF8XFi8nJ2gB92nz0piQgeC8tUKlBL/F
	 pL9uZWGdHoQsBrjjBAXjlBfw3lNCeOKBhfkfzS1ZxBFJqz3fAf0jBdQGF3WeB2YyjO
	 eO/mR2eI8pxUg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3871a08189aso23734301fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 03:29:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgBpGVGbrd+VRkpqNmuzfx3pj6F1KjEhMvhAuY/n+kZoGV5Cievkb6jGeXenjQcCYG+G/BNhq6k9iV@vger.kernel.org
X-Gm-Message-State: AOJu0YwKGdqZp8mS67rO7ga4vUx8GhG/jFI9cJDOtPmyLjjd4HmoXvhY
	hV3Oh7ZPEo68m9zB9hvSi7tTZnkLe+2WNj2c7fwiyEGVhMIzS/eFYmZS9Uj8tVUibwr0qiFjGhN
	0CayXPi6Wgib1uOIRlRYV3GbvmkeRUIoKGldhCstysw==
X-Received: by 2002:a05:651c:19a9:b0:386:7e61:5de1 with SMTP id
 38308e7fff4ca-388103f4306mr27361421fa.0.1771241397326; Mon, 16 Feb 2026
 03:29:57 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 03:29:56 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 03:29:56 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260216045842.1206350-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216045842.1206350-1-pshete@nvidia.com>
Date: Mon, 16 Feb 2026 03:29:56 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdRL=_nRF5g4MukNjgeYGh=Bz3zN7bXEp7RPsLHHyq8xA@mail.gmail.com>
X-Gm-Features: AaiRm50wNA8SFafoe1T907sBezYG1RY1RVOmUDX7ZwH1gEiMS6J53Evi1J47ZF0
Message-ID: <CAMRc=MdRL=_nRF5g4MukNjgeYGh=Bz3zN7bXEp7RPsLHHyq8xA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Support multi-socket devices
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nvidia.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-31712-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7105E142FEF
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 05:58:42 +0100, Prathamesh Shete <pshete@nvidia.com> said:
> On Tegra platforms, multiple SoC instances may be present with each
> defining the same GPIO name. For such devices, this results in
> duplicate GPIO names.
>
> When the device has a valid NUMA node, prepend the NUMA node ID
> to the GPIO name prefix. The node ID identifies each socket,
> ensuring GPIO line names remain distinct across multiple sockets.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 9c874f07be75..daf5aaffa28a 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -857,7 +857,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>  	struct device_node *np;
>  	struct resource *res;
>  	char **names;
> -	int err;
> +	char *instance = "";
> +	int node, err;
>
>  	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>  	if (!gpio)
> @@ -937,17 +938,21 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>  	if (!names)
>  		return -ENOMEM;
>
> +	node = dev_to_node(&pdev->dev);
> +	if (node >= 0) {
> +		instance = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%d-", node);

I've never noticed it before (and it's not introduced by this patch) but I
really dislike the child device registering devres nodes with its parent...

> +		if (!instance)
> +			return -ENOMEM;
> +	}
> +
>  	for (i = 0, offset = 0; i < gpio->soc->num_ports; i++) {
>  		const struct tegra_gpio_port *port = &gpio->soc->ports[i];
>  		char *name;
>
>  		for (j = 0; j < port->pins; j++) {
> -			if (gpio->soc->prefix)
> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
> -						      gpio->soc->prefix, port->name, j);
> -			else
> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
> -						      port->name, j);
> +			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s%sP%s.%02x",
> +					      instance ?: "", gpio->soc->prefix ?: "",

instance can't be NULL here, can it? Either print it unconditionally or
initialize it to NULL.

> +					      port->name, j);
>  			if (!name)
>  				return -ENOMEM;
>
> @@ -1373,6 +1378,9 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
>  	.has_vm_support = true,
>  };
>
> +/* Macro to define GPIO name prefix with separator */
> +#define TEGRA_GPIO_PREFIX(_x)	_x "-"
> +

This doesn't look like it belongs to this patch, why are you doing it?

Bart

>  #define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
>  	TEGRA_GPIO_PORT(TEGRA410_COMPUTE, _name, _bank, _port, _pins)
>
> @@ -1388,7 +1396,7 @@ static const struct tegra_gpio_soc tegra410_compute_soc = {
>  	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
>  	.ports = tegra410_compute_ports,
>  	.name = "tegra410-gpio-compute",
> -	.prefix = "COMPUTE",
> +	.prefix = TEGRA_GPIO_PREFIX("COMPUTE"),
>  	.num_irqs_per_bank = 8,
>  	.instance = 0,
>  };
> @@ -1418,7 +1426,7 @@ static const struct tegra_gpio_soc tegra410_system_soc = {
>  	.num_ports = ARRAY_SIZE(tegra410_system_ports),
>  	.ports = tegra410_system_ports,
>  	.name = "tegra410-gpio-system",
> -	.prefix = "SYSTEM",
> +	.prefix = TEGRA_GPIO_PREFIX("SYSTEM"),
>  	.num_irqs_per_bank = 8,
>  	.instance = 0,
>  };
> --
> 2.43.0
>
>

