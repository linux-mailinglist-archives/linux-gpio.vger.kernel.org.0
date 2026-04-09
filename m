Return-Path: <linux-gpio+bounces-34970-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEyiGmf512mrVAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34970-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 21:09:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C69FA3CEF87
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 21:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B99A30073D9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 19:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A0531F9B3;
	Thu,  9 Apr 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="hfAgzfns"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABD7250C06
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 19:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775761762; cv=none; b=jKwy8JaZrw5B3gD8RXHHrNpbwlC3NsLXLCuWE20E8eEeYHVzDtEGqR7bB1x1UU/uHB+VXHihV1Tk2gpp/Fk3MQoMBQB9odhBI0i/C9cLT1aVB2DXC5o16fNxZ6KptL35dj+irAIOeE8AAyM4u6UB+LGAMK1W7d44/moFe+uadGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775761762; c=relaxed/simple;
	bh=+DJCmXO8nVtA2bKXTovqpSv1S6k/eH8NTg9rtMDnqZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJrCF6eAgNnyDdhdwFDRmL2VCNL2vmMrwQAlrNeZfaapkqKvv5NABhTgSpmEmg2QdEiY+yad4C0xZh5U9E3bvRBDHzbcObmsgjAL39qMh30fZJum4qJblNSdoLi7vuDpqfSwQSRf9Fq53oJWZ3lDkz+/W5Gg9F2j95E13vuRp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=hfAgzfns; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1775761754;
 bh=7mFdGI22HLazQ8AMNtyB+5bh4ZS1+fAVOQiETGYdJus=;
 b=hfAgzfnsakFNSe4p2IeBaEQaNMEH1wxFbjEfDapE1Wx3jL29lbDQwNY0ho9DRCamJ9pVQphpw
 TNIZgWl/H18/hEnxZKSYRdsksihOqkA6XnuU3uAIeYfk8eLmtBSI/ShPqI/ZxSYo9VdURTtLaT8
 dCotLctyt/IrIc40K+DLyM03B3uQW58sxbXn3B1L4erKgFOzoOxwdAHTDZqjI1WRrsi+m90qp0b
 nAx4UTJvheUV8/VPk1TAdVAjRyZA/ghEH1oP8uSpAR7Iu+xB7p+DpC7EZHjbGogo1nz26QJwAsx
 NQnXLqrR3eLwrspxY+CKFb19DMvvTuO82sq/CXIUl6rw==
X-Forward-Email-ID: 69d7f95570094f9452de21a3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.6.69
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <384b25a0-d55d-4415-82fb-dcf2e6ad1232@kwiboo.se>
Date: Thu, 9 Apr 2026 21:09:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rockchip: convert to dynamic GPIO base allocation
To: Shawn Lin <shawn.lin@rock-chips.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 ye.zhang@rock-chips.com
References: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
 <CAMRc=Mfg3KvifZgpD8c7kkLNhv3zgDKvHB=n_=MQJ2EtwRi44A@mail.gmail.com>
 <73130e47-dbd7-c0d0-eba1-8bafba9f91e5@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <73130e47-dbd7-c0d0-eba1-8bafba9f91e5@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34970-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kwiboo.se:dkim,kwiboo.se:mid,ff788000:email,ff780000:email]
