Return-Path: <linux-gpio+bounces-33004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHCcDO0vsGkShAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:51:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3425285F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C4FC3043DB2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CB93C5DD4;
	Tue, 10 Mar 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3KvJIod"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713103B6BF3;
	Tue, 10 Mar 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148200; cv=none; b=SIt6yGp4rer+XQf0wpgJO1kO3WczngswX9ybeXUbCO6K7Xvv91BiCyCY0U17tVoqwahsDJaMdJ9EakhyfXJd9+0SZT2HlfoG9clgnOPfalA83omc/HhUy5S2K4Kr3v9m19fxuJQiBKNq4u4nMR9DAtLlViRQcL/aTnEXR1MKrdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148200; c=relaxed/simple;
	bh=9bbyHAo5UlFGJh9WK+HAzpZhWv7uXoauyswz2qbH8yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foQPBdutuNWDBDuw1pl5wJmeCN7t/hcE3yKaxgwTfkXOzqZOxI1+9CxxAAW/WW8CzHNWs00VGxG6HX2UDjP8MKjMZVg2agEvHQszvHJrQZKPBEfB8Zq4K50J5mN5BDmOcXyjMm5B5u/h5C81un6al8EJNYWvbpKIb5asCpY66os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3KvJIod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2839C19423;
	Tue, 10 Mar 2026 13:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148200;
	bh=9bbyHAo5UlFGJh9WK+HAzpZhWv7uXoauyswz2qbH8yY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F3KvJIodLzmaTHS8DH2uWY/4vmWMKDpPIDYAXTkbdljQ+/BFxQI18Q/TvfYiVF3yR
	 0yKCYqWKOR3uBds0lHM80dMBNW2M1Srtqot7L6i/77t5Sg0fLQj413MHbYtPGa79Y3
	 bMMgbg15C5TgfWb0rc/uai73kTfOF+Q2RVXIie1IcOGCkyMT+24uIcUqjzA/sw3WYf
	 9spQqMm1l+4t4zBnCfRhIJ331t+/QPEtScbfAD/+pVtWBO2g7Z4vYLDspEtzV0GtMQ
	 GWhlLDOzQrQ31QoPFE0Eg2CmIscwyHyMJh9WEYxnmUm7GK6iidWUhsvDF/CPUztwUF
	 CdOBkzLYPPt1Q==
Message-ID: <8a197d9b-bec1-4c8f-be53-ee35c8bbb2dc@kernel.org>
Date: Tue, 10 Mar 2026 14:09:54 +0100
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
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com,
 miguel.vadillo@intel.com, kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-6-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260310124427.693625-6-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2CC3425285F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33004-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,msi.com:url]
X-Rspamd-Action: no action

Hi,

On 10-Mar-26 13:44, Antti Laakso wrote:
> Define regulators and gpios for MSI Prestige 14 AI EVO+ laptop.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..fe7c23e72d66 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -232,6 +232,73 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
>  	},
>  };
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
>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
> @@ -258,6 +325,19 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>  	}
>  };
>  
> +static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
> +	.dev_id = "i2c-OVTI5675:00",
> +	.table = {
> +		GPIO_LOOKUP_IDX("tps68470-gpio", 9, "reset", 0, GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP_IDX("tps68470-gpio", 7, "reset", 1, GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
> +static const struct tps68470_gpio_platform_data msi_p14_ai_evo_tps68470_gpio_pdata = {
> +	.daisy_chain_enable = true,
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +367,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>  	},
>  };
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
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -316,6 +406,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),

I think this match might be a bit to specific, e.g. there also is a C1M model where
this might also apply? See:

https://www.msi.com/Business-Productivity/Prestige-14-AI-Evo-C1MX

or maybe these are really different ?

If you can look into that somehow that would be great. If you cannot find
out if other models are compatible we should probably play it safe and
keep the specific match you've above for now.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> +		},
> +		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
> +	},
>  	{ }
>  };
>  


