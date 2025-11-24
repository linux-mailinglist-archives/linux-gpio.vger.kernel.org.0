Return-Path: <linux-gpio+bounces-29047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FCC82C4E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 00:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AF104E5795
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 23:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541172F60A6;
	Mon, 24 Nov 2025 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="EWskoSh1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5C26B75C
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764025544; cv=none; b=N0FRckiDH5qRxoC1C7HshRZPAh7qFrE/wJlYMcSaQERbdzxdnIxcXFRByZI+byNBxzHwa7h5qCTdl+2xHj2bQcUYQ4Id/Val4vOgFPBVqDA8mbhTM/7KEGWUs0ugEsS9uyFzUMJI9G2KaClMs2QdH5PVl6GSz+/XLTTLnwoKVtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764025544; c=relaxed/simple;
	bh=Z0bfPsrJxiR5XYzKIGaSDc/1QPUUhDJBzVL1+arosfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFCjQ/LN+koLkRkAvSrV6IooP+YDRA5Q39fDNjBJGYz/hWY9i2N+Sp/b14cmNStZEH1+x4r6KhCouEMjcTrLUixqWiULD7YaVWSQ8PZY+VizGQl88WITHIDJHsd7Kh1kbiI09IkDnv6TMl/w1neNThUZK+No6zWGvZiBTiAD2gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=EWskoSh1; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <98c0f185-b0e0-49ea-896c-f3972dd011ca@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1764025530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rigrPoZ4oOxcaiyz20Ooyz0eENH2D9rnHH7Vg05+nM=;
	b=EWskoSh1eFEakqp0SUJGgnS3DIW7sm5zhi4S8heVAXVYLlxR88jqAHMt2H70oYQpMV8PB7
	pyMNTgmqvx2DS2o2RSoU11S8MRkNTR7Ai91YnZ75Fu89PE4GjzOFPWlG4yKR1ZUweZc91z
	+zIJ7pfOOypgekjKdZzL/Lh6vLeHUJYwaCk1xTsUd+0GhYLJ4Ju4wMJpX4t0lTmiYujQsX
	CC+aAxHxQcXb2N72sOiSqoclVl1SsVICrZ4wQNFyEvGNnp2AVy54ccty/WtkUUkwCOMFDo
	OeXYcGaAKw2KXh4swkWXxQOQkH+wAZzzSOJCYyu/CO60mrJYrrFGK0HBj18tBw==
Date: Mon, 24 Nov 2025 20:05:24 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] gpio: shared: handle the reset-gpios corner case
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org>
 <be7fd390-e81d-4e93-880a-1b6404398408@packett.cool>
 <CAMRc=MdW3AkkivE=sA4STZAmmee7bCBkD5oEsXiRcKA80Ggd4A@mail.gmail.com>
 <CAMRc=MfQhu9GY2+3G+Ba71JnXUnU4akAfNbsMDnwkCRNzAXQCw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <CAMRc=MfQhu9GY2+3G+Ba71JnXUnU4akAfNbsMDnwkCRNzAXQCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 11/24/25 12:36 PM, Bartosz Golaszewski wrote:
> On Mon, Nov 24, 2025 at 9:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> On Sun, Nov 23, 2025 at 2:03 AM Val Packett <val@packett.cool> wrote:
>>>> ---
>>>> This is targetting linux-next where the reset-gpio driver is now using
>>>> the auxiliary bus and software nodes rather than the platform bus and
>>>> GPIO machine lookup. The bug is the same in both cases but the fix would
>>>> be completely different.
>>>> ---
>>>> [..]
>>> Tried applying only this, as well as this +
>>> https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org/
>>> + https://lore.kernel.org/all/20251121135739.66528-1-brgl@bgdev.pl/ (on
>>> top of next-20251120) and the issue is still present.. am I missing
>>> something?
>> Can you try this branch?
>>
>>    https://github.com/brgl/linux test/gpiolib-shared-reset-gpio-fix
>>
>> I confirmed it works on my setup and fixes the problem with multiple
>> users of reset-gpio AND shared GPIOs enabled.
> Actually linux-next got updated with all the prerequisites so you can
> try this patch on top of next-20251124. I tested it and it works for
> me. If it still doesn't for you, can you enable GPIO debug messages
> and send me the entire kernel log?
>
> Bartosz

Rebased to next-20251124, still the same..

Here's a full dmesg: https://owo.packett.cool/lin/sound.gpio.dmesg

I even added a custom print to confirm the reason of the EBUSY:

[    9.233613] gpiolib: swnode: swnode_find_gpio: parsed 'reset-gpios' 
property of node 'node4[0]' - status (0)
[    9.233624] gpiolib_shared: Adding machine lookup entry for a shared 
GPIO for consumer reset.gpio.0, with key 'gpiolib_shared.proxy.8' and 
con_id 'reset'
[    9.233630] reset_gpio reset.gpio.0: using lookup tables for GPIO lookup
[    9.233640] gpio_shared_proxy gpiolib_shared.proxy.8: Shared GPIO 
requested, number of users: 1
[    9.233652] gpio_shared_proxy gpiolib_shared.proxy.8: Only one user 
of this shared GPIO, allowing to set direction to output with value 'low'
[    9.332317] reset_gpio reset.gpio.1: using swnode 'node5' for 'reset' 
GPIO lookup
[    9.332337] gpiolib: swnode: swnode_find_gpio: parsed 'reset-gpios' 
property of node 'node5[0]' - status (0)
[    9.332343] gpiolib_shared: Adding machine lookup entry for a shared 
GPIO for consumer reset.gpio.1, with key 'gpiolib_shared.proxy.8' and 
con_id 'reset'
[    9.332347] reset_gpio reset.gpio.1: using lookup tables for GPIO lookup
[    9.332353] gpio-856 (reset): gpiod_request_commit: flags 200043 
test_and_set_bit GPIOD_FLAG_REQUESTED -> EBUSY
[    9.332356] gpio-856 (reset): gpiod_request: status -16
[    9.332358] reset_gpio reset.gpio.1: error -EBUSY: Could not get 
reset gpios
[    9.332362] reset_gpio reset.gpio.1: probe with driver reset_gpio 
failed with error -16
[    9.441612] wcd938x_codec audio-codec: bound sdw:2:0:0217:010d:00:4 
(ops wcd_sdw_component_ops [snd_soc_wcd_common])
[    9.441644] wcd938x_codec audio-codec: bound sdw:3:0:0217:010d:00:3 
(ops wcd_sdw_component_ops [snd_soc_wcd_common])
[    9.445771] gpio_shared_proxy gpiolib_shared.proxy.8: Voted for value 
'high', effective value is 'high', number of votes for 'high': 1


