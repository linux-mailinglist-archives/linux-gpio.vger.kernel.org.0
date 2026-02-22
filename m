Return-Path: <linux-gpio+bounces-31994-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FRVLSkOm2lbrQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31994-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 15:09:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1716F4A7
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 15:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D9413008984
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 14:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840CD34F484;
	Sun, 22 Feb 2026 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+jJNbiq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A01255F57;
	Sun, 22 Feb 2026 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771769382; cv=none; b=RYhNnZqZNCTHNULcnOxuWMWcEtvV9kWvdX1R30p7bDJOjhM378Toh8Z6EeB4Gk4S2uvSwmKk7E1fktmSBrTTk5EnqRqDDoagQwADUhNqqXya8sjYIVqO8NvVDRW5IVvabBKyk86ONIS8713P/qvCjwIIEA9dbxLD0BNqdJvg7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771769382; c=relaxed/simple;
	bh=BUJJWN8r851+HbTXeBPI/4ofaQUF/5/AaQuMbKrOvkI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dHiyDzEqmZpcKGbxwLldcYghAg3olWbtM8UvsBgTtfGfv35RhZD9TYMDk8k+1QFYWfPN55W8Rln5zgSWQJayGJTDS33Ml9wvJk0UpolOoGWCBwsMIeXHX6LUySig6jFS6ryOU3dX9UpzR0EJLCj1pDPfYyRYNM4aOFHlDQev/6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+jJNbiq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FD9C116D0;
	Sun, 22 Feb 2026 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771769381;
	bh=BUJJWN8r851+HbTXeBPI/4ofaQUF/5/AaQuMbKrOvkI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k+jJNbiqHnbUDCRpS/SZ0CUVqe8XMY1Pk3PKsBqZwNuFG+YQGqkeLh8yuUz82EDi1
	 LGqReyBbjWOTZtoQTF50J5SEUwptwTli+9sIAE/Ro6BVhuL+bpuauhMml/Ktdc+oVv
	 6Z1w8XypkHl6605V5OR98MkL+ISJmzozDpd7F3V6SGndwOT//R9n0zqYc+RaudYXeK
	 +dDRQP81hS0GIfxRImQCjX2a+II60/fYxAdwU2ZU5EI2z7ql9LI2Vdg54ltjUfGg9j
	 OEfzPszOhWqhtxui8nB+qkTBfIKwRkcxUkaPFeCOvHx/BvECM7SkLsA/LDExXfb/u0
	 mM1AJd+W8MBOw==
Date: Sun, 22 Feb 2026 14:09:23 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/4] iio: adc: ti-ads7950: complete conversion to
 using managed resources
Message-ID: <20260222140923.10bd9b7a@jic23-huawei>
In-Reply-To: <20260219022929.3558081-5-dmitry.torokhov@gmail.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
	<20260219022929.3558081-5-dmitry.torokhov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31994-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DF1716F4A7
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 18:29:28 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> All resources that the driver needs have managed API now. Switch to
> using them to make code clearer and drop ti_ads7950_remove().
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Dmitry

One additional comment from me.

>  static int ti_ads7950_probe(struct spi_device *spi)
>  {

>  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
> @@ -598,36 +605,36 @@ static int ti_ads7950_probe(struct spi_device *spi)
>  	mutex_init(&st->slock);
>  
>  	st->reg = devm_regulator_get(&spi->dev, "vref");
> -	if (IS_ERR(st->reg)) {
> -		ret = dev_err_probe(&spi->dev, PTR_ERR(st->reg),
> +	error = PTR_ERR_OR_ZERO(st->reg);

To me this reads worse than original IS_ERR() / PTR_ERR() pair.

> +	if (error)
> +		return dev_err_probe(&spi->dev, error,
>  				     "Failed to get regulator \"vref\"\n");
> -		goto error_destroy_mutex;
> -	}
>  
> -	ret = regulator_enable(st->reg);
> -	if (ret) {
> -		dev_err(&spi->dev, "Failed to enable regulator \"vref\"\n");
> -		goto error_destroy_mutex;
> -	}
> +	error = regulator_enable(st->reg);
> +	if (error)
> +		return dev_err_probe(&spi->dev, error,
> +				     "Failed to enable regulator \"vref\"\n");

