Return-Path: <linux-gpio+bounces-29870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE5ACDB791
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 07:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8900B3002FF3
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 06:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F8D2E1F02;
	Wed, 24 Dec 2025 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDMfhJGs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE7C2ECE97
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557314; cv=none; b=MozTHOsVldW2oF5ez/V/w28duN4FPPFM3er8YLbMBnOmkIr5rpp8Ti76D5SXeMWIljf/1FffUmK+mvyLIgeCzBrcLUSC6+Il57wVDO37oS8+m/y15d4AjC/IMiqkl+taV6htC0tY2fIJmeOsbhd1bfom5zPqR6oEXs3b/53JB5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557314; c=relaxed/simple;
	bh=Xudt5g8FIGTBbUXAJnzLSY1unIbRL6JJkSvK+T5mzK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fs3fMlMG0Axo6TPYMfNzd0Cheyhw/RPZDgoIpytI2y6vIUH/i+Qb3l+md2wNGrwGjX1GDQDHFX2MSvD64+uGTaYbFBKW9ug9lZ2I+Dr9olJuV/XnHuRkcR4NT2wD1MwdZMoNKHUuP1Owl/LvdflvHVsSUvVp/ZngGk9slQHF6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDMfhJGs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766557313; x=1798093313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Xudt5g8FIGTBbUXAJnzLSY1unIbRL6JJkSvK+T5mzK8=;
  b=fDMfhJGscg2iRpv1tI0F/zxzVRhxvhzhHxyopzPXz5R4MH+InlAK9Jmv
   lCVTBNJQncjLRgrCaK7uPic/pRLk05bmMYzv2DlRQYRNs+br91e3rkm5C
   B8vCQkBOthAUpgovydnmQefc9VAHQ4TuWmqB/bsbVVn8Fz731oBgxRYka
   LIm3O6doS6VYE9tCo3QibGyeU2WrTcRwNKcpoCGslWb3ApjrSurZvAlw1
   mDciZqe6gh7sNFvuz+mdRZ7g3EGsbuBxcqNAWv8Sq0rsus90yjXxRZ5ho
   L1uSroRqqJLo+cuK7O++otVcBlx5ZIZcnjtBBcbQs4f2geRXjUxS5xO7v
   Q==;
X-CSE-ConnectionGUID: fBTw8kLDRgiuj0yUPt5/Wg==
X-CSE-MsgGUID: 3KnUnaHFTp+q1U/lCuQHmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="70979989"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="70979989"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 22:21:52 -0800
X-CSE-ConnectionGUID: dk/WT2ucRnugpsZTXi88QA==
X-CSE-MsgGUID: ehi4pQ2lQvGs0AhwwQekiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="200250078"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Dec 2025 22:21:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYIFn-0000000068i-3AeB;
	Wed, 24 Dec 2025 06:21:47 +0000
Date: Wed, 24 Dec 2025 07:21:01 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UGF3ZcWC?= Narewski <pawel.narewski@nokia.com>,
	linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linusw@kernel.org, brgl@kernel.org,
	=?utf-8?B?UGF3ZcWC?= Narewski <pawel.narewski@nokia.com>,
	Jakub Lewalski <jakub.lewalski@nokia.com>
Subject: Re: [PATCH] gpiolib: fix race condition for gdev->srcu
Message-ID: <202512240750.LQnDrYIF-lkp@intel.com>
References: <20251223084952.1847489-1-pawel.narewski@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223084952.1847489-1-pawel.narewski@nokia.com>

Hi Paweł,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on next-20251219]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawe-Narewski/gpiolib-fix-race-condition-for-gdev-srcu/20251223-165142
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20251223084952.1847489-1-pawel.narewski%40nokia.com
patch subject: [PATCH] gpiolib: fix race condition for gdev->srcu
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251224/202512240750.LQnDrYIF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240750.LQnDrYIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240750.LQnDrYIF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:13,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from drivers/gpio/gpiolib.c:3:
   drivers/gpio/gpiolib.c: In function 'gpiochip_add_data_with_key':
>> include/linux/notifier.h:86:35: error: 'struct raw_notifier_head' has no member named 'rwsem'
      86 |                 init_rwsem(&(name)->rwsem);     \
         |                                   ^~
   include/linux/rwsem.h:121:23: note: in definition of macro 'init_rwsem'
     121 |         __init_rwsem((sem), #sem, &__key);                      \
         |                       ^~~
   drivers/gpio/gpiolib.c:1109:9: note: in expansion of macro 'BLOCKING_INIT_NOTIFIER_HEAD'
    1109 |         BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +86 include/linux/notifier.h

eabc069401bcf4 Alan Stern 2006-10-04  80  
e041c683412d5b Alan Stern 2006-03-27  81  #define ATOMIC_INIT_NOTIFIER_HEAD(name) do {	\
e041c683412d5b Alan Stern 2006-03-27  82  		spin_lock_init(&(name)->lock);	\
e041c683412d5b Alan Stern 2006-03-27  83  		(name)->head = NULL;		\
e041c683412d5b Alan Stern 2006-03-27  84  	} while (0)
e041c683412d5b Alan Stern 2006-03-27  85  #define BLOCKING_INIT_NOTIFIER_HEAD(name) do {	\
e041c683412d5b Alan Stern 2006-03-27 @86  		init_rwsem(&(name)->rwsem);	\
e041c683412d5b Alan Stern 2006-03-27  87  		(name)->head = NULL;		\
e041c683412d5b Alan Stern 2006-03-27  88  	} while (0)
e041c683412d5b Alan Stern 2006-03-27  89  #define RAW_INIT_NOTIFIER_HEAD(name) do {	\
e041c683412d5b Alan Stern 2006-03-27  90  		(name)->head = NULL;		\
e041c683412d5b Alan Stern 2006-03-27  91  	} while (0)
e041c683412d5b Alan Stern 2006-03-27  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

