Return-Path: <linux-gpio+bounces-31505-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id E4v7ABZzh2nkYAQAu9opvQ
	(envelope-from <linux-gpio+bounces-31505-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 18:15:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FF9106A23
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 18:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09764301C581
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 17:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A36C2701C4;
	Sat,  7 Feb 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddvD1Lpa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB333A010;
	Sat,  7 Feb 2026 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770484497; cv=none; b=eLYMWL/5dsC8SXeLWcyB5X8MKvDAW3CWZ9ilbvF4gZh3CYihqHkuWFUtLe+aL2YvXcBWnKbDpuflHGUTchdzvS0b6hz68vfmquwAoAV7WwNJlyqEv6VPoSKlFVEOPE27bhljzw8blbXumc0qv1gcRx5U7rws2LoFGiXvAZGrjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770484497; c=relaxed/simple;
	bh=zKw/AYb0/7FzcWHNukM1Pn4RE5MTCdV2hdJg1r0SlOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHWISlK3r2u1rUwefQXQXkkD24edes1h69uLIyYucw4jc3DddvsgLL0/NwGUNZZnkvzzmVKaygeTIiDa75zNBMw/O5KuGyh4+tqt6ZXnTH16l7PrD3/CiYxmBH4kJeyb+08dyygh0u+lFb7NdXuvmYcjF8yTPHjjVUjUQlQjuao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddvD1Lpa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770484496; x=1802020496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zKw/AYb0/7FzcWHNukM1Pn4RE5MTCdV2hdJg1r0SlOQ=;
  b=ddvD1Lpa6Uzz/FHqwpIbyeNLmI3ISh3Etc2ArW8mEOUZDTi7yWh9xp+6
   Ddg1WyQojtiGq0NwwEMZEa9/qsn3IeNO48fZ52Y/Erl5SH2ADdrPf1ktZ
   w1YTo7Uw7OrD+TvKPybLxALlkW+gSHbhsn0uxdFn7OBQq4BuiOZncMYjx
   xKtwSYbvgNStRKGcZz5wzgo32CjmvD78TP7bldwMLhS/hJPAbr1dZ6FlI
   cDRQGFNLi5e54bfGYDqamgxi81SL+taUufpO0MnjkGclbXhyfCaS8NrC+
   2OyQ+CwBNamtayXW1iIw9zPArjqROwitd1kUGEauH7ysxBSGsotyeS0x8
   A==;
X-CSE-ConnectionGUID: hYIzw2JgTLWkkSTyols08A==
X-CSE-MsgGUID: EoJCpXTWRRm9Cvjfm/JmQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="70859053"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="70859053"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 09:14:55 -0800
X-CSE-ConnectionGUID: iKezQjPSTNeDZ3nMz6tNgg==
X-CSE-MsgGUID: CH8RI5QnSi29lqVxpEM0OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="211211830"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2026 09:14:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voltR-00000000lmq-1J6L;
	Sat, 07 Feb 2026 17:14:49 +0000
Date: Sun, 8 Feb 2026 01:13:53 +0800
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
Message-ID: <202602080159.l0CRmkUf-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-31505-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 43FF9106A23
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.19-rc8 next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/434779359-qq-com/tof-Add-VL53L4CX-TOF-drivers/20260207-174646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/tencent_326708D02875274DF25B10B91402B3828606%40qq.com
patch subject: [PATCH] tof: Add VL53L4CX TOF drivers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260208/202602080159.l0CRmkUf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080159.l0CRmkUf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080159.l0CRmkUf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/proximity/vl53l4cx-i2c.c: In function 'ctrl_mz_data_blocking_common':
>> drivers/iio/proximity/vl53l4cx-i2c.c:16100:13: warning: variable 'rc0' set but not used [-Wunused-but-set-variable]
   16100 |         int rc0;
         |             ^~~


vim +/rc0 +16100 drivers/iio/proximity/vl53l4cx-i2c.c

 16096	
 16097	static int ctrl_mz_data_blocking_common(struct stmvl53lx_data *data, void __user *p, bool is_additional)
 16098	{
 16099		int rc = 0;
 16100		int rc0;
 16101		struct stmvl53lx_data_with_additional __user *d = p;
 16102		pid_t pid = current->pid;
 16103	
 16104		mutex_lock(&data->work_mutex);
 16105		if (data->is_device_remove) {
 16106			rc = -ENODEV;
 16107			goto done;
 16108		}
 16109		if (!data->enable_sensor) {
 16110			rc = -ENODEV;
 16111			goto done;
 16112		}
 16113		if (!is_new_data_for_me(data, pid, &data->mz_data_reader_list))
 16114			rc = sleep_for_data(data, pid, &data->mz_data_reader_list);
 16115		if (rc) {
 16116			kill_mz_data(&data->meas.multi_range_data);
 16117			rc0 = copy_to_user(&d->data, &data->meas.multi_range_data, sizeof(VL53LX_MultiRangingData_t));
 16118			goto done;
 16119		}
 16120	
 16121		rc = copy_to_user(&d->data, &data->meas.multi_range_data, sizeof(VL53LX_MultiRangingData_t));
 16122		if (rc)
 16123			goto done;
 16124		if (is_additional) {
 16125			rc = copy_to_user(&d->additional_data, &data->meas.additional_data, sizeof(VL53LX_AdditionalData_t));
 16126			if (rc)
 16127				goto done;
 16128		}
 16129		rc = add_reader(pid, &data->mz_data_reader_list);
 16130	
 16131	done:
 16132		mutex_unlock(&data->work_mutex);
 16133	
 16134		return rc;
 16135	}
 16136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

