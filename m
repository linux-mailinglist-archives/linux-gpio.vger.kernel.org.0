Return-Path: <linux-gpio+bounces-18656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BAA83FBE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F09118962FF
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 10:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567A126F459;
	Thu, 10 Apr 2025 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNFkqeXv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779FF26E15E
	for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2025 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279057; cv=none; b=MBOwLcUiN20rHSJG8IEP7+PHoxi0bPavb471r+X9HSfEaJFuYcBQdFKNUfIzx3X6vQZVeOBcBXh8a7Si89xW6hliHg24OBpXOpuM44G/bKNchBAGwW0ZbC//tDGUO84ACN/XTvpd0+9Qq15veozl9fxqSj4L7vorZpds3xmpEIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279057; c=relaxed/simple;
	bh=ecmS1Nnqhw1cWqQNxgokCeNDcn5Ug77YCtaWkmslAko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kI30Dz1Xsjws5YVLgsi42UBUSk79ZFvHmHThjUMbhKj/YkwmnwWzEFatZXfaV0/gd8C30BZxsz7o9WroJmlq3DcItoiHNBe9PKXnQw/fJN7q5eOzZqyam+2D4RL9KEFN52gxDSOb+GX9tY3+GpJJWywKozhjOGkB90Oj9tuEp1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNFkqeXv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744279055; x=1775815055;
  h=date:from:to:cc:subject:message-id;
  bh=ecmS1Nnqhw1cWqQNxgokCeNDcn5Ug77YCtaWkmslAko=;
  b=DNFkqeXvtd4G1M4F0VL5XTCIz6DVViQuhqm4XiXl5sFk5iumOlUk61Pb
   gOU4KUc/k/tKk6LMmwTcWeawbedyzcFkr9oORasQgWvsQJwyRBb8tSg/b
   fLzhw3Nx8pknF4Vl39Q57AtBamadl64OiBh1fFQ1dli/o5PteRWP4e+WW
   FuH82atCjyrSSFCxZecbMbJ/G/DdEI/pzdOeIk+A8PAZygbTd2iMpqm3O
   zy0WUvBhbPt1e8MjKn1c9huDzHO5PJd45vdv2lqP3JBihM8SNMJJfTvRo
   TA3noLKj5kkZKhtVgyEoJ8/FHXTdmRY0qa70s2GxtspjOICytj3iRBBUt
   Q==;
X-CSE-ConnectionGUID: 7atq4x6hS82D8qkQ7ir6cg==
X-CSE-MsgGUID: S7VJngY3S+yqXp2FrcmQUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57158946"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57158946"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 02:57:34 -0700
X-CSE-ConnectionGUID: 3wH/SnEhSNuZ0Kd0t0FNnQ==
X-CSE-MsgGUID: CJANZfkuTQqcZpF+yaM5pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="129693942"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2025 02:57:33 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2of4-0009td-2H;
	Thu, 10 Apr 2025 09:57:30 +0000
Date: Thu, 10 Apr 2025 17:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:arm/gpio-set-conversion] BUILD SUCCESS
 fb52f3226cab41b94f9e6ac92b1108bce324e700
Message-ID: <202504101726.AhpdX79g-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git arm/gpio-set-conversion
branch HEAD: fb52f3226cab41b94f9e6ac92b1108bce324e700  ARM: s3c/gpio: use new line value setter callbacks

elapsed time: 1467m

configs tested: 10
configs skipped: 139

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc               allmodconfig    gcc-14.2.0
arc               allyesconfig    gcc-14.2.0
arm               allmodconfig    gcc-14.2.0
arm                allnoconfig    clang-21
arm               allyesconfig    gcc-14.2.0
arm    randconfig-001-20250409    gcc-7.5.0
arm    randconfig-002-20250409    gcc-7.5.0
arm    randconfig-003-20250409    gcc-7.5.0
arm    randconfig-004-20250409    clang-14
arm64             allmodconfig    clang-19

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

