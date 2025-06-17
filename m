Return-Path: <linux-gpio+bounces-21681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C45ADC215
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 08:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9234169AF2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 06:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15B128B3EE;
	Tue, 17 Jun 2025 06:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbLVaY/V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F3E202C48;
	Tue, 17 Jun 2025 06:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750140517; cv=none; b=CBnMiOXlO+z9/EMYpQjV0P4j7HubHrZcJxNUf54K37M5CdfBfUi2Jhs3MM3/1mH8S3LYk4mRqZ0iMwwjylwL4oLWzQRS9Iu2Sf1Mq+bO1Y0GDVELinO/oirQRGPpvjx3TCYesfDzo9spKFv0BaLN3jYycZIp/uIqOe+TpHt40Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750140517; c=relaxed/simple;
	bh=VFgG5c3adCcLcFwMHG3HHPoRX1wEDrUuiPjHGzWQRFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3lGSJMhLA3AQNiXW8j0zq2q1hF5bFL8ePi8MSc4KrlXKQvmDLEyYXzAV2O/QsbcENJDk71PxKPfPUqftCohOnqHVixfKE3/XSVyUMtkfWmZRgKJ+oYPU1Ile+9X/uEk6Sy/1LwYgQPEN5g60yXcYrI8bnFYIHHff4HyOyjnQ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbLVaY/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036CDC4CEE3;
	Tue, 17 Jun 2025 06:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750140517;
	bh=VFgG5c3adCcLcFwMHG3HHPoRX1wEDrUuiPjHGzWQRFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MbLVaY/VkG7/yqaRdZJ4ciDzFzYcKYR7O3yeNw5GNfJmykreKe+c7Pss06elNsxKS
	 nOj3pEYNbM9B/NWO3+Cqa8Oz9djVOgI5vWIpwafcrV/qL6tIajVghtvwHokGpUdd8N
	 pwtSabaozykpShj2T6IgN/h2GGofjTLDEUSJ2DUiD/O7PU4Lub+nlvgi3XjNXVIicN
	 gu/pKzgE2avenkO22T3GzPB2lNGiPHRFPYRlcZrMm9iOe2hYLQN3tujmVnCr+9eST1
	 w8insVfLhED/TmE/hKPztnG3tfK8pWUI0bX14kSQtOrfGTFZZIeTrQaXYSpjvbq448
	 ETF48L9aPJfEw==
Message-ID: <d99c2be9-1052-4c09-9707-ac8b82bc6fee@kernel.org>
Date: Tue, 17 Jun 2025 08:08:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-2-341502d38618@axiado.com>
 <f4430b9a-3275-405e-becf-ff62ae16f23c@kernel.org>
 <IA0PPFBEC4B1F8E5727945AD33204C3AB18D570A@IA0PPFBEC4B1F8E.namprd18.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <IA0PPFBEC4B1F8E5727945AD33204C3AB18D570A@IA0PPFBEC4B1F8E.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/06/2025 23:13, Harshit Shah wrote:
> 
> ________________________________________
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 15 June 2025 23:05
> To: Harshit Shah <hshah@axiado.com>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Arnd Bergmann <arnd@arndb.de>; Catalin Marinas <catalin.marinas@arm.com>; Will Deacon <will@kernel.org>
> Cc: devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; soc@lists.linux.dev <soc@lists.linux.dev>
> Subject: Re: [PATCH v2 2/6] dt-bindings: arm: axiado: add AX3000 EVK compatible strings
>  
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.

Drop all this. Not needed, not useful and not even correctly wrapped.

> 
> 
> On 16/06/2025 06:31, Harshit Shah wrote:
>> Add device tree binding schema for Axiado platforms, specifically the
>> AX3000 SoC and its associated evaluation board. This binding will be
>> used for the board-level DTS files that support the AX3000 platforms.
>>
>> Signed-off-by: Harshit Shah <hshah@axiado.com>
>> ---
>>   .../devicetree/bindings/arm/axiado/axiado.yaml     | 23 ++++++++++++++++++++++
> 
> Just arm/axiado.yaml

use proper quoting. Who wrote that?

> 
> Noted. I will update the same in v3.

And that?

Best regards,
Krzysztof

