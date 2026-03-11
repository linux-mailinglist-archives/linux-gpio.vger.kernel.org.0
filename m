Return-Path: <linux-gpio+bounces-33119-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GnQJyhQsWlCtAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33119-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:21:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC5262D95
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0059303A485
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C01A31E82A;
	Wed, 11 Mar 2026 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qv5OWEjP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608D3D88F9;
	Wed, 11 Mar 2026 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228068; cv=none; b=CUGQsXTzD7UDIxYgvc/ECN4qR+kIdrBp6Y+sP5yexgnDL6lfZO4U4LEKyF81uqkwkO8tVsc7tcStCQCgU/ZbRfwAiZg4TYdh0J9KcbO5ixzxi6Z2ligcr62lTRjg2la37FQ3UOwqyveOoId52iTEehLsmJnR2cOcwPkeqOUjUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228068; c=relaxed/simple;
	bh=G8zRjBWbNVr1Sm3VXmHyMLo9tRzQK8H7TzgK2IGArw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jz/53Wuqb7Kz5iw+srUgJWrgE9zmDu1RUPYF2j7CouDCar/yjmwL/dyPXuqa4vLSWzFfOfgbKpVx4VMKsQwRMNw3Fo9xb9RY95SnVFawPnbiH42m6hy4t7E1GQFg3v1SovSIINuQTFzFU/zxeGjisj+lfkUMjeyFt8E519W/2Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qv5OWEjP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773228066; x=1804764066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G8zRjBWbNVr1Sm3VXmHyMLo9tRzQK8H7TzgK2IGArw0=;
  b=Qv5OWEjPc9QpBvHkwAbQMqSyO7LBG0gumxaa+16WCgUz26l+pwhVFQF+
   68x6cNLP3m/3e/Q1q5kCgdoNXsm15fD+YfInyIYLNYkCupGZW6sc/cykw
   Ue8eeleKx9eWvgu64TA/hRff7ggP6E6ho+TzAEmRyJD6x7otrgmIw1ybc
   RLoY1h1DoiGTwcsyrRElUIqOf/pNPuq/cme8LwVWUrea6KN2BeE6JWFpe
   cqLTZWQPUzAx7Cjee+ZuxepOundcYdTqHPFWM0yGZshVVtg9tgw8PUdRv
   ETmYxCGtWTIjgTdfaLNMm20Sqa6ac5Bmf+csyNNWlskE1iSvh4CCwxL/B
   g==;
X-CSE-ConnectionGUID: A/T3nB6URaOewFDNPOIDyg==
X-CSE-MsgGUID: gmeq6KQmRqeLYoBfRDkCcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85646369"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85646369"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 04:21:05 -0700
X-CSE-ConnectionGUID: 5naTzg3WTgaFUHtfxzPYOA==
X-CSE-MsgGUID: 1trlYXxBSxamGbxjdVQQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217110086"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-DESK) ([10.245.246.81])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 04:21:00 -0700
Date: Wed, 11 Mar 2026 13:20:56 +0200
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linusw@kernel.org,
	brgl@kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
	jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
	ribalda@chromium.org
Subject: Re: [PATCH 5/5] platform: int3472: Add MSI prestige board data
Message-ID: <abFQGE0N3Ulgcn1I@alaakso-DESK>
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-6-antti.laakso@linux.intel.com>
 <db7b4eeb-1054-4b7c-9f91-810be504124d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db7b4eeb-1054-4b7c-9f91-810be504124d@ideasonboard.com>
