Return-Path: <linux-gpio+bounces-31993-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC3OLrIMm2mjrAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31993-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 15:03:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920416F489
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 15:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80D543010156
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 14:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4994214F9FB;
	Sun, 22 Feb 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsK5ZbJ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB21B808;
	Sun, 22 Feb 2026 14:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771769005; cv=none; b=WOxj0Q8OROK3ye0gVBOV1t3Ft1sqrATBmOth3dk6aDq3iYgiZN2seIY1tPhqlx+SL6OWa7ZNqVfhCnDkTnsgvXU7e4R0emdBlByo1xv09d584Lo4632gEEymrGg+HlqT4AZLSS9zM3wROuH5YsmZBxfRsEHyA8pZaByTNXp/fK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771769005; c=relaxed/simple;
	bh=Api/KXx3CyA+l/V9RndsWfXqZ3HkT3hfiByk6SG7laI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGA7jaT8QE+F/LjEfN572Kx0YskwLPF3H2ZxUyysEn3kt6ulZoM/GD3SJ4x6qMdOm72QwRDatTIc4i8GrqjdQtoupHE5m+9zI9jEsN+oor1osYRNpa3wAvtHe913U52pd0v29h0CRLA3lOA2XOI2x1LPmOWq1mCV9k3XCOMuFHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsK5ZbJ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEDBC116D0;
	Sun, 22 Feb 2026 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771769004;
	bh=Api/KXx3CyA+l/V9RndsWfXqZ3HkT3hfiByk6SG7laI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WsK5ZbJ5yuNUns3FvgD0OGA2XWT7V6BxwCn6JUMEBsx4N0U0tVQn8gVXD4trgog2W
	 7p/AkEA6H6joA0WjfiLQs0AjpqM8q6hkVwf4kZppBVwvAhgwCt8b0Fw7XxNhC3jcJc
	 mHCLZKu++Kuvn6Dv4jOFgzhSHXQJoGUDE3HLAx+QKspQiWwIWjm8kNg6txHDcoSxCe
	 YyB0fSG6pwfau1bCcv9rh0SC1kT3ODGq2IDUVsk0aV2ova2m2C2DiYLyDKecqYBNi6
	 iNMvqEw2B7MNT8sQk8UiGPPwhnyiGZAHgr8TXVvhpe5h9lC/X/n4YuSIqwWDae61S0
	 ObEnQGxmllQBQ==
Date: Sun, 22 Feb 2026 14:03:15 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] iio: adc: ti-ads7950: normalize return value of
 gpio_get
Message-ID: <20260222140315.33e5e97c@jic23-huawei>
In-Reply-To: <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
	<20260219022929.3558081-2-dmitry.torokhov@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31993-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1920416F489
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 18:29:25 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by ti_ads7950_get() for output
> pins is normalized to the [0, 1] range.
Fixes?  I'm not quite sure with something that says 'expected'

Jonathan

> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/iio/adc/ti-ads7950.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> index bbe1ce577789..b8cc39fc39fb 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -433,7 +433,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
>  
>  	/* If set as output, return the output */
>  	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
> -		ret = st->cmd_settings_bitmask & BIT(offset);
> +		ret = (st->cmd_settings_bitmask & BIT(offset)) ? 1 : 0;
>  		goto out;
>  	}
>  


