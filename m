Return-Path: <linux-gpio+bounces-10314-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE697D652
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 15:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6874CB21601
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 13:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE67517995E;
	Fri, 20 Sep 2024 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9qoyG0B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797B13A26F;
	Fri, 20 Sep 2024 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726839639; cv=none; b=HnL5YcHGmnvIKzqrMUG9s1GlcveS2t1EvHeeSbGtK5q9hLtzhkfWxRvRMMNz4fjd0Sz163DMGjg3OcOK0P2/b6icPC9RUbIRkhKDpf6BnOSiE5vO3M/h+J6DOoS8Vq6CTgFU7v900akn0fQ3Kp7tFxZRi3Jl8BL/ftyl0wxqL70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726839639; c=relaxed/simple;
	bh=MbUsKbc4h3caOjNoLKScCev08uVWhnLJbYiUb/2Rx8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDTprqESmDMYm5YTG2QLrdf0Ym5WMyFDdpVwdy+Q7nO+qkrJLpG7Vl3fHEjtMtLgFRjIdIkwH6spAJxxYYbYvQGHtOZobv7gyOPRrWAmW9cPRSXHgpm5Bmvrlu7vGl1PW1ysqcw6iud0QmXwM9SZcDDoEuaGVCW3xtTI0G3xoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9qoyG0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB83C4CECD;
	Fri, 20 Sep 2024 13:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726839639;
	bh=MbUsKbc4h3caOjNoLKScCev08uVWhnLJbYiUb/2Rx8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V9qoyG0BnriVxi3O/C/HOclygXXYDDVIH+nBJ6CEV0Q9l2ERgOxeHyZVc+Xbn43Ku
	 TWm6cXg3m8YVvXX2obpasH1Jl01OVz0kcOqJRUXyDr73sKWtf9HKSVAYkR7DCFOUxg
	 fzIjf8rI7idHIisXSkMieXDWBgWdWi6aDDtXN2FNJ5mQP3MASjPl0YgirWaZdJHXLr
	 ZeyR4ytpgLj4X2Iys9tuER+O3RsTBLwX8CKpLpy5IFxeUTzBRVw3UhgXApgZHg908I
	 pPaO+pZAJ9t6MqQTsQfjqN+fFPe0LZXCDTQBAnAD8D9e/1QJ/Z8ZcLji7KGV2Q9AR6
	 ukQ4f+HK37Jcg==
Message-ID: <bd5a2d24-164c-4707-a5fd-6584e444ee0b@kernel.org>
Date: Fri, 20 Sep 2024 15:40:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add support for NXP S32G2/S32G3
 SoCs
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>
References: <20240919134732.2626144-1-andrei.stefanescu@oss.nxp.com>
 <20240919134732.2626144-3-andrei.stefanescu@oss.nxp.com>
 <20240920-reapply-amusement-a37cf13fd910@squawk>
 <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <16950e81-e0ef-4e7c-b0ef-4f56415dceed@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2024 15:33, Andrei Stefanescu wrote:
> Hi Conor,
> 
> Thank you for your review!
> 
> On 20/09/2024 15:46, Conor Dooley wrote:
>> On Thu, Sep 19, 2024 at 04:47:22PM +0300, Andrei Stefanescu wrote:
>>> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>>>
>>> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
>>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>> ---
>>>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 107 ++++++++++++++++++
>>>  1 file changed, 107 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>>> new file mode 100644
>>> index 000000000000..0548028e6745
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
>>> @@ -0,0 +1,107 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
>>> +# Copyright 2024 NXP
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/gpio/nxp,s32g2-siul2-gpio.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: NXP S32G2 SIUL2 GPIO controller
>>> +
>>> +maintainers:
>>> +  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>>> +  - Larisa Grigore <larisa.grigore@nxp.com>
>>> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>>> +
>>> +description:
>>> +  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
>>> +  chips. It includes an IRQ controller for all pins which have
>>> +  an EIRQ associated.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: nxp,s32g2-siul2-gpio
>>
>> Commit message and binding description say s32g2 and s32g3, but there's
>> only a compatible here for g2.
> 
> Yes, the SIUL2 GPIO hardware is the same for both S32G2 and S32G3 SoCs. I plan
> to reuse the same compatible when I add the SIUL2 GPIO device tree node for
> the S32G3 boards. Would that be ok?

There are only few exceptions where re-using compatible is allowed. Was
S32G on them? Please consult existing practice/maintainers and past reviews.

Best regards,
Krzysztof


