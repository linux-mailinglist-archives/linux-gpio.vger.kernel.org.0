Return-Path: <linux-gpio+bounces-14568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB6A0453A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 16:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2BCD1887AAE
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 15:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABF21F3D2D;
	Tue,  7 Jan 2025 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BjYz3ER9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B91F2C23;
	Tue,  7 Jan 2025 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265273; cv=none; b=fVTnGMPKRnqSeGAhFJnKHaILbSb4oUB9FyChJxEu0UShwP17xk0ebtK7u29i/7RXVzNxEaF1dUFUjEsSWsFSgYLNBVkKtWVfJzSCFUET28OUL1CV+NLDhWTBBoPsX2jvgFJq5ADstxZmPjrp2jAlNv6DTmuet2WA0Rp59r4b+p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265273; c=relaxed/simple;
	bh=ZColaJchYHQUTdC5l9KMK7U/n6WVO4E0FvLAa+1L3dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5p2I3meJqgCYs/7HKUEormGVx2hgxbufCFyVk1CcyGu8IdZjhLb3DC2VsAhOh5JUbvauh5EcHVMumGJHNoLbtqhtaQERKF13xfgqpgqKXDMLo7rm2TXrKDfC9cCGPDfoZk8Rq68IiXji1v1pmRC/FynHroIUly/f0N65dkqKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BjYz3ER9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736265268;
	bh=ZColaJchYHQUTdC5l9KMK7U/n6WVO4E0FvLAa+1L3dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BjYz3ER91eASynnII7vjuVazUWx/msHDd8cWnDw6W2GpHsDj4j0kDonsibm+9nWZh
	 HQwp1Ng+Vt+3yUoaZtWChzzKW1Onl7QUZvgcRKLQcJVhsOu1OSutY/r3A+Umw8kTTv
	 1Xjks+cmkmdhd7AojIOEBuoHpEOfDtN6Fd2ClUGyq33nS5y5znS6T38Cl6S72CFx6S
	 hn7EsbmlV5ByIj/r5klIO5Y8Rv5eAr4lU52ZmrFXWJ4iCRp+ntePNbcfJVl07/iydz
	 NV9xXNw/92084VEFe9J86tEs31eHLXbvIdQvg6ZNZOEvf3mSTOLa9L+4QoI9s3pOTv
	 IJEbLjlE+5zuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9081B17E159F;
	Tue,  7 Jan 2025 16:54:27 +0100 (CET)
Message-ID: <ee926982-be21-4292-984b-57e0d777d3f9@collabora.com>
Date: Tue, 7 Jan 2025 16:54:27 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: Linus Walleij <linus.walleij@linaro.org>
Cc: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com,
 sean.wang@kernel.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
 <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
 <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
 <CACRpkdarstoQW+ZBi+MWxEff_=h8bPo9+fwy=LW2uhWRuQ6YSQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CACRpkdarstoQW+ZBi+MWxEff_=h8bPo9+fwy=LW2uhWRuQ6YSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 07/01/25 16:11, Linus Walleij ha scritto:
> On Thu, Dec 19, 2024 at 1:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> 
>> Il 17/12/24 14:45, Linus Walleij ha scritto:
>>> Hi Chang,
>>>
>>> thanks for your patch!
>>>
>>> On Tue, Dec 3, 2024 at 2:13 PM chang hao <ot_chhao.chang@mediatek.com> wrote:
>>>
>>>> From: Chhao Chang <ot_chhao.chang@mediatek.com>
>>>>
>>>> Change 1: change EINT from 1 address to 5 addresses,
>>>> Eint number is stored on each base.
>>>> Change 2: Compatible with 1 address design
>>>>
>>>> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
>>>
>>> This patch looks good to me, as preparation for mt8196,
>>> but can one of the Mediatek experts please
>>> review it? If nothing happens I will just apply it I guess...
>>>
>>
>> Linus, that's something like the fourth time that he pushes variations of this
>> patch which do break all MediaTek SoCs in a way or another, leaving only MT8196
>> hopefully-functional.
> 
> That's unfortunate, and I see there is some annoyance building
> up.
> 
> The maintainers are here to protect the code and the change
> would have anyway just been reverted soon if it breaks stuff.
> 
> How can we get this contribution on a better path?
> 
> Chhao: maybe you can split your idea into smaller changes
> that can be reviewed and tested one by one?
> 

Splitting would be nice, but I'm not sure it's really doable... besides,
there's only one way to get this right: testing on older platforms!

Even just one done manually, like MT8173, would be fine - the others can be
tested in KernelCI as we do have many MTK SoCs in the lab.
Then it's just about following the review process and adding the suggested
changes - nothing in particular.

Besides, I'm sorry for the very (maybe too much!) "strong" reply :-)

Cheers,
Angelo

> Yours,
> Linus Walleij



