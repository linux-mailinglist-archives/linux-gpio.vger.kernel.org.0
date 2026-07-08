Return-Path: <linux-gpio+bounces-39624-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 40+dJ4cFTmo7BwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39624-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 10:08:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2943722FB6
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 10:08:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="DaFL18/h";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39624-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39624-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E83353137FDF
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 07:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463163FCB2A;
	Wed,  8 Jul 2026 07:49:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56113F8EAB;
	Wed,  8 Jul 2026 07:49:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496973; cv=none; b=iTMPCw58SD6ftssk+BKnsXLW+ZU6J3wEUZIRTO07lQywe3NCmiJW6CbM5FA9C+0VCGO2cVxXElSZTaRA4ZBxXVRMkJp1SdwGGjmAC5bZ2a/2sit4AsGhRegPj/ASJsdgzz32ekwKAWRiyqQDneh+soeHSmfoeAOMWGdt25v/UjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496973; c=relaxed/simple;
	bh=Mk083OPOAAfd08lOviDsFpuit5RlNZwp80hUPUoNoMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR9zYOIxctu96G0ZAp50lDGm5ZnvA3Vw9hZ3YbkSfuI82CIYp7IVguOaKY6CFeKNWuE97ZsE40ckG+iPWVtWx69WjoaXBcfRLrFhSD7MTEo24CYGn6jOBn0aa+gBdzLymkIOIWGOyKqwtHKBLF8TR8wu3jnrhh8znoTkKlr1vEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DaFL18/h; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E0154E40CF0;
	Wed,  8 Jul 2026 07:49:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20E8660337;
	Wed,  8 Jul 2026 07:49:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3A0A11BC3233;
	Wed,  8 Jul 2026 09:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783496951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Mk083OPOAAfd08lOviDsFpuit5RlNZwp80hUPUoNoMk=;
	b=DaFL18/hjvSbR+iPd4tEOw8m+VKTK9tluCu18F++DB5/T4entFAyyG7NR/Ha2/ipUU09LN
	PzNww64s3Wcx4fCrRGMcF3PaV5cnhLjplw0mfIJajymRc1VfZZyL82xUBGQFbjxGtHPcde
	8ANkIJ28fcQP/1Z+KZB3NcG7FiutuXkbjEY30We1HMbVpIsbi5twMkGGQkpejb//XbHDUE
	LTCy9YQV5pS8Iy/+h9U9V9Hbjf0WltclcymDqZnP6yNc7k7eJrvKPorHC28/as0D8WEATW
	PhcO1WpElpmyBl/dgcWu9P7JLloCGKH+UY/3YWxanz+zeYjWQfE66SCEE2kRrw==
Message-ID: <b2ee8bf9-de42-441a-97fb-2e42ad882b5e@bootlin.com>
Date: Wed, 8 Jul 2026 09:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>,
 Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
 <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com>
 <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39624-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:from_mime,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2943722FB6

Hello Gary,

On 7/7/26 5:55 PM, GaryWang wrote:
> On Tue, Jul 7, 2026 at 7:50 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>>
>> Hello Gary,
>>
>> On 7/6/26 12:36 PM, Gary Wang wrote:
>>> Add support "UP Xtreme i12" and I2C/PWM/UART/SPI pins mapping data.
>>
>> Driver probes successfully on UP Xtreme i12.
>>
>> I tested the IOs:
>> - pwm0 does not work.
> you have to use our pwm kernel module for pwm test, I'll provide later.

Ack

>> - uart1 partially works: TX is okay, but loopback doesn't work. Signal
>> is bad when I add a loopback. Looks like pinctrl misconfig on SoC side.
> uart1 tested ok on our side, if you loop TX/RX do not forget to turn off
> hardware flow control. and we have executed cmd as below to make sure
> direction is set all right.
> echo "uart1_grp uart1" >
> /sys/kernel/debug/pinctrl/upboard-pinctrl/pinmux-select

I did some tests with/without flow control using linux-serial-test tool.

>> - i2c busses are okay.
>> - for SPI, MOSI and CLK are okay, but not CS.
> Do you have enabled spi in BIOS HAT configuration?
> CS0 should be ok, it's SOC defined, CS1 is optional, users can activate low by
> himself before read/write, actually all gpio can be manually used as CS pin.

I applied an ACPI overlay. I'll test it again.

>> - all GPIOs are okay.
>>
>> Could you have a look please.

Anyway these are not related to this patch series.
Thanks for the clarification.

Tested-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,
Thomas

