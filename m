Return-Path: <linux-gpio+bounces-21638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB1ADA942
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5F351893CC7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86421E9B21;
	Mon, 16 Jun 2025 07:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxhZQWxa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEF92CA6;
	Mon, 16 Jun 2025 07:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058624; cv=none; b=kDZSJY1VnnVEnU5I6gp65zfBFc4i7ABPPdBX0X9ssJEkBtbsCPOfQxK3NuNiArJWrHzf5Ew0l8yEMGLyJZzy3wpmQ//fwa9lYzMG0niq2u7vrTDntATHp9K6mJ/X9XlBZaP8irCGw/E/Os0urBy9pLNI4qY53l9dQei59sYRTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058624; c=relaxed/simple;
	bh=b9h7zpBbrRZhTHEHtZrUPxpbmzF8I65Zuhh72vAlq3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkJzUREYEoSt4vlpP4EciRPSwAoCnGJc50g7hMicAb5aylftO+l6yXN5yzw5HSt1I7nt3YwrcBkUsopph+TDapFurVOP/tCg1+c3lSp+4ya1MlEeuYEmKka3Oei5sCQqv0bPJT9Gk0MX9jRyT5v4+1EzkMbUr2m4x/+2Gzii0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxhZQWxa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E984C4CEEA;
	Mon, 16 Jun 2025 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750058624;
	bh=b9h7zpBbrRZhTHEHtZrUPxpbmzF8I65Zuhh72vAlq3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uxhZQWxa8PaxXzrGspetZXp7H0rjB85XIpI/59HnhkqZat7owbtKeGGZdAXksx7Ab
	 aakiNlhE9bUR5c2Zd/EByoQ6GZwl12tz7taYVgeTV9fTktlwOjge4GnBDDEMW/MxcS
	 hGF9SzrCwgHCSWuJrNoh6UNfQgxWmKb9q+h/p+HON4vw9fxBJhIeOndNH6eAMF4+31
	 Vn+ZfvGxf/iYZK90ck2Ckf45RTF7WP28tQ0z5knAvG2cd3mXJnVBieQ/dHCAvNH0Mo
	 KBpC1OHyiXb3KHVxog3kvrNANBY8zTmqkDSY6KIp9ag57Pvj1W/cXQ9134FGiW3au/
	 IZbu1dG1VBZ9Q==
Message-ID: <73a94b93-6c7d-464c-8fb8-a8e1004e67a8@kernel.org>
Date: Mon, 16 Jun 2025 09:23:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: gpio-xilinx: Mark clocks as
 required property
To: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <8407ef56b11632c1a7abfce8a4534ed8a8ed56cc.1749809570.git.michal.simek@amd.com>
 <cbde9b9e2b0f9d12fdd1ba24fddb1543159357aa.1749809570.git.michal.simek@amd.com>
 <2fb10aee-6610-43f4-9d12-88a97e0f66e5@kernel.org>
 <9dc04095-e397-4a51-a75c-8a5577be197e@amd.com>
 <1fced39f-1077-4af7-9294-affb99860984@kernel.org>
 <765a606b-3b87-4a08-8630-69a3c52ed138@amd.com>
 <1dfb2bbc-4ad5-454c-b046-b721500fbb91@kernel.org>
 <8c5ac938-6e58-4ff3-bc0c-d639b0c9ac14@kernel.org>
 <ccec896b-d639-40f5-8c5b-3527caf17d0c@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ccec896b-d639-40f5-8c5b-3527caf17d0c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2025 09:18, Michal Simek wrote:
> 
> 
> On 6/16/25 09:13, Krzysztof Kozlowski wrote:
>> On 16/06/2025 09:10, Krzysztof Kozlowski wrote:
>>> On 16/06/2025 08:51, Michal Simek wrote:
>>>> Hi,
>>>>
>>>> On 6/16/25 08:41, Krzysztof Kozlowski wrote:
>>>>> On 13/06/2025 13:26, Michal Simek wrote:
>>>>>>>> Based on discussion at
>>>>>>>> https://lore.kernel.org/lkml/20241002-revivable-crummy-f780adec538c@spud/
>>>>>>>>
>>>>>>>> Actually this shouldn't be only targetting GPIO but also for example
>>>>>>>> xlnx,xps-timebase-wdt-1.00.a but I would like to check it first on gpio
>>>>>>>> before starting to check other bindings.
>>>>>>>
>>>>>>> IIUC, patch #1 is a prerequisite, so you need to squash them. Otherwise
>>>>>>> dt_binding_check is not bisectable and we want it to be bisectable.
>>>>>>
>>>>>> No issue with squash if necessary. I sent it as series to be applied together
>>>>>> which won't break bisectability of tree and no new error is going to be reported.
>>>>>
>>>>> You did not say anything about dependencies and merging strategy, to
>>>>> this would go via different trees. Sending something in one patchset
>>>>> does not mean that there is a dependency.
>>>>
>>>> No offense but I don't think I can agree with this. The main purpose of patchset
>>>> is to show sequence how things should go one after each other and series should
>>>> go via single tree.
>>>
>>> Go through all patchsets on DT list touching different subsystems. You
>>> will find only 1% of patchsets having above expectation implied (when
>>> not explicitly stated).
>>>
>>> Really. 99% of patchsets on DT list targeting different subsytems, have
>>> opposite, so implied rule they go INDEPENDENTLY to separate subsystems.
>>>
>>> And above (so implied rule of splitting things) is even documented in DT
>>> submitting patches.
>>>
>> One more thought: That was from submitter point of view. But from
>> maintainers point of view, EVERY MONTH there is around one patchset on
>> DT list which has implied merging like you described (but not explicitly
>> stated) and MAINTAINERS pick them up independently causing breaks, so
>> some or many MAINTAINERS also have such reasoning as I said.
>>
>> They will pick up individual bits from patchset unless told otherwise.
> 
> What do you want me to do?
We just discuss about the process. You disagreed with me, I responded.
If you ask in general how to solve such problems: either squash such
patches or document the dependency/merging strategy.

General kernel submitting patches also asks about this:

https://elixir.bootlin.com/linux/v6.16-rc1/source/Documentation/process/submitting-patches.rst#L186

(which is third argument against your implied dependency within patchset).

Best regards,
Krzysztof

