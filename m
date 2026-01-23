Return-Path: <linux-gpio+bounces-31029-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E9FMSAIdGmE1gAAu9opvQ
	(envelope-from <linux-gpio+bounces-31029-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 00:45:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E307B873
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Jan 2026 00:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED133013AAC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 23:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87C022259F;
	Fri, 23 Jan 2026 23:45:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C9715E5BB;
	Fri, 23 Jan 2026 23:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769211932; cv=none; b=f60PSpYolmgB4ikbt/LzbReiUceOpHLO2l9dDYamCti7zqDxJUtLCQ8kWvAAB18wQ2mVZWUkTVy580UkgZ3YMJyE36JzNwUk5Hr/VgVHCqi9JFTb0BfVGqr9IMVlwMIy1/VqNv0Qx6oNIydGiOnCYSUxnX7oYO4yTEsbeln2+vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769211932; c=relaxed/simple;
	bh=zC0V6wSbmMfojZ+NWBRVzhSNvDBpOJ/m3zw7EyxvdhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uatP0bB0gBBOouq/tMcO3eWn8MTqz5XMOqXkQnufye3/ucmhN9upcwe7ICKA6NgbwSUMsIc+T5yFnCnoDwoHyvXSZkTCeYFKHxM2iV2NTAVcvxdPu1gTQQBmXmyDRsGlISYBfYnI3FONs7fo1hcRxrdEUA0hXKhDXCMhUg9bqeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC431476;
	Fri, 23 Jan 2026 15:45:22 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A8B73F632;
	Fri, 23 Jan 2026 15:45:27 -0800 (PST)
Message-ID: <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com>
Date: Fri, 23 Jan 2026 23:45:25 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <CAMRc=Md0h5b=N9CqV-9L9sOtCNbiL1-y6RE0x4+w9HYXE8=pEQ@mail.gmail.com>
 <e9fd0005-bfbb-4052-8c2a-9200eb0b60ac@arm.com> <16771005.dW097sEU6C@diego>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <16771005.dW097sEU6C@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31029-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23E307B873
X-Rspamd-Action: no action

On 2026-01-23 9:52 pm, Heiko Stübner wrote:
> Am Freitag, 23. Januar 2026, 21:57:50 Mitteleuropäische Normalzeit schrieb Robin Murphy:
>> On 2026-01-23 7:27 pm, Bartosz Golaszewski wrote:
>>> On Fri, Jan 23, 2026 at 2:27 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>>>
>>>>>>
>>>>>> It's not a big issue for the hdmirx driver specifically, but I wonder
>>>>>> how many more (less often tested) rockchip drivers use GPIOs from their
>>>>>> IRQ handler.
>>>>
>>>> Yeah, seems this finally reached my distro kernel and now the kernel log
>>>> on one of my boards is totally flooded from gpio_ir_recv_irq()
>>>> (legitimately) calling gpio_get_value()... that's not really OK :/
>>>>
>>>
>>> This has always been a sleeping driver. The driver does not know the
>>> firmware configuration it'll be passed and - as I explained above -
>>> depending on the lookup flags, we may call .direction_output() and
>>> descend into pinctrl which uses mutexes. Ideally, we'd make
>>> GPIO-facing pinctrl operations not sleeping but this is a long-time
>>> project and quite complex. Telling the GPIO core that it cannot sleep
>>> is simply incorrect - even if it worked for this particular use-case -
>>> and has an impact on paths we're choosing.
>>>
>>> Can the GPIO reading in the gpio-ir-recv driver be done from a
>>> high-priority workqueue by any chance? Or can we make it a threaded
>>> interrupt?
>>
>> rockchip_gpio_get() is essentially nothing but a readl(), please explain
>> how that could sleep? Saying that countless in-tree and out-of-tree
>> arbitrary GPIO consumer drivers should pointlessly refactor just to
>> avoid the GPIO core spewing spurious WARN()s is not reasonable.
>>
>> I appreciate there are cases where the warning most definitely *is*
>> relevant, which is why I picked up this discussion rather than proposing
>> a revert, even though the documentation says:
>>
>>    * @can_sleep: flag must be set iff get()/set() methods sleep, as they
>>
>> where since neither rockchip_gpio_get() nor rockchip_gpio_set()
>> themselves sleep, apparently this flag must *not* be set. It's
>> irrelevant that a higher-level gpiod_set_value() invocation might end up
>> calling .set_direction before it gets as far as calling .set - that's
>> not the gpio_chip's fault, and gpiolib knows exactly what it's doing.
>>
>> What I'm getting at is that getting, and even (directly) setting a
>> GPIO's value can reasonably be expected to be more common and applicable
>> in a wider range of circumstances than changing its configuration, so
>> the former should not be unfairly penalised because of the latter. This
>> case is clearly distinct from external GPIO expanders on buses that
>> fundamentally can't guarantee fast memory-mapped access at all, so
>> trying to conflate it under the same flag doesn't fit, and that needs
>> fixing ASAP, before the reverts *do* start piling in. Maybe that just
>> means some new dir_can_sleep or more abstract dir_needs_pinctrl flag
>> might suffice, maybe it's something more involved; I don't really know,
>> and I don't have the bandwidth to take this on myself.
> 
> the sadest part here is, that the dive from gpio to pinctrl is sort of
> a remant of the past. Originally it was meant to "automatically" set
> the gpio pinmux, but nowadays we (at least try to) have pinctrl entries
> doing that separately.
> 
> But of course that's hard to enforce now, because we can't really know
> where gpios without pinctrl might hide, and of course newer kernels
> need to still run with old DTBs.
> 
> But...
> 
> rockchip_pmx_gpio_set_direction()'s only function is to set the GPIO
> pinmux - it does not handle the actual the actual direction.
> 
> Can't we move the pinctrl_gpio_direction_input/_output() call just over
> to the request callback of the gpiochip?

In fact, after an hour or so chasing through the code, is that not just
pretty much this? (Not even compile tested as I'd rather go to bed now...)

Cheers,
Robin.

----->8-----
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76..118edd57c252 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -164,12 +164,6 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
  	unsigned long flags;
  	u32 data = input ? 0 : 1;
  
-
-	if (input)
-		pinctrl_gpio_direction_input(chip, offset);
-	else
-		pinctrl_gpio_direction_output(chip, offset);
-
  	raw_spin_lock_irqsave(&bank->slock, flags);
  	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr);
  	raw_spin_unlock_irqrestore(&bank->slock, flags);
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..2fc67aeafdb3 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3545,10 +3545,9 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
  	return 0;
  }
  
-static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
-					   struct pinctrl_gpio_range *range,
-					   unsigned offset,
-					   bool input)
+static int rockchip_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
  {
  	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
  	struct rockchip_pin_bank *bank;
@@ -3562,7 +3561,7 @@ static const struct pinmux_ops rockchip_pmx_ops = {
  	.get_function_name	= rockchip_pmx_get_func_name,
  	.get_function_groups	= rockchip_pmx_get_groups,
  	.set_mux		= rockchip_pmx_set,
-	.gpio_set_direction	= rockchip_pmx_gpio_set_direction,
+	.gpio_request_enable	= rockchip_pmx_gpio_request_enable,
  };
  
  /*


