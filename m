Return-Path: <linux-gpio+bounces-33006-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNWZEDIrsGlHgwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33006-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:31:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579025201E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BAEB35BBC55
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80595397E67;
	Tue, 10 Mar 2026 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRtzAfJ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564523B632;
	Tue, 10 Mar 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148612; cv=none; b=T0troXpyOVQw98oS9PUgbhVVhgPBax21sneBvdKw/7lVzVW1q1bJR9Cu772qAvYoYfszjvPGMaYsOmGapPBnaN9t/8i49h8IkObLR7APU8fbren6XPJ/ldAQ9NGsF3/9PybIWlc9d6iV1DzP+9UmorRlYILawfeb+ExMkj0W9T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148612; c=relaxed/simple;
	bh=cCmQdY4UierAE+qEcpR1PCyef/t4/x4hQ6yLMcOL3o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2osd338tHjfehJkJIPu3bxhApVvrgIG1krGcfNosyxMu7ZGMCdEr0UkICfw51k4KFWpRm8rUmBx3LlJOsIr6fhY69w+2eS76g+EeCcd7/n5xlgyNz45ncxWqg92gxoChQBYXSd8oBtpVA06nmiFd6PhKJkL37OaLsNRdY0D6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRtzAfJ8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773148611; x=1804684611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cCmQdY4UierAE+qEcpR1PCyef/t4/x4hQ6yLMcOL3o8=;
  b=KRtzAfJ8C6BBmQhidKcwZTMCy5UfN7YPNNPS901sR55JTGWJOrHFn2fN
   UU9rvXtk9alvKjKPDaM9sRLKYlczIFOIaVUGnA1YcOTHQKNBOROL+SujE
   ei+/bXtLvLqLxxsMY4HbDg5uByv+dKfrpdIS8s9MPiNZVnzDROoIoiSmm
   /P0fH/NfXuUmo1iRDpBa5PldnIPAPzGGBOUagZqWB0z/ceao6wfMjKnP3
   XSuK/Y8GkJkkdEMOiXa8JKEM3W+c8IJONpwrbnCRQU07P+6SsceArenuW
   iGzcxUUDzl/W7bbvAorJymBGMRxEjnUufKYfE8LLFkG3ubJqRuAuHsi6h
   g==;
X-CSE-ConnectionGUID: A89oGl6ERB+3GoLkx8ScwA==
X-CSE-MsgGUID: F1d8pObjTcWrdfGed4MMsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74112075"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74112075"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:16:50 -0700
X-CSE-ConnectionGUID: 9UtF/sf0RHC46DKpmgGKCw==
X-CSE-MsgGUID: 802VRIaGTLqCOewS144ZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="215488380"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 06:16:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AA131121D13;
	Tue, 10 Mar 2026 15:17:17 +0200 (EET)
Date: Tue, 10 Mar 2026 15:17:17 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linusw@kernel.org,
	brgl@kernel.org, mchehab@kernel.org, dan.scally@ideasonboard.com,
	ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org,
	sre@kernel.org, hao.yao@intel.com, jason.z.chen@intel.com,
	jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
	ribalda@chromium.org
Subject: Re: [PATCH 5/5] platform: int3472: Add MSI prestige board data
Message-ID: <abAZ3ZJk3jpoKG8m@kekkonen.localdomain>
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-6-antti.laakso@linux.intel.com>
 <8a197d9b-bec1-4c8f-be53-ee35c8bbb2dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a197d9b-bec1-4c8f-be53-ee35c8bbb2dc@kernel.org>
X-Rspamd-Queue-Id: 3579025201E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33006-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,qualcomm.com:email,msi.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Hans,

On Tue, Mar 10, 2026 at 02:09:54PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 10-Mar-26 13:44, Antti Laakso wrote:
> > Define regulators and gpios for MSI Prestige 14 AI EVO+ laptop.
> > 
> > Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> > ---
> >  .../x86/intel/int3472/tps68470_board_data.c   | 97 +++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > index 71357a036292..fe7c23e72d66 100644
> > --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> > @@ -232,6 +232,73 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
> >  	},
> >  };
> >  
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
> >  static struct gpiod_lookup_table surface_go_int347a_gpios = {
> >  	.dev_id = "i2c-INT347A:00",
> >  	.table = {
> > @@ -258,6 +325,19 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
> >  	}
> >  };
> >  
> > +static struct gpiod_lookup_table msi_p14_ai_evo_ovti5675_gpios = {
> > +	.dev_id = "i2c-OVTI5675:00",
> > +	.table = {
> > +		GPIO_LOOKUP_IDX("tps68470-gpio", 9, "reset", 0, GPIO_ACTIVE_LOW),
> > +		GPIO_LOOKUP_IDX("tps68470-gpio", 7, "reset", 1, GPIO_ACTIVE_LOW),
> > +		{ }
> > +	}
> > +};
> > +
> > +static const struct tps68470_gpio_platform_data msi_p14_ai_evo_tps68470_gpio_pdata = {
> > +	.daisy_chain_enable = true,
> > +};
> > +
> >  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
> >  	.dev_name = "i2c-INT3472:05",
> >  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> > @@ -287,6 +367,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
> >  	},
> >  };
> >  
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
> >  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
> >  	{
> >  		.matches = {
> > @@ -316,6 +406,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
> >  		},
> >  		.driver_data = (void *)&dell_7212_tps68470_board_data,
> >  	},
> > +	{
> > +		.matches = {
> > +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> > +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
> 
> I think this match might be a bit to specific, e.g. there also is a C1M model where
> this might also apply? See:
> 
> https://www.msi.com/Business-Productivity/Prestige-14-AI-Evo-C1MX
> 
> or maybe these are really different ?
> 
> If you can look into that somehow that would be great. If you cannot find
> out if other models are compatible we should probably play it safe and
> keep the specific match you've above for now.

This one is MTL whereas Antti's patch adds support for an LNL laptop. It'd
be great if we could get a confirmation from MSI the PMIC configuration in
these models would match Presige 14 AI+ (or that it's different). There's
also a very similar model with a 13" display... Without a confirmation I
wouldn't relax the DMI check.

That being said, the risk of smoke being released might be small on a wrong
regulator (or GPIO) configuration but it can't be ruled out.

> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

-- 
Regards,

Sakari Ailus

