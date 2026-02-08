Return-Path: <linux-gpio+bounces-31511-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL+mLt3yh2lWgAQAu9opvQ
	(envelope-from <linux-gpio+bounces-31511-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Feb 2026 03:20:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 165AF107A31
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Feb 2026 03:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16148301545E
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Feb 2026 02:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C411E17A2E8;
	Sun,  8 Feb 2026 02:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMfl4/a5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18953009EE;
	Sun,  8 Feb 2026 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770517207; cv=none; b=E7YG8X2mpYBhhD6sVHxk3hnbHM3p3GQdEB1ZfXHV+Ea3a4RKPnQY5p72Uv7Q+v6Mv7TvDg6HWj1bf3wUfWqQoWHh3sZxoZwb3CQAj0n57R7x82/XYkBBNEveu6NbLpHgshpPeTypczIWZXk0qXT/SjKi/p1ocliB9eehI2AwyZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770517207; c=relaxed/simple;
	bh=DXnfPHWS0SoqDznXZb4pTv7mp6X9bZbcaLNr2tdznqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1ehpD7Gpc/iqGLVqzorVw7kh9LKy1LpryjgjAIMlZxgi2H7O1+M7+F4K69U2olmicSSYdy3sji90lm93x9A4mWOxTgchgprzfSpRIMi41lXFpzQIHwQ2zI74rGHr5lEbivXtmecxC7C2xOiwYaNO6BRmg3hbQYd8un+KePLpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMfl4/a5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770517207; x=1802053207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DXnfPHWS0SoqDznXZb4pTv7mp6X9bZbcaLNr2tdznqw=;
  b=gMfl4/a5TUZqLjAIxVzT09kTnSONo9mHb0jkAs94/AltmUMZ+SOhghFw
   rwoB2KdfmL0e8YgHZxY8Qky5nYHzfKSrnopuWLUPaqHio4tTd3Ctg2Pzq
   4t1syYhVc+zDSyWIXUh9HqIPOBtEM9pNYZZ1/22aPPatyZFeQo4nR6kRf
   8UkyJZGXwPrmNQrid4Wz4toMhzYX/lr6j7RKNuMBlRRf/Pn/Ejc7Y6h/n
   +BfZTb5SdeuHSyVMCbkx0sLEhuHJ0KNrsEsvGHN5fTamVYq2ahpq1q/yS
   Ejt+y4bmWsSzBTp3BHRafPx5wRbf3aXYqhY2VKo5knUXX7qexdcWa9qYl
   A==;
X-CSE-ConnectionGUID: aMfnHzvnRt+JL772jSFX6g==
X-CSE-MsgGUID: fdQqJmNhTmynuZJuPGn0oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="94322278"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="94322278"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 18:20:06 -0800
X-CSE-ConnectionGUID: 2ZUGKOx+Soq58pug647SPw==
X-CSE-MsgGUID: rJOWAXWmS76q6MaTicNHTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="215752594"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2026 18:20:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vouP2-00000000m0q-2GxQ;
	Sun, 08 Feb 2026 02:20:00 +0000
Date: Sun, 8 Feb 2026 10:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: 434779359@qq.com, Jonathan Cameron <jic23@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	liufulin <frank.liu@faiot.com>,
	Waqar Hameed <waqar.hameed@axis.com>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tof: Add VL53L4CX TOF drivers
Message-ID: <202602081057.kWswynEJ-lkp@intel.com>
References: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_326708D02875274DF25B10B91402B3828606@qq.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31511-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,baylibre.com,analog.com,kernel.org,gmail.com,faiot.com,axis.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 165AF107A31
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.19-rc8 next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/434779359-qq-com/tof-Add-VL53L4CX-TOF-drivers/20260207-174646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/tencent_326708D02875274DF25B10B91402B3828606%40qq.com
patch subject: [PATCH] tof: Add VL53L4CX TOF drivers
config: loongarch-randconfig-r122-20260208 (https://download.01.org/0day-ci/archive/20260208/202602081057.kWswynEJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602081057.kWswynEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602081057.kWswynEJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: input_set_abs_params
   >>> referenced by vl53l4cx-i2c.c:5614 (drivers/iio/proximity/vl53l4cx-i2c.c:5614)
   >>>               drivers/iio/proximity/vl53l4cx-i2c.o:(stmvl53lx_setup) in archive vmlinux.a
   >>> referenced by vl53l4cx-i2c.c:5615 (drivers/iio/proximity/vl53l4cx-i2c.c:5615)
   >>>               drivers/iio/proximity/vl53l4cx-i2c.o:(stmvl53lx_setup) in archive vmlinux.a
   >>> referenced by vl53l4cx-i2c.c:5616 (drivers/iio/proximity/vl53l4cx-i2c.c:5616)
   >>>               drivers/iio/proximity/vl53l4cx-i2c.o:(stmvl53lx_setup) in archive vmlinux.a
   >>> referenced 16 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

