Return-Path: <linux-gpio+bounces-15637-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DAA2E704
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 09:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B8A16057C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 08:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDCA1C07EC;
	Mon, 10 Feb 2025 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="GbuJgakQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541BA1BEF90
	for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177573; cv=none; b=rX5r2Ef1I/DLaslHjC+//YNhwDbTmALMu3Kx6vOr5BzgBLJYLQYM0ArHieFG23IL2XpckT7K52tBtdxTObuuYzOu/BfMWI3dKK7gy1BFvJjPH+zgoHIQBhhdfgpMtenq6KKj2mFRypR0PebmVgKMUi3OpDqolcZJIQADzdq6IX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177573; c=relaxed/simple;
	bh=Mzo8weuAT2mlks7nbB7Xl9z60vdOgIwwxoK6G6Px/mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgsZuTaAO2DF/tIMSyIpxcN0w3H9h82qIu87lhzji0/cTYVVJqE9xUwnsFX1wXq66kdVXPOzfNIOUvb6Aw5OD1aVTQlhY0CVcvbtyEAXy+FQbnUWaKd6zSznX0SjZmxB/iw1v39JbmmzIownvDLDsApS59aQW4uU+3gbzQbhVAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=GbuJgakQ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-307d9a13782so35812861fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2025 00:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1739177569; x=1739782369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYu8yQ/OgSiNEgnJK4K3dO6bbEYi+Xy76mIpaogzGWI=;
        b=GbuJgakQ4scuZ9r7LAAGIyd8rZBC6o4ul2HR/h0RrtMVJjYRvb3Gy6L5sL8NKLozDg
         1YdsNU0MHDCTAuSTQpu2Gate3i2yw5Q+JWVZO5b3Vy2Bbopvil4SDQJi1I8UbMjifshB
         ev6wSR4eLUW3UR3+5Px7tOBazs9yVx/kUR6DwtkkNujP5Y9GVud1wb5xQNlWJbUHSFRs
         tOuCnVuesZ1JLNIQGycoZR4Mah/zuGx45i2eXJu8woQzb7IkZSS4O76O3uWalEp422la
         Qy1i2bMx3Hi6BeKcFcsyDFeo0XcwY7A8h5JFJJUn7sgsnBX7g9utpfDQTTYJViJwXKSC
         LxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177569; x=1739782369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYu8yQ/OgSiNEgnJK4K3dO6bbEYi+Xy76mIpaogzGWI=;
        b=McIhRxaUCapD7zM0XCgOR2p7Wn+1zu6IGmkbvkC/AX+1p7ChoVa/R9jjNJv8SInXxh
         Iv7Mm5XDpq/cjSDeO7Q802O9/FStgYst/gaPNEML1bW7wuX1rladxbDIOwivtxsYMQp4
         vwlURkMd4yLfRuSKheYeWtELvxvZeeevTE+mEKMI4Cyc6Iud0lxEbLmoc44ZY+OmD8OK
         x0vXIzl6Gb47zo/1p1TN726FSbT+Ddbu1dJKOVko49IUDlKA2yrngYWVy0pDMwWmLAQi
         p4J0n3ByHmXf2/7FmsSxIdjyg3Rol5gR5beBLtexUHwCtGzehukRrO5Eg9DiG2DxSrmh
         ehRQ==
X-Gm-Message-State: AOJu0YwWao4yK//cll2t6tYMccvvXIn5+MJAITEX1DdrY+b3YiiBZwZg
	W3kAwurFGb1dLwqiZ4tGk0V8Q3yn9ZXPa/HEeBDSPYwZE/x73rYeyngK9ry66g==
X-Gm-Gg: ASbGncu0jeteBZ1/I/U8tJKQ66bwXd7tr4igQvK5gy4BVOppyUFFbdtL+/2Yl8AI2LZ
	jWhlkz4KVw1cf2F02VDDPE3qirlvN7AR63aZ164M0mapbVrunqMjpn1jnwVudFV18NJTvO+LZW3
	Use+7fwmVfRSD2rUDApPBpH4/+lQ8OsNDtR574QOK1bJjAiIpHbLA+AhrfoxMf33oLdaPvNG0IS
	OMcnfHUeQiaGacbpS3WvXySUboscBuAENNbw/kaaoqn6zkQ+uspSM2XvAc+6bo4TEr7T2dU/gqw
	K11youPbMyUqFiWnMj0rCbpFPNVrLcAONKvg9rva+q/puigZAGhI7NqKTgd73WRNkA==