X-Rspamd-Queue-Id: E7AC5262D95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33119-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Thanks for review Dan,
On Tue, Mar 10, 2026 at 02:32:56PM +0000, Dan Scally wrote:
> Hi Antti
> 
> On 10/03/2026 12:44, Antti Laakso wrote:
> > Define regulators and gpios for MSI Prestige 14 AI EVO+ laptop.
> > 
> > Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> > ---
> >   .../x86/intel/int3472/tps68470_board_data.c   | 97 +++++++++++++++++++
> >   1 file changed, 97 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > index 71357a036292..fe7c23e72d66 100644
> > --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > @@ -232,6 +232,73 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
> >   	},
> >   };
> > +/* Settings for MSI Prestige 14 laptop. */
> > +
> > +static struct regulator_consumer_supply ovti5675_avdd_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("avdd", "i2c-OVTI5675:00"),
> > +};
> > +
> > +static struct regulator_consumer_supply ovti5675_dovdd_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI5675:00"),
> > +};
> > +
> > +static struct regulator_consumer_supply ovti5675_dvdd_consumer_supplies[] = {
> > +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI5675:00"),
> > +};
> > +
> > +static const struct regulator_init_data msi_p14_ai_evo_tps68470_core_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1200000,
> > +		.max_uV = 1200000,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(ovti5675_dvdd_consumer_supplies),
> > +	.consumer_supplies = ovti5675_dvdd_consumer_supplies,
> > +};
> > +
> > +static const struct regulator_init_data msi_p14_ai_evo_tps68470_ana_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 2815200,
> > +		.max_uV = 2815200,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(ovti5675_avdd_consumer_supplies),
> > +	.consumer_supplies = ovti5675_avdd_consumer_supplies,
> > +};
> > +
> > +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vio_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1800600,
> > +		.max_uV = 1800600,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = 0,
> > +	.consumer_supplies = NULL,
> > +};
> > +
> > +static const struct regulator_init_data msi_p14_ai_evo_tps68470_vsio_reg_init_data = {
> > +	.constraints = {
> > +		.min_uV = 1800600,
> > +		.max_uV = 1800600,
> > +		.apply_uV = 1,
> > +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> > +	},
> > +	.num_consumer_supplies = ARRAY_SIZE(ovti5675_dovdd_consumer_supplies),
> > +	.consumer_supplies = ovti5675_dovdd_consumer_supplies,
> > +};
> > +
> > +static const struct tps68470_regulator_platform_data msi_p14_ai_evo_tps68470_pdata = {
> > +	.reg_init_data = {
> > +		[TPS68470_CORE] = &msi_p14_ai_evo_tps68470_core_reg_init_data,
> > +		[TPS68470_ANA]  = &msi_p14_ai_evo_tps68470_ana_reg_init_data,
> > +		[TPS68470_VIO]  = &msi_p14_ai_evo_tps68470_vio_reg_init_data,
> > +		[TPS68470_VSIO] = &msi_p14_ai_evo_tps68470_vsio_reg_init_data,
> > +	},
> > +};
> > +
> >   static struct gpiod_lookup_table surface_go_int347a_gpios = {
> >   	.dev_id = "i2c-INT347A:00",
> >   	.table = {
> > @@ -258,6 +325,19 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
> >   	}
> >   };
> > +static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
> > +	.dev_id = "i2c-OVTI5675:00",
> > +	.table = {
> > +		GPIO_LOOKUP_IDX("tps68470-gpio", 9, "reset", 0, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("tps68470-gpio", 7, "reset", 1, GPIO_ACTIVE_LOW),
> 
> The ov5675 driver seems only to look for a single gpio, so I think the
> second entry would never be accessed here...should there be an accompanying
> driver change?
> 
> Thanks
> Dan

Yes, the gpio 7 is not needed. I'll fix it for v2.
 
> > +		{ }
> > +	}
> > +};
> > +
> > +static const struct tps68470_gpio_platform_data msi_p14_ai_evo_tps68470_gpio_pdata = {
> > +	.daisy_chain_enable = true,
> > +};
> > +
> >   static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
> >   	.dev_name = "i2c-INT3472:05",
> >   	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> > @@ -287,6 +367,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
> >   	},
> >   };
> > +static const struct int3472_tps68470_board_data msi_p14_ai_evo_tps68470_board_data = {
> > +	.dev_name = "i2c-INT3472:06",
> > +	.tps68470_regulator_pdata = &msi_p14_ai_evo_tps68470_pdata,
> > +	.tps68470_gpio_pdata = &msi_p14_ai_evo_tps68470_gpio_pdata,
> > +	.n_gpiod_lookups = 1,
> > +	.tps68470_gpio_lookup_tables = {
> > +		&msi_p14_ai_evo_ovti5675_gpios,
> > +	},
> > +};
> > +
> >   static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
> >   	{
> >   		.matches = {
> > @@ -316,6 +406,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
> >   		},
> >   		.driver_data = (void *)&dell_7212_tps68470_board_data,
> >   	},
> > +	{
> > +		.matches = {
> > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
> > +		},
> > +		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
> > +	},
> >   	{ }
> >   };
> 

