Return-Path: <linux-gpio+bounces-38404-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y//+FvhjLWrVfgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38404-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 16:06:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EE067EB7C
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 16:06:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Apuxhaca;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38404-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38404-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93372303028C
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 14:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB60E3090C1;
	Sat, 13 Jun 2026 14:06:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6A72D7D59;
	Sat, 13 Jun 2026 14:06:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781359600; cv=none; b=NWzfU7x3A8s5L6I2ZzlR89/xiEeH7vsLL2D/WAh+MZB5jhSqSEprBGmRZnJUJv6EbRfT47+R9QImXwBIw6/BRmbsS4Cz0Y4AGA34Ur9gD7aPKLzZqW/29osKmsBR4W2XBPOMFk84EyFSvQRn6SdmSnYFCk7e9Gh6LPMdMvtapiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781359600; c=relaxed/simple;
	bh=XKfpxlRn1tTHF4IatoVwyeK78OYpu52Yx1NBvHFRFNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6kF0kU1ItKn4/e5dX7mNrG7HZw+M6PMU75uaxZ1LryAzvv1hWqTEvfAPjeEFIryZy6meccpf0dXMAORr4C5Vcs3pkA4oEpIDMXgWwqONzVxa9R/AI/ZsthYyXdEzrNJSHo7m+u44RKBSBifeVFuVR2N6YQNjpg+52zIhfVZT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Apuxhaca; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAE71F000E9;
	Sat, 13 Jun 2026 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781359599;
	bh=+8bBAMX6vKJfF5EfKeHvtPhAZlrJ15UIYFCzm2FZ+gg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ApuxhacaqN7D7HW+gNshGd2ze4fnvIZjfiZCByRz56+/7ni4x59Z27usFgK11JeKX
	 bKcuOLjcFy4hS6WnrhMdpBpEvuQXFuagYtudg9xFF6YpgZqnus/l86OI7gph54FUJl
	 4qIHoRZLI8lDz16QMuSOAH89zfAS0yn2twmuRHr/gGgR7/hRiAta5S5uHjCL164yXW
	 GplrwjK6K8A84u123pWwuiVQM1uimDwn2yVmDSX6R0BeX7mqpQt6r4+lbk/MEeYjZR
	 Sxm2/09ruWnGVLaKe0MiIzh8+XzsmtjPKFusXKh2SOHOQtbMen8+a8VJLulUYBWIM3
	 oWJ4Nwh0/XsVA==
Date: Sat, 13 Jun 2026 15:06:29 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
Message-ID: <20260613150629.26914a16@jic23-huawei>
In-Reply-To: <20260613144544.0594a7f0@jic23-huawei>
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
	<20260612-ads126x-v1-2-894c788d03ed@gmail.com>
	<20260613144544.0594a7f0@jic23-huawei>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kuurtb@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38404-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2EE067EB7C


> 
> > +static int ads1262_channel_hot_reload(struct ads1262 *st,
> > +				      const struct iio_chan_spec *chan)
> > +{
> > +	unsigned int weight;
> > +	unsigned long i;
> > +	int ret;
> > +
> > +	/*
> > +	 * Hot reloading is only required on buffer mode and if only one channel
> > +	 * is enabled.
> > +	 */
> > +	if (!iio_device_try_claim_buffer_mode(st->indio_dev))
> > +		return 0;  
> 
> Look at IIO_ACQUIRE_DIRECT_MODE()
obviously that comment is garbage  - so please ignore!

> 
> That should let you simplify the error paths in here.
> I see you used it elsewhere.

