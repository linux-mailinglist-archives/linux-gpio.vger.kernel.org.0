Return-Path: <linux-gpio+bounces-37302-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCNDM5N0D2r4MQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37302-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 23:09:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4745E5AC0A4
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 23:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0D563035A89
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 21:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C5A386450;
	Thu, 21 May 2026 21:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDxBMNjM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25388349CEE;
	Thu, 21 May 2026 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397765; cv=none; b=tbZgUnDPgFNNTlZwvwHwxDLHD5fE3P1WEwjkr1E4gLR15acX7/e+lAFNYi684j7n8sUu2rVxMytvQ59zd5a91JVh+Uay9i9yCMopyQEBKgAhhbv+dLxVDA5YeGkti2h2o1ueT3on0R7XS5C+q81Bgnm9Y/P00hssfc1FHj9riOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397765; c=relaxed/simple;
	bh=Tk+x2RRlqS8N1l/XsV+MkCyncrh6+B3kGY1IYbGaHWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qetNclGg7jmcbTr+SZSY2TmyIvuiVWqlinVMy+SANSX1wkvi6pkOfinO+RysPiYVZdgHaKGtWFToZfgisUyhJKMqc6JIyuSJ6hYbPyyesmVDGJQqSO770n04KIbYASmXZYFj17R0PsAe3N0aJniw69hjcz/TRfpfJW8flCXdIK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDxBMNjM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2248A1F000E9;
	Thu, 21 May 2026 21:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779397763;
	bh=s921qgxKTVpxbehepX0NIBoeAZ5oMDivqoHpcRsCcN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VDxBMNjMcoVe3HUO+vz+ojM9lp/xzBkakwkB3bZRMmqyvByFXTZF8/Nsa64tnY2s0
	 W1K7l64vnnHjkYTzXiZEJ7024sPnofR1kOeejfq1QDFQVqzVBc2nLxAu7M5OkZ4LX2
	 DxXhRzCmQeZ5nZO6GxIFdfzGh6ov1XEekTQnsJL5WSVP57MF+Ew/TO+mpfb9Cf0dYi
	 XdAdTEYokVbnDWlTNPgutJfS4P+l6iBVufLtlA6Q8EfGLb7YLGukc9ojvb2s9zEd17
	 F9MAd3dVVNkeMgAuAqtLw3kVDto5XNsnewxH0DOq3ieCZNVFGIE1ci9odz9DM8FpSL
	 SPD7c3dB6UVvw==
Message-ID: <e3e5768d-f1b4-4fe6-a182-0210c9b7f784@kernel.org>
Date: Thu, 21 May 2026 23:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
To: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37302-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ultrarisc.com:email]
X-Rspamd-Queue-Id: 4745E5AC0A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> Add pinctrl driver for UltraRISC DP1000 pinctrl controller.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/pinctrl/Kconfig                       |   1 +
>  drivers/pinctrl/Makefile                      |   1 +
>  drivers/pinctrl/ultrarisc/Kconfig             |  23 +
>  drivers/pinctrl/ultrarisc/Makefile            |   4 +
>  drivers/pinctrl/ultrarisc/pinctrl-dp1000.c    | 112 ++++
>  drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c | 746 ++++++++++++++++++++++++++
>  drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h |  71 +++
>  8 files changed, 959 insertions(+)

Organize your patchset correctly. Such style:
DTS
pinctrl
DTS

is very confusing and discouraged. See submitting patches in DT directory.


> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 832e01898ae5..ecd87d58f28c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27364,6 +27364,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> +F:	drivers/pinctrl/ultrarisc/*
>  F:	include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
>  
>  ULTRATRONIK BOARD SUPPORT
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 03f2e3ee065f..76105be8b395 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -711,5 +711,6 @@ source "drivers/pinctrl/ti/Kconfig"
>  source "drivers/pinctrl/uniphier/Kconfig"
>  source "drivers/pinctrl/visconti/Kconfig"
>  source "drivers/pinctrl/vt8500/Kconfig"
> +source "drivers/pinctrl/ultrarisc/Kconfig"

u < v

Do not add to the end of files. You are messing how this file is sorted.

>  
>  endif
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index f7d5d5f76d0c..4df3e52518ea 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -98,3 +98,4 @@ obj-y				+= ti/
>  obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
>  obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
>  obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
> +obj-$(CONFIG_ARCH_ULTRARISC)	+= ultrarisc/

Missing compile test. Don't use that style. See other decent SoC vendors
how they solved that problem.

Also, do not add to the end of the files. Keep things sorted, more or less.


> diff --git a/drivers/pinctrl/ultrarisc/Kconfig b/drivers/pinctrl/ultrarisc/Kconfig
> new file mode 100644
> index 000000000000..ba8747b90127
> --- /dev/null
> +++ b/drivers/pinctrl/ultrarisc/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PINCTRL_ULTRARISC
> +	tristate
> +	depends on OF
> +	select PINMUX
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINCONF
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GPIOLIB
> +	select IRQ_DOMAIN_HIERARCHY
> +	select MFD_SYSCON
> +


Best regards,
Krzysztof

