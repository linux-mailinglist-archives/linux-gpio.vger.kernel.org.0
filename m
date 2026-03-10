Return-Path: <linux-gpio+bounces-33025-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBMLBT8+sGmohQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33025-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:52:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 11693254001
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36C8E3211B9B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A622F3600;
	Tue, 10 Mar 2026 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Irki6hZy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8532EC562;
	Tue, 10 Mar 2026 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153183; cv=none; b=Le7wanm6uYJiUkRK3ayhPr1hFg4Z492unyA0bzkTiP7hcQkXxmiSPdVviia+z0powXysNy/bAlxsLogUQpTeLwI/QpeLgAkuQa0034oFQcMJGrtA2bEQvP2nOvl7gP1zT2kc3EIi5WHQKvmsM5W0pHZT7fXBkIUOagwJzWAGp0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153183; c=relaxed/simple;
	bh=tyPlqVoMdHp8hj8vOFa9QVD3tcexWKEchvFfLl/zht0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFlvl9KKlp5ycMiUHLR0wG8EjgMUhyzS13yRU7Y0P85pMgMKAutP+6PuwoFv8o/MRXDW2uHmCL7ilPHEqhI3rPnvaa76zB2ut53peeZjVDjOgugNRCXJybB0k1dbVEtaMQBtcVHkszFWbcovoE97LojSbskbrxWQX0xtJatg6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Irki6hZy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12A36250;
	Tue, 10 Mar 2026 15:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773153112;
	bh=tyPlqVoMdHp8hj8vOFa9QVD3tcexWKEchvFfLl/zht0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Irki6hZy0ek7Tuep1wtlw/DC+NaNLMiY1ZlX69Ozhx6jM6Xwvw1qS47FWaD6USypy
	 1fV8v7fPqqrOdospxJUu1Xi+H5kS0ru6C0SICz+K6dkBih3k2+EuADIlA8OX7K2dya
	 01/J1yq/dvE9L8oJV42FV6U+wnDyF2hP4+m7xclc=
Message-ID: <db7b4eeb-1054-4b7c-9f91-810be504124d@ideasonboard.com>
Date: Tue, 10 Mar 2026 14:32:56 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] platform: int3472: Add MSI prestige board data
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
 jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
 ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-6-antti.laakso@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260310124427.693625-6-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 11693254001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33025-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Action: no action

Hi Antti

On 10/03/2026 12:44, Antti Laakso wrote:
> Define regulators and gpios for MSI Prestige 14 AI EVO+ laptop.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>   .../x86/intel/int3472/tps68470_board_data.c   | 97 +++++++++++++++++++
>   1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..fe7c23e72d66 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -232,6 +232,73 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
>   	},
>   };
>   
> +/* Settings for MSI Prestige 14 laptop. */
> +
> +static struct regulator_consumer_supply ovti5675_avdd_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI5675:00"),
> +};
> +
> +static struct regulator_consumer_supply ovti5675_dovdd_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI5675:00"),
> +};
> +
> +static struct regulator_consumer_supply ovti5675_dvdd_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI5675:00"),
> +};
> +
> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti5675_dvdd_consumer_supplies),
> +	.consumer_supplies = ovti5675_dvdd_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti5675_avdd_consumer_supplies),
> +	.consumer_supplies = ovti5675_avdd_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = 0,
> +	.consumer_supplies = NULL,
> +};
> +
> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti5675_dovdd_consumer_supplies),
> +	.consumer_supplies = ovti5675_dovdd_consumer_supplies,
> +};
> +
> +static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pdata = {
> +	.reg_init_data = {
> +		[TPS68470_CORE] = &msi_p14_ai_evo_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  = &msi_p14_ai_evo_tps68470_ana_reg_init_data,
> +		[TPS68470_VIO]  = &msi_p14_ai_evo_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] = &msi_p14_ai_evo_tps68470_vsio_reg_init_data,
> +	},
> +};
> +
>   static struct gpiod_lookup_table surface_go_int347a_gpios = {
>   	.dev_id = "i2c-INT347A:00",
>   	.table = {
> @@ -258,6 +325,19 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>   	}
>   };
>   
> +static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
> +	.dev_id = "i2c-OVTI5675:00",
> +	.table = {
> +		GPIO_LOOKUP_IDX("tps68470-gpio", 9, "reset", 0, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("tps68470-gpio", 7, "reset", 1, GPIO_ACTIVE_LOW),

The ov5675 driver seems only to look for a single gpio, so I think the second entry would never be 
accessed here...should there be an accompanying driver change?

Thanks
Dan

> +		{ }
> +	}
> +};
> +
> +static const struct tps68470_gpio_platform_data msi_p14_ai_evo_tps68470_gpio_pdata = {
> +	.daisy_chain_enable = true,
> +};
> +
>   static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>   	.dev_name = "i2c-INT3472:05",
>   	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +367,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>   	},
>   };
>   
> +static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:06",
> +	.tps68470_regulator_pdata = &msi_p14_ai_evo_tps68470_pdata,
> +	.tps68470_gpio_pdata = &msi_p14_ai_evo_tps68470_gpio_pdata,
> +	.n_gpiod_lookups = 1,
> +	.tps68470_gpio_lookup_tables = {
> +		&msi_p14_ai_evo_ovti5675_gpios,
> +	},
> +};
> +
>   static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>   	{
>   		.matches = {
> @@ -316,6 +406,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>   		},
>   		.driver_data = (void *)&dell_7212_tps68470_board_data,
>   	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
> +		},
> +		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
> +	},
>   	{ }
>   };
>   


