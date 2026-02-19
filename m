Return-Path: <linux-gpio+bounces-31851-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKdeLUfVlmmVowIAu9opvQ
	(envelope-from <linux-gpio+bounces-31851-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:17:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20915D45B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A38301DB83
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3CF334C34;
	Thu, 19 Feb 2026 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BR84xj9u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E11F32692C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492675; cv=none; b=kJUXkPdICp/YsoxoSI3SpZc2eHX3jAs8QREKzXVNbH8iAMsd0N++u0SeqFasTd0xyv7H5tYAlLyzFz3pUApxckn0MtWFQwwTlZYbIKKkUhzKds7jM94+Lbm39EfiCow/aEOQnwY30ApvTiaUQtt1IQ73roXmHjha8ZfmBjh4BXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492675; c=relaxed/simple;
	bh=Y3CTc40pYTtpE9bevaAHpECqByMf+1V74GsiG9Ca+F4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBKeZseTqYcLVB6J4qs2its2g3sy7YZfoNeKBV6L4Jtvb0TaC8baPoCfJch6ksMpQ1N6x6Kw1GaBBCzaS0k0EQySUdq7HmJcJNcvjdBZsNtp9c2GhtuOGZvJ3XWgB7Nda6TcmQin4WCYy0b2O2TisBpyZHEXPjSErmjvo7Jyf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BR84xj9u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1169FC4AF09
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771492675;
	bh=Y3CTc40pYTtpE9bevaAHpECqByMf+1V74GsiG9Ca+F4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=BR84xj9uBgn0KvsLmiZr4wb8+Atftkc9MMoPv3+hJauNBLYl3rYM8pWn8dhVrja3C
	 8dfPPnv4AGMYmFYq/XouOY1FiHUF8Vcf75FpU6AWXtzRDz7xHsVYKA1o3FTeVuZmRP
	 XmCvL/luLmHh8ygXSjYky6lJDUX59M4T/bdlT0ZilgrzBqAs6Gei6IwVnowk1K+KCx
	 U8JHMFGmUWRibOUm4r+a+xP2HHklAYVWQ+ue1lGKTyejcp/1kI/ZwRVlX7vDWttCXE
	 I5m7xUDHOo3vDQxq1of5cezR0dLfv8v/Nszf0qkKx5IYfqAOWJFwPyBUsgsld+IE8W
	 HsaCfbm1lm3hA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e5eaa491cso975493e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 01:17:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMqUBxxHzgx3DHSoUTc3yGXaZCAv+Tsy3PfQqBpGfkPa+jaOgicFu5/vp/Ze26Jpp0snuydzhQwSuZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEve2FmIi6DTsVhUN64k/7BprrXvfY+W8tZfDtY7pouIq8J3nt
	Xq7n1MFpBCiwiI8UYTR5gll05syA/8qeXq9+K8mkx5+csBmsEc6A9luGduyjk9px0ZjDj2fFcq1
	Qxdpig4MClMpeT7joKlB3Si3q69MWJa/bOZRMF3WDXA==
X-Received: by 2002:a05:6512:3e1d:b0:59d:f69e:16c2 with SMTP id
 2adb3069b0e04-59f69c2058fmr6237654e87.12.1771492673660; Thu, 19 Feb 2026
 01:17:53 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 03:17:51 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 03:17:51 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com> <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
Date: Thu, 19 Feb 2026 03:17:51 -0600
X-Gmail-Original-Message-ID: <CAMRc=Mc6TpLqSgHYBob9whEaXmwuDVWws8wUoj4=sDLa5eM39w@mail.gmail.com>
X-Gm-Features: AaiRm50KsCN4RkCW5SWi5nc8zeOCpZIuArHecOmaHg_sCD8pXAyHWLq-WKb89XA
Message-ID: <CAMRc=Mc6TpLqSgHYBob9whEaXmwuDVWws8wUoj4=sDLa5eM39w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] iio: adc: ti-ads7950: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31851-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A20915D45B
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 03:29:25 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by ti_ads7950_get() for output
> pins is normalized to the [0, 1] range.
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
> --
> 2.53.0.335.g19a08e0c02-goog
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

