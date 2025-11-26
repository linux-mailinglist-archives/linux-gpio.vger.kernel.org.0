Return-Path: <linux-gpio+bounces-29115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 013FFC8C1E5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 22:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4AC63A828B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 21:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7362031A072;
	Wed, 26 Nov 2025 21:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqX5NLKC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70464201278
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 21:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194127; cv=none; b=JV6Nobi3iNpha1Q+BFQRb1vrAkLImPX6LSuo3Mf+Bmym/OQPrm+3TWvt+FV4TyZsQawsq4Ho0AwOG20zORn8hsnEhT41B6hblBkzoKP9WSM1aH37Xj+UnyClQBWo2Dd9FFKkTsVO5tkw8CBWa3dpT9J9YIMd1T4DGWCRQ8kU7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194127; c=relaxed/simple;
	bh=k+FM/aEKcDFaxPHlSMLXisLRyVO4WMaX6rRxLLwWwBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pcNYjxm8ErEu0hDD7P0eqlEqVZ+vJFgzmQtmZ2fKSPchj55fqaVJOwVMp0B1TzI9QgqEUWB0vGcz1qfgbfFaCH90XeqtdxviKNseANsTBxguVH8mGYkN3tJjXSVbq7urvv6yH6aa5wWxYa//6XJFKpgZ/+zBgnA4K5zvgnEbaag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqX5NLKC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764194126; x=1795730126;
  h=date:from:to:cc:subject:message-id;
  bh=k+FM/aEKcDFaxPHlSMLXisLRyVO4WMaX6rRxLLwWwBo=;
  b=WqX5NLKCD+IRcCCEjlJb5fsGfnSpyhtu47nnYnND+cMKIkUoIVCKAIu+
   D+2w+Yj5PzHXlLrj2T5tdrex3t96tzjAsdSezvtFTdLo1/Z4B3E97IzVN
   HZ3vE2Ir6GGMfET68nVADiVVGup1L81nTa/SAfs+NAROQRKnL/8G0j37a
   8HB2Lzarn6/iHhXXuu+XRrryzBgOYr8u43kMwjo9YlSET8tT6c2gEdgbZ
   qhxhtXRiwK4FolNiCw3bkQI8LAKRsoWyTh1Ryg547ax09kYQuzrXmB5wj
   VRaxgFNhGwwarBst+lkxa519cnK5o59M+N6A/LVEwDFyOEwqnjzoGzpZ0
   A==;
X-CSE-ConnectionGUID: MErSmjzZSCutBdNllahqtw==
X-CSE-MsgGUID: 5NpmMnMnSS2nhHzcujRyYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65245008"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65245008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:55:25 -0800
X-CSE-ConnectionGUID: a4csJjtdTsSOuHcHvaiQcw==
X-CSE-MsgGUID: SV79DMSwQXSr9bWqeW4olw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="216409378"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 13:55:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vONTt-000000003Or-3MGd;
	Wed, 26 Nov 2025 21:55:21 +0000
Date: Thu, 27 Nov 2025 05:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:devel] BUILD REGRESSION
 6156424a7d001cceeafe59b52209d6f36719b51d
Message-ID: <202511270529.a8fZlQyb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
branch HEAD: 6156424a7d001cceeafe59b52209d6f36719b51d  Merge tag 'intel-pinctrl-v6.19-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel into devel

Error/Warning (recently discovered and may have been fixed):

    pinctrl-pic64gx-gpio2.c:(.text+0xd0): undefined reference to `pinconf_generic_dt_node_to_map'

Error/Warning ids grouped by kconfigs:

recent_errors
`-- xtensa-randconfig-001-20251126
    `-- pinctrl-pic64gx-gpio2.c:(.text):undefined-reference-to-pinconf_generic_dt_node_to_map

elapsed time: 1489m

configs tested: 54
configs skipped: 0

tested configs:
alpha                   allnoconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251126    gcc-13.4.0
arc         randconfig-002-20251126    gcc-11.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251126    clang-22
arm         randconfig-002-20251126    clang-22
arm         randconfig-003-20251126    clang-19
arm         randconfig-004-20251126    clang-22
arm64                   allnoconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251126    clang-22
hexagon     randconfig-002-20251126    clang-22
i386                    allnoconfig    gcc-14
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251126    gcc-15.1.0
loongarch   randconfig-002-20251126    clang-22
m68k                    allnoconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251126    gcc-11.5.0
nios2       randconfig-002-20251126    gcc-9.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251126    gcc-8.5.0
parisc      randconfig-002-20251126    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251126    gcc-10.5.0
powerpc     randconfig-002-20251126    gcc-8.5.0
powerpc64   randconfig-001-20251126    clang-19
powerpc64   randconfig-002-20251126    clang-22
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251126    gcc-10.5.0
riscv       randconfig-002-20251126    clang-22
s390                    allnoconfig    clang-22
s390        randconfig-001-20251126    gcc-8.5.0
s390        randconfig-002-20251126    gcc-8.5.0
sh                      allnoconfig    gcc-15.1.0
sh          randconfig-001-20251126    gcc-14.3.0
sh          randconfig-002-20251126    gcc-11.5.0
sparc                   allnoconfig    gcc-15.1.0
sparc       randconfig-001-20251126    gcc-8.5.0
sparc       randconfig-002-20251126    gcc-14.3.0
sparc64     randconfig-001-20251126    gcc-8.5.0
sparc64     randconfig-002-20251126    clang-22
um                      allnoconfig    clang-22
um          randconfig-001-20251126    clang-19
um          randconfig-002-20251126    clang-22
x86_64                  allnoconfig    clang-20
xtensa                  allnoconfig    gcc-15.1.0
xtensa      randconfig-001-20251126    gcc-14.3.0
xtensa      randconfig-002-20251126    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

