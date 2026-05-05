Return-Path: <linux-gpio+bounces-36112-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOQ1Icmt+Wky+wIAu9opvQ
	(envelope-from <linux-gpio+bounces-36112-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 10:43:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC464C8CC4
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 10:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EFD63034283
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 08:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE262F290B;
	Tue,  5 May 2026 08:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b="Do6u5Ku7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 13.mo581.mail-out.ovh.net (13.mo581.mail-out.ovh.net [87.98.150.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0B30BB8A
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 08:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.150.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970559; cv=none; b=Kg9MM1yxjcnvxfL4s+r7aRKEcgZgECtzI+gwVGVhvXBJFAgOvPwYy7RTPiPMx+yo6TOohYoqkB0UTlmfm1FoSx8kCSuqYuEaRVU+aQ58VWIJN6X8x72OGdc7Xv111iZogLRyEt82BCMdffyt8KbqL1iDtfhEq9naK6nkv1KmPk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970559; c=relaxed/simple;
	bh=UeIRA0xIGC2b+3SSnkE5bR3iIrYnOtlOcY4wZZXP7ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QfgQDCmasFAxaQifNplj97vFle3cSEjupj8k9tEnmowdy6cTa/8DctBc8YhNNGZqvjgNTvU5BUuX92ua1tS22EyxTwjRbk66MD5biwX6NkxVnP2c5DHryEiP98IgVLv4gFzTUbkaO1HntscIOODKBF60hpJlDQ2KkoYIaZWxhFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com; spf=pass smtp.mailfrom=armadeus.com; dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b=Do6u5Ku7; arc=none smtp.client-ip=87.98.150.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armadeus.com
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.58.249])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4g8sGB5gnwz60B6
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 08:32:50 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-92v2f (unknown [10.110.118.108])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 74512C31BF;
	Tue,  5 May 2026 08:32:49 +0000 (UTC)
Received: from armadeus.com ([37.59.142.106])
	by ghost-submission-7d8d68f679-92v2f with ESMTPSA
	id muovFjGr+Wkn/wgAJ55Jkg
	(envelope-from <sebastien.szymanski@armadeus.com>); Tue, 05 May 2026 08:32:49 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-106R006582a2f30-e56d-4c4f-8000-ab83c7f616fe,
                    EF376445141242EFB525A4BC622796E311A81957) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp:90.126.104.208
Message-ID: <b5f75901-29c0-4153-ad1f-543dcf7476e4@armadeus.com>
Date: Tue, 5 May 2026 10:32:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] pinctrl: imx1: Allow parsing DT without function
 nodes
