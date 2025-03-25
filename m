Return-Path: <linux-gpio+bounces-17953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB4A6EC79
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 10:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F15B83B3C96
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F361DD0F6;
	Tue, 25 Mar 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXJjEiId"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC31A2389;
	Tue, 25 Mar 2025 09:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742895023; cv=none; b=dgFoW3M5cnIH/v8sdUpUv8UFXjIDvH4JBwkSHfmUPWBnMbSKzSKw4+/biyow2eB3WhADPLwMpi5Zy8XjqO2+TRFfNs4dPq6xMwvwEpuyh92h6qQeh8gjJrcqgwMWlGQ7KETK4OpqPQcUBRWbRcuWzAvN43CGLJOXNoDN59AQ48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742895023; c=relaxed/simple;
	bh=69sFJAE3YpNj/ZaxEAAUkXjPxt7C54lTaFbX1GYT9lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5LSMLDcxjgy2nTpafHW9C1pnhuUFILuUQofVrfWY17GMwYJmvTBx7lLQPXUgv8To/X/1ZYjtw/0yVBS+KsY195HEkSpU1Lf6xiuwybAVFSKW7xbmiuYl03t6x7xp4RO7wGr3ujHsiR0Z22r22DSSwFtPsrlzqkkNqVQeu8EnCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXJjEiId; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A2AC4CEE4;
	Tue, 25 Mar 2025 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742895022;
	bh=69sFJAE3YpNj/ZaxEAAUkXjPxt7C54lTaFbX1GYT9lw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VXJjEiIdO+zP4+eKoD5WJbXgbF3jorSV2bwVEYegmhktl+ojoGaKTjMj2ggARzGgG
	 yFL528uP1NFd2I8Aze2YQx6hrGN9x8uXxZKG1WxCiBoXo1r4b89Bb8FU1pCoAYcubM
	 dg7dFzUSieoHzutLQdGx+KyeI09/ySZi5JvIOolSynn1F711GzKUvhSbobCxkwykMJ
	 BGO4V0wA8+K67WAH2Y08NtkiZ2Sc9TvTFc74jBJgaHS2KSKjw2R67/aTwEbS0lSm6Y
	 LIiwyw1S7PRvYcX1DPwHc+ECPzU5bxz3q4f6zkw/ykEZTJBdXQXxpX9adLA36m/gEh
	 bZMVcQEDJosJA==
Message-ID: <7f22be3e-908d-4036-ab92-97c6b0427d26@kernel.org>
Date: Tue, 25 Mar 2025 10:30:16 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: s5m8767: Convert to GPIO descriptors
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20250318052709.1731747-1-peng.fan@oss.nxp.com>
 <Z9lJETLh2y27934q@black.fi.intel.com>
 <PAXPR04MB8459A44864B9213E8265137188DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <e3abe8cc-357c-471f-b489-e1a8625933e0@kernel.org>
 <20250324033038.GA9886@nxa18884-linux>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250324033038.GA9886@nxa18884-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2025 05:21, Peng Fan wrote:
> On Tue, Mar 18, 2025 at 02:48:05PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2025 13:38, Peng Fan wrote:
>>>> Also the commit message doesn't tell anything about the existing DTS
>>>> files.
>>>> Do we have this device described in any in the kernel? Do we have any
>>>> googled examples? Why I'm asking because often the issue is the
>>>> incorrect setting of the polarity, which needs to be carefully checked,
>>>> esp. for the voltage regulators case.
>>>
>>>
>>> Under arch/arm/boot/dts/samsung/, a few dtsi files have the property 
>>> with results from output of
>>> `grep "s5m8767" ./arch/arm/boot/dts/samsung/ -rn | grep gpios`
>>>
>>> Exynos5250-spring.dts uses GPIO_ACTIVE_LOW.
>>> Others use GPIO_ACTIVE_HIGH.
>>>
>> These are old devices and not many people are actually providing tests,
>> so you need to preserve existing ABI. IOW, if previously GPIO flags were
>> ignored, meaning "1" is ACTIVE_HIGH, then you must preserve this behavior.
> 
> Per google,
> Manual Reset function is for Hardware reset in the Active mode.

Why are you mentioning the reset functions? Which properties are these?


> If MR1B and MR2B is kept low during the VLDO3 is active state, the
> system makes all internal presetting registers as default in the
> active mode (automatic power on sequence). If this hardware reset
> function is not required, connect MRB pin to high.
> 
> So the reset is ACTIVE LOW if my understanding is correct.
> 
> To keep DTS unchanged, we need update polarity in gpiolib to
> force GPIO_ACTIVE_LOW.

How are you going to achieve it if one DTS has LOW and other has HIGH?

> 
> please see whether this is ok for you.

I don't understand how this is related to the issue I raised.

Best regards,
Krzysztof

