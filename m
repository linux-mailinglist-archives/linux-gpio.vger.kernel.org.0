Return-Path: <linux-gpio+bounces-29868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73206CDB480
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 04:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28C233025323
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 03:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A639D283C9E;
	Wed, 24 Dec 2025 03:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPf03/Lr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA3927E054
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 03:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766548072; cv=none; b=Dijn8/x/9QFNrAIxyOb3vdPWMbwX51k4sCLSQLcx8l7VCH8YVm+3plwH8MHSCXZ4ZUep5w/hZGh2j9cT/eM/IwAOYgZ1Yu5YF6404+3TT0sqLjBbiBX0O4HPj9hxnMIvMqTP9CcVK6GMMwM1+kFjlqot98QeMbOKnBd9uzRTUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766548072; c=relaxed/simple;
	bh=Nrx8SnLjGi1tMAy5C7x9+knQXlEkEfFgw7pqhY61U1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cgzd2id1yEsxBUjMVQVTfHUDpggfbhvnZqKeS798IfWZ6xm7ukBQV3OdffuUGNaYHE6bjoTFot6EyENXrsdem1jxAmC5iFqL1fVoc7jB8tzI3cK9/7ITOaToBdXXtNQJqrqZCC1Kw37kcfrgNy0VWEo1GvNzbhk4tmFFJaZSCZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gPf03/Lr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766548070; x=1798084070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Nrx8SnLjGi1tMAy5C7x9+knQXlEkEfFgw7pqhY61U1A=;
  b=gPf03/Lr6I2xxGmPL8I+aY4XaMQmPbW1JCgEWXj50THrwbwlrVVTM/Xn
   eaRrbzrMFJMK5mIwOA2R+bqxaVRs5hHcHtH8NUAaJeJJ/7i2ii59zhhWL
   6Kb39+qmcamn/MLoq84j6H3y5uD8gc3niyPeP6OhMM+HlIDrJ+46vh+aq
   y0QmIaFTYw+g+VnEfTHAq9kPr5RgSufosyCbCLVxDiqzanY6vRtxA9gXw
   MyKNeMAMvx9IKU0muzAmN1epiqM4Flc5Wkt1CWh+2d1hIhwKCWSg7JncL
   CPqE/9Zl8U5UevnZwHiRVG7hYHTQ4Koo1xhyTXPjlDdlmPWbknsNM9peQ
   g==;
X-CSE-ConnectionGUID: xN6FUxgGTsiIkyA/MaFMeg==
X-CSE-MsgGUID: v0uzLC3SQzm0Brl0FAQlMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="55959848"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="55959848"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 19:47:50 -0800
X-CSE-ConnectionGUID: 4c4zx21aSOiwPn10uk9MFg==
X-CSE-MsgGUID: Yb0nJWM8QrS2LcCkJCGrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="223410948"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 19:47:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYFqk-0000000066O-10ma;
	Wed, 24 Dec 2025 03:47:46 +0000
Date: Wed, 24 Dec 2025 04:47:04 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UGF3ZcWC?= Narewski <pawel.narewski@nokia.com>,
	linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linusw@kernel.org,
	brgl@kernel.org,
	=?utf-8?B?UGF3ZcWC?= Narewski <pawel.narewski@nokia.com>,
	Jakub Lewalski <jakub.lewalski@nokia.com>
