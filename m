Return-Path: <linux-gpio+bounces-19028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0707A922D5
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 225C03AFA32
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 16:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1182550CD;
	Thu, 17 Apr 2025 16:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOkVROvK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5622550BA
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 16:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907826; cv=none; b=XZHqMAYURC5x7/piYHyomYZmz4Qd9/dfjFS8KHmvRrvIEtWBrXys6zDCMcyJSMVfQWP+MqdsgPaw6FeHvhvpIWo4WaiAVRNSyFMJlRSkKSjto1DD9357dTxdGajMmTAo7Rcb1oE8pujHUAmevWJ17MVkKFOFA8ycmVMZE7JaZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907826; c=relaxed/simple;
	bh=8tB7/B77DZAPnAVsPOkiRc9R6N0xS0rlQrzU1Qp67sw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WqvR/HrW5S5KVS4w1ieJEpLIlomWT2gRkOS5hwK9mCDAYkXn+RKmpAc2hmaVXedyG+EsP3MXpoIiJSyRad86nBeDtZUyP6xoU4B77o1axnJNrbih7EbK/FAMB/ECKgU0L4iO8Xa6C0vU4TpwlKbiHpS7hsyEPBMDplTJj806l0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOkVROvK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744907824; x=1776443824;
  h=date:from:to:cc:subject:message-id;
  bh=8tB7/B77DZAPnAVsPOkiRc9R6N0xS0rlQrzU1Qp67sw=;
  b=WOkVROvKuA3DJe5Qapm1PCoyD1S160BFCKfpapzOmMvrJFeUPLOJZLJm
   OUAH8DnZMO5BqN5Im0ze8O3jdJadFgH1CVASYqHAZ1UwlZQKj5fmxENe+
   81lDPS8mCL/wUIEX3ZEg2LS9b0v5ri77PntU4oKpBS6+Knrv1v8HcPB6C
   Yk/V9eMfctQ1doKoPas94QYH9gUennCjHwzZ+1GseWXvn8Ehx6ELBTUoo
   nr9zrLM3FeWYP4Pn+jlCcj4Ta6pnGNVMbG1AskEW7Vx5sDe67qXp8Z9zo
   iH5rskN3B/v03MFJ5SF7GG/1w8bvbDjf1Jjw2jBB/0PVUtQWskDW2D/ZC
   w==;
X-CSE-ConnectionGUID: 62swM0O6RgKg6QutSlweyg==
X-CSE-MsgGUID: pzc8bkTrT16KTEPYyBlYVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57894282"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57894282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:37:03 -0700
X-CSE-ConnectionGUID: tMTO0FO2QduE/Wdu38ynWA==
X-CSE-MsgGUID: ke0zPvzIRDGJ1SFAeePVkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131403465"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 09:37:02 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5SEW-0000W1-12;
	Thu, 17 Apr 2025 16:37:00 +0000
Date: Fri, 18 Apr 2025 00:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:davinci/for-next] BUILD SUCCESS
 78e6b545e5587ed89b5768a2815861dcfa415101
Message-ID: <202504180030.nm73YuuM-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git davinci/for-next
branch HEAD: 78e6b545e5587ed89b5768a2815861dcfa415101  ARM: davinci: remove support for da830

elapsed time: 1465m

configs tested: 10
configs skipped: 114

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm             allmodconfig    gcc-14.2.0
arm              allnoconfig    clang-21
arm             allyesconfig    gcc-14.2.0
arm      aspeed_g5_defconfig    gcc-14.2.0
arm        assabet_defconfig    clang-18
arm          imxrt_defconfig    clang-21
arm  randconfig-001-20250417    gcc-7.5.0
arm  randconfig-002-20250417    clang-16
arm  randconfig-003-20250417    gcc-10.5.0
arm  randconfig-004-20250417    gcc-6.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

