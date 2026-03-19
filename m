Return-Path: <linux-gpio+bounces-33826-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Dj7IE4FvGmurAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33826-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:16:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E82CC8EE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 678BF3005A80
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F08322533;
	Thu, 19 Mar 2026 14:16:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE343033E0;
	Thu, 19 Mar 2026 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929801; cv=none; b=V44F2eh7WKLVmpG/Jk6iGmD0b8D+8nzk19LL+mQI68XUk8o46aHvk56WTM9K9bkwWNwvceSyA1/8X1ifCC8GcWslm132qe+uRI35o7iOvODB2GDTO7MRRHHIgscqp1GkEpGeWNQKEO/X3zabp8y/lwOx2hghNS7lboo9+CagblM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929801; c=relaxed/simple;
	bh=dh4tiSZ0JU9s0rUFKCuq6abboXS2Xjn4z2r2vKp7M/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMp0BoGEcJfxW+gqlv8FPXDNH8etkrl6DRquDoE8I7LQm3f5AAH1a6xLs8KeusEQGMxJT6AfRtydSBA+BlQ1M0hCLN0yGm8LVhbtz4gi5TpI72vR2pIG1KTriwwSq76mQrvEMHcBOM464L0vutqJWoKPBqUzflr6ZimdEd8oaIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD07E1A25;
	Thu, 19 Mar 2026 07:16:31 -0700 (PDT)
Received: from [192.168.178.23] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A5133F7BD;
	Thu, 19 Mar 2026 07:16:35 -0700 (PDT)
Message-ID: <dd275884-665b-46ca-a72a-c32aa189fc25@arm.com>
Date: Thu, 19 Mar 2026 15:16:33 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: wens@kernel.org, Linus Walleij <linusw@kernel.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
 <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33826-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.082];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2D8E82CC8EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/19/26 15:06, Chen-Yu Tsai wrote:
> On Thu, Mar 19, 2026 at 9:46 PM Linus Walleij <linusw@kernel.org> wrote:
>>
>> On Sat, Mar 14, 2026 at 9:10 AM Michal Piekos
>> <michal.piekos@mmpsystems.pl> wrote:
>>
>>> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>>>
>>> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
>>> is in unitialized state.
>>>
>>> Solution is to set pinmux to GPIO INPUT in
>>> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
>>> earlier.
>>>
>>> Tested on Orange Pi Zero 3.
>>>
>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
>>
>> Should this have a Fixes: tag and should it be applied as an urgent fix?
> 
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> 
>> Tag for stable?
> 
> The original patch wasn't tagged for stable. And it doesn't seem like it
> was auto picked.
> 
>> Also: is there consensus with Andre that this is the way to proceed?
> 
> As Andre mentioned, the mux value for "disabled" is different between
> generations. So we likely need to make the value part of
> |struct sunxi_pinctrl_desc|.

There is already the SUNXI_PINCTRL_NEW_REG_LAYOUT flag, which describes 
exactly that: the new layout increased the bit field to 4 bits, moving 
the HiZ value to 0xf.
But it's just a flag passed to sunxi_pinctrl_init_with_flags(), not 
stored in desc, and not available during runtime. Which is what I tried 
to fix for my A733 series:
https://lore.kernel.org/linux-arm-kernel/20250821004232.8134-3-andre.przywara@arm.com/

So maybe we can cherry-pick just this patch, then check for that flag?

Cheers,
Andre

> 
> Michal, can you respin a version so that we can get this fixed in the
> same release?
> 
> 
> ChenYu
> 


