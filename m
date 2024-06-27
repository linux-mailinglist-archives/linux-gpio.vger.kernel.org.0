Return-Path: <linux-gpio+bounces-7765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA09A91AB43
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 17:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92990B2A636
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039251991A3;
	Thu, 27 Jun 2024 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiLrGhdW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A808B198E66;
	Thu, 27 Jun 2024 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502075; cv=none; b=uJEieeVUuzM3n/zyKcjMCIQRDJRLwed2BKGoSfddXyjiud3j7FTDZuSDEwZQO5BmWjLKdwmwuW3bM/4rLZhTu6+Rogu4dFcOaG0pnw8DA4hyibty6n7kv8v/uTle8NVLNsXFnH21sr4ifA3jVfqP5s4UiwL4oWg1XmBZLI6G2f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502075; c=relaxed/simple;
	bh=9cPgU3lKZ5sHDxRTQaP3BVTiignn+lYlySeU6Ux/fys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXp7/9lEzGjYe8Hm28maEsGajQtH1TwSt8jn1vibjtv9z/TvU0jtSX+JInrIbwBA2+Yrl5+kxmlGOzO0BSuWqji/jm0PSlOtwiPowsX3Bsln93NdfCQ2RUHPOsPB9iDO3PoB3Cksb/wrs2hlk/Aq3gbbZxJ3p62fDM7nQZNWLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiLrGhdW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DA8C2BBFC;
	Thu, 27 Jun 2024 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719502075;
	bh=9cPgU3lKZ5sHDxRTQaP3BVTiignn+lYlySeU6Ux/fys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DiLrGhdWBpmA3W1tjY7IIBB1Gg6aIbnJO0AzMMaDUklbi1yYhpui73U2buHSeePuE
	 De4azC/U+G0f/w2z6h+SI8wlHf3m9DtRk+3rdOmLk4RW+pStAVkC+qAQKSghXVDCte
	 VS6rfeGQswgi4zxj8FxOJ7oWojvz5qdQq76aB7WW49tL2lRlHnDE48qRNXasf7gnk8
	 EhtZ8yPP9XKFiZ79nu2NV8VDAE8G+jdrmvF58O46dzBfjhSr9OkrMZce29/ZczrvUI
	 6+BN8ml8JSWe9n4HSX9zP5tsJdfPCesQgO6SMkdqivZQWQglcKsIHbQ9SElUU8Pz9/
	 etKli/S9h+zLg==
Message-ID: <b1b6ccc8-ab83-4d4e-8902-769e12975580@kernel.org>
Date: Thu, 27 Jun 2024 17:27:49 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: samsung: Add support for pull-up and
 pull-down
To: Vishnu Reddy <vishnu.reddy@samsung.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 s.nawrocki@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
References: <CGME20240620103950epcas5p10514d4a19bdfd505d7d92ceb1fe10cc7@epcas5p1.samsung.com>
 <20240620103410.35786-1-vishnu.reddy@samsung.com>
 <38fae674-f672-46e0-a44e-1278deaaf36a@kernel.org>
 <07f201dac7be$e81317d0$b8394770$@samsung.com>
 <4efb51f3-4600-4d88-a5df-e7be43294d53@linaro.org>
 <086b01dac896$e988fed0$bc9afc70$@samsung.com>
 <dbe55275-a13e-46a3-8b45-b08c301088d4@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <dbe55275-a13e-46a3-8b45-b08c301088d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2024 17:22, Krzysztof Kozlowski wrote:
> On 27/06/2024 15:35, Vishnu Reddy wrote:
>>>
>>> I don't remember the code used here, but usually such choices are
>>> determined by driver match data (and flags or value customized per variant).
>> Hi, Thanks for suggestion.
>> I have gone through this and found that driver match data in this driver is stored in the __initconst section, which is freed up after kernel initialization. So we have two options:
>> 1: Keep this platform specific data in driver match data and then populate driver_data field in probe function. 
>> 2: Use compatible matching and set different values during set_config. 
>>
>> First approach will result in many changes, such as populating  driver match data for all platforms and then storing the same in driver_data in probe.
>>
>> In the second approach, we can handle this using simple if/else based on a compatible match. 
>>
>> IMO, second approach would be simpler and introduce less changes. Any suggestions from your end?
> 
> Please wrap your email according to mailing list style.
> 
> Both options are not the way because you introduce a new, different
> style of handling per-variant customization. The driver already parses
> match data and stores such per-variant-details in different places, like
> samsung_pin_bank or samsung_pinctrl_drv_data. This seems like a value
> fixed per entire device, so could go to samsung_pinctrl_drv_data.

... although maybe this matches your first option? Not sure.

Best regards,
Krzysztof


