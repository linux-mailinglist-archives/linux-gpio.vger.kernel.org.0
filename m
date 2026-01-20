Return-Path: <linux-gpio+bounces-30800-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICucIk9ecGkVXwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30800-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 06:04:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 24204514B6
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 06:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 70BD8684B84
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 12:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF45427A0B;
	Tue, 20 Jan 2026 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8aC/Qvw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0610838BDD4;
	Tue, 20 Jan 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912036; cv=none; b=h67aNj6HoJAYpsm4C3hLaQzwfwDgSAaERywphq8Q7lE0DVY/Yw9fqfHRKeSjygpyI9RSuK9b5LHTlxe+sRTMAINeUuH/HUl/tAb7ButZ6MQmQq4PCUXdFG/wJfqjgSdK01LA9vnOC58rhqhSNqq0kf5JJMv6yy0lOO++SGMkOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912036; c=relaxed/simple;
	bh=We6iPStU0ZFDOwTAL7qZlfBr4nmJKhgoqksa0yciLRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZW6KSLtcspTOUWocclsuZ7IL8GoV0LKR9WmJ45Y2jFT8ouvMs1Ydn1nKQ2Y11wsbnJCNwqW3MB+d9aijt250tTH9JIzzH1Uvr6/Bs+9YFjABoR01tceNJFT/lSDVPUOsRoT4I53xwUe3kt7MeD2NtsZJjcaauwRpuyWnrO9MABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8aC/Qvw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F1FC16AAE;
	Tue, 20 Jan 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912035;
	bh=We6iPStU0ZFDOwTAL7qZlfBr4nmJKhgoqksa0yciLRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n8aC/QvwvFFOP3yufXOJtOjJe/XstFlKJSXeyxXFVxtZom2AB4Wyb6Sl5K0vj96gN
	 a/tWGLtAI1Py1Hkdlb6KS9EDHPNv9rpQgBiA2ePMF2dG/CYc6Dp2ibQCBVuMk44Met
	 BWfvVLb2Hyrpnr8ep7OYAxDyUatZgk9eXGRCGNr3+mEZ1MRjZT57UO+x3DTPu2SHwn
	 BumztqbzymIqqbgJaatoZItVouoryCjUwo+OKY0XnhoiFiD8agFXwb4Af8BTdwwIBm
	 s8lo4pF5VEfABwAWlCxdY14qnkt8R0O9M+0TMUNqaFqWy7WHCdRLangR3t8mVSWK6j
	 Lq22G3QPoulyg==
Message-ID: <0d8ad41f-a2c4-4a4f-ac1f-68263648c4dc@kernel.org>
Date: Tue, 20 Jan 2026 13:27:09 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] pinctrl: aspeed: add G7(AST2700) SoC0 pinctrl
 support
To: Billy Tsai <billy_tsai@aspeedtech.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, bmc-sw@aspeedtech.com
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
 <20260120-upstream_pinctrl-v3-3-868fbf8413b5@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260120-upstream_pinctrl-v3-3-868fbf8413b5@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30800-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 24204514B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 12:43, Billy Tsai wrote:
