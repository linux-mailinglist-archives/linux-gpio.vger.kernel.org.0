Return-Path: <linux-gpio+bounces-8679-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185894C9DB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 07:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8C762815E0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 05:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F8116C846;
	Fri,  9 Aug 2024 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEHpStzt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8734934CDD;
	Fri,  9 Aug 2024 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723182566; cv=none; b=kKw3uZbAo+pTM9jz3cwREOV0yLrro5lK8EBxTUwU8hTreuDm8g1b/kP5Q/VCITatv1pY8HCnzMf+m+SRx9MvioHnqDY9bonxJWQJrS7rsSmK5yyQFf2avErrrM3S+2Uqzg0eKf6Bz0J+OJpYzkkPLoJbyXAakzYDiov6OECKnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723182566; c=relaxed/simple;
	bh=12XbqWay4D68Qp40QHYpSukXZCMh8XhXyK8jkIHuWzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZiyueiRZHjEgbV0YS7k+z+UybHNlftftQyxyffOiJBaX5bzqk5Zs0XnruAXWmcpjWtm5mC0g97Xe04xwFIIj03Fgn5J/l0w67PMCJtB4YaD4pHvQrf9lKh+U4pvExMN8sfx4lhoL4kYRfbh61e7TAD9fpBPkZ/9pyl39pYzhhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEHpStzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7857AC32782;
	Fri,  9 Aug 2024 05:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723182566;
	bh=12XbqWay4D68Qp40QHYpSukXZCMh8XhXyK8jkIHuWzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EEHpStztJHMpUTADsJGXfHr7x9SGMACJQ7l6nIy6P6tjKLzrWEvBr3HwdXyrDSpLG
	 b96p3F7rJbFpuRFCU6n20oO4c33OEUIXiYhSwYSz3Tf+BPjEOOZcxIO6Ra+5xBWRv9
	 MXFc2+Gmo6LdSFbiyTjdX6QjuyEYiNit0qb+xMK/H7ADhpLVBbmXTZ44pZzFdhVzyw
	 CNfSk0c6ul1ADKfMUhxLTpEwL9s//Xzd81ssImJMRH6D+6ynrekaNLkbYclyx/VheZ
	 kCIqI+JoTd//YLADS4+iJCDCFJR4sWlNatranNA51M6ve/3njfHCEZYNek59xyHeZw
	 o5RTNtLHZPhMQ==
Message-ID: <a29c1c92-0f22-4fe3-a965-8561f6dba059@kernel.org>
Date: Fri, 9 Aug 2024 07:49:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
To: David Virag <virag.david003@gmail.com>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807082843.352937-9-ivo.ivanov.ivanov1@gmail.com>
 <e6b4e0d8-7183-4ff4-a373-cb1c0c98d993@kernel.org>
 <5274b8a1-b81c-3979-ed6c-3572f6a6cfc2@gmail.com>
 <225a94c3d0e8f70238aa9a486e7752ad6cb20283.camel@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <225a94c3d0e8f70238aa9a486e7752ad6cb20283.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/08/2024 19:29, David Virag wrote:
> On Wed, 2024-08-07 at 14:20 +0300, Ivaylo Ivanov wrote:
>>
>> On 8/7/24 12:20, Krzysztof Kozlowski wrote:
>>> On 07/08/2024 10:28, ivo.ivanov.ivanov1@gmail.com wrote:
>>>> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> [snip]
>>>>
>>>> +
>>>> +	timer {
>>>> +		compatible = "arm,armv8-timer";
>>>> +		/* Hypervisor Virtual Timer interrupt is not
>>>> wired to GIC */
>>>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8)
>>>> | IRQ_TYPE_LEVEL_LOW)>,
>>>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8)
>>>> | IRQ_TYPE_LEVEL_LOW)>,
>>>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8)
>>>> | IRQ_TYPE_LEVEL_LOW)>,
>>>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8)
>>>> | IRQ_TYPE_LEVEL_LOW)>;
>>>> +		clock-frequency = <26000000>;
>>> Hm? I think this was explicitly disallowed.
>>
>> It's weird. Without the clock-frequency property it fails early
>> during the
>>
>> boot process and I can't get any logs from pstore or simple-
>> framebuffer.
>>
>> Yet it's not set on similar platforms (exynos7885, autov9). Perhaps I
>>
>> could alias the node and set it in the board device tree..? That
>> doesn't
>>
>> sound right.
> 
> This sounds like CNTFRQ_EL0 is not set properly by the firmware.
> Now, if I read the documentation properly, this can be only set from
> EL3, which in your case is... not easy.
> 
> On my Galaxy A8 2018 (Exynos7885) I remember the old Android 8
> bootloader not being able to boot mainline, but Android 9 bootloaders
> did. I did not take the time to check if it was related to this, but it
> is my guess.
> 
> Your best bet is that maybe Samsung decided to fix this on the latest
> bootloader, and upgrading will fix it. (Though if it's already on an
> Android 9 based bootloader and it's still broken, my guess is a newer
> version won't fix it, but who knows)

If you can update your device to newer Android and it fixes the issue,
then please drop the property. If this does not work, then please add a
comment like: /* Non-updatable, broken stock Samsung bootloader does not
configure CNTFRQ_EL0 */

Best regards,
Krzysztof


