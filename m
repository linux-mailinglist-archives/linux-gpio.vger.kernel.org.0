Return-Path: <linux-gpio+bounces-38886-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PJ2XGcYZPWoNxAgAu9opvQ
	(envelope-from <linux-gpio+bounces-38886-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 14:06:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5316C5606
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 14:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=baodeep.com header.s=dkim header.b=iHUltsGX;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38886-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38886-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=baodeep.com (policy=reject);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC48F301C880
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 12:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61DA3DEACB;
	Thu, 25 Jun 2026 12:05:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D73DFC61;
	Thu, 25 Jun 2026 12:05:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389145; cv=none; b=QEhGzL/FrnA3krsehLS/9EGWMw1hoda5RnL2V4gV+SV/BgGhMponA10PUP29+py5mFv6EY3RDND4plHWLESlPkX5gAudlOlVbYs8jNaQz2w05eeQ7sCoyNT1e4EFxChEvPxNtn+m//oyXDBUok8Ga6C4mHqnDAn7ZXbsI1gJHpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389145; c=relaxed/simple;
	bh=FxD5JjqjW1gaKhHe+/B9VFLUNkdIT1Gd3a5pW/Cr4Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDb4VdAA1cegfyzSuHl1i3PJ3id0OCWZQSZkdT0zGzKpTK1RNweLdirC8JU4+3PaE8owSAqG9yxe0mc9zOieUYfG7iCF0vGKC5ynJ7Hwnn3Dh4KpmFPLFfC8IsQQNOxv8jcrhs1nE7G3PVFgJRAWPxN0/ah7OAMCNMtDzeUmzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=iHUltsGX reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EF0D1A0C8A;
	Thu, 25 Jun 2026 15:05:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782389141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9mXIj+mN0okDzD2iEIEK87JUucdAnGmmd68jsRDhCyI=;
	b=iHUltsGXX/Iok1BcHLC8NxNAXZxiLB+f7d3VPaStvR6pB8Z9s3jDvPszknOwZwAJFsv/SJ
	HFGmAa/Kypg57bgHOa4XwhwnZZie1Y9j7TsMAt0cP6PC+1G5EhxOZXsZQyqI0OFkbOGkUx
	neQ857sOVo4ggIOzoT4h668BIdiHwrcauN7lTfDDXkbC8eGDCwCXGoEbk6z0f/1YjPO5zK
	6zvUs+KbcYqJgZ9X9Rs9T+ThfEwVkeWwZ61fZDSBTVsVzBWALbKYy0KUeRaqCaZW5nvQzm
	enUSEkzFyHe6r9+KCLS9ZHFgOYc6J0tepzgcTtxA9WkCJGejnRM4jfSZel/PVA==
Message-ID: <49c2aeb0-39b9-4bbe-833e-b18e38167f8e@baodeep.com>
Date: Thu, 25 Jun 2026 15:05:41 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
 <20260610153329.937833-1-v@baodeep.com>
 <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
 <112d2563-e650-4881-bba0-335f6a3fcb8a@arm.com>
 <CAMRc=MdP8Wf6QRXGHpb3KJW2KMidSe-0LeyKKTYix=wYKZcPuA@mail.gmail.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <CAMRc=MdP8Wf6QRXGHpb3KJW2KMidSe-0LeyKKTYix=wYKZcPuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_REJECT(2.00)[baodeep.com : SPF not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[baodeep.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38886-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[baodeep.com:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[v@baodeep.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,baodeep.com:mid,baodeep.com:from_mime,infradead.org:url,infradead.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB5316C5606

Hi!

24.06.2026 10:25, Bartosz Golaszewski wrote:
> On Tue, 23 Jun 2026 17:16:44 +0200, Robin Murphy <robin.murphy@arm.com> said:
>> On 11/06/2026 9:26 am, Marek Szyprowski wrote:
>>> Hi Viachesla,
>>>
>>> On 10.06.2026 17:32, Viacheslav Bocharov wrote:
>>>> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
>>>> the underlying chip's can_sleep, but under that lock it calls config and
>>>> direction ops that reach sleeping pinctrl paths. On a controller with
>>>> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
>>>> runs from atomic context:
>>>>
> 
> ...
> 
>>>
>>> I've checked this patchset with these two reverted and no warning was reported.
>>
>> If it hadn't already been fixed (...)
>>
> 
> About that - Viacheslav, do you still plan to submit v2 of this?

Thanks for review. I prepared and sent the second version of the patch today

> 
> Bart
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