> Add pinctrl support for the SoC0 instance of the ASPEED AST2700.
> 
> AST2700 consists of two interconnected SoC instances, each with its own
> pinctrl register block.
> 
> The SoC0 pinctrl hardware closely follows the design found in previous
> ASPEED BMC generations, allowing the driver to build upon the common
> ASPEED pinctrl infrastructure.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/pinctrl/aspeed/Kconfig                  |   8 +
>  drivers/pinctrl/aspeed/Makefile                 |   1 +
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c | 683 ++++++++++++++++++++++++
>  3 files changed, 692 insertions(+)
> 
> diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/Kconfig
> index 1a4e5b9ed471..16743091a139 100644
> --- a/drivers/pinctrl/aspeed/Kconfig
> +++ b/drivers/pinctrl/aspeed/Kconfig
> @@ -31,3 +31,11 @@ config PINCTRL_ASPEED_G6
>  	help
>  	  Say Y here to enable pin controller support for Aspeed's 6th
>  	  generation SoCs. GPIO is provided by a separate GPIO driver.
> +
> +config PINCTRL_ASPEED_G7
> +	bool "Aspeed G7 SoC pin control"
> +	depends on (ARCH_ASPEED || COMPILE_TEST) && OF
> +	select PINCTRL_ASPEED
> +	help
> +	  Say Y here to enable pin controller support for Aspeed's 7th
> +	  generation SoCs. GPIO is provided by a separate GPIO driver.
> diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Makefile
> index db2a7600ae2b..cb2c81a69551 100644
> --- a/drivers/pinctrl/aspeed/Makefile
> +++ b/drivers/pinctrl/aspeed/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_PINCTRL_ASPEED)	+= pinctrl-aspeed.o pinmux-aspeed.o
>  obj-$(CONFIG_PINCTRL_ASPEED_G4)	+= pinctrl-aspeed-g4.o
>  obj-$(CONFIG_PINCTRL_ASPEED_G5)	+= pinctrl-aspeed-g5.o
>  obj-$(CONFIG_PINCTRL_ASPEED_G6)	+= pinctrl-aspeed-g6.o
> +obj-$(CONFIG_PINCTRL_ASPEED_G7) += pinctrl-aspeed-g7-soc0.o
> \ No newline at end of file

Do not introduce patch warnings.

> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
> new file mode 100644
> index 000000000000..c4e828c8839a
> --- /dev/null
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
> @@ -0,0 +1,683 @@
> +// SPDX-License-Identifier: GPL-2.0
> +

...

> +
> +static const struct aspeed_pinmux_ops aspeed_g7_soc0_ops = {
> +	.set = aspeed_g7_soc0_sig_expr_set,
> +};
> +
> +static struct aspeed_pinctrl_data aspeed_g7_soc0_pinctrl_data = {

Look at your existing drivers - what is missing here and in other places?

> +	.pins = aspeed_g7_soc0_pins,
> +	.npins = ARRAY_SIZE(aspeed_g7_soc0_pins),
> +	.pinmux = {
> +		.ops = &aspeed_g7_soc0_ops,
> +		.groups = aspeed_g7_soc0_groups,
> +		.ngroups = ARRAY_SIZE(aspeed_g7_soc0_groups),
> +		.functions = aspeed_g7_soc0_functions,
> +		.nfunctions = ARRAY_SIZE(aspeed_g7_soc0_functions),
> +	},
> +	.configs = aspeed_g7_soc0_configs,
> +	.nconfigs = ARRAY_SIZE(aspeed_g7_soc0_configs),
> +	.confmaps = aspeed_g7_soc0_pin_config_map,
> +	.nconfmaps = ARRAY_SIZE(aspeed_g7_soc0_pin_config_map),
> +};
> +
> +static int aspeed_g7_soc0_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return aspeed_pinctrl_probe(pdev, &aspeed_g7_soc0_pinctrl_desc,
> +				    &aspeed_g7_soc0_pinctrl_data);
> +}
> +
> +static const struct of_device_id aspeed_g7_soc0_pinctrl_match[] = {
> +	{ .compatible = "aspeed,ast2700-soc0-pinctrl" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, aspeed_g7_soc0_pinctrl_match);
> +
> +static struct platform_driver aspeed_g7_soc0_pinctrl_driver = {
> +	.probe = aspeed_g7_soc0_pinctrl_probe,
> +	.driver = {
> +		.name = "aspeed-g7-soc0-pinctrl",
> +		.of_match_table = aspeed_g7_soc0_pinctrl_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +
> +static int __init aspeed_g7_soc0_pinctrl_init(void)
> +{
> +	return platform_driver_register(&aspeed_g7_soc0_pinctrl_driver);
> +}
> +arch_initcall(aspeed_g7_soc0_pinctrl_init);
> 


Best regards,
Krzysztof