X-Google-Smtp-Source: AGHT+IEFrSWijx5//WYxrO69alxyK3OwlZnbT1e1oSn0kYEx0Jps5YEkPD7RfAkSs7gwPx91jQfBeQ==
X-Received: by 2002:ac2:4c39:0:b0:545:5d:a5d9 with SMTP id 2adb3069b0e04-545005da81amr2978311e87.3.1739177569272;
        Mon, 10 Feb 2025 00:52:49 -0800 (PST)
Received: from ?IPV6:2001:4643:2b9c:0:a407:a1b4:766f:a8eb? ([2001:4643:2b9c:0:a407:a1b4:766f:a8eb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545064c95fdsm585428e87.205.2025.02.10.00.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:52:48 -0800 (PST)
Message-ID: <cb75162b-de5a-475b-aeb6-9a3c39de108e@remarkable.no>
Date: Mon, 10 Feb 2025 09:52:47 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Bough Chen <haibo.chen@nxp.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Johan Korsnes <johan.korsnes@remarkable.no>
In-Reply-To: <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/7/25 7:21 AM, Bough Chen wrote:
>> -----Original Message-----
>> From: Linus Walleij <linus.walleij@linaro.org>
>> Sent: 2025年2月7日 2:29
>> To: Johan Korsnes <johan.korsnes@remarkable.no>
>> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
>> <bartosz.golaszewski@linaro.org>; Bough Chen <haibo.chen@nxp.com>
>> Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
>>
>> Hi Johan,
>>
>> thanks for your patch!
>>
>> On Thu, Feb 6, 2025 at 7:17 PM Johan Korsnes <johan.korsnes@remarkable.no>
>> wrote:
>>
>>> Add locking to `vf610_gpio_direction_input|output()` functions.
>>> Without this locking, a race condition exists between concurrent calls
>>> to these functions, potentially leading to incorrect GPIO direction settings.
>>>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> Cc: Haibo Chen <haibo.chen@nxp.com>
>>> Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
>>
>> Looks correct to me, verified by looking at the most tested driver gpio-mmio.c
>> and seeing there is a lock there indeed.
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>>> where after a couple of reboots the race was confirmed. I.e., one user
>>> had to wait before acquiring the lock. With this patch the race has
>>> not been encountered. It's worth mentioning that any type of debugging
>>> (printing, tracing, etc.) would "resolve" the issue.
>>
>> Typical. I would include this in the commit message, people care.
>>

Hi Linus and Haibo,

Thanks for the review! I'll include this in v2.

>> Looking at the driver it seems vf610_gpio_irq_mask()/vf610_gpio_irq_unmask()
>> could have a similar issue, both write the same register.
> 
> Indeed, and also the vf610_gpio_set() / vf610_gpio_irq_ack().
> 

Could you please explain the race condition we fix by adding locking to
these other functions? F.ex. the vf610_gpio_set(), in which scenario would
the lack of locking cause an issue? It's a single write to either the set
or clear register. Is this related to how the writel_relaxed() works on
different architectures?

Kind regards,
Johan

>>
>> Both issues could be fixed by converting the driver to use
>> gpio-mmio() with bgpio_init() which would also implement get/set_multiple
>> support for free.
>>
>> I have no idea why this driver isn't using gpio-mmio.
>> Not your fault though, just pointing out obvious improvement opportunities.
> 
> I check the code, for vf610_gpio_direction_input()/vf610_gpio_direction_output(), to let the input/output really works, need to call pinctrl_gpio_direction_input() for vf610/imx7ulp/imx8ulp SoC.
> Refer to drivers/pinctrl/freescale/pinctrl-vf610.c, it implement gpio_set_direction callback. Also for imx7ulp/imx8ulp pinctrl drivers.
> This should be the reason why not using gpio-mmio.
> 
> Regards
> Haibo Chen
>>
>> Yours,
>> Linus Walleij


