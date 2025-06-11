Return-Path: <linux-gpio+bounces-21407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFFAD5B03
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 17:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F287177415
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E5C1DE4C5;
	Wed, 11 Jun 2025 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZvumMgG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BF71C84D5;
	Wed, 11 Jun 2025 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656905; cv=none; b=Td1+gKQhdjsuBw3plHig6FA/9hFDi3qsEuqaQ8rmk2VkMcbaIVWGLqev5CQgHECnVGeziNo1g+BuMAQ+2gZ6q/vF0KZd4Maac8PAkF6KeJapeXpPJmQLCRHOTccx6cg8B8DCSFpXk3PYBdqA8DBLgq0hXM7DMXx+VnAs6kbQAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656905; c=relaxed/simple;
	bh=LNb7YbVus4nbWzU8eQUbtfq2tisE72p1WUOPyk88UIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uet0tD4MMdPK7cnORY6lgxFjm91bA6TllJERkY+nQwpodDDvIGoTrgpm7DcNx3ZKcbrXRkT7MOFNkX31ZtRfyYKnZ8s9qu4q2n0Y8YoSc50ziWtu8XlG517jl+arXbvODtPrmKlzR97OdHnBVT5R0tgaIZD1454SArBkiHTV+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZvumMgG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE600C4CEE3;
	Wed, 11 Jun 2025 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749656904;
	bh=LNb7YbVus4nbWzU8eQUbtfq2tisE72p1WUOPyk88UIk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eZvumMgGK6SbKsBcFzKeJeRL43GMbesaZDPm1UXUDNwThKkF01+7651Besemd7NH2
	 34NbeyYs5sWouLFZhNHPlI5XpHwcTBwxHUpHhYBMjpjedaD1ebRHaJi2pey9UAPTyR
	 Ngi7JRognCRZZlA0LQ+z1b2lox/5DpFv/NL0rJTQZ30SAk0HZjKuBrY03kfJFmLABa
	 8DV62B14yT1S+bH3EwHdijXQWb7ssNnzBqIkGD1/whEbYQQn0pjemfMbtjsL2qnyQD
	 Hg9tfh9Ti5kYg0KYU0XuLZY2LSjCzS1v7jb41B5+N13etyPHnXU22FpVen9/iJKTbc
	 OLVwzEraB/MzA==
Message-ID: <f1a63830-0533-4f1c-9116-32e8c1e61a8b@kernel.org>
Date: Wed, 11 Jun 2025 17:48:20 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
 <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
 <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
 <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2025 16:08, Clement LE GOFFIC wrote:
> On 6/11/25 08:35, Krzysztof Kozlowski wrote:
>> On 10/06/2025 15:33, Clement LE GOFFIC wrote:
>>> On 6/10/25 14:38, Krzysztof Kozlowski wrote:
>>>> On 10/06/2025 14:02, Clement LE GOFFIC wrote:
>>>>> On 5/29/25 11:01, Krzysztof Kozlowski wrote:
>>>>>> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>>>>>>
>>>>>>>>> +		};
>>>>>>>>> +
>>>>>>>>> +		hdp: pinctrl@5002a000 {
>>>>>>>>> +			compatible = "st,stm32mp131-hdp";
>>>>>>>>> +			reg = <0x5002a000 0x400>;
>>>>>>>>> +			clocks = <&rcc HDP>;
>>>>>>>>>      			status = "disabled";
>>>>>>>>
>>>>>>>> Why are you disabling it? What is missing?
>>>>>>>
>>>>>>> Nothing is missing just disabled by default.
>>>>>>> The node is then enabled when needed in board's dts file.
>>>>>> Nodes should not be disabled by default if they are complete. That's why
>>>>>> I asked what is missing. Drop.
>>>>>
>>>>> Hi Krzysztof, OK I better understand now.
>>>>> So yes the 'pinctrl-*' properties which are board dependent are lacking.
>>>>
>>>> These are not properties of this node.
>>>
>>> Does this mean I should add 'pinctrl-*' properties in bindings yaml file ?
>>> I don't get it..
>>
>> These properties have no meaning here, so the hardware description is
>> complete. You claim that you miss them thus device is incomplete is just
>> not correct: these properties do not belong here! They belong to the
>> board but even there they are totally optional. Why would they be a
>> required resource?
>>
>> To remind: we talk here ONLY about required resources.
> 
> Yes, 'pinctrl-*' properties belongs to the board and are not required.
> So nothing is missing.
> 
> This hdp node in the SoC dtsi file can be enabled by default.
> But the hdp driver will probe and do nothing because without the 
> 'pinctrl-*' properties from the board files it would not be able to 
> access to any pin.


Pinctrl has other features in general, including interfaces to userspace
(as pretty often combined with gpio, although not sure if relevant here).

> I consider enabling this driver by default in SoC dtsi file as just 
> increasing the boot time on "every" board.
> It's the board dts that requires the hdp and provides the 'pinctrl-*' 
> properties to connect the hdp to some SoC pin and then to some signal on 
> the board. For me it's natural to have the status okay only in the board 
> dts file.

The DTS is not the way to optimize boot processes. It is OS-independent
hardware description. My BSD system for example uses smart driver which
avoids probing, but also my user-space needs this device to talk over
exposed interface, so why choice of Linux probing should affect others?

Best regards,
Krzysztof

