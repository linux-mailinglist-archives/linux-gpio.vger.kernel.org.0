Return-Path: <linux-gpio+bounces-4078-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B865586F289
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 22:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5A381C203E3
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 21:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E99441206;
	Sat,  2 Mar 2024 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHquGWEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E902921100
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709414705; cv=none; b=GCj16FxmhlKwmxUHdmuJUp9WiQbTfxnHw6bFj/zWHsi+9RcVMfKrGVzHsZ6skFmqw6oqa9e/eTDCN2KYYOGDz9XLF347zjK7JfGzx0AquLiIDE/SwAJl4o8TC8Ux5Tb1AbGnwzeO9jd8rRoGFG1iGBoP+p9jH0siiED7ElEt97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709414705; c=relaxed/simple;
	bh=agLTBXHfGlzSA3hAdNa5fykAq1cbboqEnYI9oMMDl1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UBDk8FfF2C2bNQzRrwwJCAEZCyYlLNGtFuoSLhV0WVMXAFS0a4NPD0DMl//NopL1TfYpCMS3v3D3c2HwyP81KZJzTTKZvpYIIYzPkyt7AedT8fK3w9jKoU4lRzKuG3Aot0ceQeu8C7GCONAIEO9unzPija1jIORQDm0vQOFpZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHquGWEr; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709414702; x=1740950702;
  h=date:from:to:cc:subject:message-id;
  bh=agLTBXHfGlzSA3hAdNa5fykAq1cbboqEnYI9oMMDl1M=;
  b=MHquGWErFSvkojC1iIiM0Aal6H4JAov0oxR8UCphO9UTCiSqxQioCepW
   yWEvW3iEqqVi8jFJWxnKfy4TP0Ye+FepU1UhF4IOuZTtXmxHtQAEYEFi9
   +USDpiw9U42Tmp5UME1lnWSYUn5H9FTwF0gpi2XoxLRE8P6QaXC1xY4/k
   zH8iA+m4PDV8nUTQBfR6Q56XHkMbkf4LFpAcNXga3hg+tvUy4WBgq74tD
   c5S+cRm+TEUvrVSmj6WKFE/BNYIyZl2ZYbhyuu04LhjAWzIb2jR/KiR4A
   A8A/yachb6b6ZLnO/rhnE3YgleVy8uOcr2Z7GUU81mgq8UfdGeeymzlof
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="7752176"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="7752176"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 13:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8505544"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Mar 2024 13:25:00 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgWqn-0000JG-18;
	Sat, 02 Mar 2024 21:24:57 +0000
Date: Sun, 03 Mar 2024 05:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:ib-nomadik-gpio] BUILD REGRESSION
 528904342169c582c128c4f83fbc4a7c9611fb0a
