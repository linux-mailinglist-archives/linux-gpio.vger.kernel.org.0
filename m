Return-Path: <linux-gpio+bounces-7830-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B8991C9D4
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 02:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0474283E5D
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2024 00:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B1D370;
	Sat, 29 Jun 2024 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCfjA+/i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E41109
	for <linux-gpio@vger.kernel.org>; Sat, 29 Jun 2024 00:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719622168; cv=none; b=c6tkbXm5ubaV2V/pemFL/Dz9KFEl4MuEr9glBk6LJStBZ+8gg/apD601nLceFAsfRBq8KXZOg6FxSRO8ctHE8DX1soHKsj85Sz2JZY++kY2/5Vv4CUWcP8VaA/SiSADkCpo65yxu83kQIJYkZiZAaoXZOvUKcMIiU+zxBWAvuxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719622168; c=relaxed/simple;
	bh=H4CgfOpNpYsCYoj+A0ngESP4BOdOfSbNNZeRI+tp7Os=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QstQUBreFepDvmyXw7FMYk3OAsIFkq+RZTX9gwkJfS0rpcPhvC7hUM7p0BBpCK5NfBsXICnHYwy4unVkIiaKz6cMkhj/qoGvPtkXR6Djdcqxi5A+ROtzLpbIdVwRUV85bvg1MRuGtQZiuU+0UOwCl0QPlAT2y1fBiRofy8pmeXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCfjA+/i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719622166; x=1751158166;
  h=date:from:to:cc:subject:message-id;
  bh=H4CgfOpNpYsCYoj+A0ngESP4BOdOfSbNNZeRI+tp7Os=;
  b=BCfjA+/ihOijF+MKvSJBJRJZXwttDh1n9B0Iq5pyIh1C3/darMQAeLPR
   9ZdstCiAosiXk2DZtim4koorzVbeHALFBIcGaLbKL6H76Sn5XrVu5sumI
   X6sEpENiT2I1sUcayDzZO3Ueb65iWJuxRvms1HXVSsOl/7TGxIhABqud5
   To5HHg070Rmfrhj6idfyy+nQAOknKC0DjAYRgSijEUPYkwYfn2ozszTkW
   8qy0ERgUWEoLlzQ14iCSM1DPavwl9z+YMlBcmbnkQ6iftEFJBUpbCh4OQ
   QKOa17Nfc9T/F9aWaVBgRR+Edzz1FKtkDtKeC15em3PSWOWEH7mzRBJzD
   A==;
X-CSE-ConnectionGUID: DhQ8gpucQnahDtgKMAgwvQ==
X-CSE-MsgGUID: 1Y+qnWBiQZeZBa33ftwNlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16494466"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16494466"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 17:49:26 -0700
X-CSE-ConnectionGUID: cuYXUYtzRPyI8azjHReEnQ==
X-CSE-MsgGUID: QsjABui4QhuEzFZNOKfrpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44972555"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2024 17:49:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNMHK-000Ing-2I;
	Sat, 29 Jun 2024 00:49:22 +0000
Date: Sat, 29 Jun 2024 08:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Subject: [linusw-pinctrl:b4/imx-scmi-generic] BUILD SUCCESS
 ecf749cdb24eb1c205705e43c12a27fae61cf4d2
Message-ID: <202406290812.u8zCGMTB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/imx-scmi-generic
branch HEAD: ecf749cdb24eb1c205705e43c12a27fae61cf4d2  pinctrl: freescale: Select missing features

elapsed time: 15188m

configs tested: 39
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386                                defconfig   clang-18
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

