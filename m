Return-Path: <linux-gpio+bounces-34766-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPA1ALrV1GnuxwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34766-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:00:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA23AC700
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 883CC30036FB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1213A75A5;
	Tue,  7 Apr 2026 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Ne3cqx7/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49225.qiye.163.com (mail-m49225.qiye.163.com [45.254.49.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C4F3A7835
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556012; cv=none; b=fG30RYDds5Pc2jOO+YKjvP2tnseAzY+eMIjoCzEskNfDFVmOynL/YlkJmjT2P8DvqjneSOhFAmB0IsFFCSAwkRTUTYsmURYX0XOgo1kZNHlOgUpeIdw3bijsrxZ9Uegu3zFiLUcCZtSUHkPKqO5/phe8CG7RchC0fFa0BmXpwjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556012; c=relaxed/simple;
	bh=dPYnbOP5sHNNF5ca16wAE75C9aU5fnRJE+ayfEmHH6k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pYQkQTwpgpLqO8qBovTu1fpGTGqsK3hoqg20ZHuUdAMs82dd3AAxSv1q33DWetF1aGMgnspb11Tm3Wdl18x+sdqkmByWHUVAnqzFWsTs3yD2KRWpIB1eIquCL8RMFgPHt7uAQPbpsfCQ5t1iLCYKsxr4jxe6zCu1i/Gwl3M879s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Ne3cqx7/; arc=none smtp.client-ip=45.254.49.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 39cb7de78;
	Tue, 7 Apr 2026 17:59:58 +0800 (GMT+08:00)
Message-ID: <73130e47-dbd7-c0d0-eba1-8bafba9f91e5@rock-chips.com>
Date: Tue, 7 Apr 2026 17:59:56 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, Linus Walleij <linusw@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org, ye.zhang@rock-chips.com
Subject: Re: [PATCH] gpio: rockchip: convert to dynamic GPIO base allocation
To: Bartosz Golaszewski <brgl@kernel.org>
References: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
 <CAMRc=Mfg3KvifZgpD8c7kkLNhv3zgDKvHB=n_=MQJ2EtwRi44A@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <CAMRc=Mfg3KvifZgpD8c7kkLNhv3zgDKvHB=n_=MQJ2EtwRi44A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d676272cd09cckunme7e3b5c731f66e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk8aHVYZSUwZQ0wdSh4dHk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVU
	pLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ne3cqx7/hycE/L7vLnAr5+H4FkmuJEhvp3LteaHn70J1+zV7BPsGXlg6XYEx6jqsBfBuCAwNi9xNbwYRA9Bqo3WUzT4YY/RY2Bu/PpuYMJ8Q1Lehst0aTGbkCgFTs19ZuDjTUOZMReYPZUiXtjPlxONbugtijV2GABGracMYBh4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=UykfOqm44M0JqkidCmZPxPcoafZJDvVGKJeuSCcLscc=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34766-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rock-chips.com:dkim,rock-chips.com:email,rock-chips.com:mid]
X-Rspamd-Queue-Id: 1BBA23AC700
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

在 2026/03/31 星期二 16:05, Bartosz Golaszewski 写道:
> On Mon, Mar 30, 2026 at 11:53 AM Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>
>> This driver is used on device tree based platform. Use dynamic
>> GPIO numberspace base to suppress the warning:
>>
>> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
>> gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
>> gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
>> gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
>> gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
>>
>>   drivers/gpio/gpio-rockchip.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
>> index ac1b939..08ea644 100644
>> --- a/drivers/gpio/gpio-rockchip.c
>> +++ b/drivers/gpio/gpio-rockchip.c
>> @@ -582,7 +582,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
>>          bank->gpio_chip = rockchip_gpiolib_chip;
>>
>>          gc = &bank->gpio_chip;
>> -       gc->base = bank->pin_base;
>> +       gc->base = -1;
>>          gc->ngpio = bank->nr_pins;
>>          gc->label = bank->name;
>>          gc->parent = bank->dev;
>> --
>> 2.7.4
>>
> 
> I take it you know first-hand that nobody depends on the predefined
> GPIO numbering for this driver? If so, I can queue it for v7.1.
> 

I have confirmed internally that nobody depends on the pre-defined
GPIO numbering.

Thanks.

> Bart
> 

