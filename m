Return-Path: <linux-gpio+bounces-2769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1568384347D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 04:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786F61F26A08
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 03:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663C51079B;
	Wed, 31 Jan 2024 03:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIwfn7SF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCDAE574
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706672063; cv=none; b=iPwZsZC981Ti1l/j1zbrj3zYzTYIT2baO/YRu5UIkshccfKoetWul6mIMHk8XzCX6Z+dzwxCq5VywX2YspjU8VTyIvmjT0MS3hsPvq64tczqf8XBV+dSPaqnOMkxlKRCdeqn2z78lxIRNGPOdOUTmbf47jATqZf08cFg0TPqN3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706672063; c=relaxed/simple;
	bh=1pA0z4l0FWR03cS6VVl9urQIgKBvymvog5MGp4cKWC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UG4hxTuXyubOkTS4zIC/T5qPcEe4AGGMj/+XVMyiNV1rsWzVnveMDwEJk1v+ziYR7hd3B04MOjKJXFQLTlZK50Vr6cjRlDnhd+Mvtamw7PO6u467XbMyJ14t3gxMPao90ntYygA57QKQHByXOM0szHlu6spp+J1B2KGvFbWk5rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIwfn7SF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706672060; x=1738208060;
  h=date:from:to:cc:subject:message-id;
  bh=1pA0z4l0FWR03cS6VVl9urQIgKBvymvog5MGp4cKWC0=;
  b=jIwfn7SFkiens3dI+5TEd8lAN/T/Mnswewq6bRg48IOLMGqM1RCD9THT
   PoSC71hP6syquSDfOTlssQ6xcipT82jncieCd8xPCFHDMTtMUrH0grpYp
   utXPT9uYbDl9d6C7T0FSrhdq4CF17hPqGkw4WUCkf0SaPSmr5dADEQC3R
   2OqDLmBWWawR/wWKzfjR/OFiGlGAcWoNs6NkiRNHRtqrszYqYYIlw3a9N
   R/HGaGHOnbU7HYCxNYrY5nyvmOhpntWRbvI5cDpHdgieLz9tbyZqsPDGy
   ylRiBOpiZpeMohT2xUYetYOX8MT9fLTjPbjGIUy8bE42nWvTzHUku99qD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17005544"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="17005544"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 19:32:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119482083"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="1119482083"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2024 19:32:51 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV1Ki-000168-2I;
	Wed, 31 Jan 2024 03:32:30 +0000
Date: Wed, 31 Jan 2024 11:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-gpio:b4/descriptors-wireless] BUILD REGRESSION
 99b6016595e9254167434ef82f4c2ed88d986452
