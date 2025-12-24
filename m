Return-Path: <linux-gpio+bounces-29876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4081CDC301
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 13:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3BC230078B8
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 12:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B563164A5;
	Wed, 24 Dec 2025 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0I56F65"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94082DAFCB
	for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2025 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578855; cv=none; b=SLPkiOD19HqbmdIzZAK4N253F4WGYOLXV9KKdjcjdtIE7Bw+8bYBEa2ekH/5pSkulz1NmLfm7RxgBlWrpA9DSRl62nE9SvIqkDgB+jsVT6rGd3W3ILOAIOMzRjeSyc6d57xmTEiRnndFzzf9ex3nF9vFCrjteJP7s9+RPrEqbSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578855; c=relaxed/simple;
	bh=jDDzoEMDWKJjxdGROLKVvjf7g0T6U4unJ1T7ysSscaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nl8/g1VQg/vBlQR1SECNhvA1ffulNHJOHegzV0JKg1zQb1tdEVI0g26azkFmfCUYgLxZWJVw8YKh6g6pCgqTIKJEP6lgYplfCTWykvgQxyRp3Xlen3wnphPbJx0IU8n1l696E+5tvPuMAv0NfncQ/rKz0TlaPKDratIeDgVv/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0I56F65; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766578854; x=1798114854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jDDzoEMDWKJjxdGROLKVvjf7g0T6U4unJ1T7ysSscaQ=;
  b=H0I56F653Ef0Li3/MnFZ46Qx4Ppb7eOrN6kyfaNSCuJeslV9QC1e8n4E
   /ivHTQHW3tDNKOWsUd3puM3nUki9tEfGdBpitpc8FsnoYQ+fdo0RUb0Eo
   UpEQylTAd4EPjlP0FYI+go19xB6QRmWFbI8hqTbg/iSp370lDwDJcusr2
   Bu69wMKt+ovwxsnw1nFGZteDxiLP9VwOK686Twit5tsr7RUna0OmbqlBf
   LZBuDloXlhXuzw/8Ascf0Ji2fdXpOG2562UwAAyBP6xW0GIhqXcjzTxqB
   qfSBQUTNlc9selSBugYekNSDrFwoun9xH4Jj2RkFwrRKJh5CWmGiofAxP
   Q==;
X-CSE-ConnectionGUID: KIBGDFOQSCWxiA4ZURb9tg==
X-CSE-MsgGUID: 1TxZONgySE+xvLDhkl4Ptg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68354717"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68354717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 04:20:53 -0800
X-CSE-ConnectionGUID: LR/k6W1OQIWtevoLKMkHCA==
X-CSE-MsgGUID: G2+gnj9MTfSPMLd72OaynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="199759525"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Dec 2025 04:20:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYNrF-0000000032L-12pY;
	Wed, 24 Dec 2025 12:20:49 +0000
Date: Wed, 24 Dec 2025 20:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UGF3ZcWC?= Narewski <pawel.narewski@nokia.com>,
	linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linusw@kernel.org,
	brgl@kernel.org,
	=?utf-8?B?UGF3ZcWC?= Narewski <pawel.narewski@nokia.com>,
	Jakub Lewalski <jakub.lewalski@nokia.com>
Subject: Re: [PATCH] gpiolib: fix race condition for gdev->srcu
Message-ID: <202512250122.ibtipV8L-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251225/202512250122.ibtipV8L-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250122.ibtipV8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250122.ibtipV8L-lkp@intel.com/

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

