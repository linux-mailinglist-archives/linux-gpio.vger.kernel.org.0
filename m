Return-Path: <linux-gpio+bounces-37560-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG48EVmnFmrAoAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37560-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:12:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C225E0E2A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FAF93008A5D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 08:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995E63CFF72;
	Wed, 27 May 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfZ92c0x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C133CFF57
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869524; cv=none; b=tf/+Qe4/zw0dQbuKFEATY4JYfsrIQ/2sxafxAwK7lxx4H9I9NDdUOVbmb08aic+G8tVzgK/Ouqp0CfdY0r8S4rjmjZalgOM9o62gG4hZ/ilMS8lK2KVvW2Ku+RvrmO8K2/2HTwMFjl9qZGoamHyNwDugbiVatfHAvmc9vvbMcus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869524; c=relaxed/simple;
	bh=BdCRqzp0hLtZVSxP+40v5Ejwp80hUPgziwRcKo0qKQE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZW5F6B/9TWymhDh1PrqIqMmVMwg7lJAyEFu5tJChtablzHc+CYW7XwwIYze9MNoWB/AT5b/W2amjdZwlf0ewVEHnnjHuxsjOcnNkN8S8JCXXkjs0dduKh2Dn3PHxiQon92ekH8kt6m8RNJEwtXqPJZMq/X/FhrNrGASirTfzS6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfZ92c0x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89801F00ACF
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779869522;
	bh=uw2so0frtoJ7L36BG8ZMy2KRPedLJY369P26BUJOLLk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NfZ92c0xHqFVYEwjCEaR10h4Zq7VdUdg23WgrwjKsc9r29Dpuna/TsEzLUGOjY/+b
	 DasguJf7uRtfrp2IeWPfpNN68WZKq1+H1AgQbSJnezzs1tbZ4tbieTAe2W4c84fK1y
	 GNEwEdzk1Axh7KRHs+m2nX7M/L80K2wTkrzI5Z0T/wVXstzm6KpPoefrqrkXei7DE3
	 dtcBYQ+SaqsTb5oVTD/X3nLW0V3MEkmGRSZbOM2ot/1pLTc9/0wboIHnSh/8aMahY8
	 NB8d7VOSMnOG/T/5zjjJ+BJ3EK2t8nKulOgqteIDfxgueIdWLyV0i8e6OYhTBxtB5o
	 /NlrYLFHgJiqg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-393da8f389bso96747291fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 01:12:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8eISa49cm45lK8Sb3msl68n/WkORhdd4p0kRfv62VU7lqNBr3cMC0fV7zyz1rpnoV8Y4oVFS8UO6KL@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbn89uWoTeQh++eImSgOz22cSDe7yUnXkjBbHGPTKESXZq9Ug
	F95xVRoK7wStUz1+yoRAOd2G0szeBiByqtleGNVyDvn8ovi2tNvUy8Pp3mx7z2Q6z8wcfuGr/Ai
	2KpgWO02TUyu/E2UEzgVfDOxBP+mn2RqYY91IYdpmNQ==
X-Received: by 2002:a2e:9187:0:b0:38e:294a:d447 with SMTP id
 38308e7fff4ca-395d8d1d2a3mr51655011fa.28.1779869521582; Wed, 27 May 2026
 01:12:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:11:59 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:11:59 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260526171050.12785-3-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
 <20260526171050.12785-1-scardracs@disroot.org> <20260526171050.12785-3-scardracs@disroot.org>
Date: Wed, 27 May 2026 04:11:59 -0400
X-Gmail-Original-Message-ID: <CAMRc=McuW+fU2m+oy6Q0+cOB_Kh0Biz_NRgD5m60M4bmAyuJZg@mail.gmail.com>
X-Gm-Features: AVHnY4IMDCoU0IV6a-vUPw7eiuq2thFTlobhU6B8muFXFThBWn-86qTSkIm69ug
Message-ID: <CAMRc=McuW+fU2m+oy6Q0+cOB_Kh0Biz_NRgD5m60M4bmAyuJZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: rockchip: teardown bugs and resource leaks
To: Marco Scardovi <scardracs@disroot.org>
Cc: brgl@kernel.org, heiko@sntech.de, linusw@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37560-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98C225E0E2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 19:02:46 +0200, Marco Scardovi <scardracs@disroot.org> said:
> Address several teardown issues and resource leaks in the driver's remove
> path and error handling:
>
> 1. Debounce clock reference leak: The debounce clock (bank->db_clk) is
>    obtained using of_clk_get() which increments the clock's reference
>    count, but clk_put() is never called. Register a devm action to
>    cleanly release it on unbind. Note that of_clk_get(..., 1) remains
>    necessary over devm_clk_get() because the DT binding does not define
>    clock-names, precluding name-based lookup.
>
> 2. Unregistered chained IRQ handler: The chained IRQ handler is not
>    disconnected in remove(). If a stray interrupt fires after the driver
>    is removed, the kernel attempts to execute a stale handler, leading
>    to a panic. Fix this by clearing the handler in remove().
>
> 3. IRQ domain leak: The linear IRQ domain and its generic chips are
>    allocated manually during probe but never removed. Remove the IRQ
>    domain during driver teardown to free the associated generic chips
>    and mappings.
>
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/gpio/gpio-rockchip.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 33580093a4e7..c804f970d823 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -638,10 +638,17 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
>  	return ret;
>  }
>
> +static void rockchip_clk_put(void *data)
> +{
> +	struct clk *clk = data;
> +
> +	clk_put(clk);
> +}
> +
>  static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  {
>  	struct resource res;
> -	int id = 0;
> +	int id = 0, ret;
>
>  	if (of_address_to_resource(bank->of_node, 0, &res)) {
>  		dev_err(bank->dev, "cannot find IO resource for bank\n");
> @@ -673,6 +680,13 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
>  			dev_err(bank->dev, "cannot find debounce clk\n");
>  			return -EINVAL;
>  		}
> +
> +		ret = devm_add_action_or_reset(bank->dev, rockchip_clk_put,
> +					       bank->db_clk);
> +		if (ret) {
> +			dev_err(bank->dev, "failed to register debounce clk action\n");
> +			return ret;

Use return dev_err_probe() for brevity.

> +		}
>  		break;
>  	case GPIO_TYPE_V1:
>  		bank->gpio_regs = &gpio_regs_v1;
> @@ -789,6 +803,9 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
>  {
>  	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
>
> +	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
> +	if (bank->domain)
> +		irq_domain_remove(bank->domain);
>  	gpiochip_remove(&bank->gpio_chip);

Maybe if you're already touching the driver, use devres for gpiochip_remove()
too and schedule an action for removing the irq handler?

>  }
>
> --
> 2.54.0
>
>

Bart

