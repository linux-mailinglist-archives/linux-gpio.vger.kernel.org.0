Return-Path: <linux-gpio+bounces-37105-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBWzI1rHC2qWMQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37105-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 04:13:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB21576566
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 04:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DE7C301BCF1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FE530C17C;
	Tue, 19 May 2026 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUzdj70j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52E2BD022;
	Tue, 19 May 2026 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156796; cv=none; b=F3/+biJodMWUsHtLwXLOPVYQ7/Pb9umJCalXvl6RCksp5VjWlQmXsDZzv2UY+RaTZnsfp/FErenWoCKP6In6WRrTSkcUj7dereKmu2Y+TM0ynWGX42uio69acE31guNyVw2P9DrpRIhmwqUdmXe5H4yvlagFw97I8D8PesMN8Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156796; c=relaxed/simple;
	bh=YUmCsavKOtlk398DgQKYiDZ0NI/JX7vUuEM2/VVHOK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjO63kevRTm5220s4aLi2u3hE6dQEdPqx7W7ehONiYpkqEa5VqLy7Vj4yqkqYByXDurHvJpTVgyiWpaWMIqJb0Pky4fUGg8aCbJuYi8KtPL7GH+cT1LkinTIikliCxYDGtJKFpXgeJ8BtvKN191+i+5Piw+ceXvQ/QMV5bSr134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUzdj70j; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156795; x=1810692795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YUmCsavKOtlk398DgQKYiDZ0NI/JX7vUuEM2/VVHOK0=;
  b=UUzdj70jvhBu5goDE0aE3gLhlHCNxKAN3p8uIR2qF4vLft/1npFYv1gx
   OqDXUiYn+gEA31JNiXAmRdl9xPvC9rmvLyBqFfYKIsN4QeiOU2zVtMpJn
   b0tDAoCQQCt0X84RnbejOGOxVB8LefAYxBpd04k/9Wz4KN3dgFtWE91RB
   T1QWyD+eACpqu425jmNV7wQhNpO3Vnm48se9z3MuDW2w6Iz2XSXaAp0/1
   g5HZBznbm4u7uHqTxZ9dPr1tCcJPpLyaTVnYBKrFS5IV9URSf0cpzV1Fn
   Cs47H1mNSRaFp8icTPEd6iLFQJvkE2W3TxgvVvFbcG/BzfrAUJVo902Ph
   A==;
X-CSE-ConnectionGUID: 7qb+xokyQ5OxKPY9MqVlTw==
X-CSE-MsgGUID: iPOf2RCTTzuYNQWTQYo90Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="67553783"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="67553783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:14 -0700
X-CSE-ConnectionGUID: VH/HwBksT7mZa7qATCvodA==
X-CSE-MsgGUID: nDQMIyvaRIWtd4uEyuRzqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239684783"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2026 19:13:13 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xF-00000000015-46vW;
	Tue, 19 May 2026 02:13:09 +0000
Date: Tue, 19 May 2026 06:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
	wsa+renesas@sang-engineering.com, andi.shyti@kernel.org,
	linusw@kernel.org, brgl@kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v2] i2c: i2c-gpio: Enhance driver for buses with shared
 SCL
Message-ID: <202605190501.z5y2mZnV-lkp@intel.com>
References: <20260518161013.900504-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518161013.900504-1-markus.stockhausen@gmx.de>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmx.de];
	TAGGED_FROM(0.00)[bounces-37105-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,sang-engineering.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: ECB21576566
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Markus-Stockhausen/dt-bindings-i2c-Add-i2c-shared-gpio/20260515-102710]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/i2c-i2c-gpio-Enhance-driver-for-buses-with-shared-SCL/20260519-005100
base:   https://github.com/intel-lab-lkp/linux Markus-Stockhausen/dt-bindings-i2c-Add-i2c-shared-gpio/20260515-102710
patch link:    https://lore.kernel.org/r/20260518161013.900504-1-markus.stockhausen%40gmx.de
patch subject: [PATCH v2] i2c: i2c-gpio: Enhance driver for buses with shared SCL
config: hexagon-randconfig-001-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190501.z5y2mZnV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190501.z5y2mZnV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190501.z5y2mZnV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-gpio.c:426:2: error: no member named 'dep_map' in 'struct rt_mutex_base'
     426 |         lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:158:33: note: expanded from macro 'lockdep_set_class'
     158 |         lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,   \
         |                                ~~~~~~  ^
>> drivers/i2c/busses/i2c-gpio.c:426:2: error: no member named 'dep_map' in 'struct rt_mutex_base'
     426 |         lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:159:18: note: expanded from macro 'lockdep_set_class'
     159 |                               (lock)->dep_map.wait_type_inner,  \
         |                               ~~~~~~  ^
>> drivers/i2c/busses/i2c-gpio.c:426:2: error: no member named 'dep_map' in 'struct rt_mutex_base'
     426 |         lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:160:18: note: expanded from macro 'lockdep_set_class'
     160 |                               (lock)->dep_map.wait_type_outer,  \
         |                               ~~~~~~  ^
>> drivers/i2c/busses/i2c-gpio.c:426:2: error: no member named 'dep_map' in 'struct rt_mutex_base'
     426 |         lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:161:18: note: expanded from macro 'lockdep_set_class'
     161 |                               (lock)->dep_map.lock_type)
         |                               ~~~~~~  ^
   4 errors generated.


vim +426 drivers/i2c/busses/i2c-gpio.c

   393	
   394	static struct i2c_gpio_scl_data *i2c_gpio_create_scl(struct fwnode_handle *fwnode)
   395	{
   396		struct fwnode_reference_args args;
   397		struct i2c_gpio_scl_data *scl;
   398		int ret;
   399	
   400		ret = fwnode_property_get_reference_args(fwnode, "scl-gpios",
   401							 "#gpio-cells", 0, 0, &args);
   402		if (ret)
   403			/* try the ancient way */
   404			ret = fwnode_property_get_reference_args(fwnode, "gpios",
   405								 "#gpio-cells", 0, 1, &args);
   406		if (ret)
   407			return ERR_PTR(ret);
   408	
   409		if (args.nargs < 1) {
   410			fwnode_handle_put(args.fwnode);
   411			return ERR_PTR(-EINVAL);
   412		}
   413	
   414		scl = kzalloc(sizeof(*scl), GFP_KERNEL);
   415		if (!scl) {
   416			fwnode_handle_put(args.fwnode);
   417			return ERR_PTR(-ENOMEM);
   418		}
   419	
   420		/* The unique identification from the SCL GPIO reference in the device tree */
   421		scl->fw_node = args.fwnode;
   422		scl->fw_pin = args.args[0];
   423		scl->fw_flags = (args.nargs >= 2) ? args.args[1] : 0;
   424	
   425		rt_mutex_init(&scl->lock);
 > 426		lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
   427		refcount_set(&scl->ref, 1);
   428	
   429		return scl;
   430	}
   431	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