X-Rspamd-Queue-Id: C69FA3CEF87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 4/7/2026 11:59 AM, Shawn Lin wrote:
> Hi Bartosz,
> 
> 在 2026/03/31 星期二 16:05, Bartosz Golaszewski 写道:
>> On Mon, Mar 30, 2026 at 11:53 AM Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>>
>>> This driver is used on device tree based platform. Use dynamic
>>> GPIO numberspace base to suppress the warning:
>>>
>>> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
>>> gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
>>> gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
>>> gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
>>> gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
>>>
>>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>> ---
>>>
>>>   drivers/gpio/gpio-rockchip.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
>>> index ac1b939..08ea644 100644
>>> --- a/drivers/gpio/gpio-rockchip.c
>>> +++ b/drivers/gpio/gpio-rockchip.c
>>> @@ -582,7 +582,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
>>>          bank->gpio_chip = rockchip_gpiolib_chip;
>>>
>>>          gc = &bank->gpio_chip;
>>> -       gc->base = bank->pin_base;
>>> +       gc->base = -1;
>>>          gc->ngpio = bank->nr_pins;
>>>          gc->label = bank->name;
>>>          gc->parent = bank->dev;
>>> --
>>> 2.7.4
>>>
>>
>> I take it you know first-hand that nobody depends on the predefined
>> GPIO numbering for this driver? If so, I can queue it for v7.1.
>>
> 
> I have confirmed internally that nobody depends on the pre-defined
> GPIO numbering.

This patch is causing boot issues on my Rock Pi 4 (RK3399) board using
next-20260409 kernel where this patch has been applied as c8079f83e0bf.

[    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
[    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
[    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
[    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
[    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
--
[    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it cannot be requested
[    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:637)
[    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/led-0'
[    0.212389] leds-gpio leds: probe with driver leds-gpio failed with error -22
--
[    0.607545] rockchip-pinctrl pinctrl: pin 519 is not registered so it cannot be requested
[    0.608775] rockchip-pinctrl pinctrl: error -EINVAL: pin-519 (gpio0:519)
[    0.610003] dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockchip failed with error -22
--
[    0.805882] rockchip-pinctrl pinctrl: pin 547 is not registered so it cannot be requested
[    0.806672] rockchip-pinctrl pinctrl: error -EINVAL: pin-547 (gpio1:547)
[    0.807301] reg-fixed-voltage regulator-vbus-typec: error -EINVAL: can't get GPIO
[    0.807307] rockchip-pinctrl pinctrl: pin 602 is not registered so it cannot be requested
[    0.807970] reg-fixed-voltage regulator-vbus-typec: probe with driver reg-fixed-voltage failed with error -22
[    0.808692] rockchip-pinctrl pinctrl: error -EINVAL: pin-602 (gpio2:602)
[    0.810279] reg-fixed-voltage regulator-vcc3v3-pcie: error -EINVAL: can't get GPIO
[    0.810284] rockchip-pinctrl pinctrl: pin 665 is not registered so it cannot be requested
[    0.810299] rockchip-pinctrl pinctrl: error -EINVAL: pin-665 (gpio4:665)
[    0.810960] reg-fixed-voltage regulator-vcc3v3-pcie: probe with driver reg-fixed-voltage failed with error -22
[    0.811679] reg-fixed-voltage regulator-vcc5v0-host: error -EINVAL: can't get GPIO
[    0.813943] reg-fixed-voltage regulator-vcc5v0-host: probe with driver reg-fixed-voltage failed with error -22
--
[    0.867788] rockchip-pinctrl pinctrl: pin 522 is not registered so it cannot be requested
[    0.868537] rockchip-pinctrl pinctrl: error -EINVAL: pin-522 (gpio0:522)
[    0.869166] pwrseq_simple sdio-pwrseq: error -EINVAL: reset GPIOs not ready
[    0.869798] pwrseq_simple sdio-pwrseq: probe with driver pwrseq_simple failed with error -22
--
[    0.940365] rockchip-pinctrl pinctrl: pin 623 is not registered so it cannot be requested
[    0.941084] rockchip-pinctrl pinctrl: error -EINVAL: pin-623 (gpio3:623)
[    0.941823] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: Cannot register the MDIO bus
[    0.942542] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: MDIO bus (id: 0) registration failed
[    0.943772] rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac-dwmac failed with error -22

With c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base
allocation") reverted everything goes back to normal and gpio/pinctrl
and all devices depending on gpio works again.

Regards,
Jonas

> 
> Thanks.
> 
>> Bart
>>

