Return-Path: <linux-gpio+bounces-38476-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3aRaLvXHL2pOGQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38476-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 11:37:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD876851C3
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 11:37:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=RzpWtyhq;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38476-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38476-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEE9F3006688
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 09:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BE83DA5BD;
	Mon, 15 Jun 2026 09:37:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0C3DA5B7;
	Mon, 15 Jun 2026 09:37:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516275; cv=none; b=PlZ3hKswzm2KNPEkSKrFxzOVJ1oyygSayT4Im7ZuRRwA134TNmN9q9AeFCgRupCxBEbmrUHau/btNLorF8CWyRH/cG6kdTfgTOndJKDuQrAqcBXxJvoGXKxMsy91yDYchqqdGQ0I0LsNVTuShYzcQvd2/EafBJFYdj3qyQe8Ixc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516275; c=relaxed/simple;
	bh=7NLGKZJ4ibNQziV+KGRwZz3+lAlEW5aI4YGoryqgWVI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HfUjJCtkC9BJapwupliyoVfgLRgz0VGOBEHktdeRrvgaBYXU1hrnCpOZNxn1Fp2IL1/P4fGQYKiMNfSYO9y98iQNREUI/yvCG3KUNGcbD+zuy25CbFUA9gOEe9iwiatzmrb3HPTiBgRa4Pg+bWT7X9GA0ff8a9cS3qVyNieBivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RzpWtyhq; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 93507C2BB2A;
	Mon, 15 Jun 2026 09:37:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70DDC60015;
	Mon, 15 Jun 2026 09:37:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E44B106C9443;
	Mon, 15 Jun 2026 11:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781516269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3kV7JAYiWEBu8X3hZc5VxgMGHyRgZSWQ4SqGl4X9pLk=;
	b=RzpWtyhqwjaPCkD70ywDEG80OdYTy8ldkLPWJ399L/T/Fn8fzMIO0sk6Qrj8vH3NenOuQO
	BdX8PhJYKR/3WRGdSabiKMwq12tpsOl2nwxPcNOZp4yUWuxxYQkG7x1mHFwMrWXE78Gwg9
	ehBz5t7adjZ7ZxqjfNICxp6mYuJ8XzmsL+Snfvo1asKpEcpKytJD2IUJ9M5C4kUfVjc4N4
	rhm+onMRs/EJb+2+bWhXQuyLZDFK3whl6zM1qNmKJGobr6Ik3Ko8LM4wpm5ZirZWdLzuJb
	C19D714BcS7HYC3FvoE3lDarrz/m+xx6X7Svs/R4jQONyQpC65Vj7zSmYhdGMw==
Message-ID: <cb694725-b3f3-40a3-94c7-0c1606aaea94@bootlin.com>
Date: Mon, 15 Jun 2026 11:37:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
From: Thomas Richard <thomas.richard@bootlin.com>
To: GaryWang <is0124@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Daniele Cleri <danielecleri@aaeon.eu>,
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
 <d6453a9c-d2f1-4aef-8caf-e351c210d6bb@bootlin.com>
Content-Language: en-US
In-Reply-To: <d6453a9c-d2f1-4aef-8caf-e351c210d6bb@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38476-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BD876851C3

Gary,

On 6/15/26 10:01 AM, Thomas Richard wrote:
> Hello Gary,
> 
> On 6/12/26 12:13 PM, GaryWang wrote:
>> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12",
>>  "UP 7000" boards and I2C/PWM/UART/SPI pins mapping data.
>>
> Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> Best Regards,
> Thomas

I did test your series on UP Squared Pro 7000 and pinctrl driver does
not probe. Pinctrl device INTC1055:00 does not exist on this board.

[   12.818773] upboard-pinctrl upboard-pinctrl: unknown pinctrl device
INTC1055:00 in map entry, deferring probe
[   12.818795] upboard-pinctrl upboard-pinctrl: error -EPROBE_DEFER:
Failed to select pinctrl
[   12.818801] upboard-pinctrl upboard-pinctrl: Driver upboard-pinctrl
requests probe deferral
[   12.818834] platform upboard-pinctrl: Added to deferred list
[   12.818894] platform upboard-pinctrl: deferred probe pending:
upboard-pinctrl: Failed to select pinctrl

Did you test your series on all boards?

Best Regards,
Thomas

