Return-Path: <linux-gpio+bounces-33028-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID+lGZA5sGlbhQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33028-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:32:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A1A25398A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 16:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D96732DA5A9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C8F309DAF;
	Tue, 10 Mar 2026 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLvXYw4r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2533033F6;
	Tue, 10 Mar 2026 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154956; cv=none; b=V8mQcK2LZ6WaBNy3ZBgd9IOZiCRHOv0RHfmLnHc+UsHFEInZhA4qQKwrNzumZKvKktU4r88gP3gYzITk/vVC6z7pd1ciTTAt2/UTf3EhkndeUh6k6mSo/wCQnbxRkM249lMDFXWTFge7bdcpKLJ1cwj3HKQ99PMEDEIaxTdpEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154956; c=relaxed/simple;
	bh=B3yjZ2PtytN8s2XAoFhnIPvCWCLkJ9uFzDhkRyQNxoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2td0aaQXKZsjsmX9FNYARjbPuWNuuR8kXsCfN2CFfTSviZOCTMSWKSyI4bA+gNIUpDcMmIeLi3Evy2Zw4ArbqkR0Ky7EnrGMEXTejtNSb1r4JuJWEbSP4UFfzqItgwUH/FBVs8HpLcPqYNWHaU7j4RfWLSNFR/h0H979iI9/KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLvXYw4r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0758AC19423;
	Tue, 10 Mar 2026 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773154956;
	bh=B3yjZ2PtytN8s2XAoFhnIPvCWCLkJ9uFzDhkRyQNxoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uLvXYw4ructNr51kyC6fpYMf9FWkvdcq+POKkbbgueINM1DnoZSq+JSx0B0O1goRl
	 h9y8MuotvH6LYAVnCyr0zVw9MvWKv11VUiJOb2rwpXR/7UgC5vZaVOl9w3TwUBuldq
	 eio1Th41A1BAms4BHdcHTdKROjDaaLIfT+Zb+BbKcfzyVyNPlZtZsZIrr+M1t7/mh4
	 s3Mbak+AfkCyhDYm5syG9WrFtErJuQsFBtOPm0bdolUDv2FCxPBNvseZxGf1ZTnkIA
	 U4QJH4nwkKDdTNRfUub6EvYgQyd2RbH7Xoi0Etm0y/LplxPflK2SdW4fx/HJm/GhI+
	 9Uk22rU9bCd9g==
Message-ID: <cc274ba7-cae4-47b0-90d3-124ceae6a51b@kernel.org>
Date: Tue, 10 Mar 2026 16:02:31 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] platform: int3472: Add MSI prestige board data
To: Dan Scally <dan.scally@ideasonboard.com>,
 Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, ilpo.jarvinen@linux.intel.com,
 hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
 jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
 ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-6-antti.laakso@linux.intel.com>
 <db7b4eeb-1054-4b7c-9f91-810be504124d@ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <db7b4eeb-1054-4b7c-9f91-810be504124d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 08A1A25398A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33028-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi,

