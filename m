Return-Path: <linux-gpio+bounces-36929-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIJzAEMfB2rnrgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36929-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 15:27:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 520455506FD
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 15:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1382F3031AF1
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C52315D35;
	Fri, 15 May 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shDdEekj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB4342CB1;
	Fri, 15 May 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851172; cv=none; b=rRZD3OcnTMjaAt70eb8tkd0yeEH2XjehWr2BmuFQaRgSfP4nHSWb4aw2UshwhjuPQxs5h7XRgWiV8jyPQZsmKZyD/xcUtSHnEgqEtM0HO9W13YMpaKDQojE/wFnKJQX82JEHyE+jfAcuV1nn9gT/6A04psLmp7dUMhtzUN6viZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851172; c=relaxed/simple;
	bh=dYD5nGxPubVtTRDTT4G6zHcYOSRikOavByFI7daUm1E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9Vh9cXPYwNyDgakLYrFeQ4OmxtpC2eA95EVZG2B9+OjhwbuiZUFGUCs6QG5H/RqQsWd6pzJlMM5xWQRGwMcnBXlE5Gu/DXu7RQJ5FgyiIIjMBeRyQVpETOfaF7fCO/p5IzqaATeazU1qoEBZPcf1m2++rNm6+L5osRJihvbz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shDdEekj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8095C2BCB0;
	Fri, 15 May 2026 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778851172;
	bh=dYD5nGxPubVtTRDTT4G6zHcYOSRikOavByFI7daUm1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=shDdEekjkpYH/WVB8SYfdjcyFgXTJbe5c2uZaal3nt96KZr9AcabJN3TJEtITjAme
	 xZyYXgY5Ma0G8XBP5Hgj+tc5lAYTf2m5+wA/JHPbidJyn0z8jbjNYaCT58SIObHLun
	 QGO80H97EUb569WRKOtGqjLRYYi7k6T2qeR3JYlt4mB1gThaUAW2m0MIMaxfbnBZrs
	 0mydFFeVCXEo5SR8W7WnDyyfkWYGIpkiYDRqfWTVCrpPwWzmWuc3w+jkb/P+w1ViQO
	 4jkCg6e2mxfdARgiKhH6di6/ruc2M72xD+Va8TKJgSKrtdmnzZ3+MV5lyXSC6DAmvQ
	 kdQOEf7vP93IA==
Date: Fri, 15 May 2026 14:19:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Jorge Marques <jorge.marques@analog.com>, Arnd Bergmann
 <arnd@arndb.de>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>, Jonathan Santos
 <Jonathan.Santos@analog.com>, Radu Sabau <radu.sabau@analog.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH] iio: adc: ad4062: add GPIOLIB dependency
Message-ID: <20260515141921.72242ab7@jic23-huawei>
In-Reply-To: <20260515090814.437092-1-arnd@kernel.org>
References: <20260515090814.437092-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 520455506FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36929-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, 15 May 2026 11:07:53 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ad4062 driver gained support for the gpiochip and now fails
> to build when GPIOLIB is disabled:
> 
> 390-linux-ld: drivers/iio/adc/ad4062.o: in function `ad4062_gpio_get':
> drivers/iio/adc/ad4062.c:1383:(.text+0x3dc): undefined reference to `gpiochip_get_data`
> 
> Add a Kconfig dependency for this.
> 
> Fixes: da1d3596b1e4 ("iio: adc: ad4062: Add GPIO Controller support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Applied and marked for stable.  thanks,

J
> ---
>  drivers/iio/adc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 8550917226a1..2c96e500c684 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -78,6 +78,7 @@ config AD4030
>  config AD4062
>  	tristate "Analog Devices AD4062 Driver"
>  	depends on I3C
> +	depends on GPIOLIB
>  	select REGMAP_I3C
>  	select IIO_BUFFER
>  	select IIO_TRIGGERED_BUFFER


