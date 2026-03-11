Return-Path: <linux-gpio+bounces-33118-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB0tJ0xPsWlCtAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33118-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:17:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61195262D14
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B24A6301C910
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE9322A1D4;
	Wed, 11 Mar 2026 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CO6WEMJs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1949E3DB654;
	Wed, 11 Mar 2026 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773227838; cv=none; b=pDC9JAdGD0vxR53Au1ND9RWflt8SMapCsnVTwrCTVZBP0Ftwiot9uzOaWQVfzgr1FzHJQPILwYHZo12l9pZUzNDVwYvzWIoUM2Seaq6eX40C7bE5Bwqn76XNIPoi2LmRUGtu4Er2hkdbuPiYV97oKxxWKkQ7SrWel0OKuiEGLTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773227838; c=relaxed/simple;
	bh=ON0iASOjUIvwRmT+yIVZHWWQLT4HAk5CV1sSLTHdaqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRNsQWyFjApjNr0G6J/++UB8IsAwZtStjHDkgb703NwJElSJbrd/rZUX5P3G6bZYKlVlrZj1RMCE0Np9zTjycjM1aj6iSGMiiSN8LWNrANSp97qYvD2HVRjO9OkAZiINiqhiU0CMCjt+qgRdz5/NyryPvi55ozEFJAct/iErssE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CO6WEMJs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773227836; x=1804763836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ON0iASOjUIvwRmT+yIVZHWWQLT4HAk5CV1sSLTHdaqg=;
  b=CO6WEMJsyaSjxWP90idv+dYyUw51NZ1jXsgPqa/7zEA5YifXGjUE9VWu
   2gjY4McWs5bo4mUIlfaEo75HXI+R+Y58plVHcG7pWoV6cTsjlORFLxFGP
   Y3R2n6gkUto6ydy/pKc7NnV6yji4jQralyMNYrn6wxqF1IJGJoBAOAi6s
   9khZPVqkkbfB7Jj/5jeq1G3z6E5g+VeFrOCXYLGPhpXgi5Em6pZmJSz+u
   jIoToeKr82YLAZOtf0DFtHf7YiwJaQyR+7fmUFFIuA4H2JtbqE3l1gZuU
   ETCr/awSLauKJY79h0qMG+rDziXTuLjlqru2Ag+k3KMomG9b5mVNCgmAl
   g==;
X-CSE-ConnectionGUID: Tx9t1JJaTYGcpn7Hu+rYzQ==
X-CSE-MsgGUID: Vo6sVtRDSwKBk8ILLQg/4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74168335"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74168335"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 04:17:15 -0700
X-CSE-ConnectionGUID: m/Qh+imgRc6xWSZgG8PzcQ==
X-CSE-MsgGUID: O7S2MoMcTaS5C6FlPs7RJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225391830"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO alaakso-DESK) ([10.245.246.81])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 04:17:09 -0700
Date: Wed, 11 Mar 2026 13:17:03 +0200
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linusw@kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org,
	dan.scally@ideasonboard.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org,
	sre@kernel.org, hao.yao@intel.com, jason.z.chen@intel.com,
	jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
	ribalda@chromium.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/5] platform: int3472: Add gpio platform data
Message-ID: <abFPL17lzDfbz9or@alaakso-DESK>
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-4-antti.laakso@linux.intel.com>
 <CAMRc=Me73BrokqUnPmWa59_rCnAM-cu+2Kpu8qxc7pbN6kN5+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me73BrokqUnPmWa59_rCnAM-cu+2Kpu8qxc7pbN6kN5+Q@mail.gmail.com>
X-Rspamd-Queue-Id: 61195262D14
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
	TAGGED_FROM(0.00)[bounces-33118-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
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

Hi Bartosz,
On Tue, Mar 10, 2026 at 06:32:31AM -0700, Bartosz Golaszewski wrote:
> On Tue, 10 Mar 2026 13:44:25 +0100, Antti Laakso
> <antti.laakso@linux.intel.com> said:
> > The tps68470 supports i2c daisy chain, which need to be configured by
> > gpio-tps68470 driver. Add daisy chain information to platform data.
> >
> > Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> > ---
> >  drivers/platform/x86/intel/int3472/tps68470.c | 2 ++
> >  drivers/platform/x86/intel/int3472/tps68470.h | 1 +
> >  include/linux/platform_data/tps68470.h        | 4 ++++
> >  3 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> > index a496075c0d2a..b02bc675cabe 100644
> > --- a/drivers/platform/x86/intel/int3472/tps68470.c
> > +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> > @@ -197,6 +197,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
> >  		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
> >  		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
> >  		cells[2].name = "tps68470-gpio";
> > +		cells[2].platform_data = (void *)board_data->tps68470_gpio_pdata;
> > +		cells[2].pdata_size = sizeof(*board_data->tps68470_gpio_pdata);
> >
> >  		for (i = 0; i < board_data->n_gpiod_lookups; i++)
> >  			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
> > diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> > index 35915e701593..c1c4290eb6d5 100644
> > --- a/drivers/platform/x86/intel/int3472/tps68470.h
> > +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> > @@ -17,6 +17,7 @@ struct tps68470_regulator_platform_data;
> >  struct int3472_tps68470_board_data {
> >  	const char *dev_name;
> >  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> > +	const struct tps68470_gpio_platform_data *tps68470_gpio_pdata;
> >  	unsigned int n_gpiod_lookups;
> >  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
> >  };
> > diff --git a/include/linux/platform_data/tps68470.h b/include/linux/platform_data/tps68470.h
> > index e605a2cab07f..7330dab7a711 100644
> > --- a/include/linux/platform_data/tps68470.h
> > +++ b/include/linux/platform_data/tps68470.h
> > @@ -27,6 +27,10 @@ struct tps68470_regulator_platform_data {
> >  	const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
> >  };
> >
> > +struct tps68470_gpio_platform_data {
> > +	const bool daisy_chain_enable;
> > +};
> > +
> >  struct tps68470_clk_consumer {
> >  	const char *consumer_dev_name;
> >  	const char *consumer_con_id;
> > --
> > 2.53.0
> >
> >
> 
> I know this is the pattern used in this driver but why not start converting
> it gradually to more modern APIs?
> 
> You could do:
> 
> static const struct property_entry tps68470_gpio_props[] = {
> 	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
> 	{ }
> };
> 
> static const struct software_node tps68470_gpio_swnode = {
> 	.properties = tps68470_gpio_props,
> };
> 
> static int skl_int3472_tps68470_probe(struct i2c_client *client)
> {
> 	...
> 	cells[2].swnode = &tps68470_gpio_swnode;
> 	...
> }
> 
> And avoid both modifying the public header as well as using ugly platform
> data. In the GPIO driver you'd just need:
> 
> 	if (device_property_present(&pdev->dev, "daisy-chain-enable"))
> 
> Bartosz

Thanks for suggestion, I'll use software node in v2.

Antti

