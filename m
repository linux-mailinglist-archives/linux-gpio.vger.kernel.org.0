Return-Path: <linux-gpio+bounces-31861-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHORLfDqlmkzrAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31861-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 11:50:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D0B15DFB0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 11:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84CC93070DD2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655D72D7D30;
	Thu, 19 Feb 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUFZ/pz0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2717E63CB
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498103; cv=none; b=ctrcBcfmR6bqha4un0QH3ezcUZlzZxZBmu8gBD42XQK98IjShs7fOzW747fQSzNfltSngpYVjVY4CxUU2TETEsxxbfRVNLeqNkKHy7A8+Qvhr+jCLGM6dxgczfiHtHCNt8+7cZnmLGB5UjPykU8C5vucETFCRhRI8gol/3SSz1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498103; c=relaxed/simple;
	bh=UG5abZTarFImyXTZVnBGl4YuTfNf5HgIPyB1ji42Xws=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJrGodppkgw+a500zGfgJ0ciZTb+3MrzTs7zC1kUKSgGLALKL7j56rklKaEAvWvGWA93Zad79IC5EJMravbfJZzyyXplI9R/xkLGnusjbV+N8Vm+mHhqIAafRjb6UX2MhK/YCEeN1dDXXi6GdEwciSnSNIi+/Ruw5fZLStfWCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUFZ/pz0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4F1C2BCB0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771498103;
	bh=UG5abZTarFImyXTZVnBGl4YuTfNf5HgIPyB1ji42Xws=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=OUFZ/pz0RYELTf8rYgpWFLRJt1HlDaDsKD48iBWgU/jhadUHkeNsWiVIiPQFmRwDQ
	 fA84lbir8Vh8DnnrhePuV2lI+3Qm1WOoS7vNg8Q+1/i1otsNfNTHj8Wnan2KRA1CqF
	 vB3vp5iCW0v7LIj8FyXjkVUKTHAkFAWF+oDjg2V+VzwRNWbq3DPR2zeDeeTYbPlXUR
	 f/RSjUsoHzKH3ohLAZ7IG8Cx21jgMe+dvm/yXEhFdx0OLZMVAl7o5EDynvXdlHYCJp
	 LgOkO4ECXuUwa6DaBNa7mhW4eHrYXwschq+ihaW5vd3xv31nH7VwNieVcjjMl872U9
	 wyobvJZBBIPdg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e6c181402so1058733e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 02:48:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFv0tjEI0QGhOPnSsjgMts+2/0SPGGbcMb8k58RoFgcJjlmS5yiAbrhDG7w0nSMXo7jeZj5yyGFazL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/QDj+I50EprVv21p9FNop/AjH3R4pgx9scR6PPLFXlamt31XK
	qpfaUdHPNvJ2Px3iWFTnRtKRKOPSb7k6Op5O9Zty8RMWFgYVpXCz1RJaDEpQcGYcHcvjqzLZeUG
	14M9/UhqG85Y5IXhmx5mdaeg1jazZ/KyT+kybc3wNLQ==
X-Received: by 2002:a05:6512:3b0e:b0:59f:6b77:a7ad with SMTP id
 2adb3069b0e04-59f83ba2fd5mr1483422e87.21.1771498101645; Thu, 19 Feb 2026
 02:48:21 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 05:48:20 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 05:48:20 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aZYmemDCcVzPB1RM@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZYmemDCcVzPB1RM@google.com>
Date: Thu, 19 Feb 2026 05:48:20 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeSznJx8zCWrs86LQ-v6zOF=3j-o0SQJGdb66BPG1ssmA@mail.gmail.com>
X-Gm-Features: AaiRm50UhBItXrS3arvQwccpn0SdiJSQ56mVUSPmQLC3AiQvH2O8zUsiKzdUS_0
Message-ID: <CAMRc=MeSznJx8zCWrs86LQ-v6zOF=3j-o0SQJGdb66BPG1ssmA@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: ti-ads7950: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31861-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 48D0B15DFB0
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 21:52:44 +0100, Dmitry Torokhov
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
> index bbe1ce577789..0c4db18ec4d7 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -433,7 +433,7 @@ static int ti_ads7950_get(struct gpio_chip *chip, unsigned int offset)
>
>  	/* If set as output, return the output */
>  	if (st->gpio_cmd_settings_bitmask & BIT(offset)) {
> -		ret = st->cmd_settings_bitmask & BIT(offset);
> +		ret = !!(st->cmd_settings_bitmask & BIT(offset));
>  		goto out;
>  	}
>
> --
> 2.53.0.335.g19a08e0c02-goog
>
>
> --
> Dmitry
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

