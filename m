Return-Path: <linux-gpio+bounces-39142-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8J2pBgODQmp08wkAu9opvQ
	(envelope-from <linux-gpio+bounces-39142-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:36:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 131766DC205
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 16:36:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Ehpyt39K;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39142-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39142-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DDE163007B07
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 14:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4093368957;
	Mon, 29 Jun 2026 14:23:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E432BF41;
	Mon, 29 Jun 2026 14:23:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743007; cv=none; b=cTHobmEMiecJjGCsP8otwcpjDltOd5wtLVGj/lKBHtuQVQodnEIXpwJ0/KKRHdeco2Re/vfurGYwkmPX0tvJI08AI0vEgMHKtQZ7JSJjV8sTby4oH3FQcMTtsKEXkHQoCKxQ3sVVEN/loFvhlyaj+XfjopmYLrcglHQjyghTLj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743007; c=relaxed/simple;
	bh=+k6KMOdRQAZW1KVW/3phOMtRHvMyYn2umElAQ7z9yts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE4xtkYqW5iNDVuF6Su3hRsqIv2mIy3qAQ/q6IeVdfxEyRb+kLbedLOrUtx5rUqIiXRrbNsAbMM1jIlWRn8fT9rXCzTJYZ9eYWM7SVq8Yzm+9z+z1/C5+wqNtNe+qUo7ifVOyuqniMVw/50pd2BcB0zOK9vfVEYBm60BI4I+VXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ehpyt39K; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782743006; x=1814279006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+k6KMOdRQAZW1KVW/3phOMtRHvMyYn2umElAQ7z9yts=;
  b=Ehpyt39KZ6Z871UHgajwJPSGqBF2X8AS+5mxyyAL+gAzDLVbLH0J1qxl
   TQDjw1XLRkvJWdFB+itAfPoxTx3eDgVZZr7+lSCRrjd0S+R7lSTkdWNZe
   LO902JIlf8Fv383/omn1/1mPw6JNapXRd7HOf7GI0t+LlH8c4ceEM3Bap
   itMZBQv+LHQ8/UQesGWt0Uukp+XirPFJPHEglbSuVFc/AgVRFuMRtVSpl
   39bNDsCzJIPo0MVBOiOZEo7NrEV34GymvjvkkEcYUwYX4I8WU3Ic31uEV
   2jFnvJv/mSWEZtwthpfNAPg/JRikNztOqkW1KVYddNsL7wvzZLQ5V3hBT
   A==;
X-CSE-ConnectionGUID: u0dQC7ANQ2OBI5hGsJ/9FA==
X-CSE-MsgGUID: 8r4YsFPuQgS3weeu+l0ylA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83572992"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83572992"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:23:19 -0700
X-CSE-ConnectionGUID: hs5A42O6SdGQlkTPVBCpUA==
X-CSE-MsgGUID: Yp99o0vcQMyvDm7Gsb6Ifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="256890686"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jun 2026 07:23:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weCtB-000000007SP-1muN;
	Mon, 29 Jun 2026 14:23:10 +0000
Date: Mon, 29 Jun 2026 22:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: swnode: remove deprecated lookup mechanism
Message-ID: <202606292234.A3QghcWA-lkp@intel.com>
References: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39142-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:dmitry.torokhov@gmail.com,m:andy@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 131766DC205

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dc59e4fea9d83f03bad6bddf3fa2e52491777482]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-swnode-remove-deprecated-lookup-mechanism/20260629-185811
base:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
patch link:    https://lore.kernel.org/r/20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883%40oss.qualcomm.com
patch subject: [PATCH] gpio: swnode: remove deprecated lookup mechanism
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260629/202606292234.A3QghcWA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606292234.A3QghcWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606292234.A3QghcWA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpiolib-swnode.c: In function 'swnode_get_gpio_device':
>> drivers/gpio/gpiolib-swnode.c:29:29: warning: unused variable 'gdev' [-Wunused-variable]
      29 |         struct gpio_device *gdev;
         |                             ^~~~


vim +/gdev +29 drivers/gpio/gpiolib-swnode.c

e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  25  
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  26  static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  27  {
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  28  	const struct software_node *gdev_node;
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27 @29  	struct gpio_device *gdev;
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  30  
b7b56e64a345e7 Bartosz Golaszewski 2023-09-27  31  	gdev_node = to_software_node(fwnode);
6774a66d0e103d Bartosz Golaszewski 2025-12-15  32  	if (!gdev_node)
216c1204757190 Bartosz Golaszewski 2025-11-20  33  		goto fwnode_lookup;
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  34  
9d50f95bc0d5df Charles Keepax      2024-04-16  35  	/*
9d50f95bc0d5df Charles Keepax      2024-04-16  36  	 * Check for a special node that identifies undefined GPIOs, this is
9d50f95bc0d5df Charles Keepax      2024-04-16  37  	 * primarily used as a key for internal chip selects in SPI bindings.
9d50f95bc0d5df Charles Keepax      2024-04-16  38  	 */
9d50f95bc0d5df Charles Keepax      2024-04-16  39  	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
6774a66d0e103d Bartosz Golaszewski 2025-12-15  40  	    gdev_node == &swnode_gpio_undefined)
9d50f95bc0d5df Charles Keepax      2024-04-16  41  		return ERR_PTR(-ENOENT);
9d50f95bc0d5df Charles Keepax      2024-04-16  42  
216c1204757190 Bartosz Golaszewski 2025-11-20  43  fwnode_lookup:
ff373b244a4cbb Bartosz Golaszewski 2026-06-29  44  	return gpio_device_find_by_fwnode(fwnode) ?: ERR_PTR(-EPROBE_DEFER);
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  45  }
e7f9ff5dc90c38 Dmitry Torokhov     2022-11-11  46  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

