Return-Path: <linux-gpio+bounces-23579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE8B0C3C6
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 14:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC003189FBBB
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 12:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430671D54FE;
	Mon, 21 Jul 2025 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7cs6xuw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670D62868A6
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099340; cv=none; b=GNwto19G7+4GVbzEQyQviOrSWovFCKw6cK8JZlwKwvPQ0ZnAay9xZSlwte9z9r4ZB0pwWhR/Xc74w4UxNO5Uy2qG52YuSImcetds6kRXhkNZUqolS5kNqwC7VDChd0quAO1opjhQoYdy4YBb7U5x+NygJ55OWicvN0gvu+il48Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099340; c=relaxed/simple;
	bh=B82JVSNufpUcHv8y7EcvXvZhjOuMdlK93Oe87oDHeJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGhi/zfge8CSz01ejOz2MmvSTjP7jfZNHtCWXZBRfQwyCbFlQW47COud7Dpd27LriVjzaCo949eD5k/g4ivOBBs3/ZzubAND0utrPTw4mun3b9SQ5zBdus1NWLEOJ3RJhLmFrLRp+ngF+jYOWUTYDMVQW56QzueAfHjhre7RZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7cs6xuw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753099338; x=1784635338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B82JVSNufpUcHv8y7EcvXvZhjOuMdlK93Oe87oDHeJ0=;
  b=i7cs6xuwMa9z4GqBJ4EWCOy+65hD81OixUgccrBR6fBTHhrHKzdzD13+
   TCNIVyhUgyjggpmo61w2xwt4WkeSlr5MDdKwVEaGMfSDIYT4u9oqxcK+F
   bVO8wrOOLgrUHlYLcwHVOZ5k9WPmnkbDT9SCw9K+zPxojk+zTZ7+J9N44
   MqkQ/4e3C9frmRfnd/YhVipXmtqr/xxbSE72tv3t5POOXgq+dQQo3oYpE
   7QwdR4q00mDtHiqlp5DdxuBsNZCrZkD0p8BBrktnXqZFjBfdK667CGabj
   nuodCa7wM+xGHybp7JV2PqbiAxvZy9GkD7mn1yX09C4RqRM1lxFzJ4eph
   g==;
X-CSE-ConnectionGUID: FG1MOlO6T0O1pnEv8OtNEw==
X-CSE-MsgGUID: 7Q3O3WOsR72GrvQj3NNIDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55461181"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="55461181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:02:18 -0700
X-CSE-ConnectionGUID: 1Zj9NvkuQmu0fiVUmMjKuQ==
X-CSE-MsgGUID: Jz6FNRXrR2ac+c1yV96MGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="158927031"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jul 2025 05:02:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpDi-000GmL-0q;
	Mon, 21 Jul 2025 12:02:14 +0000
Date: Mon, 21 Jul 2025 20:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel /3] drivers/soc/fsl/qe/gpio.c:322:19: error:
 'struct gpio_chip' has no member named 'set_rv'
Message-ID: <202507211919.5Oks2bl4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
head:   ab43c98c938b0a53d7a5220d9e42e7db30961a47
commit: a905b526122df26d14f16b245cc0d5bd6a073e5f [/3] treewide: rename GPIO callbacks
config: powerpc-randconfig-001-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211919.5Oks2bl4-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211919.5Oks2bl4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211919.5Oks2bl4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/qe/gpio.c: In function 'qe_add_gpiochips':
>> drivers/soc/fsl/qe/gpio.c:322:19: error: 'struct gpio_chip' has no member named 'set_rv'
     322 |                 gc->set_rv = qe_gpio_set;
         |                   ^~
>> drivers/soc/fsl/qe/gpio.c:323:34: error: assignment to 'int (*)(struct gpio_chip *, long unsigned int *, long unsigned int *)' from incompatible pointer type 'void (*)(struct gpio_chip *, long unsigned int *, long unsigned int *)' [-Werror=incompatible-pointer-types]
     323 |                 gc->set_multiple = qe_gpio_set_multiple;
         |                                  ^
   cc1: some warnings being treated as errors


vim +322 drivers/soc/fsl/qe/gpio.c

1b9e89046c31fd3 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-12-03  295  
d14b3dd6190af7c arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-06-12  296  static int __init qe_add_gpiochips(void)
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  297  {
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  298  	struct device_node *np;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  299  
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  300  	for_each_compatible_node(np, NULL, "fsl,mpc8323-qe-pario-bank") {
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  301  		int ret;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  302  		struct qe_gpio_chip *qe_gc;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  303  		struct of_mm_gpio_chip *mm_gc;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  304  		struct gpio_chip *gc;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  305  
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  306  		qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  307  		if (!qe_gc) {
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  308  			ret = -ENOMEM;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  309  			goto err;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  310  		}
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  311  
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  312  		spin_lock_init(&qe_gc->lock);
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  313  
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  314  		mm_gc = &qe_gc->mm_gc;
a19e3da5bc5fc6c arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2010-06-08  315  		gc = &mm_gc->gc;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  316  
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  317  		mm_gc->save_regs = qe_gpio_save_regs;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  318  		gc->ngpio = QE_PIO_PINS;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  319  		gc->direction_input = qe_gpio_dir_in;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  320  		gc->direction_output = qe_gpio_dir_out;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov     2008-05-19  321  		gc->get = qe_gpio_get;
5901111498f7660 drivers/soc/fsl/qe/gpio.c         Bartosz Golaszewski 2025-06-10 @322  		gc->set_rv = qe_gpio_set;
1c0b7df5d333b0b drivers/soc/fsl/qe/gpio.c         Joakim Tjernlund    2018-06-19 @323  		gc->set_multiple = qe_gpio_set_multiple;

:::::: The code at line 322 was first introduced by commit
:::::: 5901111498f766024b4e4146a7a660618af6abf3 soc: fsl: qe: use new GPIO line value setter callbacks

:::::: TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
:::::: CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

