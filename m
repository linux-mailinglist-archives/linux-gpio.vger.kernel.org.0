Return-Path: <linux-gpio+bounces-30870-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGMBBWDycGk+awAAu9opvQ
	(envelope-from <linux-gpio+bounces-30870-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 16:36:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AA64D59449
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 16:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 682AF72A555
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 14:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5B53D4118;
	Wed, 21 Jan 2026 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uazv6lAW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44543A4F34;
	Wed, 21 Jan 2026 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005530; cv=none; b=CKu7rmRjlZRWcFka2slo9ZcUhqWOUbyezgPYeU9XtEGhzNbyRTTmi76a6f9F0KDegWCod4byvKo5WCZc2e2OUK+WRlWf9kKV624HgE56YDfp0ygSYsZj4Pda8EJ2ESMt5ZHXrHjOrkRjBB/NbxqERZl8awKuojM3INe++JrFo2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005530; c=relaxed/simple;
	bh=g+4h2F0GqeJM+ILBcEzEWRvalmeCX7blFWNfkF0KDHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlXYvciR0X+ltCrCg+xTw+NVK2LGzW2gvIrTOi4eSuzZn1KQK9IBRjI7DyRyVwmpYCVgr3E4K0dJ/Yl8DlW0ck2FkYQYP2R6ZK05lJ8HzD1VPh7ytTRpOnfsaO2+zJ861+7OpeDUVQb1faUzfj2bfvdLnJYAUBVRE2MUOoZnL4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uazv6lAW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD83C4CEF1;
	Wed, 21 Jan 2026 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769005530;
	bh=g+4h2F0GqeJM+ILBcEzEWRvalmeCX7blFWNfkF0KDHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uazv6lAWX5j9HF1yfT3oYBr4JyvwLdoX/BYVlxM0k4Ng1VVODKKG61g19NKt259yl
	 JMAFPADXGN3YMXHQgum34PyUric6g0KAjQrs71+emhwN0gYkz290hqF+VLvAkPu/pF
	 Mv1SJnmzycPljh0yQd67++YWsz5J4RBVGVYRa7nvRCuJGKaZ0pqGe1KKyHF7tgik3P
	 fG1uAK4JGC0ShpaNCO5Ck00lzuQjymCmkgrSBNDzNhjzXUmV4Z4UkeIoJM0pn2JfFp
	 yc/bjp8C0zyZl3BuX4RZ2skfaKIry6scz5U+WSn8QSucDwkonmZDX4sKLhYCFKznnz
	 ZFtr3HwApVXAQ==
Date: Wed, 21 Jan 2026 22:25:26 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform
 maintainer
Message-ID: <aXDh1tc3x4aCZG0z@dragon>
References: <20260121142047.10887-1-shawnguo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,kernel.org,lists.linux.dev,lists.infradead.org,vger.kernel.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-30870-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawnguo@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,i.mx:url,infradead.org:email,nxp.com:email,pengutronix.de:email,agner.ch:email]
X-Rspamd-Queue-Id: AA64D59449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Cc Frank

On Wed, Jan 21, 2026 at 10:20:47PM +0800, Shawn Guo wrote:
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
> -- 
> 2.43.0
> 

