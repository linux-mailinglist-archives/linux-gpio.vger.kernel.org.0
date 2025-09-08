Return-Path: <linux-gpio+bounces-25737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748EB48D70
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE0F216AF69
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282EF2FE060;
	Mon,  8 Sep 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="b75V3OJP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="uus1gG0P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD202F83BE;
	Mon,  8 Sep 2025 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757334425; cv=none; b=NQySwu9IWV+F46AtdP3JD1Uvnl2FNgDc6ycUAE48BvNcXS51dXivaw/Nqwoo8Po0/3MWseUZjWFmA9Kk5N+VFCjUPiDqUBezW0+2p0aOnrBsm3slszya9lX1QezZhPol+lWSg1uR3fSlsZ2uTUkt/PpdZoH43PRcEXohwkXbBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757334425; c=relaxed/simple;
	bh=MiRTds9oiHs/B6UcYSFxHsmBL56uVVXDD3bgZ0EEB6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhYGjnWtFPLyy8tZt//EGPoSp6Jels7icE8jkGJsWnrxpXMu6LtquPHGKgy7dqupRykfN8XXZguXh6gjFIq6KvJT5XeeefWd5iFxVZfcLtOgE1TVY8cHLZxlQP7mxUW8b7AWYeMd4gTJKq7yOSXTQc7nIXIvA07Q5Zh+/bK02Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=b75V3OJP; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=uus1gG0P; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1757333976; bh=1V7HualNevRitDqxwUJewH6
	4/Z3JcnH9c2FyaK3ahH8=; b=b75V3OJP4qtGMgtOuQtFef/eYMsNGtEAhY8FvUot/6or6xiKfG
	g8ZMY+fkL2aBJ73JnbQuU0mpMeGKLCaCs7vTkdoMR4MstunjMI71pH2lPErLhKzOQHEPja2mUfK
	+TZCbr1c48WEvw7gldiQPNJxBpbL8upA7OMaXu6Gn/P85/1fF1JYDugOiI8hjMU3R8RpmGhlqRK
	p4GQmRGI62qDuD4L/nuUQAPsVcYNOciDd61lB4FeVrOt+MkUg/FcvlUr+cDLWAePQ18CdqQ67rh
	ocnL8jiUVo+usKNzFxrjgRF/9vPp6t+3hodhWOIWXbGtzzWVbfvB+16yPusktUvyxdA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1757333976; bh=1V7HualNevRitDqxwUJewH6
	4/Z3JcnH9c2FyaK3ahH8=; b=uus1gG0Pd2nT4ds7jb6CHWnAL5cscnLJZ0f8pAJzq1o+Nrt6nR
	HBx9OWOtthScdROz5RIcCsG+dYW80C3DVqAA==;
Message-ID: <8b8e9545-7e39-4b6c-b453-59f815318f87@mainlining.org>
Date: Mon, 8 Sep 2025 15:19:34 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Add SDM660 LPASS LPI TLMM
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Nickolay Goppen <setotau@yandex.ru>,
 Richard Acayan <mailingradian@gmail.com>
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
 <CACRpkdY2o7PB-1t5kwGFpWjDu4QfKG_gf0_pGA=V1=_KFCqqiA@mail.gmail.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <CACRpkdY2o7PB-1t5kwGFpWjDu4QfKG_gf0_pGA=V1=_KFCqqiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


08.09.2025 15:18, Linus Walleij пишет:
> On Wed, Sep 3, 2025 at 3:43 PM Nickolay Goppen <setotau@mainlining.org> wrote:
>
>> This patch series adds SDM660 LPASS LPI TLMM pinctrl driver and
>> introduces pin_offset field for LPI pinctrl drivers to support
>> SDM660's quirky pin_offsets taken from an array with
>> predefined offsets from downstream [1].
>>
>> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107
>>
>> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> This seems ready for merge if you fix the last few comments
> and collect the ACKs/Reviewed-by, can you send a v6
> addressing this?

Yes, of course. Just a moment.

> Yours,
> Linus Walleij

-- 
Best regards,
Nickolay


