Return-Path: <linux-gpio+bounces-37884-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UB08JjnlH2rirwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37884-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:26:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 47932635AE0
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 10:26:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UDE3Hajx;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37884-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37884-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 194CB30561A3
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 08:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C6142189B;
	Wed,  3 Jun 2026 08:23:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192540913C;
	Wed,  3 Jun 2026 08:23:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474993; cv=none; b=u/D5wxChU91PV9NGMwROLT2Zny6Jd4bMI6lkbAAaLc+fxNy8ESRJ73mHV/BUpnIlKuV7evVCMXq+TZXYlnsjo70H6UwT4Wq/hlVDF4R58SF8M/iLvgCrT2eg65T2kQmrr+nfQAoiyFyXAzDKuCdnn746VDwhghUzopUPIAiJa3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474993; c=relaxed/simple;
	bh=lsDa8bcyL/weB227DDTHB3UWrYz4tq4iEuxgOqLYjJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cK2IwLfTGD4Wnb4ZXLKMdBa08wRNzKrgSDrhHYEwWIbdi+COH26BQOsYNwyEdHgybpcm5JeAo/ZTW44NS/1bCmA0WWvtPIg+XhzIlIuTPemeMYhEUVEuWE2jlesG4soIsiaKQF++SQqLl7ATW0+ACAlqUjlkfUJqIvsvWdt6aH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDE3Hajx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9D51F00893;
	Wed,  3 Jun 2026 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474991;
	bh=7T9hB45nEUAMnqC9Be3PzNhtHY4KvHFd+RrPaHZ6pDU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UDE3HajxGV1AEr7ckHI4uoOTzFrcsbc+wm2PLS8Zfy0g3MIqMVlDLmXBYYXJ14oZ8
	 7vjSN+CLdkFxzo+V4fKKKxeQGQIT9DBa413jRN6BTIQ7u5EiL1eYx9SDa6o+A9PGeE
	 mvRp5KWSIyogwjHF+vy2HUlrMddDB0YyBExSrTgCwz1O2WLoBRVnwnUCaOpAT5fOao
	 9qJpmI2v/yswoFNZ4gmSKgbx1f8Ct8e7CB51ocI9OpBqPrblniosTabqiBPtPvk+qC
	 cvTV937q9GD0oSF/U5v1k73lYgZxMiP46U2ZQL6LPxhQhxRpHf38WMdTPH0iVK+/YE
	 5BrA9Xsd4KEkQ==
