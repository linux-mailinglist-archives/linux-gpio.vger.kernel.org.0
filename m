Return-Path: <linux-gpio+bounces-33001-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JdeCG0hsGmCgAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33001-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:49:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B43DC250D5F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4F793281714
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F403BBA1C;
	Tue, 10 Mar 2026 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oc8GyeyJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348E43BBA13;
	Tue, 10 Mar 2026 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148001; cv=none; b=mWi7PxpChuvGCD93VK3gi2tIeI1KDSkaPxrdO/rWN+jKPVVdZZsWA6T0NSuIvVra1KkPkU6fqFvf/edbOWfNRryuMMG/dcr+QhsOS6HPl/qZww0yKEeAz9mBl7QVw/04CgdJ3P+2Oq2Txz7UxNdW1+RL4eG3niR6kbS70xdXhfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148001; c=relaxed/simple;
	bh=tYTbD082D1CjxqxR44nlGdmxEU587BQeuKM+nasQ8+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxwGXjpzoZWZt+CyXuWW4C9R6a43RR0ZWHO3GRGcMP4011fqSXur3bwIENpLco16Ow28DbY/fHBNJRLQUA3cvJvqByqx7GwyIKBctnu0Zr3xfgjWwIOxtFJJwv7Be0yMv93OndSsgIOhgtp/9kH61HCLTyGXXgkXxjersZxRiTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oc8GyeyJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D441FC19423;
	Tue, 10 Mar 2026 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148001;
	bh=tYTbD082D1CjxqxR44nlGdmxEU587BQeuKM+nasQ8+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oc8GyeyJ1vmpZn0eYmrG8pjpah+JVHDX2OxSocjT+0aQu0HS4J0SWRXE5ukdwIBX2
	 7r1no646YjnBViXfhwqIHOaxb+xLNOUClqEq5Y2/NZ4Hkyljr0pwfOO1i9SAPQKTsV
	 kIxFN/vfNa92X3GBg+r64933vAgI8UpbdYFhYmAzu2T5cXT7MsdavMM3wNSpPAeyih
	 oZTGSTuGv/wx2C8A8Fz8ocqSkw18KRB1Ct6PV1IzspCMcRvg+bka7DCjs26Vn5GmER
	 e+zpgn/FSC+5/T4ErgJRAJZ/8361lOO3JAndFIDA1hHdMc43goW6tBjiFz9nC/p4O6
	 /sWoJsZan2N4Q==
Message-ID: <5b955e4c-4206-44f7-b680-9b8a99d75a74@kernel.org>
Date: Tue, 10 Mar 2026 14:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] platform: int3472: Add gpio platform data
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com,
 miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-4-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260310124427.693625-4-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B43DC250D5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33001-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Hi,

On 10-Mar-26 13:44, Antti Laakso wrote:
> The tps68470 supports i2c daisy chain, which need to be configured by
> gpio-tps68470 driver. Add daisy chain information to platform data.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 2 ++
>  drivers/platform/x86/intel/int3472/tps68470.h | 1 +
>  include/linux/platform_data/tps68470.h        | 4 ++++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0d2a..b02bc675cabe 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -197,6 +197,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>  		cells[2].name = "tps68470-gpio";
> +		cells[2].platform_data = (void *)board_data->tps68470_gpio_pdata;
> +		cells[2].pdata_size = sizeof(*board_data->tps68470_gpio_pdata);
>  
>  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
>  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701593..c1c4290eb6d5 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	const struct tps68470_gpio_platform_data *tps68470_gpio_pdata;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };
> diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
> index e605a2cab07f..7330dab7a711 100644
> --- a/include/linux/platform_data/tps68470.h
> +++ b/include/linux/platform_data/tps68470.h
> @@ -27,6 +27,10 @@ struct tps68470_regulator_platform_data {
>  	const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
>  };
>  
> +struct tps68470_gpio_platform_data {
> +	const bool daisy_chain_enable;
> +};
> +
>  struct tps68470_clk_consumer {
>  	const char *consumer_dev_name;
>  	const char *consumer_con_id;