To: Frank Li <Frank.Li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260504170836.1794372-1-Frank.Li@nxp.com>
Content-Language: en-US
From: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Autocrypt: addr=sebastien.szymanski@armadeus.com; keydata=
 xsBNBFNfZLEBCACv1lqSePHJNpRgcnER+3emy+Arjz84zFax3XkogjY/e3ZneihIgWrVKe5M
 ql16pX4KTkzNgMUKz4bG/XwT3kjcrXshxFLlg7KrHMl287C+W+QOUjnjVeRi/su+SPmjz8VD
 yr11h+ZkVLAWhS+uQJ93jy1NwG8M4t1kBLAVHHD5Vw4FJ+3ouaVYIp1X1Cr8bVKQw33Q1aTd
 ro0kMBb96B9vNu7ciJZ3gvlaBzUEKOgNnq9KaywuLnqrqr4HUIn5JuxZjCjJzt9kTAKcTfp2
 cJM8qpp+2FF5qtbkse9fZ6M64qozgOPr9Tk4Amf9fZEUQ6UNw14mmBZuXSzoHe75gI7TABEB
 AAHNN1PDqWJhc3RpZW4gU1pZTUFOU0tJIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
 LmNvbT7CwJAEEwEIADoCGyMHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgBYhBJwGygpYm/1C
 /GCmwbCaKeiBMmTiBQJdhIHLAAoJELCaKeiBMmTixXIH/2W3kbzRG0UF81jtRRnp0H83rjDT
 v0H+8fgFMRL/7HCJ1QPArkfRJlM2wlJkN+ChP09CCarYfUEHfRCHlTb7At6Yyrz1jziD7ZwX
 8IWHYRXnZkY5eZc5DsiUgq6JH49kt+GPzK8UVP9MTa6zkBpPCUf7LzZ4pD3FihdkT52BU3gI
 d9P49fSI0TYySlb/VKn815aOhvwEr7+Dh3mZUjSh7saofbRmVUOr7p+R3MvvGI19/IJZjeOE
 ZWliODDOt6HnBOtoGSXMcNIFF6snH52D5N5gY88njZjTwhgGGUBix1bsgf/EY0v4R5itZBXB
 B/Ze4Tm++YHaB75hZK6PQu/YRv7OwE0EU19ksQEIALo7jhXddrXBTRu5SAjelV53jyHBJTX/
 vN4nL/VbbW/saca+NJjDSxx5DBmotZbQdWIyZiSIjU/xnTREvtDrl6ZeSsKWd7ZqiuiY4fSR
 zwuQp9rd0yqRuxesrWeyJB1zCSdEvLyKASERt+nxkOA+IzJ4y1qLtvnWr+SL1AXgTMw+Tkyw
 KIDCRWHTIYas11ldGj82gOIpYeXnapeNLHfT4EQwg0NeWYHynJxAQWiX5aPlw0uSpAQSsBXQ
 FIe3fpoveMSnXK+PG2BBOzexYv7r4S70a6sF9sgTTPpfKqUaqqC+u1+bUX6alTAKhGKJywaF
 6ViqLlgY8PfwohSyAlqlTRMAEQEAAcLAdgQYAQgAIAIbDBYhBJwGygpYm/1C/GCmwbCaKeiB
 MmTiBQJdhIHSAAoJELCaKeiBMmTitU8IAK7NQM3fEwaF5XaKtepYWsVka44CD8A9e4r7NVK9
 ugirKvXirIxBSDmN/Db862NmVpITsZ6ERNSNZLm/7k55N+TexKYiFZeU7G92TEfAM6qPElvx
 DLEcrkNMq9r08YZeUloacsq31AL5fK4LW+xdvXudkdiKRMJsdTpmff3x5kIziGOHjwFP9wve
 ZgEH52gpbRsP8Whx/Z2lNX/BBRmFM8OnEXFsjjqDzYThdxTq85wGPpkgvvUGyPNRD7TpbB1C
 pajOUUkPxgj5LKt77HD1afeZNudWhgcdkbtT5PMQTT0WY6wvMEj9S1+bGPeXRGWLYB7gHQ+L
 JNoSD7Kz6Y9qnKo=
In-Reply-To: <20260504170836.1794372-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 12335922329985537596
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEb25FGR3nOhA5+91Dq+E8bxlVEcVCP3B9EOMEnmpQdQrRBSNwBHJU0A57XiRZ4GmB+NkrWNoaJJZf4PxdX7bZoE1Zke2M4w8q3Rfg7BvbKroSxA/zlnsoKKQS/N/AWiqL5Idv9FMD7K/VoPYEqV+elc7uCrH/8rED972sIVeCkCeVvlDksLJjByTIG8Q23/1G0jtGscTqpK10kJxDRm/Mp+5haI1GoD7Jl+zGF1HyrGjehGYc5vZiJxSSwQaMSEOGhdpfDPMB/SwMXFhrT4KRj3U2M+lFHBOTuwLimFt1oK7tX9qfwJO1xAmI4XSrkNceytXsRfjQ2a9nSOVnNE+wbb0Ga/Kqu+YiaraTpbcgNGPbcOGNsAPue302BB0FhuM3Th1XUp5w0RSlsNSABnF+Sma5G0eZ7KPD7traMKETDdYL6dHdsdJggaySPv83S4VJEvKiFOL+KYKWm7EzJwGPln+ONc3w4y7DPIl9cl66FPcj+poCDA85cCAuCEK22haPhHPDEQM0UM/nKumGmLQh6x9lXFTzk8WIVXbJo83EVHY847H5GHFJ+t7k83Lg0jjApinYCbQGknBbn+mgCaLe9DFLMarlg4Udknr3UiRoQ/Cv3hH1EetnYPjl1m65eekg602/zFQvNINvg8vBamsTcGiwNes0iL1vmdFr0uvaHdA
DKIM-Signature: a=rsa-sha256; bh=iK2OTeqhoBSCveaCZexOJs9PVb4BkPBHaXlxF/rh3GY=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1777969971; v=1;
 b=Do6u5Ku7eX6UIF3R96zMpCeUIo7GLJTLcUIMaDSuj8NcjGQZMI/tQAA+A0YJ+NRuaFvcfFDV
 CXbFObklQuf4vnOOwLupte9otDmWc4h2nrBgM1N/6MLn6Z1EB2Qw6BOUxKE1hRq0dinoDnxDNJ0
 EO97leMDcdFlDAaLYNI5n2q71LkjfowgDzVC/b8geyIOc1nJsLyKOUAcYKmXrtQMeMX6/I0Li+4
 QHRirIyIrY/wDbtm9wsojJwDchDBqNcCj2Hm0Ua7wXAkJymFnyDRhF39tcqoCy1CrGu9MKSdp7J
 n6ssmgchukE2veiUL3dAOcTM68HGTGSlsj5Jylt2e05UA==
