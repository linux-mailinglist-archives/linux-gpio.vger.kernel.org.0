Return-Path: <linux-gpio+bounces-39324-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oRGkOXwTRWom6goAu9opvQ
	(envelope-from <linux-gpio+bounces-39324-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:17:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E70B66EDF83
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 15:17:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=IFVbIJn4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39324-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39324-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D56C930AFF54
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 12:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB404963AD;
	Wed,  1 Jul 2026 12:55:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5416D48A2B6
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 12:55:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910528; cv=none; b=YQeHIArg0w+QNHavng/0RK8snbQ1JuujpNfiDIWm67ay2TMYEQN75FF+xJIJibQmMbj65YBRHE19uhq+WouAd7IzAw81e7W5vIAik5Ue8gROISw+NrkLcLNeXCZSVd5F5xFv6wVtnrRLn4vaBN//a864p63KRqSOrWYflE5NotE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910528; c=relaxed/simple;
	bh=srBFXGO98uQWDvyIh+xYsIJkj/+Hax1EgreZTyqJMQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3GePVMeMZNxIOrD5JaVxlDduEjepfv1LIlZ3tmedEu8Q+YoPFuGNtvHKxMeJgHVqnTWvJ1OcxbLCPAyKIuxpvUrzAHotV37ZFiRlnxXGgawyjL0TkeR7XGsdcZHsAKeZemWFz1CsOGpANhNIXgTMAhhI/ImBA2A6j/dBD30MKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IFVbIJn4; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8F03FC504E0;
	Wed,  1 Jul 2026 12:55:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E85960288;
	Wed,  1 Jul 2026 12:55:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77650104C95FB;
	Wed,  1 Jul 2026 14:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782910523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=FjLiQzO1cIpZ7Od9KYcaF/iY79A+Cq0/W7IciQmSFaU=;
	b=IFVbIJn4X3EtjE9D3aub7A1QcOOoPWSmn00E1sI/TAsiXDZoQYlUFXVwioqQwwjnFOp9Fk
	O/vVZo2MdriGgfn0iUeqqAIQdAd64dVe6L9lLGEzvqicPTl2QaGhnKVmv7MS2pDcCTWVki
	tzrGv7Cf6fJc2hZQJLul334cdooc050ArIixY2LTQMgGRc7+ska8/iBW/zYZWTUTxjY2mF
	bdnoz13SU5nrSNN+89ALANnI8NMG0TPlaZSi93W4aRumRG+hKR0Rzw9KTbJTz6UzQlUcnL
	80EnJ8WpUI7ENwSPcUEDxmxGxThOrEa+MZ+rLyYnBxEx8PhPnU+Of3qGVoIYKw==
Date: Wed, 1 Jul 2026 14:55:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 4/8] rtc: bd70528: Support RTC on ROHM BD73800
Message-ID: <20260701125519b00c5f03@mail.local>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <d9f5b1c6b165699627c7cf127a7ec64d28e15cca.1782909323.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9f5b1c6b165699627c7cf127a7ec64d28e15cca.1782909323.git.mazziesaccount@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39324-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linusw@kernel.org,m:brgl@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,gmail.com,baylibre.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E70B66EDF83

On 01/07/2026 15:42:20+0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> BD73800 contains similar RTC block as BD71828 and BD71815. Only the address
> offsets seem different. Support also BD73800 RTC using the rtc-bd70528.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-bd70528.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index 482810b61495..fd415e327ea6 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -8,6 +8,7 @@
>  #include <linux/mfd/rohm-bd71815.h>
>  #include <linux/mfd/rohm-bd71828.h>
>  #include <linux/mfd/rohm-bd72720.h>
> +#include <linux/mfd/rohm-bd73800.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -284,6 +285,12 @@ static int bd70528_probe(struct platform_device *pdev)
>  		bd_rtc->bd718xx_alm_block_start = BD72720_REG_RTC_ALM_START;
>  		hour_reg = BD72720_REG_RTC_HOUR;
>  		break;
> +	case ROHM_CHIP_TYPE_BD73800:
> +		bd_rtc->reg_time_start = BD73800_REG_RTC_START;
> +		bd_rtc->bd718xx_alm_block_start = BD73800_REG_RTC_ALM_START;
> +		hour_reg = BD73800_REG_RTC_HOUR;
> +		break;
> +
>  	default:
>  		dev_err(&pdev->dev, "Unknown chip\n");
>  		return -ENOENT;
> @@ -344,6 +351,7 @@ static const struct platform_device_id bd718x7_rtc_id[] = {
>  	{ .name = "bd71828-rtc", .driver_data = ROHM_CHIP_TYPE_BD71828 },
>  	{ .name = "bd71815-rtc", .driver_data = ROHM_CHIP_TYPE_BD71815 },
>  	{ .name = "bd72720-rtc", .driver_data = ROHM_CHIP_TYPE_BD72720 },
> +	{ .name = "bd73800-rtc", .driver_data = ROHM_CHIP_TYPE_BD73800 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, bd718x7_rtc_id);
> -- 
> 2.54.0
> 



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

