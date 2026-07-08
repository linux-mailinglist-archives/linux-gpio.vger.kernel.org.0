Return-Path: <linux-gpio+bounces-39672-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FohVIKxJTmrxKAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39672-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:59:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18F7268A1
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=Xyawtce3;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39672-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39672-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C93193017CCA
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 12:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E527E45BD4E;
	Wed,  8 Jul 2026 12:55:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1E4451056
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:55:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515334; cv=none; b=nyE72aAaNzl+hXl7M+RblrYoL8cDzpjqmAUo6YgWOhFX8Rik8Bh3450pher5Hm79TngtKv1Siz0sacWEd9joJJBZ0o4Qs2oNcfDhostxRtjLFFmX5u8xwRt8YdrvP2M/+dDkGRQTlVdOpAeypFQmgV9IYfFOdIjFmvN8cKRUkv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515334; c=relaxed/simple;
	bh=/bFAwiYMv47HhoNWDuEpWJB1RYkUKPdZeomTyJf2lJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muduNsytZpYeOdurmvOkJPfdCZDabe7owXdbrue+s/xKz3bQOt1K5Jg2C/+ykbEtz3C/RJwU0hGIg2YIXaA7+pHpi7n1SmfUeiiB0D4tyvNOHGsoxk/k8zq043TT9MsU4WabW1mr/SOlzyWTO6wZ2y3h6SKUkNqEfILy1vJ4oKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xyawtce3; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 923314E40CF0;
	Wed,  8 Jul 2026 12:55:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D5BE60339;
	Wed,  8 Jul 2026 12:55:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72C3A11BC0D0F;
	Wed,  8 Jul 2026 14:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783515329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=faXxrEjfq2X82uM2/vw2iMOqXtkhpsgI4P+WkebPOv0=;
	b=Xyawtce3FWKXPOVvaUJ1fn5Rgxi//nHizIA11+PM3VStSZUDBOIqeY3KFkyGFzhEzJsnEk
	ifO1Wkeg15mu7fy9rcjln/5hPnXExwp/aPY5dbLWIfDjJEkByvGLOFocQ+zVqwaNQFfZgx
	M308QC/fi0OZR456TYCr+5d35nRPGdjy45mhVl1mtea4T+LSuLXU4ibSAlI8Kdk1AAAsUF
	XCrkkn/qtFMqme01CNPObPsNX9IjW9lDp1r0aUS6dznKmMHDKvNhtH0Vbc1ELkf7ML+/O+
	TjZ1Xo1k2jcCOwNFYzdPELdE3T9jwoWW2l/d/f5eqeTazkIE8WlMcBzkFpmjkQ==
Message-ID: <269d40d1-7783-4eca-8cee-3e2001cc6ccc@bootlin.com>
Date: Wed, 8 Jul 2026 14:55:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: GaryWang <is0124@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>,
 Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
 <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com>
 <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
 <b2ee8bf9-de42-441a-97fb-2e42ad882b5e@bootlin.com>
 <CAHp75VcGGC8Z5vGN+RQtSA2N+s9ViH-tHi_BjT-_SWPVVoLQxA@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAHp75VcGGC8Z5vGN+RQtSA2N+s9ViH-tHi_BjT-_SWPVVoLQxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39672-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,aaeon.eu,aaeon.com.tw,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.richard@bootlin.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C18F7268A1

On 7/8/26 11:21 AM, Andy Shevchenko wrote:
> On Wed, Jul 8, 2026 at 10:49 AM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>> On 7/7/26 5:55 PM, GaryWang wrote:
>>> On Tue, Jul 7, 2026 at 7:50 PM Thomas Richard
>>> <thomas.richard@bootlin.com> wrote:
>>>> On 7/6/26 12:36 PM, Gary Wang wrote:
> 
> ...
> 
>>>> I tested the IOs:
>>>> - pwm0 does not work.
>>> you have to use our pwm kernel module for pwm test, I'll provide later.
>>
>> Ack
> 
> Can you, folks, elaborate why this is a requirement and what exactly
> is not working?
> 
>>>> - uart1 partially works: TX is okay, but loopback doesn't work. Signal
>>>> is bad when I add a loopback. Looks like pinctrl misconfig on SoC side.
>>> uart1 tested ok on our side, if you loop TX/RX do not forget to turn off
>>> hardware flow control. and we have executed cmd as below to make sure
>>> direction is set all right.
>>> echo "uart1_grp uart1" >
>>> /sys/kernel/debug/pinctrl/upboard-pinctrl/pinmux-select
>>
>> I did some tests with/without flow control using linux-serial-test tool.
> 
> I'm sorry it's not so clear to me, does it mean the serial interface
> is (still) not properly working or you have done that pinmux
> configuration and everything becomes fine (as Tested-by tag suggests)?
> 
> ...
> 
>>>> - for SPI, MOSI and CLK are okay, but not CS.
>>> Do you have enabled spi in BIOS HAT configuration?
>>> CS0 should be ok, it's SOC defined, CS1 is optional, users can activate low by
>>> himself before read/write, actually all gpio can be manually used as CS pin.
>>
>> I applied an ACPI overlay. I'll test it again.
> 
> I suppose this part is not as critical and I just wonder what the test
> results are.
> 
> ...
> 
>> Anyway these are not related to this patch series.
>> Thanks for the clarification.
>>
>> Tested-by: Thomas Richard <thomas.richard@bootlin.com>
> 
> So, after all, are they all good to go?

Yes,

I tested all functions and it is okay.

It was my fault, my test script did not select pingroup and function
correctly, so FPGA pins were misconfigured.

You can pick my TB tag.

Best Regards,
Thomas


