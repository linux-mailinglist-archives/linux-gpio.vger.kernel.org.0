Return-Path: <linux-gpio+bounces-39536-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1CAEMPILTGp8fQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39536-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 22:11:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED3715533
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 22:11:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=VO2c7dgq;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39536-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39536-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EA5E303CE87
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 19:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E45E386425;
	Mon,  6 Jul 2026 19:44:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FE737DAD5;
	Mon,  6 Jul 2026 19:44:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367082; cv=none; b=TVBykELa9otTtuqc68czB9znpPUB2+RCywiw/7thLzW4O2iZC8eTDhb7DrhwZAKbnw5wIi1/ln/wxj+F4cMB4cMT9b6/1NGTG3ZBwesX5fF/mUM7+vqHCgi3MkQcD6afb+U6Toe+keWRFZZBrLAnSkIJcN+JyBVK9NLwEeex5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367082; c=relaxed/simple;
	bh=CWZhUJcYoDkhoYtK1iatbsomPrNsu3GgiD409MrmM4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQf85VJJ+qxpHy9q2iyUCJ2CfE3b7YSHwZaPXu1gwfEse9Uturd2vu06ClUC7oH4VArkvpN4W9yEcpHBjGYG/jZaGRPV/aKtLTTT+K2uoJjfvMBDDKdCUWKX8TUVTkfR5+Rp5E/0/ShKdMfeji5g6+gpttyjiI7WOlfoxNYUnVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VO2c7dgq; arc=none smtp.client-ip=80.241.56.171
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gvFDZ4ZGxzMl25;
	Mon, 06 Jul 2026 21:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783367070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yYL7G2us8L1A+ywgdNGttIZPW1DvpTtJ3gvCDvIiAEc=;
	b=VO2c7dgq1MlQPUau1AxNghnke1EnVjyqyONihaOOagbxdtH7hnbBl0ef44m9glBZA9MnBQ
	Bf0sAgfdYvLUGJZKMAx5vyLPknKXvEeapulY06qgaRv/U0BirpZWU0G7r9eNLlxvHyb2KZ
	4TD/ogmzgIMmGzrMldg5gjBneQt+9EkGzCD2z7tuDLMYbXqClgf981BbmWPJoBiXixh/NS
	GgPyVtexk1r082Q/xjJMUmNzJBiIAOCtP7sLubSirZJKLPUs/A12/GsO0vtu8OZLv5t8JO
	xptbQjHsXSOVZNpmGV0iVCPAs2o3znZQ2+uQje1hsytLY+T2dNQz43ryIabXww==
Message-ID: <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
Date: Mon, 6 Jul 2026 15:06:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org>
 <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: e5aod8a9sremupnu97iu3hz4ksycwump
X-MBO-RS-ID: c857a6e774d5f1b558b
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39536-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BED3715533

On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:

Hello Bartosz,

>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
>> +{

I am hoping to get some input on this remap function.

>> +	/* R-Car Gen4 and older do not need any offset remap. */
>> +	if (!p->info.has_layout_gen5)
>> +		return 0;
>> +
>> +	/*
>> +	 * R-Car Gen5 register layout is slightly different and the offsets
>> +	 * that have to be added to or subtracted from each register offset
>> +	 * can be divided into five groups, listed below.
>> +	 */
>> +	switch (*offs) {
>> +	case IOINTSEL...OUTDT:
>> +		return 0;
>> +	case INDT:
>> +		*offs += 0x10;
>> +		return 0;
>> +	case INTDT...EDGLEVEL:
>> +		fallthrough;
>> +	case BOTHEDGE:
>> +		*offs += 0x70;
>> +		return 0;
>> +	case OUTDTSEL:
>> +		*offs -= 0x34;
>> +		return 0;
>> +	case INEN:
>> +		*offs -= 0x38;
>> +		return 0;
>> +	default:
>> +		/*
>> +		 * This here must never be reached, if this is reached, that
>> +		 * means there is a catastrophic failure in the driver. Skip
>> +		 * any IO read/write to prevent further damage.
>> +		 */
>> +		WARN_ON(1);
>> +		return -EINVAL;
>> +	}
>> +}
>> +

[...]

>> @@ -399,6 +445,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
>>   	.has_both_edge_trigger = false,
>>   	.has_always_in = false,
>>   	.has_inen = false,
>> +	.has_layout_gen5 = false,
>>   };
>>
>>   static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
>> @@ -406,6 +453,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
>>   	.has_both_edge_trigger = true,
>>   	.has_always_in = false,
>>   	.has_inen = false,
>> +	.has_layout_gen5 = false,
>>   };
>>
>>   static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
>> @@ -413,6 +461,7 @@ static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
>>   	.has_both_edge_trigger = true,
>>   	.has_always_in = true,
>>   	.has_inen = false,
>> +	.has_layout_gen5 = false,
>>   };
>>
>>   static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
>> @@ -420,6 +469,15 @@ static const struct gpio_rcar_info gpio_rcar_info_gen4 = {
>>   	.has_both_edge_trigger = true,
>>   	.has_always_in = true,
>>   	.has_inen = true,
>> +	.has_layout_gen5 = false,
> 
> This looks good but do we really need to change these lines if it's zeroes
> anyway?

I'm just following the pattern in the driver, which does full assignment 
of all fields for all generations of the controller. See .has_inen = 
false in Gen1 for example. We don't have to do the assignment, but maybe 
doing so is more comprehensible ?

-- 
Best regards,
Marek Vasut

