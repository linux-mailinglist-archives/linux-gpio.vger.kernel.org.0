Return-Path: <linux-gpio+bounces-39248-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8pBmFwDkQ2p1lAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39248-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:42:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC196E60C7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 17:42:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Shy5SjIk;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39248-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39248-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD9E13136034
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA37C44CF2C;
	Tue, 30 Jun 2026 15:37:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6544CACA;
	Tue, 30 Jun 2026 15:37:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833836; cv=none; b=d5+AIkjY6xg4KdO+C7b3JoZyuh8EGSY2PLt9leB+ZBNac8JZ/KmZu7TZJMBzcGahVilM/8R48TeNouuXx12SvCdLQ5A7Z27FYDTs3IbMQCDhf0kOFWzXtPKbYGkDeEQ+UVdd87gAwv0gmi/2sWHyAhZtAH2nDTGhSWQUE8y3NVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833836; c=relaxed/simple;
	bh=LXbKc+pk2xXz8b/bkoNzrA2gM/KwAImFNydJoG/KzbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDPMLFbL2I9gwplEh3RsMoSv02jwg49xLSpriFhNtVE2kCQ210r1H0NXUYTYDJ4cK+Eau63+vh6/+xEJes7xaLeIykm7hM4oDr4g80AsLC0RNaSvIKgG/kNHBaL5lqF+sfze5unZktuOZR4959aweUsnAwWPeh7npAjKYuQ8F7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Shy5SjIk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4877E1F000E9;
	Tue, 30 Jun 2026 15:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782833835;
	bh=f3gDDpa2F+xxVGf0PANTbnb+AzneKEHuN6HprbF9bqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Shy5SjIkdi8a1edi8K58WDtF7KRartQjSOwBFdhTNeADxFTOegM7p8O5auSkWXL6x
	 fg+etw55D2K402q0wfLNBnR5E7TrnJaHZHpDMIEHEeaSY1KwWg8oF4ZiOyJtMQzGdk
	 gzA/FtOWre0HXtUWZvzU/Zjm9II8YbvMgwfSqym8Cv/XKgLE8JUwwoogXQMps13vsN
	 hMZhxLEMHOdWUd5A+RnVm83Rt4z75sMsncVtyi2XKshB9Lf41M3I5XZqI2+9qTm99G
	 k87Jbc7MIOTDu/aWsyO7J+HUfZsWWKzpuwv+UqPup6Pf+3O9wAYt+Ouqmp+O1BOqTV
	 SWAYCreI5+ZMA==
Date: Tue, 30 Jun 2026 10:37:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-hardening@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 05/11] pinctrl: freescale: IMXRT: Remove NOMMU platform
 support
Message-ID: <178283383072.3679006.860128200601452588.robh@kernel.org>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <20260619-dts_cleanup_arm_mcore-v1-5-0101795a2662@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-5-0101795a2662@nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39248-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:piotr.wojtaszczyk@timesys.com,m:krzk+dt@kernel.org,m:kees@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:gustavoars@kernel.org,m:ping.bai@nxp.com,m:aisheng.dong@nxp.com,m:mturquette@baylibre.com,m:bmasney@redhat.com,m:s.hauer@pengutronix.de,m:stefan@agner.ch,m:imx@lists.linux.dev,m:kernel@pengutronix.de,m:abelvesa@kernel.org,m:Frank.Li@nxp.com,m:peng.fan@nxp.com,m:sboyd@kernel.org,m:linux-hardening@vger.kernel.org,m:arnd@arndb.de,m:s32@nxp.com,m:festevam@gmail.com,m:devicetree@vger.kernel.org,m:linusw@kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vz@mleia.com,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[timesys.com,kernel.org,lists.infradead.org,vger.kernel.org,nxp.com,baylibre.com,redhat.com,pengutronix.de,agner.ch,lists.linux.dev,arndb.de,gmail.com,mleia.com,armlinux.org.uk];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,i.mx:url,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCC196E60C7


On Fri, 19 Jun 2026 11:41:02 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Commercial users and hardware vendors migrated to Zephyr or other RTOS
> solutions years ago, leaving the NOMMU platform support effectively
> unused and unmaintained.
> 
> Remove the obsolete support to reduce maintenance burden and simplify the
> i.MX platform code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/pinctrl/fsl,imxrt1050.yaml |  79 -----
>  .../devicetree/bindings/pinctrl/fsl,imxrt1170.yaml |  77 -----
>  drivers/pinctrl/freescale/Kconfig                  |  16 -
>  drivers/pinctrl/freescale/Makefile                 |   2 -
>  drivers/pinctrl/freescale/pinctrl-imxrt1050.c      | 309 ------------------
>  drivers/pinctrl/freescale/pinctrl-imxrt1170.c      | 349 ---------------------
>  6 files changed, 832 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


