Return-Path: <linux-gpio+bounces-39782-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JMu/MqU+UGopvgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39782-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 02:36:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8608D736661
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 02:36:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=g5S9GZzg;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39782-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39782-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E07F63029A68
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 00:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4FA1C3BF7;
	Fri, 10 Jul 2026 00:36:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FDC126C03;
	Fri, 10 Jul 2026 00:36:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783643807; cv=none; b=R6wxVdRr2aqjt/FCjHtCRuIW77220AyqMFg+JAp1rBQ6kO4ZyVOmRlAMiqlWNhyRgWyckaPQaaMVDbLUcKWNAzaAbd16i95xWglLXmucXvvXqMlYP1uxkC9GU4Zjt3B2HJrf382UhO8FG0QMNlXIutMlLLVcD0x8PL5hvIT7hZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783643807; c=relaxed/simple;
	bh=y0ReA3FUmiRYjz1pM8SySQ19jkjKvSIiDSeaJpMX2zg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKJaurV3q9zYj9VBLE/fu/JfqDaeRFPegI3hZqCPgj1EeSjw7/W5M6BCcUUX3CdVRm5fzUsowL9ErdKWWE0o+3eXbmrpbCT405oPohs+iuY5bsZGONYHLBqCsoV6K+2TnLmHDov5QrUc9hMD4UMf+DXlBylLot03vQMZW9LjBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5S9GZzg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D837C1F000E9;
	Fri, 10 Jul 2026 00:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783643805;
	bh=LkU8EBkA44L7LZPGszAlWuIZvDx7GkqaiXRmR+MfVQw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g5S9GZzg6lL3904SZer0QuLix8Cl7ZWatBbjoFlI1o2ZZNAfk5oHIeS1FY6cORUET
	 pkMyUs/YVRjNTr1NO2LeggFMK1u+jEybBiGXibDEb6AdYi877/Jrdr2CusRvQWf4Wj
	 2NpnC00NmGg+zgJObd/35eC6TtLBNnpJ8r1i97oZAap2ZcljOXFtCsq413Zmb5n1XE
	 k5sCs8sYgYPySI9rZ9LnWlxj/IShDeycN0PQOnijLqb5o6wEcKHgGtrHPg8p205bNi
	 XK3lArujHjExBqY4/dQZL96V8ctim0k3Do2XgDWzutjogV6sYtRigD2eYfSUYVf5L2
	 KA1pOSbwfOXXg==
Date: Fri, 10 Jul 2026 01:36:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <jananisunil.dev@gmail.com>
Subject: Re: [PATCH 2/6] iio: backend: Add support for CRC
Message-ID: <20260710013638.79e094a6@jic23-huawei>
In-Reply-To: <20260709-ad7768-driver-v1-2-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
	<20260709-ad7768-driver-v1-2-44e1194fd96a@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39782-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,baylibre.com,kernel.org,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8608D736661

On Thu, 9 Jul 2026 10:50:13 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add a backend operation to enable or disable Cyclic Redundancy Check
> processing for data integrity verification. When enabled, the backend
> will generate, verify, or process CRC information for data samples
> transmitted over the interface, allowing the host to detect corrupted
> samples.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  drivers/iio/industrialio-backend.c | 33 +++++++++++++++++++++++++++++++++
>  include/linux/iio/backend.h        |  4 ++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
> index f7a4be8ec320..379a426931cd 100644
> --- a/drivers/iio/industrialio-backend.c
> +++ b/drivers/iio/industrialio-backend.c
> @@ -886,6 +886,39 @@ int iio_backend_num_lanes_set(struct iio_backend *back, unsigned int num_lanes)
>  }
>  EXPORT_SYMBOL_NS_GPL(iio_backend_num_lanes_set, "IIO_BACKEND");
>  
> +/**
> + * iio_backend_crc_enable - Enable the CRC generation.
> + * @back: Backend device
> + *
> + * Enable Cyclic Redundancy Check processing for data integrity
> + * verification. When enabled, the backend will generate, verify, or process

Verification should be on previous line - under 80 chars.

> + * CRC information for data samples transmitted over the interface.
> + *
> + * RETURNS:
> + * 0 on success, negative error number on failure.
> + */
> +int iio_backend_crc_enable(struct iio_backend *back)
> +{
> +	return iio_backend_op_call(back, crc_enable);
> +}
> +EXPORT_SYMBOL_NS_GPL(iio_backend_crc_enable, "IIO_BACKEND");
> +
> +/**
> + * iio_backend_crc_disable - Disable the CRC generation.
> + * @back: Backend device
> + *
> + * Disable Cyclic Redundancy Check processing. When disabled, the backend
> + * will stop generating, verifying, or processing CRC information for data samples.

Odd line wrap.  Keep to a consistent <= 80 chars unless there is a reason
to do otherwise.

> + *
> + * RETURNS:
> + * 0 on success, negative error number on failure.
> + */


