Return-Path: <linux-gpio+bounces-9894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D196F3EB
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 14:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81B791F23123
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 12:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACD81CC8B3;
	Fri,  6 Sep 2024 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHwtjT9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8322315;
	Fri,  6 Sep 2024 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725624136; cv=none; b=dUm3yvhmP2jEViydd/zFW5KwnWAVt0JypT9Aczg29hQ6O8mp24Vywc9ZUv8xi5+R88KrKXQKMUFMdDY0dfGLw/6nVziDnQHepAm+G0M1hJS0j9zv1bSF/6pqfagr2Xgryos3fs9WVGJg2q+wEvDx/Z+gea+apLBkM3Uo1XonGSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725624136; c=relaxed/simple;
	bh=Hu13nWL1W7hT/024S4ao9OMvAcxLQGiLWRdvDvppcIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJ7m6U1/JXqJBIIB2Vxdkm4bwmnZQ7u0/NC77cFjwJ7US8e1jXd/mQfS38zFEvKLk70lV4poDo8LTQN7OIMytVflpRSEhIlrBXTOXSfdRhA040uzNLr3RBTTNbXBAdi89ouNxZ1/5ra18pmZNX7xtMOZNTUCHCEXfmNrySdDWkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHwtjT9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A225C4CEC5;
	Fri,  6 Sep 2024 12:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725624135;
	bh=Hu13nWL1W7hT/024S4ao9OMvAcxLQGiLWRdvDvppcIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bHwtjT9hstTlY11djkDbS/11Zr4Gcm4rIACZXR9IJXZonYq94Jzqv3WMsM0J+j7td
	 YCrRkF972pR9hi3+G1KQOG+B4NXii25yctxwXUymYNnBDYi91tCbTnEjmfXgFC/cdP
	 9bbYof32aZlNWn7oxxRzew8hh8UElS6l/G5Qj52C9ASenaDrrEpSmM1RXCwQYZfP51
	 JJ3Zjx3+WTR7DbAxufLcKEc5jSnsGPT1RsdGzsBj9a6xY2MiC6pSVEW2tAPNWlyMcn
	 U+bxxqNp5Oe/DsxCgXZXem2KOKQZgIkUQtplobkCHZwjZOlxU88uSaThl1TQyL4tXs
	 lvl4KnpoHOYWA==
Message-ID: <62e65902-56c2-4283-b09e-5839c9c5a87a@kernel.org>
Date: Fri, 6 Sep 2024 14:02:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
 <fd18295c-6544-4da6-aab0-6d6b9c12581a@kernel.org>
 <6a65f608-7ca4-44f1-865c-6a1b9891b275@oss.nxp.com>
 <3ab4c235-c513-4dce-8061-b8831ea548a3@kernel.org>
 <0ba90fcf-60b8-478c-bd9d-487acacdc988@oss.nxp.com>
 <d1f9d323-0f66-484b-a5dd-3ea1fc690c6d@kernel.org>
 <d934d026-92dc-4832-bb0f-556fe12947a4@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d934d026-92dc-4832-bb0f-556fe12947a4@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2024 13:50, Andrei Stefanescu wrote:
> On 06/09/2024 12:53, Krzysztof Kozlowski wrote:
>> On 06/09/2024 11:45, Andrei Stefanescu wrote:
>>> On 06/09/2024 12:39, Krzysztof Kozlowski wrote:
>>>> On 06/09/2024 10:43, Andrei Stefanescu wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>>
>>>>>>> +static struct regmap *common_regmap_init(struct platform_device *pdev,
>>>>>>> +					 struct regmap_config *conf,
>>>>>>> +					 const char *name)
>>>>>>> +{
>>>>>>> +	struct device *dev = &pdev->dev;
>>>>>>> +	struct resource *res;
>>>>>>> +	resource_size_t size;
>>>>>>> +	void __iomem *base;
>>>>>>> +
>>>>>>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
>>>>>>> +	if (!res) {
>>>>>>> +		dev_err(&pdev->dev, "Failed to get MEM resource: %s\n", name);
>>>>>>> +		return ERR_PTR(-EINVAL);
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	base = devm_ioremap_resource(dev, res);
>>>>>>
>>>>>> There is a wrapper for both calls above, so use it.
>>>>>
>>>>> I am not sure I can change this because I also use the `resource_size`
>>>>> call below in order to initialize the regmap_config. 
>>>>> Unfortunately, `devm_platform_ioremap_resource_byname` doesn't also retrieve
>>>>> the resource via a pointer.
>>>>>
>>>>> I saw the `devm_platform_get_and_ioremap_resource` function but that one
>>>>> retrieves the resource based on the index. I would like to keep identifying
>>>>> the resource by its name instead of its index.
>>>>
>>>> So add the wrapper. Or explain what's wrong with indices?
>>>
>>> There's nothing wrong but I prefer to not force an order. I will
>>> add a wrapper then.
>>
>> Order is forced. You cannot change it. I don't understand your rationale.
>>
>> Best regards,
>> Krzysztof
>>
> 
> By order I mean the order in which the memory region descriptions are laid out
> in the reg property. Currently, there is no issue if we, let's say, swap the order
> of opads0 and opads1(as long as we keep the same change for the reg-names).

You cannot swap them. Order of items is fixed.

> 
> Just to double check, this would imply adding a new wrapper named
> `devm_platform_get_and_ioremap_resource_byname` which would basically be
> very similar to `devm_platform_get_and_ioremap_resource`. Is that ok?


That's ok for me.

Best regards,
Krzysztof


