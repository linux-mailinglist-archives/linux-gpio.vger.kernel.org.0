Return-Path: <linux-gpio+bounces-31027-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LX2DNngc2k0zQAAu9opvQ
	(envelope-from <linux-gpio+bounces-31027-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 21:58:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3077ACAB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 21:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BB94301BC16
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 20:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459182EDD4D;
	Fri, 23 Jan 2026 20:57:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84174256C70;
	Fri, 23 Jan 2026 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201878; cv=none; b=tsltzvagpAUqhM6MNEJngYhp9ID3vxPTDgH3IvGWMaUV0uFQNTdMExtzJMVEXJwX6oEYzPuoK/4UXSu2UDXUHV2j0g/3SUwr30JMQurSfjishEFUiFLHv86w9C86Xoy1AchFAr+617grn/rDGEAyB/KTxl2qi16fCw9XEMVBTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201878; c=relaxed/simple;
	bh=oTLfKQMhMf/G1/ZFs0kiRU3UcXziZ1w9OCfVwFS5rIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiHN4Wrdlt+rUD8BYieYWRGqV5HL7uncInu2vsCv2XWRmK6smo4d9GT6j0OsZOABmNtDjXji8cGrdBnfe/0NLT67qIecr8K5J3y61363zRT4O4bibTNs6AzyDYi1TNaxuNQf9O3sFsrRL5wTvugOEbN+fMFzneqZgxTT48sPC+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 122ED1476;
	Fri, 23 Jan 2026 12:57:48 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2A1B3F632;
	Fri, 23 Jan 2026 12:57:52 -0800 (PST)
Message-ID: <e9fd0005-bfbb-4052-8c2a-9200eb0b60ac@arm.com>
Date: Fri, 23 Jan 2026 20:57:50 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <aWGSQYCXP4R08koQ@venus>
 <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
 <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
 <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-31027-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8C3077ACAB
X-Rspamd-Action: no action

On 2026-01-23 7:27 pm, Bartosz Golaszewski wrote:
> On Fri, Jan 23, 2026 at 2:27 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>>>>
>>>> It's not a big issue for the hdmirx driver specifically, but I wonder
>>>> how many more (less often tested) rockchip drivers use GPIOs from their
>>>> IRQ handler.
>>
>> Yeah, seems this finally reached my distro kernel and now the kernel log
>> on one of my boards is totally flooded from gpio_ir_recv_irq()
>> (legitimately) calling gpio_get_value()... that's not really OK :/
>>
> 
> This has always been a sleeping driver. The driver does not know the
> firmware configuration it'll be passed and - as I explained above -
> depending on the lookup flags, we may call .direction_output() and
> descend into pinctrl which uses mutexes. Ideally, we'd make
> GPIO-facing pinctrl operations not sleeping but this is a long-time
> project and quite complex. Telling the GPIO core that it cannot sleep
> is simply incorrect - even if it worked for this particular use-case -
> and has an impact on paths we're choosing.
> 
> Can the GPIO reading in the gpio-ir-recv driver be done from a
> high-priority workqueue by any chance? Or can we make it a threaded
> interrupt?

rockchip_gpio_get() is essentially nothing but a readl(), please explain 
how that could sleep? Saying that countless in-tree and out-of-tree 
arbitrary GPIO consumer drivers should pointlessly refactor just to 
avoid the GPIO core spewing spurious WARN()s is not reasonable.

I appreciate there are cases where the warning most definitely *is* 
relevant, which is why I picked up this discussion rather than proposing 
a revert, even though the documentation says:

  * @can_sleep: flag must be set iff get()/set() methods sleep, as they

where since neither rockchip_gpio_get() nor rockchip_gpio_set() 
themselves sleep, apparently this flag must *not* be set. It's 
irrelevant that a higher-level gpiod_set_value() invocation might end up 
calling .set_direction before it gets as far as calling .set - that's 
not the gpio_chip's fault, and gpiolib knows exactly what it's doing.

What I'm getting at is that getting, and even (directly) setting a 
GPIO's value can reasonably be expected to be more common and applicable 
in a wider range of circumstances than changing its configuration, so 
the former should not be unfairly penalised because of the latter. This 
case is clearly distinct from external GPIO expanders on buses that 
fundamentally can't guarantee fast memory-mapped access at all, so 
trying to conflate it under the same flag doesn't fit, and that needs 
fixing ASAP, before the reverts *do* start piling in. Maybe that just 
means some new dir_can_sleep or more abstract dir_needs_pinctrl flag 
might suffice, maybe it's something more involved; I don't really know, 
and I don't have the bandwidth to take this on myself.

Thanks,
Robin.

