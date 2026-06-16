Return-Path: <linux-gpio+bounces-38555-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I/WvLJv0MGr1ZQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38555-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:00:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8058268CB27
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 09:00:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=RsfueAgC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38555-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38555-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C95503043447
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 07:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114562F7EEC;
	Tue, 16 Jun 2026 07:00:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA41A9FA4;
	Tue, 16 Jun 2026 07:00:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593224; cv=none; b=BGftUoPuAHcEu4ahkyCdzNmbFnEaIRL5PwSpJAZB4tqWjSOwSfriPEYGguuhfWP1RKOLWRxqtxcDFKQvD5Yj4eKxKU9EPIslX4Rz4BmaJCyoOVjumoRu5tpVcqsVE4lBUXP9GqZdvEBml5rNEvt5OLpjKncS7HoBnJyOuqTdx3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593224; c=relaxed/simple;
	bh=yoZrC20Rr/Cl7sij41NIAraYOQTowlZkzcUZDAlReHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqQqL3yC3wUdUPDX8x40G3Y96jZjTYCzgN3cF9eWS2f+pb45syjnslj69S6QC154s6WYV4sDN63B+BWlA5Sk0oo79slGXxgQD2eh2I2++eXNs2mDJ04ApXZQk6yLY/Dl1ESAkUoajxdGV9fCtWKSV74cAj+Cd9UrIdxEpwK3/kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RsfueAgC; arc=none smtp.client-ip=220.197.31.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=4NPwGkMgp0eY0WxVji1Jx5+S1nFDsXAjFrMfgpRjXls=;
	b=RsfueAgCIYvLWcFzZHxy7TpdzFbYm5JSlC9oERSqjwdBXYfj2zODaNnQ+8Gwnp
	iHC7TrRACuFbtKHsvkvYzqpNa1oWu6lSHjMC3jlcidauV2Zs+9oHs04lXc/ukzYw
	nkAFv5W1PVlaizEKw1QrFwtRgtwGzNSYITEszh1Mp7b6o=
Received: from [192.168.11.90] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wA3tIhj9DBqejHjDw--.42515S2;
	Tue, 16 Jun 2026 14:59:48 +0800 (CST)
Message-ID: <d1420a23-d0cc-4945-8591-312e1d385824@163.com>
Date: Tue, 16 Jun 2026 14:59:46 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pinctrl: Kconfig: fix unmet direct dependencies
 detected for MFD_STMFX
To: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260616065241.7478-1-haiyuewa@163.com>
Content-Language: en-US
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <20260616065241.7478-1-haiyuewa@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wA3tIhj9DBqejHjDw--.42515S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WryfAw4xGF4xAw48XF1rCrg_yoW8GryUpa
	93Kr4F9r1UXrZ8Ja17Cryxury3Cwn7CrWUuasakas8uFW5Zr4DC3s0krZ7WF4qkrZakr45
	Gay5Wa47WFWrt3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFApOUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC7wT8aGow9GRjEAAA3G
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38555-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[haiyuewa@163.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haiyuewa@163.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8058268CB27

Linus,

Sorry, please ignore my patch,I found it has been fixed in next tree.

BR,
Haiyue

On 6/16/2026 2:52 PM, Haiyue Wang wrote:
> The commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
> on OF_GPIO") will cause:
> 
> WARNING: unmet direct dependencies detected for MFD_STMFX
>    Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
>    Selected by [m]:
>    - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]
> 
> PINCTRL_STMFX selects MFD_STMFX, which depends on OF. Previously this
> was gated transitively by OF_GPIO, which is dropped. So PINCTRL_STMFX
> can be enabled on non-OF systems and select MFD_STMFX in violation of
> its OF requirement. Add the missing "depends on OF".
> 
> Fixes: e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO")
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---
>   drivers/pinctrl/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 03f2e3ee065f..08218ef140e0 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -549,6 +549,7 @@ config PINCTRL_ST
>   config PINCTRL_STMFX
>   	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
>   	depends on I2C
> +	depends on OF
>   	depends on HAS_IOMEM
>   	select GENERIC_PINCONF
>   	select GPIOLIB_IRQCHIP