Subject: Re: [PATCH] gpiolib: fix race condition for gdev->srcu
Message-ID: <202512240408.wrQcvO0t-lkp@intel.com>
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
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawe-Narewski/gpiolib-fix-race-condition-for-gdev-srcu/20251223-165142
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20251223084952.1847489-1-pawel.narewski%40nokia.com
patch subject: [PATCH] gpiolib: fix race condition for gdev->srcu
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251224/202512240408.wrQcvO0t-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240408.wrQcvO0t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240408.wrQcvO0t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpiolib.c:1109:2: error: no member named 'rwsem' in 'struct raw_notifier_head'
    1109 |         BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/notifier.h:86:23: note: expanded from macro 'BLOCKING_INIT_NOTIFIER_HEAD'
      86 |                 init_rwsem(&(name)->rwsem);     \
         |                 ~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/rwsem.h:121:16: note: expanded from macro 'init_rwsem'
     121 |         __init_rwsem((sem), #sem, &__key);                      \
         |                       ^~~
   1 error generated.


vim +1109 drivers/gpio/gpiolib.c

  1044	
  1045	int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
  1046				       struct lock_class_key *lock_key,
  1047				       struct lock_class_key *request_key)
  1048	{
  1049		struct gpio_device *gdev;
  1050		unsigned int desc_index;
  1051		int base = 0;
  1052		int ret;
  1053	
  1054		/*
  1055		 * First: allocate and populate the internal stat container, and
  1056		 * set up the struct device.
  1057		 */
  1058		gdev = kzalloc(sizeof(*gdev), GFP_KERNEL);
  1059		if (!gdev)
  1060			return -ENOMEM;
  1061	
  1062		gdev->dev.type = &gpio_dev_type;
  1063		gdev->dev.bus = &gpio_bus_type;
  1064		gdev->dev.parent = gc->parent;
  1065		rcu_assign_pointer(gdev->chip, gc);
  1066	
  1067		gc->gpiodev = gdev;
  1068		gpiochip_set_data(gc, data);
  1069	
  1070		device_set_node(&gdev->dev, gpiochip_choose_fwnode(gc));
  1071	
  1072		ret = ida_alloc(&gpio_ida, GFP_KERNEL);
  1073		if (ret < 0)
  1074			goto err_free_gdev;
  1075		gdev->id = ret;
  1076	
  1077		ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
  1078		if (ret)
  1079			goto err_free_ida;
  1080	
  1081		if (gc->parent && gc->parent->driver)
  1082			gdev->owner = gc->parent->driver->owner;
  1083		else if (gc->owner)
  1084			/* TODO: remove chip->owner */
  1085			gdev->owner = gc->owner;
  1086		else
  1087			gdev->owner = THIS_MODULE;
  1088	
  1089		ret = gpiochip_get_ngpios(gc, &gdev->dev);
  1090		if (ret)
  1091			goto err_free_dev_name;
  1092	
  1093		gdev->descs = kcalloc(gc->ngpio, sizeof(*gdev->descs), GFP_KERNEL);
  1094		if (!gdev->descs) {
  1095			ret = -ENOMEM;
  1096			goto err_free_dev_name;
  1097		}
  1098	
  1099		gdev->label = kstrdup_const(gc->label ?: "unknown", GFP_KERNEL);
  1100		if (!gdev->label) {
  1101			ret = -ENOMEM;
  1102			goto err_free_descs;
  1103		}
  1104	
  1105		gdev->ngpio = gc->ngpio;
  1106		gdev->can_sleep = gc->can_sleep;
  1107	
  1108		rwlock_init(&gdev->line_state_lock);
> 1109		BLOCKING_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
  1110		BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
  1111	
  1112		ret = init_srcu_struct(&gdev->srcu);
  1113		if (ret)
  1114			goto err_free_label;
  1115	
  1116		ret = init_srcu_struct(&gdev->desc_srcu);
  1117		if (ret)
  1118			goto err_cleanup_gdev_srcu;
  1119	
  1120	
  1121		scoped_guard(mutex, &gpio_devices_lock) {
  1122			/*
  1123			 * TODO: this allocates a Linux GPIO number base in the global
  1124			 * GPIO numberspace for this chip. In the long run we want to
  1125			 * get *rid* of this numberspace and use only descriptors, but
  1126			 * it may be a pipe dream. It will not happen before we get rid
  1127			 * of the sysfs interface anyways.
  1128			 */
  1129			base = gc->base;
  1130			if (base < 0) {
  1131				base = gpiochip_find_base_unlocked(gc->ngpio);
  1132				if (base < 0) {
  1133					ret = base;
  1134					base = 0;
  1135					goto err_cleanup_desc_srcu;
  1136				}
  1137	
  1138				/*
  1139				 * TODO: it should not be necessary to reflect the
  1140				 * assigned base outside of the GPIO subsystem. Go over
  1141				 * drivers and see if anyone makes use of this, else
  1142				 * drop this and assign a poison instead.
  1143				 */
  1144				gc->base = base;
  1145			} else {
  1146				dev_warn(&gdev->dev,
  1147					 "Static allocation of GPIO base is deprecated, use dynamic allocation.\n");
  1148			}
  1149	
  1150			gdev->base = base;
  1151	
  1152			ret = gpiodev_add_to_list_unlocked(gdev);
  1153			if (ret) {
  1154				gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
  1155				goto err_cleanup_desc_srcu;
  1156			}
  1157		}
  1158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