Message-ID: <202401311116.LxdSD0ku-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-wireless
branch HEAD: 99b6016595e9254167434ef82f4c2ed88d986452  wifi: cw1200: Convert to GPIO descriptors

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202401310616.wpvZVBlf-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202401310721.pDBU6qLV-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath9k/hw.c:2731:2: error: must use 'struct' tag to refer to type 'gpio_desc'
drivers/net/wireless/ath/ath9k/hw.c:2731:9: error: unknown type name 'gpio_desc'; use 'struct' keyword to refer to the type
drivers/net/wireless/ath/ath9k/hw.c:2734:10: error: no member named 'gpiods' in 'struct ath_hw'
drivers/net/wireless/ath/ath9k/hw.c:2734:15: error: 'struct ath_hw' has no member named 'gpiods'
drivers/net/wireless/ath/ath9k/hw.c:2738:15: error: assignment to 'int *' from incompatible pointer type 'struct gpio_desc *' [-Werror=incompatible-pointer-types]
drivers/net/wireless/ath/ath9k/hw.c:2747:33: error: passing argument 1 of 'gpiod_set_consumer_name' from incompatible pointer type [-Werror=incompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- arc-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- arm-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- arm-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- csky-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- loongarch-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- loongarch-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- loongarch-defconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- m68k-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- m68k-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- microblaze-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- microblaze-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- mips-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- nios2-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- nios2-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- openrisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- parisc-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- parisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- sh-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- sh-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- sparc-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
|-- sparc64-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
`-- sparc64-allyesconfig
    |-- drivers-net-wireless-ath-ath9k-hw.c:error:assignment-to-int-from-incompatible-pointer-type-struct-gpio_desc
    |-- drivers-net-wireless-ath-ath9k-hw.c:error:passing-argument-of-gpiod_set_consumer_name-from-incompatible-pointer-type
    |-- drivers-net-wireless-ath-ath9k-hw.c:error:struct-ath_hw-has-no-member-named-gpiods
    `-- drivers-net-wireless-ath-ath9k-hw.c:error:unknown-type-name-gpio_desc-use-struct-keyword-to-refer-to-the-type
clang_recent_errors
|-- arm64-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
|-- arm64-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
|-- hexagon-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
|-- hexagon-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
|-- i386-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
|-- i386-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
|-- powerpc-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
|-- powerpc-allyesconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
|-- x86_64-allmodconfig
|   |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
|   `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw
`-- x86_64-allyesconfig
    |-- drivers-net-wireless-ath-ath9k-hw.c:error:must-use-struct-tag-to-refer-to-type-gpio_desc
    `-- drivers-net-wireless-ath-ath9k-hw.c:error:no-member-named-gpiods-in-struct-ath_hw

elapsed time: 736m

configs tested: 179
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240131   gcc  
arc                   randconfig-002-20240131   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                      integrator_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                       netwinder_defconfig   clang
arm                   randconfig-001-20240131   clang
arm                   randconfig-002-20240131   clang
arm                   randconfig-003-20240131   clang
arm                   randconfig-004-20240131   clang
arm                        spear6xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240131   clang
arm64                 randconfig-002-20240131   clang
arm64                 randconfig-003-20240131   clang
arm64                 randconfig-004-20240131   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240131   gcc  
csky                  randconfig-002-20240131   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240131   clang
hexagon               randconfig-002-20240131   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20240131   gcc  
i386                  randconfig-012-20240131   gcc  
i386                  randconfig-013-20240131   gcc  
i386                  randconfig-014-20240131   gcc  
i386                  randconfig-015-20240131   gcc  
i386                  randconfig-016-20240131   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240131   gcc  
loongarch             randconfig-002-20240131   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240131   gcc  
nios2                 randconfig-002-20240131   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240131   gcc  
parisc                randconfig-002-20240131   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                     kmeter1_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                      ppc44x_defconfig   clang
powerpc               randconfig-001-20240131   clang
powerpc               randconfig-002-20240131   clang
powerpc               randconfig-003-20240131   clang
powerpc64             randconfig-001-20240131   clang
powerpc64             randconfig-002-20240131   clang
powerpc64             randconfig-003-20240131   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240131   clang
riscv                 randconfig-002-20240131   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240131   gcc  
s390                  randconfig-002-20240131   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240131   gcc  
sh                    randconfig-002-20240131   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240131   gcc  
sparc64               randconfig-002-20240131   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240131   clang
um                    randconfig-002-20240131   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240131   clang
x86_64       buildonly-randconfig-002-20240131   clang
x86_64       buildonly-randconfig-003-20240131   clang
x86_64       buildonly-randconfig-004-20240131   clang
x86_64       buildonly-randconfig-005-20240131   clang
x86_64       buildonly-randconfig-006-20240131   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20240131   gcc  
x86_64                randconfig-002-20240131   gcc  
x86_64                randconfig-003-20240131   gcc  
x86_64                randconfig-004-20240131   gcc  
x86_64                randconfig-005-20240131   gcc  
x86_64                randconfig-006-20240131   gcc  
x86_64                randconfig-011-20240131   clang
x86_64                randconfig-012-20240131   clang
x86_64                randconfig-013-20240131   clang
x86_64                randconfig-014-20240131   clang
x86_64                randconfig-015-20240131   clang
x86_64                randconfig-016-20240131   clang
x86_64                randconfig-071-20240131   clang
x86_64                randconfig-072-20240131   clang
x86_64                randconfig-073-20240131   clang
x86_64                randconfig-074-20240131   clang
x86_64                randconfig-075-20240131   clang
x86_64                randconfig-076-20240131   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240131   gcc  
xtensa                randconfig-002-20240131   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

