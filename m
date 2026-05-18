Return-Path: <linux-gpio+bounces-37089-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJu8GQ+CC2oNIwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37089-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 23:18:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E2C573BCE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 23:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15EBE303D326
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 21:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0B5388E6B;
	Mon, 18 May 2026 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aa+cmDCI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C2396D19;
	Mon, 18 May 2026 21:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779138893; cv=none; b=UmqkQxvlzoWvrGLwOb3JMXPObvaQP852YWAg6dEQvwvDyyGbyrgRqqMuk0K88xBXRbJzWlM3NawufFuRDToweC/vDiQwpzawIvzREr5xqTLtkGU+i6amaUSz7fNRLN/o7Xi22kDZvbDEbveHrrzplxUXwMQIrrus4iGIxwSuNDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779138893; c=relaxed/simple;
	bh=0NTob/lmSZJbtlL/Sfc01Q1tUC/xdilTB1xZMP6pz/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPLGYdOuxeIe5uc+TASIlYVwWmLQFpEWlSgbEg7D1fuaNCI52KHrvo4CAbTKc1oE6yIWiK4rv2PkZMJmUmTV2VUtdgtJlPSfDtyp9JmFHwEcQnPFbgxERgtbHgqE61OUH1EKQOrgyjwdmAuisfq1rw4cKBoU99AJkGeiz8ZsXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aa+cmDCI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779138892; x=1810674892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0NTob/lmSZJbtlL/Sfc01Q1tUC/xdilTB1xZMP6pz/M=;
  b=aa+cmDCIu2Y6Ed8AW+N+yn7x0lXFXAx0hkXvwxRcIIv1RJent1Zhq+WB
   JTgYjJpydZG2gu8MfeW7wjorS/n1PAL1Oy/EvH22mZ9SG6TwRraxZ6jGI
   YD5w+A/U3ZI//P8Dn0II41AnI1gWNj5LzoHVkAVbOYqsWFC6rzBrAZtjq
   APvRfD7LRYHFb7MTfj46lfTFBDFT26h2mqbd/Mx0gce0gzMEnNf1HgANU
   c8Eu/cIoqfW79++mzEgF0o186k/48me16ScAOccCqpIRVLlmhAps8lBCy
   1RldhnoLtmCYhRH/WJkRsssTIVugi2qr8J80KmgycTx+8ENk0telUq5J7
   w==;
X-CSE-ConnectionGUID: jTd32rfOT+OQsoeKo6qN4A==
X-CSE-MsgGUID: tFrTlzHlTtqRqxGahTaBsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79855891"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79855891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:14:51 -0700
X-CSE-ConnectionGUID: gOI2WDYHTZOe4tQgDM2Wug==
X-CSE-MsgGUID: 9yqvd5RKR5W2zGcF14wJAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="238565917"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 May 2026 14:14:48 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP5IU-000000003PK-04b1;
	Mon, 18 May 2026 21:14:46 +0000
Date: Tue, 19 May 2026 05:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
	wsa+renesas@sang-engineering.com, andi.shyti@kernel.org,
	linusw@kernel.org, brgl@kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v2] i2c: i2c-gpio: Enhance driver for buses with shared
 SCL
Message-ID: <202605190550.05JVXXRd-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmx.de];
	TAGGED_FROM(0.00)[bounces-37089-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,01.org:url,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: B9E2C573BCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Markus-Stockhausen/dt-bindings-i2c-Add-i2c-shared-gpio/20260515-102710]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/i2c-i2c-gpio-Enhance-driver-for-buses-with-shared-SCL/20260519-005100
base:   https://github.com/intel-lab-lkp/linux Markus-Stockhausen/dt-bindings-i2c-Add-i2c-shared-gpio/20260515-102710
patch link:    https://lore.kernel.org/r/20260518161013.900504-1-markus.stockhausen%40gmx.de
patch subject: [PATCH v2] i2c: i2c-gpio: Enhance driver for buses with shared SCL
config: sparc-randconfig-r073-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190550.05JVXXRd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190550.05JVXXRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190550.05JVXXRd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/i2c/busses/i2c-gpio.c:7:
   drivers/i2c/busses/i2c-gpio.c: In function 'i2c_gpio_create_scl':
>> include/linux/lockdep.h:158:31: error: 'struct rt_mutex_base' has no member named 'dep_map'
     lockdep_init_map_type(&(lock)->dep_map, #key, key, 0, \
                                  ^~
   drivers/i2c/busses/i2c-gpio.c:426:2: note: in expansion of macro 'lockdep_set_class'
     lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
     ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:159:16: error: 'struct rt_mutex_base' has no member named 'dep_map'
             (lock)->dep_map.wait_type_inner, \
                   ^~
   drivers/i2c/busses/i2c-gpio.c:426:2: note: in expansion of macro 'lockdep_set_class'
     lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
     ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:160:16: error: 'struct rt_mutex_base' has no member named 'dep_map'
             (lock)->dep_map.wait_type_outer, \
                   ^~
   drivers/i2c/busses/i2c-gpio.c:426:2: note: in expansion of macro 'lockdep_set_class'
     lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
     ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:161:16: error: 'struct rt_mutex_base' has no member named 'dep_map'
             (lock)->dep_map.lock_type)
                   ^~
   drivers/i2c/busses/i2c-gpio.c:426:2: note: in expansion of macro 'lockdep_set_class'
     lockdep_set_class(&scl->lock.rtmutex, &i2c_gpio_scl_lock_key);
     ^~~~~~~~~~~~~~~~~


vim +158 include/linux/lockdep.h

fbb9ce9530fd9b Ingo Molnar    2006-07-03  150  
fbb9ce9530fd9b Ingo Molnar    2006-07-03  151  /*
fbb9ce9530fd9b Ingo Molnar    2006-07-03  152   * Reinitialize a lock key - for cases where there is special locking or
fbb9ce9530fd9b Ingo Molnar    2006-07-03  153   * special initialization of locks so that the validator gets the scope
fbb9ce9530fd9b Ingo Molnar    2006-07-03  154   * of dependencies wrong: they are either too broad (they need a class-split)
fbb9ce9530fd9b Ingo Molnar    2006-07-03  155   * or they are too narrow (they suffer from a false class-split):
fbb9ce9530fd9b Ingo Molnar    2006-07-03  156   */
fbb9ce9530fd9b Ingo Molnar    2006-07-03  157  #define lockdep_set_class(lock, key)				\
eae6d58d67d973 Peter Zijlstra 2022-06-17 @158  	lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,	\
de8f5e4f2dc1f0 Peter Zijlstra 2020-03-21  159  			      (lock)->dep_map.wait_type_inner,	\
eae6d58d67d973 Peter Zijlstra 2022-06-17  160  			      (lock)->dep_map.wait_type_outer,	\
eae6d58d67d973 Peter Zijlstra 2022-06-17  161  			      (lock)->dep_map.lock_type)
de8f5e4f2dc1f0 Peter Zijlstra 2020-03-21  162  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

