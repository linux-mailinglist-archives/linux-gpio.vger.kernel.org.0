Return-Path: <linux-gpio+bounces-38725-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aivvHZtpNWquvgYAu9opvQ
	(envelope-from <linux-gpio+bounces-38725-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 18:08:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8106A6F3E
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 18:08:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PiigFRnM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38725-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38725-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6320630098A3
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 16:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0E3B8406;
	Fri, 19 Jun 2026 16:08:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E6B3947B8;
	Fri, 19 Jun 2026 16:08:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781885332; cv=none; b=qJUe4NsPwVUq56uCOfUB49aGAByWWDZc+Qd9eunlYTzxV0DqjaOsnJWHma0H76wnst1A7kL1jgNKSUtKZX6jsjYwnwYYd9AX0n4j4JeaVbBSV6L01UQmBXqaA3rbEWmF/JSBqR1l8cWQg1vTwN+1jsYzFt0P+u8DZkkeFTQVUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781885332; c=relaxed/simple;
	bh=IZBZZMg5/MujLTP47UFAq9wwXBvXEvulfL2I98ygXPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InkAwFO8d/IepOav+zCW6S/5VCb2yJ/43XzD8lWogoFOrEtvBOlvX95iKkjobrnsCPaJTVmxNsGqS6pDjlEGtQcDN4+jvqeXMzQiRcdCn5zFcNe6AKL2p7GnmMhiCFZvUV0ieARN1ZKIuM8puKmhk/B6cKcJ7fipe9DpaAi+8+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PiigFRnM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B361F000E9;
	Fri, 19 Jun 2026 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781885331;
	bh=g3rjYwyXp9LVnLG0ToWc25PWAKwvGflge9Yq+toMptA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PiigFRnMAgWqZbRw8JbcDuSyWN/DDDNft2XfAW1edDrOHtPgypB6APfPuGmIhLHu1
	 xidrGAjPub7xmEhPpv1ekZfWyczoaWbpqZTAK/KzcOr0E4KfwB2DcrpD3CdyY0owFy
	 /j5YhXdsrBRlZBxASaxKu1Z3s2+GqIRNdq34COVmnlFLHKIdtSDbXOmMFdKsM6xc++
	 05I6mBEafF6I9VrpOgGSAkdHdO7/yaqfEkuYXGHivIExGArF4ucv3FWG+vGvVlhFLA
	 zc5Iznd/AAZlF+q/kau+VlvD6cfyfYH5y2fpPQTcAHNfaYM6SxZNmplUeHGccTBJJv
	 ME0pKRKGCXJ1Q==
Message-ID: <7d946861-c3cb-4512-9d5f-9f4cb9b7ee8a@kernel.org>
Date: Fri, 19 Jun 2026 19:07:59 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] ARM: NXP: Drop NOMMU platform support
To: Frank.Li@oss.nxp.com, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hardening@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:arnd@arndb.de,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:stefan@agner.ch,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:s32@nxp.com,m:linusw@kernel.org,m:piotr.wojtaszczyk@timesys.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vz@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[oss.nxp.com,arndb.de,pengutronix.de,agner.ch,gmail.com,kernel.org,armlinux.org.uk,nxp.com,baylibre.com,redhat.com,timesys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38725-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vz@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E8106A6F3E

Hello Frank.

On 6/19/26 18:40, Frank.Li@oss.nxp.com wrote:
> Commercial users and hardware vendors migrated to Zephyr or other RTOS
> solutions years ago, leaving the NOMMU platform support effectively
> unused and unmaintained.
> 
> Remove the obsolete support to reduce maintenance burden and simplify the
> Freescale/nxp platform code.
> 
> Some driver code still be kept and may clean up later since it is possible
> reused by other SoC.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This change is a bit too early to happen, I prefer to get it orchestrated
by Arnd. So, as for today I NAK the change for its NXP LPC part.

> ---
> Frank Li (11):
>        ARM: dts: vf610m4: Remove NOMMU platform support
>        ARM: dts: imxrt1050: Remove NOMMU platform support
>        ARM: imx: Remove NOMMU platform support
>        clk: imx: imxrt1050: Remove NOMMU platform support
>        pinctrl: freescale: IMXRT: Remove NOMMU platform support
>        ARM: imxrt_defconfig: Remove NOMMU platform support
>        ARM: dts: lpc: Remove NOMMU platform support
>        ARM: mach-lpc: Remove NOMMU platform support
>        ARM: configs: lpc*: Remove NOMMU platform support
>        clk: nxp: lpc: Remove NOMMU platform support
>        pinctrl: nxp: lpc: Remove NOMMU platform support
> 
>   .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml |   79 -
>   .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml |   77 -
>   arch/arm/Kconfig                                   |   12 -
>   arch/arm/Makefile                                  |    2 -
>   arch/arm/boot/dts/nxp/Makefile                     |    1 -
>   arch/arm/boot/dts/nxp/imx/Makefile                 |    2 -
>   arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts        |   72 -
>   arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h      |  993 ------------
>   arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi           |  160 --
>   arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h      | 1561 -------------------
>   arch/arm/boot/dts/nxp/lpc/Makefile                 |    9 -
>   arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi             |  543 -------
>   arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts       |  273 ----
>   arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts      |  236 ---
>   arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             |  540 -------

NXP LPC32xx is ARMv5 and it has MMU, hence it's plainly out of scope of
the proposed "dropping NOMMU platform support".

-- 
Best wishes,
Vladimir

