Return-Path: <linux-gpio+bounces-30167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A72CF4F90
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DAB830060FF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E14314B89;
	Mon,  5 Jan 2026 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j8Itlb2i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C352F60A2
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633759; cv=none; b=NlbBpJ+0wu1FDvoXq4kNbcXIKwNJyd94j5/t7PVAbmO7Iyto7RAkW7IxzsFs3gtn+U2JiTcif5bgF3+g1jevDl0Kejl4GBO5OoaD/+F77fQtisCWf7ocXnwG4OsuGYRyXluNLDGXIyn5DvUokBbaRREj0EwHsvw9/sm14jryjFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633759; c=relaxed/simple;
	bh=xDVJzZV1vTGFToFTSaRAAt/2OxG49QMQBoU/QyYEhpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=SxGKD79qYFN7tdQhUxzWoOKaZeaQMJZVqXnnBsfXnt4cvjKo87yOnrPyRJlF841e4fKfRsq39I3hcaYJnaKaRedJo6rNZgq+8rQaxD/ENAuOF7HjWrFXRAgX3PqsONY+RlZOqa67INH78b8yP2fE01SdcQG/l0AExf/9ce5Yadg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=j8Itlb2i; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260105172234euoutp0267db95bc381b5544e04bc95f2c0c98d2~H5YjqRRYu0571605716euoutp02T
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:22:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260105172234euoutp0267db95bc381b5544e04bc95f2c0c98d2~H5YjqRRYu0571605716euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767633755;
	bh=dL7PsjrsSQCxLMyQpiUMZD+cf05qReFHDjOR+NOKGBk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=j8Itlb2ivsyeA92BttEXBX0nkcGwoovL0VnX1EWJ8Tsavw/X0IBio5s4sbBt5m/cX
	 W8ZOugGrBePUX8PS8FtxC3F6+HRWGKJM23cuKtZoRT0BpAFM5q6atjaOXqX15VQmrF
	 fSmu7YUtHBumC7tMuds8Npp4F3s7IFj75M32AlLU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260105172234eucas1p24e36134a1a125b0c4a2e273d8323998e~H5Yjf-CG11675716757eucas1p2l;
	Mon,  5 Jan 2026 17:22:34 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260105172233eusmtip11910bf8c532801f153c150cc09926011~H5YiZaBiQ1274212742eusmtip1L;
	Mon,  5 Jan 2026 17:22:33 +0000 (GMT)
Message-ID: <c53c4f14-cb0e-475d-baf9-c02f24e3df5c@samsung.com>
Date: Mon, 5 Jan 2026 18:22:31 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/2] gpio: shared: another set of small fixes
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus
	Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMRc=McGaZBDQp2+4Q5G_qkKu_fPDxWwsoo3MujkZs70eBDqxQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260105172234eucas1p24e36134a1a125b0c4a2e273d8323998e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260105155232eucas1p1a0d0d603716267eacef8f57f7aa5e34f
X-EPHeader: CA
X-CMS-RootMailID: 20260105155232eucas1p1a0d0d603716267eacef8f57f7aa5e34f
References: <CGME20260105155232eucas1p1a0d0d603716267eacef8f57f7aa5e34f@eucas1p1.samsung.com>
	<20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>
	<9ce71b14-b058-4192-9562-99856a89af1d@samsung.com>
	<CAMRc=McGaZBDQp2+4Q5G_qkKu_fPDxWwsoo3MujkZs70eBDqxQ@mail.gmail.com>

On 05.01.2026 17:53, Bartosz Golaszewski wrote:
> On Mon, 5 Jan 2026 17:48:05 +0100, Marek Szyprowski
> <m.szyprowski@samsung.com> said:
>> On 05.01.2026 16:52, Bartosz Golaszewski wrote:
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> ---
>>> Bartosz Golaszewski (2):
>>>         gpio: shared: assign the correct firmware node for reset-gpio use-case
>>>         gpio: shared: fix a race condition
>>>
>>>    drivers/gpio/gpiolib-shared.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>> ---
>>> base-commit: 19fb766a1e5ed5943a62fc671c09d45352a81b1d
>>> change-id: 20260105-gpio-shared-fixes-40a8ec3b6b25
>> Those patches indeed fixes some timing issues with the commit
>> 49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between
>> reset-gpio and gpiolib"), but they also reveals another one. I've
>> initially thought that this is a false positive and needs only a proper
>> lockdep annotation, but some boards hang just after similar lockdep splat:
>>
>> ============================================
>> WARNING: possible recursive locking detected
>> 6.19.0-rc4-next-20260105+ #11974 Not tainted
>> --------------------------------------------
>> (udev-worker)/192 is trying to acquire lock:
>> ffff000004c15098 (&ref->lock){+.+.}-{4:4}, at:
>> gpio_shared_dev_is_reset_gpio+0xcc/0x234
>>
>> but task is already holding lock:
>> ffff000004c15898 (&ref->lock){+.+.}-{4:4}, at:
>> gpio_shared_add_proxy_lookup+0x98/0x228
>>
>> other info that might help us debug this:
>>    Possible unsafe locking scenario:
>>
>>          CPU0
>>          ----
>>     lock(&ref->lock);
>>     lock(&ref->lock);
>>
>>    *** DEADLOCK ***
>>
>>    May be due to missing lock nesting notation
>>
>> 3 locks held by (udev-worker)/192:
>>    #0: ffff00000b3ad8e8 (&dev->mutex){....}-{4:4}, at:
>> __driver_attach+0x90/0x1ac
>>    #1: ffff8000830f2600 (gpio_devices_srcu){.+.+}-{0:0}, at:
>> gpiod_find_and_request+0x0/0x574
>>    #2: ffff000004c15898 (&ref->lock){+.+.}-{4:4}, at:
>> gpio_shared_add_proxy_lookup+0x98/0x228
>>
> Ah this must be due to also trying to compare the ref to the base ref...
>
> Could you try to add the following on top:
>
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 198951c4c80b..5f3b8bc4a4fc 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -378,6 +378,9 @@ static bool gpio_shared_dev_is_reset_gpio(struct
> device *consumer,
>   	 * arguments match the ones from this consumer's node.
>   	 */
>   	list_for_each_entry(real_ref, &entry->refs, list) {
> +		if (real_ref == ref)
> +			continue;
> +
>   		guard(mutex)(&real_ref->lock);
>
>   		if (!real_ref->fwnode)
>
>
> If that works, I'll send a v2.

This fixed the hangs, but the lockdep whining is still there.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


