Return-Path: <linux-gpio+bounces-39152-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RMkZK66XQmo3+QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39152-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:05:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 044506DD1A2
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 18:05:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=otExSv6C;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="Z P+OSo5";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39152-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39152-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13942318E6E0
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A7942DFEF;
	Mon, 29 Jun 2026 15:48:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67A8427A1F;
	Mon, 29 Jun 2026 15:48:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748113; cv=none; b=QbUnRpW7CqSKG3RoXq6tgnW654tatDjtWxE0i3ipvPfcf3OAWU7VfQkfaHD+9cAoYtZRGFTSBRYkpW1v023lg9bvKEGf96GkBPXISitRJlFsbicb4SHBs9KJgIeDsjQp6NoTALkn6WlAw4KH7z8c52hdalrW0RlxTFBC6qLKVOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748113; c=relaxed/simple;
	bh=1McCVs2snxu+gNjJm1D421N5eVerVO5vK6JHvxW/TfQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JkXKFk2KDlXlJXEHiJi7KHZnlLSmfiBNTVT4NuzOCwqFNoPrK2cHdXG1yL3YPokO+hwyOgbfsWKZuq+Qn9iX/kTHEZ0PXILsVfk1BV4Qwbo4GqGOfMyC2pyLqp+C5B1rYUd3kSe9hofSJ6tegmtqmUBkIPSeU+bHnf8DKOq3Bpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=otExSv6C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZP+OSo5y; arc=none smtp.client-ip=202.12.124.140
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 7F8A013001E3;
	Mon, 29 Jun 2026 11:48:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 11:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782748111;
	 x=1782755311; bh=OQSYL+rcbbMvXGkfQit/IeSyVBDzp7a1uiLZytls49o=; b=
	otExSv6CCfwgU+53OmRzfq2B2DYzwG97/7OG2yFVL9SLp2zuXWfhdL/w+7nIA4id
	pS7hJpE+p/zM36qUEbCM1LqXAUyUGB34hT8s1CLctdvUhUl0w1ZhqpR2HIS3PV7o
	bsnIFZBboF30NjRkOQ9UT+Q8NXhm9E13I7offTJ2aRcuG8r2Lm82KoHQohaMMwV5
	1pog70vnywIoIEN8MJJPZBLCU4XXKtem9FHI/gOfgvqsBOGTC7GkxZFe5P2Lw2ga
	yjsSm7K9GLJMBOqJ4k1/I3YVG3A8X1aWU9NyZdVYzw3BMgCE/ro9EeoLtAyGzeFK
	Pl4J0bO7j6edaTVNsgNFEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782748111; x=
	1782755311; bh=OQSYL+rcbbMvXGkfQit/IeSyVBDzp7a1uiLZytls49o=; b=Z
	P+OSo5yef9/cf64i9oZY96JMQWrkgDB3///chYutdOeJnhuCLMIQBthaTPJcoReA
	A42wB43XIfLOAHZlUSZRrEWmaIkkJVPyR9ZrNj0Zg79fjHX5GNwFKh44vBnstNjs
	+gKwPg044HSnH3p4e5kEU8/gJdXnd5J9rcJgbSl1CjuvG8G/lzCfuRrzQSuK0yFG
	nAQ3o6X2C2t4pALrCSMONEpg+Bh0sXEMP7jMgbrh5fxsQE9kGxPzz2YGv3rx56Gv
	vpRCb8LQ5USUCARnUKXaPOljl/bpYRFLx50FMB3vSHHH4V2/reUKPVgJULvxVire
	Mkj0fQjdTFT7fm+9wEFeQ==
X-ME-Sender: <xms:z5NCakeBygjeAHHHThz3dUsTnvB6AK_UVMjKz-WZKZVRr2lluk78FQ>
    <xme:z5NCahCpYUk2lb8a1RbHVmyXeGBSy5l5DdSrmUr_uS7YYPkiTX-Ewa_wUd6Pe47oi
    fqqLUBT-9g8HmIrQlngZpk17TUMnckWDzEtut6NIZEoxunmVuyUuWA>