X-Rspamd-Queue-Id: AFC464C8CC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[armadeus.com:s=ovhmo103079-selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-36112-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[armadeus.com];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[armadeus.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastien.szymanski@armadeus.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armadeus.com:email,armadeus.com:dkim,armadeus.com:mid,nxp.com:email,i.mx:url]

Hello,

On 5/4/26 7:08 PM, Frank Li wrote:
> The old format to define pinctrl settings for imx in DT has two hierarchy
> levels. The first level are function device nodes. The second level are
> pingroups which contain a property fsl,pins. The original ntention was to
> define all pin functions in a single dtsi file and just reference the
> correct ones in the board files.
> 
> The commit ("5fcdf6a7ed95e pinctrl: imx: Allow parsing DT without function
> nodes") already make moden i.MX chip support flatten layout.
> 
> Make legacy chipes (more than 15 years) support this flatten layout also.
> 
> Fixes: e948cbdc41d6f ("ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> build test only
> 
> Sébastien Szymanski:
> 	Can you help test it? I am happy i.MX27 still alive.

Sure! Thanks for the patch! With this patch applied on Linux 7.1-rc2 the 
board boots again. I see the following messages, though:

[    0.085139] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085226] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085281] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085327] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085372] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.085416] imx27-pinctrl 10015000.pinmux: Not a valid fsl,pins 
property (gpio)
[    0.092693] imx27-pinctrl 10015000.pinmux: initialized IMX pinctrl driver

That's because there is no fsl,pins property in the 6 gpio subnodes.

Tested-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

I one have comment bellow.

> 
> Frank
> ---
>   drivers/pinctrl/freescale/pinctrl-imx1-core.c | 48 ++++++++++++++++---
>   1 file changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index b36c8a1461b7c..bf07e0c64a098 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -540,10 +540,34 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
>   	return 0;
>   }
>   
> +/*
> + * Check if the DT contains pins in the direct child nodes. This indicates the
> + * newer DT format to store pins. This function returns true if the first found
> + * fsl,pins property is in a child of np. Otherwise false is returned.
> + */
> +static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
> +{
> +	struct device_node *function_np;
> +	struct device_node *pinctrl_np;
> +
> +	for_each_child_of_node(np, function_np) {
> +		if (of_property_read_bool(function_np, "fsl,pins"))

Isn't of_property_present better here...

> +			return true;
> +
> +		for_each_child_of_node(function_np, pinctrl_np) {
> +			if (of_property_read_bool(pinctrl_np, "fsl,pins"))

...and here ?

Regards,

> +				return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>   static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>   		struct imx1_pinctrl *pctl, struct imx1_pinctrl_soc_info *info)
>   {
>   	struct device_node *np = pdev->dev.of_node;
> +	bool flat_funcs;
>   	int ret;
>   	u32 nfuncs = 0;
>   	u32 ngroups = 0;
> @@ -552,9 +576,15 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>   	if (!np)
>   		return -ENODEV;
>   
> -	for_each_child_of_node_scoped(np, child) {
> -		++nfuncs;
> -		ngroups += of_get_child_count(child);
> +	flat_funcs = imx1_pinctrl_dt_is_flat_functions(np);
> +	if (flat_funcs) {
> +		nfuncs = 1;
> +		ngroups = of_get_child_count(np);
> +	} else {
> +		for_each_child_of_node_scoped(np, child) {
> +			++nfuncs;
> +			ngroups += of_get_child_count(child);
> +		}
>   	}
>   
>   	if (!nfuncs) {
> @@ -574,10 +604,14 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
>   	if (!info->functions || !info->groups)
>   		return -ENOMEM;
>   
> -	for_each_child_of_node_scoped(np, child) {
> -		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
> -		if (ret == -ENOMEM)
> -			return -ENOMEM;
> +	if (flat_funcs) {
> +		imx1_pinctrl_parse_functions(np, info, 0);
> +	} else {
> +		for_each_child_of_node_scoped(np, child) {
> +			ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
> +			if (ret == -ENOMEM)
> +				return -ENOMEM;
> +		}
>   	}
>   
>   	return 0;


-- 
Sébastien Szymanski, Armadeus Systems
Software engineer

