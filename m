Return-Path: <linux-gpio+bounces-9451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3C8965FF0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 13:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4C01C21113
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 11:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68D3190684;
	Fri, 30 Aug 2024 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4Pelg4O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737241531CD;
	Fri, 30 Aug 2024 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725015834; cv=none; b=eR4Q422NF3IOHYiS60qPEGIESMscRZvtw/7AL5iIKEoePFq/EWdRVNe46CTClMZ6WP4+UUynYwwFoihf6fqylKvh3PggJXzNNuC3fqa8ud5YrGZCN4bIG+O6RnhycPTUpm84XKjVr6OD8imDr9l2Q4SioDpD3Hc2omYG7CSl6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725015834; c=relaxed/simple;
	bh=usFsqN8rw6jJgzE3LoXO1ibr/w7v/sbbk6GzQgZo84s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCe89kGG0KqSQb+61UF0X87w9r/wgPFT7raB4JjCOgbWOV12bgQd5Mp+x6PSqn3iYBxPViQJLJXwJjs1tCwP/AL+llY2Rdr0RWa9lZJXljaWiL89oHTpLjM+YTlKeESmQW7e4Ijy/NZrXNbgIbHi3xBSKxoJMwdurjMhx/jUzhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4Pelg4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729DBC4CEC2;
	Fri, 30 Aug 2024 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725015834;
	bh=usFsqN8rw6jJgzE3LoXO1ibr/w7v/sbbk6GzQgZo84s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h4Pelg4OuZmSA+H86fQvajI5AX/6qqQwKsU/N0SkPzu8x7Qv6XnYd0tO0fKZM8dtG
	 5OqqQ7YrT00eEyzkCd8+8kGcK07XgHLnFEQozGB+RS56vrwWjTDLLrX2jJ5wGHiG/T
	 6ZURzv67kaNMHHQ7RnWe+qlXsD40z1eQrTfqa7EtstMZyYRXqbE/9U7d5XQ+XTEAm0
	 2uJSYRnDIS6MyYsd9k4RYh6K3U5x6sfXbKUM8nwnVKjB6BNK3dH6XGCNo/13wuEVcu
	 wvfpJvIrCs6oTlOosRd29bpl11gPAkhkxpzaatMlsKuKQ0OPnr4nPvLexVSlFWqVkP
	 u4p9trkLVAJmw==
Message-ID: <09aa43d6-9e8c-4f6e-ab49-dc4a9571e832@kernel.org>
Date: Fri, 30 Aug 2024 13:03:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
To: Conor Dooley <conor.dooley@microchip.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Conor Dooley <conor@kernel.org>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com
References: <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk> <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
 <66ce1b04.df0a0220.a2131.6def@mx.google.com>
 <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
 <66d187f1.050a0220.3213d8.ad53@mx.google.com>
 <2c9aafdd-000b-4e8f-b599-4f57e7eb0ca7@kernel.org>
 <ZtGlJBORZaFm_77K@lore-desk> <20240830-payphone-unexposed-75eed532c14d@wendy>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240830-payphone-unexposed-75eed532c14d@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2024 13:01, Conor Dooley wrote:
> On Fri, Aug 30, 2024 at 12:55:32PM +0200, Lorenzo Bianconi wrote:
>> [...]
>>
>>>>>>
>>>>>> Hi Rob, thanks a lot for the hint, I hope we can finally find a solution
>>>>>> on how to implement this.
>>>>>>
>>>>>> In Documentation the block is called GPIO Controller. As explained it does
>>>>>> expose pinctrl function AND pwm (with regs in the middle)
>>>>>>
>>>>>> Is this semplification really needed? It does pose some problem driver
>>>>>> wise (on where to put the driver, in what subsystem) and also on the
>>>>>
>>>>> Sorry, but no, dt-bindings do not affect the driver at all in such way.
>>>>> Nothing changes in your driver in such aspect, no dilemma where to put
>>>>> it (the same place as before).
>>>>>
>>>>
>>>> Ok, from the proposed node structure, is it problematic to move the
>>>> gpio-controller and -cells in the pinctrl node? And also the pwm-cells
>>>> to the pwm node?
>>>
>>> The move is just unnecessary and not neat. You design DTS based on your
>>> drivers architecture and this is exactly what we want to avoid.
>>>
>>>> This is similar to how it's done by broadcom GPIO MFD [1] that also
>>>
>>> There are 'reg' fields, which is the main problem here. I don't like
>>> that arguments because it entirely misses the discussions - about that
>>> binding or other bindings - happening prior to merge.
>>>
>>>> expose pinctrl and other device in the same register block as MFD
>>>> childs.
>>>>
>>>> This would be the final node block.
>>>>
>>>>                 mfd@1fbf0200 {
>>>>                         compatible = "airoha,en7581-gpio-mfd";
>>>>                         reg = <0x0 0x1fbf0200 0x0 0xc0>;
>>>>
>>>>                         interrupt-parent = <&gic>;
>>>>                         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>>>>
>>>>                         pio: pinctrl {
>>>>                                 compatible = "airoha,en7581-pinctrl";
>>>>
>>>>                                 gpio-controller;
>>>>                                 #gpio-cells = <2>;
>>>>
>>>>                                 interrupt-controller;
>>>>                                 #interrupt-cells = <2>;
>>>
>>> No resources here...
>>
>> ack. iiuc, all the properties will be in the parent node (mfd) and we will
>> have just the compatible strings in the child ones, right? Something like:
>>
>> 		mfd@1fbf0200 {
>> 			compatible = "airoha,en7581-gpio-mfd";
>> 			reg = <0x0 0x1fbf0200 0x0 0xc0>;
>> 			gpio-controller;
>> 			#gpio-cells = <2>;
>>
>> 			...
>> 			#pwm-cells = <3>;
>>
>> 			pio: pinctrl {
>> 				compatible = "airoha,en7581-pinctrl";
>> 			};
>>
>> 			pwm: pwm {
>> 				compatible = "airoha,en7581-pwm";
>> 			};
>> 		};
> 
> 
> Didn't Rob basically tell you how to do it earlier in the thread?
> What you've got now makes no sense, the compatibles only exist in that
> to probe drivers, which you can do from the mfd driver with
> mfd_add_devices() or w/e that function is called.

Yep, we are making circles.

I will repeat:
"The move is just unnecessary and not neat. You design DTS based on your
drivers architecture and this is exactly what we want to avoid."

Best regards,
Krzysztof