X-ME-Proxy-Cause: dmFkZTGx/zQGI8s/7q5psZd2hog4QvvLF8VyS3SEh6yndDN0NLF+SUROST5TuJaRfbYzsR
    kRNLz+nZnLIWxTAnVDEiVI3LWMoT76m1NPebPhT28iJCWPXc0GO7oFLEPDfrdg9tfzroWb
    HnrfV5e1jPmjz36LnDV+54JGw32aQMY40K1t7WiGcRFvXEmQH6xS4redW3l3jMN7eHVHXH
    OMUBqc4hdT1AWM82wO5kRpwsYMYMv8K7MRSSgj1UrGhr0ZavzP88ve8YyHNE7ly6hSja/5
    QiP/FqZsNFQZ34zbxnGfKyKytbn/wMNNFVGFjw0DXOPPa8n6XjB/fzcu7YZiP8PrvEJSOd
    l8wa/9o9YFghE4nmtzEFNP5GHS4DgMKC4w2rG1ksKG4K1tNod94D3VEihl/RxyL9ohAzRZ
    DV3gAxtenHg9Z5cQJzoBipUKZ9pqhmJudtox/jlSGg2Nc/v34rLMtOwqFKQfA1uoQshteX
    Fj+AMNKhMnJ4QbvjVI2RQG1hwfF0E+t7vkI/rh/pkR03lll3huezz0P+7sfFgS0BBFEc4I
    tgwdiyeO6AWLRMbzNKqGc2BGlgFQrUK3BgCvUK9m1iH9OEbmB8sUgFESS3o9AeJDZgiza+
    QtMgrmbDhds3U+BZzmooK8ccK4+ZTU4CwBh9Kr050guMXdKmxiwbffVRqy2w
X-ME-Proxy: <xmx:z5NCaqnslMw1U4x946I_QUjw_ET8HBcAAsdnOpVQMvFlVCBGjb5OEQ>
    <xmx:z5NCatSrHaFps5ZyxX5SqaW3oWWvqcDK6TzS14FaET5Pf4npQ179sg>
    <xmx:z5NCanXHY9GeHNVa3tjFzINJQ_mrCW-T7sCwo55oVGN2tZsh_Krxbw>
    <xmx:z5NCars5LXs8k9icxryzzfrpvBcoTsGtWAAjyBjSc4vWQn2-iQYc8Q>
    <xmx:z5NCarutsUgfjq0e6Ud1ZnN0qPM1Eju682i8umHuTCrQdRzm5WnqOIk6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 215901820082; Mon, 29 Jun 2026 11:48:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A045QOfflcQ7
Date: Mon, 29 Jun 2026 17:48:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Marcel Holtmann" <marcel@holtmann.org>,
 "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Ulf Hansson" <ulfh@kernel.org>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org
Message-Id: <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
References: <20260629135917.1308621-1-arnd@kernel.org>
 <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39152-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:arnd@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:geert+renesas@glider.be,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:geert@glider.be,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,samsung.com,glider.be,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,messagingengine.com:dkim,vger.kernel.org:from_smtp,arndb.de:dkim,arndb.de:email,arndb.de:from_mime,app.fastmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 044506DD1A2

On Mon, Jun 29, 2026, at 17:29, Geert Uytterhoeven wrote:
> On Mon, 29 Jun 2026 at 15:59, Arnd Bergmann <arnd@kernel.org> wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Most remaining users of desc_to_gpio() only call it for printing debug
>> information.
>>
>> Replace this with a new gpiod_name() helper that returns the
>> gpio_desc->name string after checking the gpio_desc pointer.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for your patch!

Thanks for testing!

>> --- a/drivers/gpio/gpio-aggregator.c
>> +++ b/drivers/gpio/gpio-aggregator.c
>> @@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
>>
>>         fwd->descs[offset] = desc;
>>
>> -       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
>> -               desc_to_gpio(desc), gpiod_to_irq(desc));
>> +       dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
>> +               gpiod_name(desc), gpiod_to_irq(desc));
>>
>>         return 0;
>>  }
>
> Before, this printed:
>
>     gpio-aggregator gpio-aggregator.1: 0 => gpio 589 irq 188
>     gpio-aggregator gpio-aggregator.1: 1 => gpio 590 irq 189
>
> After, this prints:
>
>     gpio-aggregator gpio-aggregator.1: 0 => gpio (null) irq 188
>     gpio-aggregator gpio-aggregator.1: 1 => gpio (null) irq 189
>
> Same results for instantiation using sysfs or configfs[1], although
> the latter does have optional support for specifying the name.

I wonder how many of the other instances have the same problem
then. Would it be appropriate for gpiochip_fwd_desc_add() to set
a name itself to address this one?

       Arnd

