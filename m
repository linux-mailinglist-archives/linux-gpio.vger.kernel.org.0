Return-Path: <linux-gpio+bounces-39784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OlgjGx1BUGqIvgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 02:47:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB837366BE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 02:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n26oLl7f;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39784-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39784-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C0903022970
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 00:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47BC1A6814;
	Fri, 10 Jul 2026 00:46:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736722AD3F;
	Fri, 10 Jul 2026 00:46:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783644384; cv=none; b=PnccmGzn5lcBMzMrzul11FD0kM/YJDmxzI0zn+IvmKa1UJFCUwPXOR98VpVtkhEb5uS3lo1FoPqTkhgFfY6feWozN+kruVNL00eDFnodrEuu8n0G7dea79Snq8HyNg7+eON88IGDKVKlJEnArgkF/Z4S8LhOGze9W/p1wlZU/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783644384; c=relaxed/simple;
	bh=NcAY33Cz+Y07dZSUoRE4dYMoOX/ODftBQ6ejSLDLCig=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQ52rdw32Lshb1ZZ2M3gyXJdhXi7X1UUQXrRiTHMRq7vMVE7J22LY/y2/rZecMBjBesBPULZpUnf6MPyo2wxAMTqkPyoo0aIhEBjGszlZqIksTfYZendhzVjI5JbOv/+pstSuZ0Gbn/R8wBXMErZ3RZdqxe2Ok7u/5/M8WLo2K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n26oLl7f; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5956F1F000E9;
	Fri, 10 Jul 2026 00:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783644383;
	bh=13E5iFkRhhPo8tsl5s9roEJL6c2uaz4ktKevVkLd3/I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=n26oLl7fvkRaj9R0WlIMV9CH2IijPq0UbKzEoXjkl6V3zPgfQU6pqoeIgXJWJIKQs
	 R8WnP75NkWglA4FGzr0WfYVH2hQmRxKbEdKD3CY1FE1//vfxrouyUEVHx9LObYbmSC
	 EFSFATVRBr6ADR3Kg447bHV10pnJAftkOJjiBvRkgiYrWn14nWd/vAOlhZKNm3dS1Y
	 qpInly4maBuEpmP37Ax7YP3GdlytUCsn+PlrT4puoIZKiV30efH2I0eAbOfCZlzzrh
	 1pXW2ltxzjOSkgUZFem3MOiJHHWfnhl1uS+eY4I8DAIvgK+TGrFEGWoRZgZiahkg6v
	 QkNLnaFK4UXfA==
Date: Fri, 10 Jul 2026 01:46:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, "David Lechner" <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <jananisunil.dev@gmail.com>
Subject: Re: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
Message-ID: <20260710014617.323acf6e@jic23-huawei>
In-Reply-To: <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
	<20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39784-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFB837366BE

On Thu, 9 Jul 2026 10:50:14 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> processing in the AXI ADC backend. CRC provides data integrity verification
> for high-speed ADC data streams, ensuring reliable data transfer between
> the ADC frontend and backend processing systems.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
The 'other things' I found bit from Sashiko is interesting. Far as I can
tell it is right and [devm_]mutex_init() is missing for lock
in struct adi_axi_adc_state().  

Nuno, looks like it was from:
7ecb8ee5c93b ("iio: adc: adi-axi-adc: support digital interface calibration")

Which indeed adds the lock with a mutex_init()

Jonathan

>  static const struct iio_backend_info adi_axi_adc_generic = {
> 


