Return-Path: <linux-gpio+bounces-33151-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPheHLh9sWmACAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33151-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:35:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DE12657EF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8170E3015DBB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC6A3BE654;
	Wed, 11 Mar 2026 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqEMFwuY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3E31EE7C6;
	Wed, 11 Mar 2026 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239733; cv=none; b=Q4CeyBK72EEiUpXSDgQa063lzRXTjhu2/FfYTpQvSfAMG9o3jTSxrutPLm8iK3X7hgo8gr0MsZ8s6IOgxq+9PyZ8gG7LVL4EjuA1QHG7K1p281JWW+qfnKdOGGuBCEkapIiVFG5IkPgHfsllX1NAPYezhnZh5yCSPrrjq9V3C/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239733; c=relaxed/simple;
	bh=1wwa53fC7EmCPoUYJrbERdtPjydJ/FvxblALnh4rzyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hg1MalqS1Ufk8ep9goer5vruxQ+6ZiyaM5aFQ4Z5qnFsBKi0fHskbscTTLQq4D6uhvIamWD6dOyP/72sLN2eeI2p/k/nUAdjbDFtsZE6ebO30DbPno2Gf6HRiUzkBCR4o4uxzm1t4WST2tl4Af0K1khdpcwAjkVcF7UAyO3HjCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqEMFwuY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C1DC4CEF7;
	Wed, 11 Mar 2026 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773239733;
	bh=1wwa53fC7EmCPoUYJrbERdtPjydJ/FvxblALnh4rzyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kqEMFwuY6xd5hILMvSD8FhDLSd32lU5vOd1o0tYUjFKg8uJuQdXVX5yOjCQktVn8y
	 LZkQ9zwYxvBuZp1kaLVmq1Ox0vaJK7Z3T2TkkfeTPLDBFXv72vEXeIAr68WSeeQjqC
	 F3MUSyQgo2fgzNM9C4g4rP7Owd64HQsuW0mTmTSzBpxeuvnNKA4oTJIQPJOUtOp9Pk
	 7m6K1qLzqF5yYGauLFNpXbhP4t4npA9rt0S6Hzc1eiN/KmboDi0eBI8ixayjIniNDL
	 12P93uZzbHsZ75smsT9C81kPepWKvBIMYk+KMplcgbQfu6Izl9L9jJdkfMv9ABycpW
	 n7iR8M9RK36JA==
Message-ID: <dc7f24b2-ec57-4937-92f1-f80b1f1e785a@kernel.org>
Date: Wed, 11 Mar 2026 15:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] platform: int3472: Add MSI prestige board data
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com,
 kees@kernel.org, ribalda@chromium.org
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
 <20260311131910.835513-6-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260311131910.835513-6-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-33151-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 16DE12657EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 11-Mar-26 14:19, Antti Laakso wrote:
> Define regulators and gpio for ov5675 in MSI Prestige 14 AI EVO+ laptop.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..6892d6e98072 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -12,6 +12,7 @@
>  #include <linux/dmi.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/platform_data/tps68470.h>
> +#include <linux/property.h>
>  #include <linux/regulator/machine.h>
>  #include "tps68470.h"
>  
> @@ -232,6 +233,72 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
>  	},
>  };
>  
> +/* Settings for MSI Prestige 14 AI+ Evo C2VMG laptop. */
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

Nit (no need to fix unless you need to do a v3 for other reasons),
these 2 explicit foo = 0 initializers are not necessary and can
be dropped.

Otherwise this looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




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
>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
> @@ -258,6 +325,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>  	}
>  };
>  
> +static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
> +	.dev_id = "i2c-OVTI5675:00",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
> +static const struct property_entry msi_p14_ai_evo_gpio_props[] = {
> +	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
> +	{ }
> +};
> +
> +static const struct software_node msi_p14_ai_evo_tps68470_gpio_swnode = {
> +	.properties = msi_p14_ai_evo_gpio_props,
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +371,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:06",
> +	.tps68470_regulator_pdata = &msi_p14_ai_evo_tps68470_pdata,
> +	.tps68470_gpio_swnode = &msi_p14_ai_evo_tps68470_gpio_swnode,
> +	.n_gpiod_lookups = 1,
> +	.tps68470_gpio_lookup_tables = {
> +		&msi_p14_ai_evo_ovti5675_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -316,6 +410,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
> +		},
> +		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
> +	},
>  	{ }
>  };
>  