Message-ID: <202403030526.JJgIofT3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
branch HEAD: 528904342169c582c128c4f83fbc4a7c9611fb0a  gpio: nomadik: Finish conversion to use firmware node APIs

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202403022253.zPyD6rUu-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202403030335.VHvC2QUS-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/pinctrl/nomadik/pinctrl-nomadik.c:1193:22: error: incompatible pointer types initializing 'struct device_node *' with an expression of type 'struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1222:39: error: incompatible pointer types passing 'struct device_node *' to parameter of type 'const struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1222:53: error: passing argument 1 of 'fwnode_find_reference' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1236:14: error: incompatible pointer types assigning to 'struct device_node *' from 'struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1236:21: error: assignment to 'struct device_node *' from incompatible pointer type 'struct fwnode_handle *' [-Werror=incompatible-pointer-types]
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1238:34: error: incompatible pointer types passing 'struct device_node *' to parameter of type 'struct fwnode_handle *' [-Werror,-Wincompatible-pointer-types]
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1238:48: error: passing argument 1 of 'fwnode_iomap' from incompatible pointer type [-Werror=incompatible-pointer-types]
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1239:35: error: passing argument 1 of 'fwnode_handle_put' from incompatible pointer type [-Werror=incompatible-pointer-types]
include/linux/property.h:39:9: error: initialization of 'struct device_node *' from incompatible pointer type 'struct fwnode_handle *' [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- arc-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- arc-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- arm-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- arm-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- arm-randconfig-001-20240303
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- arm-randconfig-003-20240302
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- csky-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- i386-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- i386-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- loongarch-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- loongarch-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- loongarch-randconfig-r111-20240303
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- m68k-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- m68k-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- microblaze-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- microblaze-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- mips-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- mips-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- nios2-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- nios2-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- openrisc-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- openrisc-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- parisc-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- parisc-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- powerpc-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- s390-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- sh-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- sh-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- sparc-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- sparc-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- sparc64-allmodconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- sparc64-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- um-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|-- um-randconfig-r122-20240303
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
|   `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
`-- xtensa-allyesconfig
    |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:assignment-to-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
    |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_find_reference-from-incompatible-pointer-type
    |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_handle_put-from-incompatible-pointer-type
    |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:passing-argument-of-fwnode_iomap-from-incompatible-pointer-type
    `-- include-linux-property.h:error:initialization-of-struct-device_node-from-incompatible-pointer-type-struct-fwnode_handle
clang_recent_errors
|-- arm-defconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-assigning-to-struct-device_node-from-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-initializing-struct-device_node-with-an-expression-of-type-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-passing-struct-device_node-to-parameter-of-type-const-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   `-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-passing-struct-device_node-to-parameter-of-type-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|-- arm64-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-assigning-to-struct-device_node-from-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-initializing-struct-device_node-with-an-expression-of-type-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-passing-struct-device_node-to-parameter-of-type-const-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   `-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-passing-struct-device_node-to-parameter-of-type-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|-- riscv-allyesconfig
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-assigning-to-struct-device_node-from-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-initializing-struct-device_node-with-an-expression-of-type-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-passing-struct-device_node-to-parameter-of-type-const-struct-fwnode_handle-Werror-Wincompatible-pointer-types
|   `-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-passing-struct-device_node-to-parameter-of-type-struct-fwnode_handle-Werror-Wincompatible-pointer-types
`-- x86_64-allyesconfig
    |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-assigning-to-struct-device_node-from-struct-fwnode_handle-Werror-Wincompatible-pointer-types
    |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-initializing-struct-device_node-with-an-expression-of-type-struct-fwnode_handle-Werror-Wincompatible-pointer-types
    |-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-passing-struct-device_node-to-parameter-of-type-const-struct-fwnode_handle-Werror-Wincompatible-pointer-types
    `-- drivers-pinctrl-nomadik-pinctrl-nomadik.c:error:incompatible-pointer-types-passing-struct-device_node-to-parameter-of-type-struct-fwnode_handle-Werror-Wincompatible-pointer-types

elapsed time: 726m

configs tested: 181
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240302   gcc  
arc                   randconfig-002-20240302   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240302   gcc  
arm                   randconfig-002-20240302   gcc  
arm                   randconfig-003-20240302   gcc  
arm                   randconfig-004-20240302   clang
arm                           sama5_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240302   gcc  
arm64                 randconfig-002-20240302   gcc  
arm64                 randconfig-003-20240302   clang
arm64                 randconfig-004-20240302   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240302   gcc  
csky                  randconfig-002-20240302   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240302   clang
hexagon               randconfig-002-20240302   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240302   clang
i386         buildonly-randconfig-002-20240302   gcc  
i386         buildonly-randconfig-003-20240302   gcc  
i386         buildonly-randconfig-004-20240302   clang
i386         buildonly-randconfig-005-20240302   gcc  
i386         buildonly-randconfig-006-20240302   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240302   clang
i386                  randconfig-002-20240302   gcc  
i386                  randconfig-003-20240302   clang
i386                  randconfig-004-20240302   gcc  
i386                  randconfig-005-20240302   gcc  
i386                  randconfig-006-20240302   clang
i386                  randconfig-011-20240302   gcc  
i386                  randconfig-012-20240302   gcc  
i386                  randconfig-013-20240302   gcc  
i386                  randconfig-014-20240302   gcc  
i386                  randconfig-015-20240302   clang
i386                  randconfig-016-20240302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240302   gcc  
loongarch             randconfig-002-20240302   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                           ip28_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240302   gcc  
nios2                 randconfig-002-20240302   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240302   gcc  
parisc                randconfig-002-20240302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc               randconfig-001-20240302   clang
powerpc               randconfig-002-20240302   clang
powerpc               randconfig-003-20240302   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240302   clang
powerpc64             randconfig-002-20240302   gcc  
powerpc64             randconfig-003-20240302   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240302   gcc  
riscv                 randconfig-002-20240302   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240302   gcc  
s390                  randconfig-002-20240302   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240302   gcc  
sh                    randconfig-002-20240302   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240302   gcc  
sparc64               randconfig-002-20240302   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240302   gcc  
um                    randconfig-002-20240302   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240302   clang
x86_64       buildonly-randconfig-002-20240302   clang
x86_64       buildonly-randconfig-003-20240302   gcc  
x86_64       buildonly-randconfig-004-20240302   gcc  
x86_64       buildonly-randconfig-005-20240302   gcc  
x86_64       buildonly-randconfig-006-20240302   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240302   clang
x86_64                randconfig-002-20240302   gcc  
x86_64                randconfig-003-20240302   gcc  
x86_64                randconfig-004-20240302   clang
x86_64                randconfig-005-20240302   gcc  
x86_64                randconfig-006-20240302   clang
x86_64                randconfig-011-20240302   clang
x86_64                randconfig-012-20240302   clang
x86_64                randconfig-013-20240302   gcc  
x86_64                randconfig-014-20240302   gcc  
x86_64                randconfig-015-20240302   clang
x86_64                randconfig-016-20240302   gcc  
x86_64                randconfig-071-20240302   clang
x86_64                randconfig-072-20240302   clang
x86_64                randconfig-073-20240302   clang
x86_64                randconfig-074-20240302   gcc  
x86_64                randconfig-075-20240302   clang
x86_64                randconfig-076-20240302   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240302   gcc  
xtensa                randconfig-002-20240302   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

