Return-Path: <linux-gpio+bounces-30873-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFZeAqoMcWmPcQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30873-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 18:28:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4245A860
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 18:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D531FAE6224
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 15:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0C848B370;
	Wed, 21 Jan 2026 15:19:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535924A13B5
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008799; cv=none; b=no5i1i1yFDKBL5GlV3SH2QCOzeIojwHeP8SFBF+SO/716tlafFFKIYzWH5Wh9u9WNHDz4GGl49QldY103nMIiTX/gU6/cDHq7GcCPGX+QWRyd8y4t6ZItn35YlptdZZ6RtiR9KQCF92ixMD9KlgKWnDZyA49Z3hw1PaybMX/Xlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008799; c=relaxed/simple;
	bh=ZXr9VlNJbLNIw7WZW4pYI5IacLcq1+h9ykJJmC2085M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFhJ6lY/FUTTYwPPuV12URwfZsTHyZp6pWiZU6yls/vpJ8AELAvObr+0Tm3d5/TVXi3sES9dh8uiijBdPpVFiUixz9t6nADcNYDGdg6hYpmkIT5xgFlCJNS41MRxfIns+B4omKsKGGppCHMxufLcDxscx8fZXGTV55txmIOFCH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1viZzq-00022J-Cx; Wed, 21 Jan 2026 16:19:50 +0100
Message-ID: <f002f394-0887-403b-a705-58bbffe362d4@pengutronix.de>
Date: Wed, 21 Jan 2026 16:19:49 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
 maintainer
To: Shawn Guo <shawnguo@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20260121142047.10887-1-shawnguo@kernel.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spamd-Result: default: False [-1.26 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.fatoum@pengutronix.de,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	FREEMAIL_CC(0.00)[lists.linux.dev,pengutronix.de,vger.kernel.org,gmail.com,kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-30873-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: BE4245A860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On 1/21/26 3:20 PM, Shawn Guo wrote:
> Shawn is no longer interested in maintaining i.MX platform, and would like
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
> 
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
> 
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
> 
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
> 
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Thanks Shawn for your tremendous work over the years and much success to
Frank in his new maintainership!

Cheers,
Ahmad

> ---
>  MAINTAINERS | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..a294b4e952a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2745,14 +2745,14 @@ F:	arch/arm/include/asm/hardware/dec21285.h
>  F:	arch/arm/mach-footbridge/
>  
>  ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Sascha Hauer <s.hauer@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	Fabio Estevam <festevam@gmail.com>
>  L:	imx@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	Documentation/devicetree/bindings/firmware/fsl*
>  F:	Documentation/devicetree/bindings/firmware/nxp*
>  F:	arch/arm/boot/dts/nxp/imx/
> @@ -2767,22 +2767,22 @@ N:	mxs
>  N:	\bmxc[^\d]
>  
>  ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	arch/arm/boot/dts/nxp/ls/
>  F:	arch/arm64/boot/dts/freescale/fsl-*
>  F:	arch/arm64/boot/dts/freescale/qoriq-*
>  
>  ARM/FREESCALE VYBRID ARM ARCHITECTURE
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Sascha Hauer <s.hauer@pengutronix.de>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	Stefan Agner <stefan@agner.ch>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	arch/arm/boot/dts/nxp/vf/
>  F:	arch/arm/mach-imx/*vf610*
>  
> @@ -20562,7 +20562,7 @@ F:	drivers/pinctrl/pinctrl-amd.c
>  PIN CONTROLLER - FREESCALE
>  M:	Dong Aisheng <aisheng.dong@nxp.com>
>  M:	Fabio Estevam <festevam@gmail.com>
> -M:	Shawn Guo <shawnguo@kernel.org>
> +M:	Frank Li <Frank.Li@nxp.com>
>  M:	Jacky Bai <ping.bai@nxp.com>
>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  R:	NXP S32 Linux Team <s32@nxp.com>

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


