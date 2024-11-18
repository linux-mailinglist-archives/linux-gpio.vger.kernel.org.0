Return-Path: <linux-gpio+bounces-13086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F239D19BC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 21:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DA5CB222AE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 20:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158931E5732;
	Mon, 18 Nov 2024 20:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Z87tQCm2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9D13E8AE;
	Mon, 18 Nov 2024 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731962471; cv=none; b=uYorSw6MeyYaCTbV0YqW6cKW96fAF4/ffuqvgZvWtyxBXA9ywtFD+OC9kSiCLfohqVfmGjYSalNoO5op+GWQCB9BNjqsY0KD0ASqqoD1bwTYnVUuFcD7cnKxi0qGZok1aeO4NqxalO5YOUfz6SLFH9hrQCh/GzFkafuVcVTm2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731962471; c=relaxed/simple;
	bh=LnYa092RE7BvV3uytN7fiQQixEXb/DI7ReymMTLp7xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVXCg5sOGwOPNP0rpXhRBQVHHtibzy+P4h8Irlj8rDwcYPPEETKFtv38OdY6c858uZ8ogHamrXBqOnhjKAtPNj/fM+wYZ6c9m+XI7Q+i6Srtt0EdEXPIwU+05+QexQ5GJdrwFvDBQO0PYtm11Ps8YYEKlebcWkRvcrFKbmLZUSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Z87tQCm2; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D8YLtJy3aW6lUD8YLtdjd8; Mon, 18 Nov 2024 21:41:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731962465;
	bh=2taa0UsiDaOJXoR9CITESohKEOrxoakSVH3g+gRS8Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Z87tQCm2pAyVE5hS3osvEjqtFlDYtFmWWvZMd8pDyCk0/4P753RBg0TM4yBfGfiKb
	 IYDXx/GSbiYWXZF0D0xAJ7eHfHdv11FkvtklAenfc2M0LZ+p8r8XIs0vg4kpqqUm9b
	 zIwBSGzZ/0n7Niwb3Jk5rRTRpXOJYQlyLX0bxxtev2I+Fq9GmUIQ6biRxY3OMmpsze
	 N5R5VlrsO9hxVoPPewrR+jhgO6l9nCNx6H+ZfmsCeJ7SxqqO4TvL/xGGcht0itQmO4
	 JOvepPKaQhRPjZxpGyVIKx7ZGVZ2cksnFSj+aIwwFauyLqBsiKPBroFSL9dN3UM3u3
	 Lu+A4FwUcKT+g==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 18 Nov 2024 21:41:05 +0100
X-ME-IP: 90.11.132.44
Message-ID: <c8358dc9-24e0-40f9-b559-18cf7b93f5c3@wanadoo.fr>
Date: Mon, 18 Nov 2024 21:40:57 +0100
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

Also wondering if it is needed in exynos_irq_release_resources() if 
clk_enable() fails and we early return.

I don't know how these callbacks are used and if we could dead-lock in 
such a situation.

What do you think?

CJ

> 
> Care to fix that as well?
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


