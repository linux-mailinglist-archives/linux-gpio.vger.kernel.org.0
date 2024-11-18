Return-Path: <linux-gpio+bounces-13085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F65A9D1765
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 18:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C05452833FF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 17:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534EA1C07EC;
	Mon, 18 Nov 2024 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CvgZ8LmO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E9813E8AE;
	Mon, 18 Nov 2024 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731952195; cv=none; b=BCtvsNXIOwEoWVZOShOFW1tLmFqaXz1Guc+3I6vSo6tmhX+eXRIrz7Ls0pXiUt8WApqYyWNKIMYW1qXkgMcs91zLQQlclfdrofv/liLxutdl8wIyEilWS6xf81UJYAgBCiBMB7LZCxq/Eq5sKhEM/lh8064QKHO8D8is5WMKcP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731952195; c=relaxed/simple;
	bh=s8Mcf03i/aNKLyu54XXwTZKMYXn4YbUNSZMT5ZgYmAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbvadszj6dUDtOLqMYVWhCrhPlf75opspvR0ntgMufh/DluqWN9V6ASS9C/VO3pDjWGlQQ2KjkS2iafAnK54th3WPURfBbJcoVGMCWws0NQonR2/Ow7axy7M8n7ynHVsG1nhLQUNT2N8Nu9qXh3TrHQfuwLZ694/L9dstgDMDuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=CvgZ8LmO; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D5sftAobEYfukD5sftuvIF; Mon, 18 Nov 2024 18:49:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731952189;
	bh=0lmL6Ml3/ySb/jedLCT0Yz+EsgzLwGRL3HflcFIhF8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=CvgZ8LmOwyswLBBlxp/vw23cwYCgi859mdP/lWv8q9+7lxWq76eKJ/6xVrMiLNWhS
	 bDbsQAejkfjoKCbNqFu0zVKY0xH00v9QELTnn09AN1/OFDcJuN32GVZXsurra4am9u
	 aj4QbW5uSpSjGLZJJm+ZBlVNy/ogXPNDXK0ge2iJa92vEY5vbTQ3sMXnXL/AY3VaQr
	 PJRxLEAw3avSTxhQ5KF5si8XiwwOoao523j030lW3q7AOXZzQvdzOwShCDk82dzL+s
	 f/Yph6pW+azXI0snt2CAWV6s5HQ1wXMvj+CdS1Z3dqtxIkUvgbyHpws92sJGQx+XmT
	 6/XTmwg8cF9hg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 18 Nov 2024 18:49:49 +0100
X-ME-IP: 90.11.132.44
Message-ID: <52fb32e9-11f4-48a7-8042-0e09f26569d3@wanadoo.fr>
Date: Mon, 18 Nov 2024 18:49:44 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs in
 exynos_irq_demux_eint16_31()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
 <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 18/11/2024 à 10:40, André Draszik a écrit :
> On Sun, 2024-11-17 at 13:03 +0100, Christophe JAILLET wrote:
>> chained_irq_enter(() should be paired with a corresponding
>> chained_irq_exit().
>>
>> Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
>> is not called.
>>
>> Add a new label and a goto for fix it.
>>
>> Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested only.
>>
>> Review with care, irq handling is sometimes tricky...
> 
> Well spotted, thanks.
> 
> It looks like there is a similar problem in exynos_irq_request_resources()
> in same file. It should likely call gpiochip_unlock_as_irq() if clk_enable()
> failed.

Agreed.

> 
> Care to fix that as well?

NP, I'll send a patch.

CJ

> 
> That said,
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> 
> 
> Cheers,
> Andre'
> 
> 
> 


