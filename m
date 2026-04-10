Return-Path: <linux-gpio+bounces-35003-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO6QG3Lj2GnHjAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35003-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:48:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AECF93D6561
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66C3A302A2E9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAF73A1E9B;
	Fri, 10 Apr 2026 11:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="a9C6C0pM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBF337EFE3
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775821277; cv=none; b=klpSfUECOXzEDVjpsJchx0FPCoFAhrcsPTKZQ0dM57XJz16sCzfnMAF0YvrsqMvtYzs+hAxItelKUnOWi8BjeRpTdRzfyr4MOs9QDlifkl3SODObUa9pWrhs7Icg7icYuswGjEwmccfGsyQgqGB0bRdWlW7XS/WNU63PC5kI/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775821277; c=relaxed/simple;
	bh=2wuoq9XMmD2V3k5JFrUn8DPEimM8UcRzPRCVnd56uIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJvS9WOUu5ZbBR8ZJ4dePFWb4J+mYKGN0R7Sq1XrMEOtI/1CPJaBZ4DUeZswI7Rq+MkJsLdXKnhlLTW4SeN+ro7TbB9GcNdF63CwaaPOQy5g+Iy2C+fHkZ1kK6cqrems/IXR5SEC987AfojwZBGdzGnOL3RMft8piwxvTakKv5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=a9C6C0pM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1F922682;
	Fri, 10 Apr 2026 04:41:08 -0700 (PDT)
Received: from [10.1.29.18] (e122027.cambridge.arm.com [10.1.29.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A140E3FAF5;
	Fri, 10 Apr 2026 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775821274; bh=2wuoq9XMmD2V3k5JFrUn8DPEimM8UcRzPRCVnd56uIY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a9C6C0pMK6Lm+gXRvzEf8dX83yYaTeRTNeP5lr9r3FKULKtocImvsXEYk/xYnfPC4
	 Qp9yToAWV2fdLb26X61N164vTstZElcypSmI295XpBIsGu+VzDnX/9N8IvXEcPEqUZ
	 t2GmxQSjZHfpf0ktkWP122h5C921a/Ia5ARMUbdQ=
Message-ID: <9b00710f-ba4b-4aa1-8402-98cea34055fa@arm.com>
Date: Fri, 10 Apr 2026 12:41:10 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: rockchip: convert to dynamic GPIO base allocation
To: Linus Walleij <linusw@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 ye.zhang@rock-chips.com
References: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
 <CAMRc=Mfg3KvifZgpD8c7kkLNhv3zgDKvHB=n_=MQJ2EtwRi44A@mail.gmail.com>
 <73130e47-dbd7-c0d0-eba1-8bafba9f91e5@rock-chips.com>
 <384b25a0-d55d-4415-82fb-dcf2e6ad1232@kwiboo.se>
 <CAD++jLmhkZhWzjV9b6r9P4oZq=4dqVEVV7mwwE_WWRgRXbq3AQ@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAD++jLmhkZhWzjV9b6r9P4oZq=4dqVEVV7mwwE_WWRgRXbq3AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35003-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ff790000:email,arm.com:dkim,arm.com:mid,ff720000:email,ff730000:email]
X-Rspamd-Queue-Id: AECF93D6561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 23:25, Linus Walleij wrote:
> On Thu, Apr 9, 2026 at 9:09 PM Jonas Karlman <jonas@kwiboo.se> wrote:
> 
>> This patch is causing boot issues on my Rock Pi 4 (RK3399) board using
>> next-20260409 kernel where this patch has been applied as c8079f83e0bf.

I had similar problems with my Firefly RK3288.

>>
>> [    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
>> [    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
>> [    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
>> [    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
>> [    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
>> --
>> [    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it cannot be requested
>> [    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:637)
>> [    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/led-0'
>> [    0.212389] leds-gpio leds: probe with driver leds-gpio failed with error -22
> 
> I think this may be because the rk3399 is missing gpio-ranges despite it is a
> new platform and should have had its gpio-ranges defined in
> arch/arm64/boot/dts/rockchip/rk3399-base.dtsi ...
> 
> A bunch of these rockchips seem to have this problem despite the
> code in pinctrl-rockchip.c that says:
> 
>     /*
>      * For DeviceTree-supported systems, the gpio core checks the
>      * pinctrl's device node for the "gpio-ranges" property.
>      * If it is present, it takes care of adding the pin ranges
>      * for the driver. In this case the driver can skip ahead.
>      *
>      * In order to remain compatible with older, existing DeviceTree
>      * files which don't set the "gpio-ranges" property or systems that
>      * utilize ACPI the driver has to call gpiochip_add_pin_range().
>      */
>     if (!of_property_present(bank->of_node, "gpio-ranges")) {
>         struct device_node *pctlnp = of_get_parent(bank->of_node);
>         struct pinctrl_dev *pctldev = NULL;
> 
>         if (!pctlnp)
>             return -ENODATA;
> 
>         pctldev = of_pinctrl_get(pctlnp);
>         of_node_put(pctlnp);
>         if (!pctldev)
>             return -ENODEV;
> 
>         ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
>                          gc->base, gc->ngpio);
>         if (ret) {
>             dev_err(bank->dev, "Failed to add pin range\n");
>             goto fail;
>         }
>     }
> 
> Notice dereference of gpiolib internal gc-base here.
> 
>         ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
>                          gc->base, gc->ngpio);
> 
> arguments are gpipchip, pinctontrol device name,
> gpio offset, pin offset, number of pins.
> 
> GPIO offset always 0?? Passing GPIO offset as pin offset??
> 
> This is probably just working because of luck that 0,0 is passed.
> 
> This should probably rather be something like:
> 
>         ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), gc->base,
>                          bank->bank_num * bank->nr_pins, gc->ngpio);

This however didn't work. Instead ChatGPT was able to suggest:

	ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
				     bank->pin_base, gc->ngpio);

which works for me. I won't repeat the waffle from ChatGPT because I
honestly don't understand this area of the kernel (and you can ask an AI
yourself if you want to). I'm not subscribed, so please CC me if you
want me to try any alternative fixes.

Thanks,
Steve

> Here we put the assigned (by gpiolib) gc->base in the right place, then
> bank->bank_num should be 0,1,2... and bank->nr_pins always 32 (I think).
> 
> Jonas can you test this oneliner change? I can send a proper patch
> if it helps.
> 
> If this works the DTS files can (SHOULD) be fixed with proper ranges later.
> 
> It would be nice if we could augment the rockchip pinctrl DT schema to
> make gpio-ranges mandatory on new SoCs.
> 
> Yours,
> Linus Walleij
> 


