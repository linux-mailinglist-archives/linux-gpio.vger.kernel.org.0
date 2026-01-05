Return-Path: <linux-gpio+bounces-30164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D916CF4EB7
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F73C3006465
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3C83246EC;
	Mon,  5 Jan 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWE71Rii"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C97C321437
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633022; cv=none; b=uaV96qQVsGwOT4PxT2OzcDkoZb/pwQqoCuKOEY6ZUfm3E18XQwbQY/mZqyfYuxO4dzycNpGQREDmgnvfEcGrExIERQa8S27If0i3ofLHQtCk9qvIDfAROwpt3i4ojj1fAZggrl7VNF5PZgmWRTLG6qDE50vlhvJs0yXyUbwhWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633022; c=relaxed/simple;
	bh=FTJE/mQY1OE5mKigA3fLtyr/owpAOLLZdMQ5AgH1ISY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oIkT1nkIzJZEVrMDWLBoyRUJlAebn/Kj9zzsUmHF70S0Hs+y1KHRLU7oQGeN9wDinjNfKQlAMUQOHhOSI/BjB5F7Coc9Q8fUzWHXuCyw7OqCpTZgK0cq5KD187STGnLUUN7u403q5J9cTvwv8+bAXulwwUAK9EofQyjCZsMerFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWE71Rii; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767633019; x=1799169019;
  h=date:from:to:cc:subject:message-id;
  bh=FTJE/mQY1OE5mKigA3fLtyr/owpAOLLZdMQ5AgH1ISY=;
  b=PWE71RiirB8One/3ky27UdTkNddcxeyFwKCGCH5MV2rBRi0NtRyVr17L
   B1aHGDHjyHutDNdLZSyHWGoWFzGMxX7biMSCgLzMk85rkT+A2oqZM350r
   iZVjnEx0IogDtmo8ZjFm1NM3IJrsa+6Qod/vQtD5+UXNYLU5TemTkv0fn
   8JflF9Rk7ofnDESj46mvj4rhGJLGV3vbNxzlKokkyhsUUziAMf/4tGT9U
   VdHGOvUFTJZz0YcIbktF30pvWyVcOFnnY8hjAkQ1V2NbD1uXLxykfDqu3
   08h6Hpy87Q2vzRhtSViRwNKgDgrEYmO3tV4HKMsmMOeuQTrQVzeyz24Zo
   w==;
X-CSE-ConnectionGUID: EehnTs2bRyGX7sNZ9Nsyww==
X-CSE-MsgGUID: /N8h5F4KRlCC6DjNSRgHeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68012651"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68012651"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 09:10:16 -0800
X-CSE-ConnectionGUID: zJGwXx25RqeMa8AOj43AIQ==
X-CSE-MsgGUID: YR1L7eLGTp6BmxO8SPhbmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202486733"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jan 2026 09:10:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vco5s-000000001Np-1RBG;
	Mon, 05 Jan 2026 17:10:12 +0000
Date: Tue, 06 Jan 2026 01:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:for-next] BUILD SUCCESS
 5ce864c2327b866c481625ed468e9915bf0d00f1
Message-ID: <202601060133.yH1Kqote-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
branch HEAD: 5ce864c2327b866c481625ed468e9915bf0d00f1  Merge branch 'devel' into for-next

elapsed time: 5872m

configs tested: 77
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-15.1.0
alpha              allyesconfig    gcc-15.1.0
arc                allmodconfig    gcc-15.1.0
arc                 allnoconfig    gcc-15.1.0
arc                allyesconfig    gcc-15.1.0
arm                 allnoconfig    clang-22
arm                 allnoconfig    gcc-15.1.0
arm                allyesconfig    gcc-15.1.0
arm64              allmodconfig    clang-19
arm64               allnoconfig    gcc-15.1.0
csky               allmodconfig    gcc-15.1.0
csky                allnoconfig    gcc-15.1.0
hexagon            allmodconfig    clang-17
hexagon             allnoconfig    clang-22
hexagon             allnoconfig    gcc-15.1.0
i386               allmodconfig    gcc-14
i386                allnoconfig    gcc-14
i386                allnoconfig    gcc-15.1.0
i386               allyesconfig    gcc-14
loongarch          allmodconfig    clang-19
loongarch           allnoconfig    clang-22
loongarch           allnoconfig    gcc-15.1.0
m68k               allmodconfig    gcc-15.1.0
m68k                allnoconfig    gcc-15.1.0
m68k               allyesconfig    gcc-15.1.0
microblaze          allnoconfig    gcc-15.1.0
microblaze         allyesconfig    gcc-15.1.0
mips               allmodconfig    gcc-15.1.0
mips                allnoconfig    gcc-15.1.0
mips               allyesconfig    gcc-15.1.0
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    clang-22
nios2               allnoconfig    gcc-11.5.0
openrisc           allmodconfig    gcc-15.1.0
openrisc            allnoconfig    clang-22
openrisc            allnoconfig    gcc-15.1.0
parisc             allmodconfig    gcc-15.1.0
parisc              allnoconfig    clang-22
parisc              allnoconfig    gcc-15.1.0
parisc             allyesconfig    gcc-15.1.0
powerpc            allmodconfig    gcc-15.1.0
powerpc             allnoconfig    clang-22
powerpc             allnoconfig    gcc-15.1.0
riscv              allmodconfig    clang-22
riscv               allnoconfig    clang-22
riscv               allnoconfig    gcc-15.1.0
riscv              allyesconfig    clang-16
s390               allmodconfig    clang-18
s390                allnoconfig    clang-22
s390               allyesconfig    gcc-15.1.0
sh                 allmodconfig    gcc-15.1.0
sh                  allnoconfig    clang-22
sh                  allnoconfig    gcc-15.1.0
sh                 allyesconfig    gcc-15.1.0
sh                    defconfig    gcc-14
sparc               allnoconfig    clang-22
sparc               allnoconfig    gcc-15.1.0
sparc64            allmodconfig    clang-22
sparc64               defconfig    gcc-14
um                 allmodconfig    clang-19
um                  allnoconfig    clang-22
um                 allyesconfig    gcc-14
um                    defconfig    gcc-14
um               i386_defconfig    gcc-14
um             x86_64_defconfig    gcc-14
x86_64             allmodconfig    clang-20
x86_64              allnoconfig    clang-20
x86_64              allnoconfig    clang-22
x86_64             allyesconfig    clang-20
x86_64                defconfig    gcc-14
x86_64                    kexec    clang-20
x86_64                 rhel-9.4    clang-20
x86_64            rhel-9.4-func    clang-20
x86_64      rhel-9.4-kselftests    clang-20
x86_64            rhel-9.4-rust    clang-20
xtensa              allnoconfig    clang-22
xtensa              allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

