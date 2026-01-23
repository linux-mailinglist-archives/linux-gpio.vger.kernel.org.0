Return-Path: <linux-gpio+bounces-31009-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DxkDTF3c2kEwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31009-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:27:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E8763CE
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DDDB30041E8
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 13:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC2F30E84D;
	Fri, 23 Jan 2026 13:27:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180A9311C10;
	Fri, 23 Jan 2026 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174828; cv=none; b=E6+z+QoJvkaa8wc9tZ9PKMrRAoyf6S9SITxclLG87ijAvoR4Q7nEKg20/DvwJfyJvQYr8At4R1lF1YuHCc42QiO/6ccoa74hNqpJt9HQsL5KjclPg/Phe/VgJjBPrNhPnLL45xWMpYFx5GOOxxWOiq/pTCt1XiJjXBNACIePtDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174828; c=relaxed/simple;
	bh=/xiJ3qsKmWigxZdxcWd/6FkYFcUHYblzcS5DJir3EHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9GlQf5oHOWvfHkJ5CKxNny1ogUAicMRAawRj7UdKygJLF01wezljnXoZ9l1W+6bkgNq4vRupBjqdWxq1E8dsrwhztVULYqgBAAVwqXIpCRyeIFF+47EuKrgKy1xfQOdxriQ4FncjBo8cy1F0rHgojadtDn6ZCMjgugsX0OL2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 876731476;
	Fri, 23 Jan 2026 05:26:59 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 862413F632;
	Fri, 23 Jan 2026 05:27:04 -0800 (PST)
Message-ID: <447e8d5a-916b-4d58-b39c-3467c152379c@arm.com>
Date: Fri, 23 Jan 2026 13:27:02 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <brgl@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <aWGSQYCXP4R08koQ@venus>
 <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31009-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,collabora.com:email,arm.com:mid,infradead.org:url,infradead.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B66E8763CE
X-Rspamd-Action: no action

On 2026-01-12 9:08 am, Bartosz Golaszewski wrote:
> On Sat, Jan 10, 2026 at 12:55 AM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
>>
>> Hi,
>>
>> On Tue, Jan 06, 2026 at 10:00:11AM +0100, Bartosz Golaszewski wrote:
>>> The GPIO controller is configured as non-sleeping but it uses generic
>>> pinctrl helpers which use a mutex for synchronization.
>>>
>>> This can cause the following lockdep splat with shared GPIOs enabled on
>>> boards which have multiple devices using the same GPIO:
>>>
> 
> [snip]
> 
>>>
>>> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc6@samsung.com/
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> ---
>>>   drivers/gpio/gpio-rockchip.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
>>> index 47174eb3ba76..bae2061f15fc 100644
>>> --- a/drivers/gpio/gpio-rockchip.c
>>> +++ b/drivers/gpio/gpio-rockchip.c
>>> @@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
>>>        gc->ngpio = bank->nr_pins;
>>>        gc->label = bank->name;
>>>        gc->parent = bank->dev;
>>> +     gc->can_sleep = true;
>>
>> This means all operations are marked as can_sleep, even though
>> pinctrl operations are only used for the direction setting.
>> I.e. the common get/set operations always worked in atomic mode,
>> but now complain. See for example:
>>
>> https://lore.kernel.org/all/20260108-media-synopsys-hdmirx-fix-gpio-cansleep-v1-1-3570518d8bab@kernel.org/
>>
>> It's not a big issue for the hdmirx driver specifically, but I wonder
>> how many more (less often tested) rockchip drivers use GPIOs from their
>> IRQ handler.

Yeah, seems this finally reached my distro kernel and now the kernel log 
on one of my boards is totally flooded from gpio_ir_recv_irq() 
(legitimately) calling gpio_get_value()... that's not really OK :/

Thanks,
Robin.

>> Considering setting or getting the GPIO from atomic context is much
>> more common than changing the direction - is there some way to
>> describe the sleep behavior in a more specific way in the GPIO
>> controller?
>>
> 
> No, there's no such switch at the moment. This is because there are
> paths that we can take, where we *do* end up setting direction from
> gpiod_set_value(). For instance:
> 
> gpiod_set_value()
>    gpiod_set_value_nocheck()
>      gpio_set_open_drain_value_commit()
>        gpiochip_direction_output()
> 
> I'm afraid, for correctness, it has to be either sleeping, or not. I
> would love - at some point - to make pinctrl mostly lockless with
> SRCU, like we did with GPIO. That would solve this issue correctly.
> But until then, I'm afraid we need to keep a chip-global switch for
> sleeping.
> 
> Bartosz
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


