Return-Path: <linux-gpio+bounces-14018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E859F7B9B
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 13:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DD2E164547
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 12:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2228223E77;
	Thu, 19 Dec 2024 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WKbxcCJg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D022080F1;
	Thu, 19 Dec 2024 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611974; cv=none; b=i/voSRDks7VE0eGQKC2Rl+l7T9ObWDqx6HbYrsGnlDBu25q7M4C7vfzVyqOfL11/VY4fDeZCma6qwHiAshl9KkKKMd7Zv9H4FS8tIEEu6FeUgffY6QyLO+xhOJ7yGDmU1EiUygmhUuvCsNKPd2kAMh7Uc79Fs7aQUXlSn2giYi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611974; c=relaxed/simple;
	bh=JBbxi0NMjonpSOIyVcV/rl7gTbxBOiQzkChufoJ5ZBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OM7ZzoyKF621Mpf00Vbjo/TkJyBp4bylHdWMgepV6Ufp9ak7A3twZyjszoqArbSGh3KLeAIno8aqQothTmpSsT23sE2iy6RNsHWwJgz/5yEK6fJQZsHrrqGHB/9hIwQxArWjcbXUVcMjBMgnXJx+j1BgGGrag/TIM2HVyR90XwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WKbxcCJg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734611970;
	bh=JBbxi0NMjonpSOIyVcV/rl7gTbxBOiQzkChufoJ5ZBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WKbxcCJgKiajWnA36UXvtSMl9jfb5ty6rC+Bi5z2XAlvn5XrMRJ83OzOlIC51Wphe
	 cVv0cYmE8UpmhS5nNSHbueE0KxL910TLdrU9NxbD+LdOscewpVJLD/tBFj038LnbV4
	 j+DfLQKFLVzocRHyThj8GCBr+bjOsieuxQitblkRfbo13qb5W9Bh2IlyIEnZOZUnUE
	 oePYH4d8fwTOd6a3obTgbD9RAYuM9GlVTrPG8ERcEB11S2DuiHOc9PNV+26sxZZzZL
	 j6djALZ5XdbSzsDgPj+UWdnQvkSWYr5O104ACeRoXt9WVXkqQzDclp+IJ4oRwpwFNc
	 ruDQ1PjnaWLDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C63B17E36AF;
	Thu, 19 Dec 2024 13:39:30 +0100 (CET)
Message-ID: <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
Date: Thu, 19 Dec 2024 13:39:30 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: Linus Walleij <linus.walleij@linaro.org>,
 chang hao <ot_chhao.chang@mediatek.com>
Cc: matthias.bgg@gmail.com, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
 <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 17/12/24 14:45, Linus Walleij ha scritto:
> Hi Chang,
> 
> thanks for your patch!
> 
> On Tue, Dec 3, 2024 at 2:13 PM chang hao <ot_chhao.chang@mediatek.com> wrote:
> 
>> From: Chhao Chang <ot_chhao.chang@mediatek.com>
>>
>> Change 1: change EINT from 1 address to 5 addresses,
>> Eint number is stored on each base.
>> Change 2: Compatible with 1 address design
>>
>> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
> 
> This patch looks good to me, as preparation for mt8196,
> but can one of the Mediatek experts please
> review it? If nothing happens I will just apply it I guess...
> 

Linus, that's something like the fourth time that he pushes variations of this
patch which do break all MediaTek SoCs in a way or another, leaving only MT8196
hopefully-functional.

NACK.

Cheers,
Angelo



