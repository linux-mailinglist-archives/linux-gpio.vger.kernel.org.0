Return-Path: <linux-gpio+bounces-34995-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ/1G+fM2GktiQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34995-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:11:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972B3D5782
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB2943063131
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 10:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6DC37D134;
	Fri, 10 Apr 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vab0Bd46"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD119344046;
	Fri, 10 Apr 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815549; cv=none; b=SRN5e8omDMqiEwuuliKYRWs/t3Asuv+XZk4MEjQfEOTtwwhb+o8HY4CTcBesK3diYVTJp5KwCRKW2YAhtGrhIGMmU4fg85SOXXxYroallWssVMoprupSoH+tWSKt6CZYo9NE8wVlY1eYscc0tJ5ogAaJR6bXhZ6FjJejKIJ+Aj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815549; c=relaxed/simple;
	bh=h1YJbNrS1D9yF0FDupwEzDG5/Aq1wIyxMf2Ir4lrryU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P+xd/L+JOQPooil6qWzWnYQ/exVUsiyRO9okRMYIu/XgrbnpIDtVLwhSMYhAau3cR+IO9kGnzFHhG4x3VYdEMU5fSNvOastrfU/8tAvLEPee2w/et1lkiXgoFjETtfBZG1b7Mfc2U6BiaXs1RKvppICzBP9kh6fYdUIsOFoH67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vab0Bd46; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B17C19421;
	Fri, 10 Apr 2026 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775815549;
	bh=h1YJbNrS1D9yF0FDupwEzDG5/Aq1wIyxMf2Ir4lrryU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Vab0Bd46+FCKKgiU7n9Ca1lcIFD4pv5vlGNtCmK0exf9Zb/Da5y4sfZOJYdArRa7p
	 2W0QZJkJc9NyeaQ3AxstUe6FSbt/BQvlRHGJ0YnARXR00RBv+ATsrIq+hw2czcBY74
	 xVE2feiAWL+u/YEzCuG5dj/kb2dmtdEO0NfqmeJcYoEO+k6Anm0P40slzywVB+UGLY
	 RtRrw1Pkm+ttV/4VOtPlDzd10VhrNgAacKz5DKGaFsRuuuSR0Ld6cFs7huuDBGXixh
	 PlH2Pj7HVBvjDVqVF6b2IrC9oClcKWgdVinPFuPpc+l3CE+h239Kk52e1FLDCcKFk6
	 l+KaeGugNHO8g==
Message-ID: <0a81889e-b610-4497-98c9-74a04a1595e7@kernel.org>
Date: Fri, 10 Apr 2026 12:05:43 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] pinctrl: tegra: Add Tegra238 pinmux driver
To: pshete@nvidia.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de,
 bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
 geert@linux-m68k.org, jonathanh@nvidia.com, krzk+dt@kernel.org,
 kuninori.morimoto.gx@renesas.com, linusw@kernel.org,
 luca.weiss@fairphone.com, michal.simek@amd.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, rosenp@gmail.com,
 sven@kernel.org, thierry.reding@kernel.org, webgeek1234@gmail.com
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260409131340.168556-4-pshete@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260409131340.168556-4-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34995-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nvidia.com,vger.kernel.org,arndb.de,oss.qualcomm.com,kernel.org,linux-m68k.org,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,bootlin.com:url]
X-Rspamd-Queue-Id: 1972B3D5782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 15:13, pshete@nvidia.com wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> This change adds support for the two pin controllers

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> (MAIN and AON) found on Tegra238.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  drivers/pinctrl/tegra/Kconfig            |    9 +
>  drivers/pinctrl/tegra/Makefile           |    1 +
>  drivers/pinctrl/tegra/pinctrl-tegra238.c | 2056 ++++++++++++++++++++++
>  3 files changed, 2066 insertions(+)
>  create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra238.c
> 
> diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> index 660d101ea367..ccb8c337b4ee 100644
> --- a/drivers/pinctrl/tegra/Kconfig
> +++ b/drivers/pinctrl/tegra/Kconfig
> @@ -36,6 +36,15 @@ config PINCTRL_TEGRA234
>  	bool
>  	select PINCTRL_TEGRA
>  
> +config PINCTRL_TEGRA238
> +	tristate "NVIDIA Tegra238 pinctrl driver"
> +	select PINCTRL_TEGRA
> +	help
> +	  Say Y or M here to enable support for the pinctrl driver for
> +	  NVIDIA Tegra238 SoC. This driver controls the pin multiplexing
> +	  and configuration for the MAIN and AON pin controllers found
> +	  on Tegra238.

All other Tegra drivers are non-selectable, so you are introducing
completely different style. This needs explanation WHY in the commit msg.

Also, since you are changing things around, then I suggest to finally
enable proper COMPILE_TEST for all tegra pinctrl. Unless I mistaken,
it's impossible to compile test currently anything from Tegra pinctrl...
Actually let me take a look, maybe I will do it for several platforms.

...

> +static struct platform_driver tegra238_pinctrl_driver = {
> +	.driver = {
> +		.name = "tegra238-pinctrl",
> +		.of_match_table = tegra238_pinctrl_of_match,
> +	},
> +	.probe = tegra238_pinctrl_probe,
> +};
> +
> +static int __init tegra238_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra238_pinctrl_driver);
> +}
> +module_init(tegra238_pinctrl_init);
> +
> +static void __exit tegra238_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&tegra238_pinctrl_driver);
> +}
> +module_exit(tegra238_pinctrl_exit);

Why this cannot be module_platform_driver()?


Best regards,
Krzysztof

