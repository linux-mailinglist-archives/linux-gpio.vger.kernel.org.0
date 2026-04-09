Return-Path: <linux-gpio+bounces-34939-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG6yD32h12kUQQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34939-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 14:54:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B63CAA59
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 14:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B455B303A5B7
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 12:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B5839DBC0;
	Thu,  9 Apr 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLUXVy80"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C432749EA;
	Thu,  9 Apr 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739098; cv=none; b=mQJ1J3N/EokFgZf9DxxNIceiCXFN/Tz9eysji7uFK0kVYY9iPHNJ3FOC0apLbfl8aeUDGCM6jfzRwlqacU/rXj+5nwK7mgu9taMrfkAe0HpCbW6vb0JsE1RjWORkTjGZ0rWZQETB207pPHpW771gGVsuhJOrXm3Z9eCH5RV08VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739098; c=relaxed/simple;
	bh=jYINShumR7gMthcqWcTe8uzpOGHve8M+RfHzT3pGIfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I27A8mvWTinpodWdgFTT2MECLsUwqlJPgH/mvMWN9kli0M2dlue9/Xjetz65OXjR2gsP8UqYwNalD9aParSLit1bdDn2aL0R5y0K5oDxph5svHUVpUAajNi7gM2ecZHZzxmrjkEJ9O9tj4nMv1vpQvszTd3U7azPHILlOuJpwIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLUXVy80; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55119C4CEF7;
	Thu,  9 Apr 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775739097;
	bh=jYINShumR7gMthcqWcTe8uzpOGHve8M+RfHzT3pGIfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLUXVy80x9440zBb6gblrrLJHxo7wmg+M8o9c5e99H1Y3HVbeGfHBgC3nXuTiVuFl
	 B9UE8Q+RhLDZD7rRekWCQh29l25pEqPCkMQ9/jZXrTrosDsy14HPg0Tk09jrhlyDuo
	 QZs4JmcNElKexYmIHeMBV0XSFFkw1bAaw+rsAlSH2dsoOEqsEa/YzI5zmD9ULcpWp6
	 7yaH7dyrKk2LkiKpi7uVDi8dVzNB8vRXln60h3lEwemcYx9FTgqqnhFH1MYFs08Xcj
	 w5S44hEaDUK3pnfahhJokGlWC5gz84HI0i7ZUB38Wos2RSxtMTHH40f45ffmEj3Bss
	 lL0SkG0cEauuQ==
Date: Thu, 9 Apr 2026 13:51:33 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
Message-ID: <20260409125133.GB3290953@google.com>
References: <20260327-gpio-timberdale-swnode-v3-0-9a1bc1b2b124@oss.qualcomm.com>
 <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34939-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 9D7B63CAA59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026, Bartosz Golaszewski wrote:

> This symbol is only used inside the timberdale MFD driver. Move into
> the .c file as there's no need for it to be exposed in a header.

I'd prefer that these were all kept together, even if we are over-sharing.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/mfd/timberdale.c | 2 ++
>  drivers/mfd/timberdale.h | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
> index a4d9c070d481a182890a58e4b8c850c4c29f7f17..d79419215cc292b705031a6432e877b94f9a1805 100644
> --- a/drivers/mfd/timberdale.c
> +++ b/drivers/mfd/timberdale.c
> @@ -37,6 +37,8 @@
>  
>  #define DRIVER_NAME "timberdale"
>  
> +#define GPIO_NR_PINS	16
> +
>  struct timberdale_device {
>  	resource_size_t		ctl_mapbase;
>  	unsigned char __iomem   *ctl_membase;
> diff --git a/drivers/mfd/timberdale.h b/drivers/mfd/timberdale.h
> index b01d2388e1afe59e14f77e10678bdbe599d2b90f..db7b434f766d03deb7c45ec1c8c5ded003aad087 100644
> --- a/drivers/mfd/timberdale.h
> +++ b/drivers/mfd/timberdale.h
> @@ -113,7 +113,6 @@
>  #define GPIO_PIN_ASCB		8
>  #define GPIO_PIN_INIC_RST	14
>  #define GPIO_PIN_BT_RST		15
> -#define GPIO_NR_PINS		16
>  
>  /* DMA Channels */
>  #define DMA_UART_RX         0
> 
> -- 
> 2.47.3
> 

-- 
Lee Jones [李琼斯]

