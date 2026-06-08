Return-Path: <linux-gpio+bounces-38077-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 95haMsx+JmrYXQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38077-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:35:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C807D6541CE
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:35:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tkos.co.il header.s=default header.b=UQPkqpFj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38077-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38077-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=tkos.co.il;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC01B3003BEF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BE83ACA7F;
	Mon,  8 Jun 2026 08:26:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6950131197C;
	Mon,  8 Jun 2026 08:26:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907196; cv=none; b=fhHEHCAAd/LBhEc0G+6haQNLM0galDd4BCQBdx3UnjQu9dNGjnWZR09M3YDCegiaX/7k0o9sN5NFa7EXSciiXwtJc/aX1oe/sL/dKfBPBIib//sqsWLmjOsE59OPhuxodErMLlPtmO0LkQql4KsSL9NlsayWw9fHbFuxLEfJ1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907196; c=relaxed/simple;
	bh=1R/lpufOyas1f2RIm6+Gl8ylh1N/wQbIPHOs9FUjZrU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rl0ZeBo0FTAKHer4MeZArU8wk526mMwZcuPDMV4v930Xjg/2Ckhs2PR/iJ021vgpxbF1jJKPBESJXfMicPp+aL36rgxF8ycsic+LmbRgA85J504LiRv6crB18pe+wtw+cm0ymIJMdHATM0QP37cbEDLQ2ZAIpe5YNyEZ273UFXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=UQPkqpFj; arc=none smtp.client-ip=84.110.109.230
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 12D96440887;
	Mon,  8 Jun 2026 11:25:30 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1780907130;
	bh=1R/lpufOyas1f2RIm6+Gl8ylh1N/wQbIPHOs9FUjZrU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UQPkqpFj1VQ0OfrUtrvB2Ff1tLQBr/W1hZCBOms8WiQSYKhd0OOzO2MSanYN2QVDM
	 Tw1anzl7tnEalqBL2mOy9CuYi74UHiA2swx7WkNlTxZR1ZfJ1Bh8RA9b4GQ5B9fYYb
	 xuC8SdV1A4JlzVC4B3d9eN16oc42YwzOnPW+gBgbCtfvyfbltD/Rb88mL/zcM7YJR+
	 HioVG2+rgheTjnQIUPW1g3fBlTLWd9mbtO1OxxaENKVCwvL9L0/KxIiFYXISwgG/jX
	 aRp+SJmKUVlC628vD1wayQjvWD/gY1J1LqmEJevqSL89lJDfG6rEzoYOuN80BJn07y
	 QQ/Xp2DRi/0KA==
From: Baruch Siach <baruch@tkos.co.il>
To: Yun Zhou <yun.zhou@windriver.com>
Cc: <linusw@kernel.org>,  <brgl@kernel.org>,  <linux-gpio@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] gpio: mvebu: fix NULL pointer dereference in
 suspend/resume
In-Reply-To: <20260608075742.2680700-1-yun.zhou@windriver.com> (Yun Zhou's
	message of "Mon, 8 Jun 2026 15:57:42 +0800")
References: <20260608075742.2680700-1-yun.zhou@windriver.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 08 Jun 2026 11:26:31 +0300
Message-ID: <87ik7t8mko.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[tkos.co.il,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tkos.co.il:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yun.zhou@windriver.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[baruch@tkos.co.il,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[tkos.co.il:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baruch@tkos.co.il,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38077-lists,linux-gpio=lfdr.de];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,windriver.com:email,tkos.co.il:dkim,tkos.co.il:from_mime,tkos.co.il:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C807D6541CE

Hi Yun Zhou,

On Mon, Jun 08 2026, Yun Zhou wrote:
> mvebu_pwm_suspend() and mvebu_pwm_resume() are called for all GPIO
> banks during suspend/resume, but not all banks have PWM functionality.
> GPIO banks without PWM have mvchip->mvpwm set to NULL.
>
> Calling mvebu_pwm_suspend() with mvpwm == NULL causes a NULL pointer
> dereference when it tries to access mvpwm->blink_select.
>
>   Unable to handle kernel NULL pointer dereference at virtual address 00000020 when write
>   [00000020] *pgd=00000000
>   Internal error: Oops: 815 [#1] PREEMPT ARM
>   Modules linked in:
>   CPU: 0 UID: 0 PID: 406 Comm: sh Not tainted 6.12.74-rt12-yocto-standard-g4e96f98fb7db-dirty #353
>   Hardware name: Marvell Armada 370/XP (Device Tree)
>   PC is at regmap_mmio_read+0x38/0x54
>   LR is at regmap_mmio_read+0x38/0x54
>   pc : [<c05fd2ac>]    lr : [<c05fd2ac>]    psr: 200f0013
>   sp : f0c11d10  ip : 00000000  fp : c100d2f0
>   r10: c14fb854  r9 : 00000000  r8 : 00000000
>   r7 : c1799c00  r6 : 00000020  r5 : 00000020  r4 : c179c7c0
>   r3 : f0a231a0  r2 : 00000020  r1 : 00000020  r0 : 00000000
>   Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>   Control: 10c5387d  Table: 135ec059  DAC: 00000051
>   Call trace:
>    regmap_mmio_read from _regmap_bus_reg_read+0x78/0xac
>    _regmap_bus_reg_read from _regmap_read+0x60/0x154
>    _regmap_read from regmap_read+0x3c/0x60
>    regmap_read from mvebu_gpio_suspend+0xa4/0x14c
>    mvebu_gpio_suspend from dpm_run_callback+0x54/0x180
>    dpm_run_callback from device_suspend+0x124/0x630
>    device_suspend from dpm_suspend+0x124/0x270
>    dpm_suspend from dpm_suspend_start+0x64/0x6c
>    dpm_suspend_start from suspend_devices_and_enter+0x140/0x8e8
>    suspend_devices_and_enter from pm_suspend+0x2fc/0x308
>    pm_suspend from state_store+0x6c/0xc8
>    state_store from kernfs_fop_write_iter+0x10c/0x1f8
>    kernfs_fop_write_iter from vfs_write+0x270/0x468
>    vfs_write from ksys_write+0x70/0xf0
>    ksys_write from ret_fast_syscall+0x0/0x54
>
> Add a NULL check for mvchip->mvpwm before calling the PWM
> suspend/resume functions.
>
> Fixes: 85b7d8abfec7 ("gpio: mvebu: add pwm support for Armada 370/XP/38x")

Commit summary for 85b7d8abfec7 is "gpio: mvebu: add pwm support for
Armada 8K/7K". I could not find a commit matching the summary line above
in upstream git. Commit 757642f9a584e ("gpio: mvebu: Add limited PWM
support") introduced mvebu_pwm_suspend() and mvebu_pwm_resume(). I think
that is the one being fixed.

baruch

> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
> ---
>  drivers/gpio/gpio-mvebu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 22c36b79e249..c030d1f00abc 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -996,7 +996,7 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
>  		BUG();
>  	}
>  
> -	if (IS_REACHABLE(CONFIG_PWM))
> +	if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
>  		mvebu_pwm_suspend(mvchip);
>  
>  	return 0;
> @@ -1048,7 +1048,7 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
>  		BUG();
>  	}
>  
> -	if (IS_REACHABLE(CONFIG_PWM))
> +	if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
>  		mvebu_pwm_resume(mvchip);
>  
>  	return 0;

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

