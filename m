Return-Path: <linux-gpio+bounces-11077-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B799596E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 23:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636B91F2277F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 21:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D74517C9EA;
	Tue,  8 Oct 2024 21:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEtIxFzG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE72C15F3FF
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728424034; cv=none; b=QzladrrLqHAw+DF1kyEQ42FdvfpcY2HCoMhvhO4tj4WxqiG9scdzJguiiE+pH02JTc+xBAZy6F18LHisl4XKLBB+G49uoQ3RIqQctBbccPIU9Cbvo0VhvKKiITEF3QzaIvEFqZZaY6rJuVpMVZKZI/x8NXYoyQKypEMZErTFmFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728424034; c=relaxed/simple;
	bh=ViHKXHXcphaWHIHpYQlVSjlEYmw4Pu6kGUiKCF4dGqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k8y2UCICMpsEFlAHjrfoXj06jA34YuMJ9xwKCVjYXymXH3SfEEbxW0wTrqW8l1oDXcyxgcs525dzOMAfchOI1grgjQwziy5dY1lCNPBm7OryklmHTT6EtVxTNmgbY735BkyPk28IevntlNUYvStYNn5TQ9+NG0RYLCvqH8qUhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEtIxFzG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728424033; x=1759960033;
  h=date:from:to:cc:subject:message-id;
  bh=ViHKXHXcphaWHIHpYQlVSjlEYmw4Pu6kGUiKCF4dGqs=;
  b=QEtIxFzGb4LkEHao1UEXh4o5iIX0J4Le7b7WOWYfUh/mHqGqQ9kPWGIV
   cfPZxYqdRhWXzgwKuPbMhpsFaG/maQJTuclJ/y7o6ehOx3KuNMsaXtbHk
   MLdh3fNtWuaae5qok5WjcLEUUDiVbqYWLsONLykXC7c25SBTeI44ebCNZ
   Rl7/usuNuleJFHAoSRdM/DncaaaiQYOW+QZAgptfVbHFgys1o/VT6gnvO
   vNsiB5+AxALs73fqbIqAvNhLej2jZ9g1paL5Ec/DfMTn3McJP8kiLVy5K
   TtAzQtS3GkcnJTs6rXpiAZ4mYcg99kW/33P3WWVFQEPA3BxJeLxv5dQBU
   Q==;
X-CSE-ConnectionGUID: f7qAofIJQvChn7/ELE1ZaQ==
X-CSE-MsgGUID: C7yFZIvTRJan/QTBLeLRbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27554634"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="27554634"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 14:47:12 -0700
X-CSE-ConnectionGUID: Q8loSQK/SRu5SYAaX45wcg==
X-CSE-MsgGUID: CwxkSrfKQ8SnKThNldpyNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="76252843"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2024 14:47:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syI2v-0008PW-08;
	Tue, 08 Oct 2024 21:47:09 +0000
Date: Wed, 09 Oct 2024 05:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS
 b7adfb6076ff0c1ebbde56d1903daa3d07db92c5
Message-ID: <202410090529.EKSJATo9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: b7adfb6076ff0c1ebbde56d1903daa3d07db92c5  gpio: cdev: update flags at once when reconfiguring from user-space

elapsed time: 748m

configs tested: 81
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-14.1.0
alpha           allyesconfig    clang-20
alpha              defconfig    gcc-14.1.0
arc             allmodconfig    clang-20
arc              allnoconfig    gcc-14.1.0
arc             allyesconfig    clang-20
arc                defconfig    gcc-14.1.0
arm             allmodconfig    clang-20
arm              allnoconfig    gcc-14.1.0
arm             allyesconfig    clang-20
arm                defconfig    gcc-14.1.0
arm64           allmodconfig    clang-20
arm64            allnoconfig    gcc-14.1.0
arm64              defconfig    gcc-14.1.0
csky             allnoconfig    gcc-14.1.0
csky               defconfig    gcc-14.1.0
hexagon         allmodconfig    clang-20
hexagon          allnoconfig    gcc-14.1.0
hexagon         allyesconfig    clang-20
hexagon            defconfig    gcc-14.1.0
i386            allmodconfig    clang-18
i386             allnoconfig    clang-18
i386            allyesconfig    clang-18
i386               defconfig    clang-18
loongarch       allmodconfig    gcc-14.1.0
loongarch        allnoconfig    gcc-14.1.0
loongarch          defconfig    gcc-14.1.0
m68k            allmodconfig    gcc-14.1.0
m68k             allnoconfig    gcc-14.1.0
m68k            allyesconfig    gcc-14.1.0
m68k               defconfig    gcc-14.1.0
microblaze      allmodconfig    gcc-14.1.0
microblaze       allnoconfig    gcc-14.1.0
microblaze      allyesconfig    gcc-14.1.0
microblaze         defconfig    gcc-14.1.0
mips             allnoconfig    gcc-14.1.0
nios2            allnoconfig    gcc-14.1.0
nios2              defconfig    gcc-14.1.0
openrisc         allnoconfig    clang-20
openrisc         allnoconfig    gcc-14.1.0
openrisc        allyesconfig    gcc-14.1.0
openrisc           defconfig    gcc-12
parisc          allmodconfig    gcc-14.1.0
parisc           allnoconfig    clang-20
parisc           allnoconfig    gcc-14.1.0
parisc          allyesconfig    gcc-14.1.0
parisc             defconfig    gcc-12
parisc64           defconfig    gcc-14.1.0
powerpc         allmodconfig    gcc-14.1.0
powerpc          allnoconfig    clang-20
powerpc          allnoconfig    gcc-14.1.0
powerpc         allyesconfig    gcc-14.1.0
riscv           allmodconfig    gcc-14.1.0
riscv            allnoconfig    clang-20
riscv            allnoconfig    gcc-14.1.0
riscv           allyesconfig    gcc-14.1.0
riscv              defconfig    gcc-12
s390            allmodconfig    gcc-14.1.0
s390             allnoconfig    clang-20
s390            allyesconfig    gcc-14.1.0
s390               defconfig    gcc-12
sh              allmodconfig    gcc-14.1.0
sh               allnoconfig    gcc-14.1.0
sh              allyesconfig    gcc-14.1.0
sh                 defconfig    gcc-12
sparc           allmodconfig    gcc-14.1.0
sparc64            defconfig    gcc-12
um              allmodconfig    clang-20
um               allnoconfig    clang-17
um               allnoconfig    clang-20
um              allyesconfig    clang-20
um                 defconfig    gcc-12
um            i386_defconfig    gcc-12
um          x86_64_defconfig    gcc-12
x86_64           allnoconfig    clang-18
x86_64          allyesconfig    clang-18
x86_64             defconfig    clang-18
x86_64                 kexec    gcc-12
x86_64              rhel-8.3    gcc-12
x86_64         rhel-8.3-rust    clang-18
xtensa           allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