Message-ID: <5ce415f7-5a21-44b2-bdfe-a6040f5392a5@kernel.org>
Date: Wed, 3 Jun 2026 10:23:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpiolib: Remove big fat warning in
 gpiochip_get_direction()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: PRAT Maximilien <maximilien.prat@cs-soprasteria.com>,
 Linus Walleij <linusw@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <63487206f6e5a93eaf9f41784317fe99d394312f.1780399750.git.chleroy@kernel.org>
 <CAMRc=MdngQbJVQTZXvPKzFjcLOPs4=-6Jtf4Ua4AU0D+sUb9bw@mail.gmail.com>
 <24500088-9849-46e9-b32f-3f08c2ae6261@kernel.org>
 <CAMRc=Mf9-+MCWANv5hS5g7U7jPBYzS=uQpWXSCKS1JO56uSPqA@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAMRc=Mf9-+MCWANv5hS5g7U7jPBYzS=uQpWXSCKS1JO56uSPqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37884-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[cs-soprasteria.com,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:maximilien.prat@cs-soprasteria.com,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47932635AE0



Le 03/06/2026 à 10:11, Bartosz Golaszewski a écrit :
> On Tue, 2 Jun 2026 23:40:22 +0200, "Christophe Leroy (CS GROUP)"
> <chleroy@kernel.org> said:
>>
>>
>> Le 02/06/2026 à 18:13, Bartosz Golaszewski a écrit :
>>> On Tue, Jun 2, 2026 at 1:31 PM Christophe Leroy (CS GROUP)
>>> <chleroy@kernel.org> wrote:
>>>>
>>>> Since kernel v6.15 the following big fat warning is encountered when
>>>> reading /sys/kernel/debug/gpio, leading to kernel latency while
>>>> emiting the warning, and panicing on systems configured to panic on
>>>> warnings.
>>>>
>>>>     ------------[ cut here ]------------
>>>>     WARNING: drivers/gpio/gpiolib.c:423 at gpiochip_get_direction+0x3c/0x48, CPU#0: cat/12531
>>>>     CPU: 0 UID: 0 PID: 12531 Comm: cat Tainted: G        W           7.0.10-gitc72c39~-01802-g28c351659258 #27 PREEMPT
>>>>     Tainted: [W]=WARN
>>>>     Hardware name: MIAE 8xx 0x500000 CMPC885
>>>>     NIP:  c043c2f8 LR: c043d740 CTR: 00000000
>>>>     REGS: ca89bc20 TRAP: 0700   Tainted: G        W            (7.0.10-gitc72c39~-01802-g28c351659258)
>>>>     MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24004884  XER: 00000302
>>>>
>>>>     GPR00: c043f3f0 ca89bce0 c3278000 c20b5f20 0000000d 00000002 00000000 c0a76208
>>>>     GPR08: 00000001 00000000 cccccccd c313d830 84004884 100d815e c0a76208 c0a761f8
>>>>     GPR16: c0a761f4 c0a76278 1048834c 10488350 c21c0b04 c21c0d93 c0a5fb74 c313d848
>>>>     GPR24: c20b5f20 c21c0d94 00000000 00000000 c21c0d94 00000000 c21c0c00 c21c0b04
>>>>     NIP [c043c2f8] gpiochip_get_direction+0x3c/0x48
>>>>     LR [c043d740] gpiod_get_direction+0xa0/0x170
>>>>     Call Trace:
>>>>     [ca89bce0] [c28157e8] 0xc28157e8 (unreliable)
>>>>     [ca89bd10] [c043f3f0] gpiolib_seq_show+0x370/0x524
>>>>     [ca89bd90] [c021dd1c] seq_read_iter+0x174/0x618
>>>>     [ca89bdd0] [c021e260] seq_read+0xa0/0xd0
>>>>     [ca89be40] [c031063c] full_proxy_read+0x80/0xc4
>>>>     [ca89be70] [c01df3e0] vfs_read+0xb4/0x35c
>>>>     [ca89bee0] [c01e0180] ksys_read+0x8c/0x15c
>>>>     [ca89bf10] [c000dc94] system_call_exception+0x88/0x154
>>>>     [ca89bf30] [c00110a8] ret_from_syscall+0x0/0x28
>>>>     ---- interrupt: c00 at 0xfc629e8
>>>>     NIP:  0fc629e8 LR: 0fc62a34 CTR: 00000000
>>>>     REGS: ca89bf40 TRAP: 0c00   Tainted: G        W            (7.0.10-gitc72c39~-01802-g28c351659258)
>>>>     MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28004884  XER: 00000302
>>>>
>>>>     GPR00: 00000003 7f8df6a0 77e37540 00000003 7f8df6e8 00001000 00000000 00000000
>>>>     GPR08: 00000000 7f8e3efc 00000000 7f8e06f0 7f8e3efc 100d815e 7fe70e10 100d0000
>>>>     GPR16: 100d0000 00000001 1048834c 10488350 22000882 77e3fe68 1000596c 77e40b28
>>>>     GPR24: 00000000 28004884 01000000 00001000 7f8df6e8 00000003 0fde36a0 00000000
>>>>     NIP [0fc629e8] 0xfc629e8
>>>>     LR [0fc62a34] 0xfc62a34
>>>>     ---- interrupt: c00
>>>>     Code: 9421fff0 7c0802a6 90010014 7d2903a6 4e800421 2c030001 40810008 3860ffcc 80010014 38210010 7c0803a6 4e800020 <0fe00000> 3860ffa1 4e800020 81230020
>>>>     ---[ end trace 0000000000000000 ]---
>>>>
>>>> This is due to a WARN_ON() added by commit ec2cceadfae7 ("gpiolib:
>>>> normalize the return value of gc->get() on behalf of buggy drivers")
>>>> when the gpiochip doesn't implement get_direction() function. But
>>>> according to the documentation in <linux/gpio/driver.h> implementing
>>>> get_direction() is only a recommendation, not a requirement. And
>>>> regarless, WARN_ON() has no added value here, dumping all CPU
>>>> registers doesn't give any useful information for that case.
>>>>
>>>> Lower it to a simple warn_on_once() message.
>>>>
>>>> Fixes: ec2cceadfae7 ("gpiolib: normalize the return value of gc->get() on behalf of buggy drivers")
>>>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>>>> ---
>>>
>>> Please use scripts/get_maintainers.pl.
>>
>> That's what I did, what is the problem ?
>>
>> $ ./scripts/get_maintainer.pl --nom --nor --nomultiline --norolestats
>> --nogit --nogit-fallback
>> tmp/0001-gpiolib-Remove-big-fat-warning-in-gpiochip_get_direc.patch
>> Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij
>> <linusw@kernel.org>, Bartosz Golaszewski
>> <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
>> linux-kernel@vger.kernel.org
>>
> 
> I would expect my brgl@kernel.org address to show up, the -nom option removes
> it.

Ah .. I see. Thanks for the notice.

Indeed I use two calls, first one to populate the To:

./scripts/get_maintainer.pl --nol --nomultiline --norolestats --nogit 
--nogit-fallback

then second one to populate the Cc:

./scripts/get_maintainer.pl --nom --nor --nomultiline --norolestats 
--nogit --nogit-fallback

Then I saw same names appearing in second result in addition to mailing 
lists so I took only the second result, overlooking that your adress was 
different between the two results.

Indeed the second result was initially supposed to only provide the 
mailing lists, but since some time now it also provides names and I have 
to manually compare the two results to avoid duplicates. I need to look 
into that more deeply.


> 
>>>
>>> What driver are you using?
>>
>> I have the following ones declared in the device tree:
>>
>> 			CPM1_PIO_A: gpio-controller@950 {
>> 				#gpio-cells = <2>;
>> 				compatible = "fsl,cpm1-pario-bank-a";
>> 				reg = <0x950 0x10>;
>> 				gpio-controller;
>> 			};
> 
> I'll send a patch shortly implementing get_direction() for it.

Thanks

Christophe

