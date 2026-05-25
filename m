Return-Path: <linux-gpio+bounces-37485-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IauAXzBFGrkPwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37485-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 23:39:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D85CEE6B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 23:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96B57300DDD8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 21:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12A836215F;
	Mon, 25 May 2026 21:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qDrIXuT7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB793368B8;
	Mon, 25 May 2026 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779745143; cv=none; b=akID7AeG4HkyaGzI3sqSd2nAO3M8N/JfZ4m/N65KbURtZ6P4mmBfzCOFPq8XqQQyQukPcQQWrtnwluuDvwpb6KH9lWi43S8kWQD24d4skul38O7npdzJ/yNfnOq7h8K7thbPQFxr7wx+Vi0a11uMur7e3NVNTVTxAgDNW6U9NRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779745143; c=relaxed/simple;
	bh=xmlZyiLM/KlQv4wu5tJkU7v4YAEMiImxkEyCCggM9jI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rySBfbXT53gF/1jWXbG4QlCLmZUtNgQFORDXffQ1572iB8vSjIRoovu9EsxVtPDRxlG843kAmF19fKE4gvAhJZ3X9436vPEwTrysCecswTAuSXsEvxdxXsZa0nPSmrdpVq6aAchjqLwlEyYqBrV6UpnTXVZ8Gu+SvK4wUPy6kAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qDrIXuT7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB9381758;
	Mon, 25 May 2026 14:38:55 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E5543F632;
	Mon, 25 May 2026 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779745141; bh=xmlZyiLM/KlQv4wu5tJkU7v4YAEMiImxkEyCCggM9jI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qDrIXuT7h1R7aairMJhZ7AQ0aqjUW0JeR/oLswk+6MuIyQ0ENo5fU5+xxmKG4GNK+
	 1XfDeUNR8nvkGPUkAXwd1wJUo/qll0+G1OxatpuagZ8zXYJSfE9DpXtJDYEHSYzcPY
	 l0hLvnPjkDXel5XMUq6GUShsHS8aknfU1Bli+Nhw=
Date: Mon, 25 May 2026 23:38:08 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Linus Walleij
 <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] pinctrl: sunxi: Implement function_is_gpio
Message-ID: <20260525233808.20e75a21@ryzen.lan>
In-Reply-To: <20260517171405.3697469-1-paulk@sys-base.io>
References: <20260517171405.3697469-1-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org];
	TAGGED_FROM(0.00)[bounces-37485-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ryzen.lan:mid,arm.com:dkim]
X-Rspamd-Queue-Id: 677D85CEE6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 17 May 2026 19:14:05 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> The function_is_gpio pinmux op allows the core to find out whether a
> GPIO can be safely requested from a pinctrl property and requested as a
> GPIO at the same time.
> 
> This is especially useful to request a GPIO with a particular drive
> strength, which would otherwise not be possible.

That looks a easy enough solution, but:

> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index d3042e0c9712..6162f2d86723 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -821,6 +821,17 @@ static int sunxi_pmx_get_func_groups(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static bool sunxi_pmx_function_is_gpio(struct pinctrl_dev *pctldev,
> +				       unsigned function)
> +{
> +	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
> +
> +	if (!strncmp(pctl->functions[function].name, "gpio", 4))

I wonder if this condition is a bit too relaxed? There could be
some (theoretical) function just starting with gpio, but not being mux
0 or 1. So should we check for gpio_in or gpio_out, explicitly? Or at
least use (strcmp(name, "gpio_", 5)? Or maybe even better for the mux
value directly? Is "function" an indicator of this, or does this rely
on the two GPIO functions being always listed first, at least so far?

And what about the IRQ function? Isn't that some GPIO as well, or does
that not count for the purpose of the function_is_gpio() callback?

Cheers,
Andre

> +		return true;
> +
> +	return false;
> +}
> +
>  static void sunxi_pmx_set(struct pinctrl_dev *pctldev,
>  				 unsigned pin,
>  				 u8 config)
> @@ -952,6 +963,7 @@ static const struct pinmux_ops sunxi_pmx_ops = {
>  	.get_functions_count	= sunxi_pmx_get_funcs_cnt,
>  	.get_function_name	= sunxi_pmx_get_func_name,
>  	.get_function_groups	= sunxi_pmx_get_func_groups,
> +	.function_is_gpio	= sunxi_pmx_function_is_gpio,
>  	.set_mux		= sunxi_pmx_set_mux,
>  	.gpio_set_direction	= sunxi_pmx_gpio_set_direction,
>  	.request		= sunxi_pmx_request,