On 10-Mar-26 15:32, Dan Scally wrote:
> Hi Antti
> 
> On 10/03/2026 12:44, Antti Laakso wrote:
>> Define regulators and gpios for MSI Prestige 14 AI EVO+ laptop.
>>
>> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
>> ---
>>   .../x86/intel/int3472/tps68470_board_data.c   | 97 +++++++++++++++++++
>>   1 file changed, 97 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> index 71357a036292..fe7c23e72d66 100644
>> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
>> @@ -232,6 +232,73 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
>>       },
>>   };
>>   +/* Settings for MSI Prestige 14 laptop. */
>> +
>> +static struct regulator_consumer_supply ovti5675_avdd_consumer_supplies[] = {
>> +    REGULATOR_SUPPLY("avdd", "i2c-OVTI5675:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply ovti5675_dovdd_consumer_supplies[] = {
>> +    REGULATOR_SUPPLY("dovdd", "i2c-OVTI5675:00"),
>> +};
>> +
>> +static struct regulator_consumer_supply ovti5675_dvdd_consumer_supplies[] = {
>> +    REGULATOR_SUPPLY("dvdd", "i2c-OVTI5675:00"),
>> +};
>> +
>> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg_init_data = {
>> +    .constraints = {
>> +        .min_uV = 1200000,
>> +        .max_uV = 1200000,
>> +        .apply_uV = 1,
>> +        .valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +    },
>> +    .num_consumer_supplies = ARRAY_SIZE(ovti5675_dvdd_consumer_supplies),
>> +    .consumer_supplies = ovti5675_dvdd_consumer_supplies,
>> +};
>> +
>> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_init_data = {
>> +    .constraints = {
>> +        .min_uV = 2815200,
>> +        .max_uV = 2815200,
>> +        .apply_uV = 1,
>> +        .valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +    },
>> +    .num_consumer_supplies = ARRAY_SIZE(ovti5675_avdd_consumer_supplies),
>> +    .consumer_supplies = ovti5675_avdd_consumer_supplies,
>> +};
>> +
>> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_data = {
>> +    .constraints = {
>> +        .min_uV = 1800600,
>> +        .max_uV = 1800600,
>> +        .apply_uV = 1,
>> +        .valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +    },
>> +    .num_consumer_supplies = 0,
>> +    .consumer_supplies = NULL,
>> +};
>> +
>> +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg_init_data = {
>> +    .constraints = {
>> +        .min_uV = 1800600,
>> +        .max_uV = 1800600,
>> +        .apply_uV = 1,
>> +        .valid_ops_mask = REGULATOR_CHANGE_STATUS,
>> +    },
>> +    .num_consumer_supplies = ARRAY_SIZE(ovti5675_dovdd_consumer_supplies),
>> +    .consumer_supplies = ovti5675_dovdd_consumer_supplies,
>> +};
>> +
>> +static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pdata = {
>> +    .reg_init_data = {
>> +        [TPS68470_CORE] = &msi_p14_ai_evo_tps68470_core_reg_init_data,
>> +        [TPS68470_ANA]  = &msi_p14_ai_evo_tps68470_ana_reg_init_data,
>> +        [TPS68470_VIO]  = &msi_p14_ai_evo_tps68470_vio_reg_init_data,
>> +        [TPS68470_VSIO] = &msi_p14_ai_evo_tps68470_vsio_reg_init_data,
>> +    },
>> +};
>> +
>>   static struct gpiod_lookup_table surface_go_int347a_gpios = {
>>       .dev_id = "i2c-INT347A:00",
>>       .table = {
>> @@ -258,6 +325,19 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>>       }
>>   };
>>   +static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
>> +    .dev_id = "i2c-OVTI5675:00",
>> +    .table = {
>> +        GPIO_LOOKUP_IDX("tps68470-gpio", 9, "reset", 0, GPIO_ACTIVE_LOW),
>> +        GPIO_LOOKUP_IDX("tps68470-gpio", 7, "reset", 1, GPIO_ACTIVE_LOW),
> 
> The ov5675 driver seems only to look for a single gpio, so I think the second entry would never be accessed here...should there be an accompanying driver change?

Ah I missed this, yes having 2 entries mapping to the same label is not
useful. The first entry (with index 0) will simply always be used in that
case.

Also this should use plain GPIO_LOOKUP() since the index part (the only
difference here) is never used in sensor drivers.

Regards,

Hans





> 
> Thanks
> Dan
> 
>> +        { }
>> +    }
>> +};
>> +
>> +static const struct tps68470_gpio_platform_data msi_p14_ai_evo_tps68470_gpio_pdata = {
>> +    .daisy_chain_enable = true,
>> +};
>> +
>>   static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>>       .dev_name = "i2c-INT3472:05",
>>       .tps68470_regulator_pdata = &surface_go_tps68470_pdata,
>> @@ -287,6 +367,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>>       },
>>   };
>>   +static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_data = {
>> +    .dev_name = "i2c-INT3472:06",
>> +    .tps68470_regulator_pdata = &msi_p14_ai_evo_tps68470_pdata,
>> +    .tps68470_gpio_pdata = &msi_p14_ai_evo_tps68470_gpio_pdata,
>> +    .n_gpiod_lookups = 1,
>> +    .tps68470_gpio_lookup_tables = {
>> +        &msi_p14_ai_evo_ovti5675_gpios,
>> +    },
>> +};
>> +
>>   static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>>       {
>>           .matches = {
>> @@ -316,6 +406,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>>           },
>>           .driver_data = (void *)&dell_7212_tps68470_board_data,
>>       },
>> +    {
>> +        .matches = {
>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
>> +            DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
>> +        },
>> +        .driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
>> +    },
>>       { }
>>   };
>>   
> 


