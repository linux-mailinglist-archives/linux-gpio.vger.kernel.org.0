Return-Path: <linux-gpio+bounces-34415-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEzGFIhAymky7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34415-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:21:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC33580C7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 442D7303EFE0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC20038A292;
	Mon, 30 Mar 2026 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/mF/SA+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F18B381AF7
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862145; cv=none; b=VSXzrwwGKAfc3JOBT6ZzIxU88Q2NYNzy0rhWi0Tz967YyaKRMP8N8gPj0ORSQfO7GuNXslZJODVPUFa4+PNDzyjOEwZl5dKI1SencPyOne/Z0z/oh48dZEJ7CJvO7D46H9WXj1rMwh3Rr7IQsVhbldfbQbh6nRJugfTboHQXNMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862145; c=relaxed/simple;
	bh=wRyTBT6txNN6yR3RftbjwgBQCjaAE1lesAdHg7xZ1IE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Po6bt1N+jnxWS2zAQ8Wi7tVJWLxltxYsrkFIVuNxKo4Lq5iCYmLJaTxACaOrYmJ0dieStcWOdlr8GtZDc+jGyxeszupUqkmC8EOEPxx82cyK3bAt4Qq2M3WTsIO05/PjQiToMevL6amU0I9vkQvHg5oEfYvCVGWYKz4rp9C5xyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/mF/SA+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A547C2BCB1
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774862145;
	bh=wRyTBT6txNN6yR3RftbjwgBQCjaAE1lesAdHg7xZ1IE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=L/mF/SA+7IMl1/jB2qprS3HyZE1tDmxL3H1hRu2+GkQ19vbiSLd1pKdrJld+Tu3NB
	 /Sj21WxU/z588y7zVK2Ewl/DLfDQPSbUgECPaLIxaI6BUToBjknkr83y7GbDkiR4ky
	 dCjf8yG8haF+lK7QHsRvEOjQz358+fllDfJJjbNSGacDCODIlrGQrMRx3zMWYglkmD
	 znvBl373IebLkEWnrbvFefDedNKBIiCJAPHkoEuUrd3YCrogblcSxz452lJfmpe/J9
	 +r90IEEA2ziiENA/cAcGUZ9nwE1TUICIml+2O7IjmOTAFWo/6WgiImQu+6Y/q7oUMa
	 LSphc5flwB5Ww==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38bf47a6f02so35289781fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:15:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaWi7j+Vo9+iIAMSTlrFj7cUm1vHqsfHEnAhLDkrRCVjL9oyS2Yv7cvNYDrgIsBUp5BAQ/3zDVZbAH@vger.kernel.org
X-Gm-Message-State: AOJu0YyM6sC2y5fH5CWzy7U7MQdxiKWt6ZC4zfUt9E+fkgMcW4koUsOV
	whCmW3ziE47E1PgpvveDs7maH7LHNqqcADvUiw/37X0BO7VF6K5eAWFFXwOwEMuzCbBl5PG2b2X
	Dj74hzjR1mRPbJi7+WtiyZhKldFr53HUimiRg7ZTy/w==
X-Received: by 2002:a05:651c:1507:b0:38c:4231:91c4 with SMTP id
 38308e7fff4ca-38c73143cd3mr39629831fa.10.1774862143883; Mon, 30 Mar 2026
 02:15:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 05:15:42 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 05:15:42 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260329-ti-ads7950-facelift-v4-1-c568c508c49a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com> <20260329-ti-ads7950-facelift-v4-1-c568c508c49a@gmail.com>
Date: Mon, 30 Mar 2026 05:15:42 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc0hMh2vL1qPo2SdKqvOKDEJaXm6rGKYeuA6mc8va2FWA@mail.gmail.com>
X-Gm-Features: AQROBzCxF28zwK_FhY7LSW2oRQpu0jHWTkjTjojbKfuGpZsPqhwAUT1sqIENcIk
Message-ID: <CAMRc=Mc0hMh2vL1qPo2SdKqvOKDEJaXm6rGKYeuA6mc8va2FWA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] iio: adc: ti-ads7950: switch to using guard() notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34415-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11CC33580C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 00:47:06 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> guard() notation allows early returns when encountering errors, making
> control flow more obvious. Use it.
>
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/iio/adc/ti-ads7950.c | 83 +++++++++++++++++---------------------------
>  1 file changed, 31 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> index 028acd42741f..6e9ea9cc33bf 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -299,18 +299,19 @@ static irqreturn_t ti_ads7950_trigger_handler(int irq, void *p)
>  	struct ti_ads7950_state *st = iio_priv(indio_dev);
>  	int ret;
>
> -	mutex_lock(&st->slock);
> -	ret = spi_sync(st->spi, &st->ring_msg);
> -	if (ret < 0)
> -		goto out;
> -
> -	iio_push_to_buffers_with_ts_unaligned(indio_dev, &st->rx_buf[2],
> -					      sizeof(*st->rx_buf) *
> -					      TI_ADS7950_MAX_CHAN,
> -					      iio_get_time_ns(indio_dev));
> -
> -out:
> -	mutex_unlock(&st->slock);
> +	do {
> +		guard(mutex)(&st->slock);

Am I missing something? Why isn't it just a:

	scoped_guard(mutex, &st->slock) {
		...
	}

?

Bart

