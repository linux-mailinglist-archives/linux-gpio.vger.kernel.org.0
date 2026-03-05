Return-Path: <linux-gpio+bounces-32614-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKMRJZzfqWm4GgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32614-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:55:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A66217D40
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 20:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C4AE3089795
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 19:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBEF3EB7EF;
	Thu,  5 Mar 2026 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="B9l2QOJz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15143EB7E6;
	Thu,  5 Mar 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740458; cv=none; b=KV9x1EZRP6dbIE++G7drbpSHyZsU8SjW2M8lDGmPvtoDGGlXcRfHzBePR/EBxzUVAv3h0FpyOCCqgHqwaVn8+7Y0FTVqu7YUVhvP63OdWCas1Zd7ajJY0uQ/J3Cqv4FhVCHbdJNA7kVfrk9rRoVp4b8yRwLR/Q3zqoKDuheqUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740458; c=relaxed/simple;
	bh=XBqM4bs5J6Hv72N2/p1rqCsh6vwggkjVOiUcTcGYUjA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=FKSp0Qbnwev8L/9MkDi3f3SJ5bMH3QrE1pC0EFdRmPFR661QN6DeXvPQiDuTGJOLpviAFh9Nj/RfIjpseRSsJHgBWJOjfNA4Gp3Or52vQWM1IJ0U3vi5Yn3d4M7bcmrqh9gMNwEDQZpEOPmak2Az93E2c1Ldo+t9s7xtzmb6eYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=B9l2QOJz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6F4922710D;
	Thu,  5 Mar 2026 20:54:08 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UdGDb1XIa3m; Thu,  5 Mar 2026 20:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1772740447; bh=XBqM4bs5J6Hv72N2/p1rqCsh6vwggkjVOiUcTcGYUjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=B9l2QOJzOh2QxV7//mVBInca6X2rCtKZkyLwnonVyvrhxZfZgJORGB2bXL6Mhia0u
	 2s1bD2Wq7VknWP9qKR+TGbDmNHcgADwfvh4Xh/q0J39Ab4xnai80rRDU3JH0Uz0kgI
	 tSTHRZzjmX9RwoCxkVIkI77lORHwRc19XwwGPy6OLSypc+J5gYCShDQ+oXHeAOrS/8
	 MYduAQcMuwCXsSWtg0+YN2RbKnC7KsNG6pSHyu4OWArl4PU02D3mA5Voct6TssU58T
	 b570i6UP6wBIErFoeZLHPGWiev3J78PVQ21Hon9NHXPuEMiOXlVnzMlxfSWSUdoJOR
	 /Vdd7Lvvl8J/g==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Mar 2026 19:54:07 +0000
From: adilov <adilov@disroot.org>
To: Sander Vanheule <sander@svanheule.net>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bert Vermeulen
 <bert@biot.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: realtek-otto: add rtl9607 support
In-Reply-To: <f92a2a8558ebff7a145ece97c2bc44f1f7aafd26.camel@svanheule.net>
References: <20260305161106.15999-1-adilov@disroot.org>
 <20260305161106.15999-3-adilov@disroot.org>
 <f92a2a8558ebff7a145ece97c2bc44f1f7aafd26.camel@svanheule.net>
Message-ID: <6a8538a1990dc02a6a0bdbf60ebd747f@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E5A66217D40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32614-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adilov@disroot.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-03-05 19:04, Sander Vanheule wrote:
> Hi,
> 
> On Thu, 2026-03-05 at 21:11 +0500, Rustam Adilov wrote:
>> The RTL9607C SoC has support for 3 GPIO banks with 32 GPIOs each and
>> the port order is reversed just like in RTL930x.
>> 
>> Signed-off-by: Rustam Adilov <adilov@disroot.org>
>> ---
>>  drivers/gpio/gpio-realtek-otto.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/gpio/gpio-realtek-otto.c 
>> b/drivers/gpio/gpio-realtek-
>> otto.c
>> index 4cf91528f547..5e3152c2e51a 100644
>> --- a/drivers/gpio/gpio-realtek-otto.c
>> +++ b/drivers/gpio/gpio-realtek-otto.c
>> @@ -351,6 +351,10 @@ static const struct of_device_id 
>> realtek_gpio_of_match[]
>> = {
>>  	{
>>  		.compatible = "realtek,rtl9310-gpio",
>>  	},
>> +	{
>> +		.compatible = "realtek,rtl9607-gpio",
>> +		.data = (void *)GPIO_PORTS_REVERSED,
>> +	},
>>  	{}
>>  };
>>  MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
> 
> If I'm not mistaken, this SoC has a MIPS InterAptiv CPU like the 
> RTL931x SoC
> series. Were you able to validate that the interrupts are functioning 
> as
> expected?
> 
> Best,
> Sander

Hi Sander,

Yes, this is correct. I played around with gpio-keys in OpenWrt (though 
it
has its own gpio-button-hotplug but it should not change things) and can
verify that button presses and releases are working. I think this should
confirm that interrupts are functional.

