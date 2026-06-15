Return-Path: <linux-gpio+bounces-38461-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S4BfGMyyL2qoEgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38461-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:07:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3122684681
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:07:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=kxUC0xZp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38461-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38461-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D88A5304148D
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B693E3C09EB;
	Mon, 15 Jun 2026 08:01:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA33BED33
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:01:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510506; cv=none; b=AYL1oCtIPT9sYcXyUHy1RERju9jz9HrLhaGcMtuIAl88Rry9KvvckYYL4otRIIlKa1J0Qsxm37gd5VYSBrKJoSp5A/dQhaHRzzVtv9xGI1MdIhpLxF162GOLLACCuhr4tDl3b6yRm/lrTv+X0lgeiCLKHe5vBxZVclTzMwYM7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510506; c=relaxed/simple;
	bh=dio2YD2WRbBLjuc0JXrnAC2MHwLnPhYUdsE5jmwthaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoXNM12RRu8vSGHskDDXm5E8N2fnuRfdTIFpBH91uS1gQz6gEB3QyrQswGLGtipKkEvcRPNIvVLmQbLbjbdbdug6lS4RqBEogXJVLkrsGsRlmQC4fPzB17q4/hbjd9kw3ggtrEkDJM8bkWj++n+WswJze0xRgF0sW4eRdnTbIME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kxUC0xZp; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE3E74E42F22;
	Mon, 15 Jun 2026 08:01:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A5C660015;
	Mon, 15 Jun 2026 08:01:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 652A8106C929D;
	Mon, 15 Jun 2026 10:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781510493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IFrkftsCJkXAboWXq2P9paFEjGuUUbQSe8YFs1mbcyA=;
	b=kxUC0xZpAydStGi0AcRC7XY/6OBYa0JURrHxYo/hO5ZzKcD1LG/lgve6cqoZfNQrMsnpl4
	SFMPlicZxmG3b2MZj46JmHHH4E7xWb/gTdIHGZKAcoOMNVGayAtLYUn8j5Qua5Or/XFfUQ
	W3j46b59Wkm/bzC40ZMZunsvL8n5o+nYlGtVOP3JH/gChpkgWchlJEzdWEPyrlfpLq1r2y
	bInP+ToTLnRlZcoJF4bHQsvLSPlr10MCokpYFNyEy2K4wPGg0b9KISL8oRTJ8fHIFYLnxZ
	3GJe6Gtk0mxZen8PCxZWA4RZ8az4/2C9DO8YVsDF3Fhf2AYMfu5lxyESeubu2g==
Message-ID: <d6453a9c-d2f1-4aef-8caf-e351c210d6bb@bootlin.com>
Date: Mon, 15 Jun 2026 10:01:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: GaryWang <is0124@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Daniele Cleri <danielecleri@aaeon.eu>,
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38461-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3122684681

Hello Gary,

On 6/12/26 12:13 PM, GaryWang wrote:
> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12",
>  "UP 7000" boards and I2C/PWM/UART/SPI pins mapping data.
> 
Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,
Thomas

