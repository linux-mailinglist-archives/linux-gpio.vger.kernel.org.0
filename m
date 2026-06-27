Return-Path: <linux-gpio+bounces-39046-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2avmAzVsP2qzTAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39046-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 08:22:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 732936D147D
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 08:22:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FHBMFRJR;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39046-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39046-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49405302A07C
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2026 06:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE36372692;
	Sat, 27 Jun 2026 06:22:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA135F199
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2026 06:22:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782541361; cv=none; b=ZHO6+2lDYAN/lgOdtt5wLHKAeQcIqF1aPk5CEwqpmQRfJPUu/qqki6ld7/SEZ4gXCaXoY0v6seD9uQ1sDMwksB0TMpnXldJJ6R2nrI4krpzvCae/349qzy2WYGXdmjq8BKx2wJogX8WbmefpnobMClWEZ5EP8hHmQxzAebLcrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782541361; c=relaxed/simple;
	bh=dpkhysY7+SOD41Z13ZJB89XdJzCtiHj3KAqeQjfV6yg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EgqxJcVIzqaptzCyE5krQHrXAlufNd/wSaiVmnRk1cr+1Hk6Ut9WyErpzG8Q+PmENck67cl8DJpmuE8yNiWvtPPoT3Vrcf/i5Uk5eEkROMKzqofnfnWQWpBX3cFMYMZKTZk5u8ZS7JNtK6dgiVQ2e6/Acbl5dpg2gP/yoz0C738=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHBMFRJR; arc=none smtp.client-ip=192.198.163.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782541359; x=1814077359;
  h=date:from:to:cc:subject:message-id;
  bh=dpkhysY7+SOD41Z13ZJB89XdJzCtiHj3KAqeQjfV6yg=;
  b=FHBMFRJRU7N0OXqjwtLRCwBR1DWGc1h29CEGilnV6V+XHZpU4RYDsfN2
   K2k+ruD9wmEbQKwlIQwqi48mzshuXcQxDO77OqMWzEzrrLE7NpUg/uI9F
   Cry5BmHt1f+3hyuMLvS9Zd1igvgLaePDfaTltTmpzipl5ZaMEgc03VQKg
   RTdkuXRoAaDkIl3fLj/tM6aLS3Aj6bmmtKhRRiysXjphg6BN/53D4u/Es
   AhYiEjQQmCGuuTCfOLju2/k7tkTUnsIYwY4xhtO2cHjZmWXtIZilf/qmk
   fQO9dcmt1dpqA6zWnjo2hKqi/HF/Y5xXIOnOabGF1vQwu3niZTEA+v7i1
   g==;
X-CSE-ConnectionGUID: nJVn9S3STTawRuPRuPYtWA==
X-CSE-MsgGUID: g7cig3pQTtqy30O8foEDag==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="93978536"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="93978536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 23:22:37 -0700
X-CSE-ConnectionGUID: tpxLsf39Srmn+Kos2N/rOQ==
X-CSE-MsgGUID: oclJMERCTu2BIBPFvQgLYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="247032729"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2026 23:22:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdMQy-000000005fj-3i4N;
	Sat, 27 Jun 2026 06:22:32 +0000
Date: Sat, 27 Jun 2026 14:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next] BUILD SUCCESS WITH WARNING
 415c63896b76fd98883e190bc7518383cb01779c
Message-ID: <202606271408.6uNNatzJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39046-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 732936D147D

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
branch HEAD: 415c63896b76fd98883e190bc7518383cb01779c  gpio: pca9570: Use I2C match data

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202606270433.gAWekfd3-lkp@intel.com

    Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- alpha-randconfig-r113-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arc-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arc-randconfig-r123-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm-randconfig-002-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm-randconfig-004-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-defconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-randconfig-001-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-randconfig-002
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-randconfig-002-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- arm64-randconfig-003
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- csky-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- hexagon-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- hexagon-randconfig-002-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- hexagon-randconfig-r071-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- i386-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- i386-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- loongarch-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- loongarch-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- m68k-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- m68k-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- microblaze-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- mips-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- mips-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- nios2-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- openrisc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- openrisc-randconfig-r112-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- parisc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- parisc-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- powerpc-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- riscv-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- riscv-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- s390-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- s390-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sh-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sh-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sh-randconfig-002-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- sparc64-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- um-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- um-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- um-randconfig-r071-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- um-randconfig-r132-20260627
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- x86_64-allmodconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
|-- x86_64-allyesconfig
|   `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info
`-- xtensa-allyesconfig
    `-- Warning:drivers-gpio-gpio-rtd1625.c-struct-member-base_offset-not-described-in-rtd1625_gpio_info

elapsed time: 740m

configs tested: 260
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-001-20260627    gcc-16.1.0
arc                   randconfig-002-20260627    gcc-16.1.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                         lpc18xx_defconfig    clang-23
arm                   randconfig-001-20260627    gcc-16.1.0
arm                   randconfig-002-20260627    gcc-16.1.0
arm                   randconfig-003-20260627    gcc-16.1.0
arm                   randconfig-004-20260627    gcc-16.1.0
arm                           spitz_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260627    clang-23
arm64                 randconfig-001-20260627    gcc-10.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260627    clang-23
arm64                 randconfig-002-20260627    gcc-10.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260627    clang-23
arm64                 randconfig-003-20260627    gcc-10.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260627    clang-23
arm64                 randconfig-004-20260627    gcc-10.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260627    clang-23
csky                  randconfig-001-20260627    gcc-10.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260627    clang-23
csky                  randconfig-002-20260627    gcc-10.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260627    clang-23
hexagon               randconfig-001-20260627    gcc-11.5.0
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260627    clang-18
hexagon               randconfig-002-20260627    gcc-11.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260627    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260627    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260627    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260627    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260627    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260627    clang-22
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260627    clang-22
i386                           randconfig-002    clang-22
i386                  randconfig-002-20260627    clang-22
i386                           randconfig-003    clang-22
i386                  randconfig-003-20260627    clang-22
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260627    clang-22
i386                           randconfig-005    clang-22
i386                  randconfig-005-20260627    clang-22
i386                           randconfig-006    clang-22
i386                  randconfig-006-20260627    clang-22
i386                           randconfig-007    clang-22
i386                  randconfig-007-20260627    clang-22
i386                  randconfig-011-20260627    clang-22
i386                  randconfig-012-20260627    clang-22
i386                  randconfig-013-20260627    clang-22
i386                  randconfig-014-20260627    clang-22
i386                  randconfig-015-20260627    clang-22
i386                  randconfig-016-20260627    clang-22
i386                  randconfig-017-20260627    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260627    clang-23
loongarch             randconfig-001-20260627    gcc-11.5.0
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260627    gcc-11.5.0
loongarch             randconfig-002-20260627    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260627    gcc-11.5.0
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260627    gcc-11.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-8.5.0
parisc                randconfig-001-20260627    gcc-8.5.0
parisc                         randconfig-002    gcc-8.5.0
parisc                randconfig-002-20260627    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                   motionpro_defconfig    clang-23
powerpc               mpc834x_itxgp_defconfig    clang-23
powerpc                        randconfig-001    gcc-8.5.0
powerpc               randconfig-001-20260627    gcc-8.5.0
powerpc                        randconfig-002    gcc-8.5.0
powerpc               randconfig-002-20260627    gcc-8.5.0
powerpc64                      randconfig-001    gcc-8.5.0
powerpc64             randconfig-001-20260627    gcc-8.5.0
powerpc64                      randconfig-002    gcc-8.5.0
powerpc64             randconfig-002-20260627    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260627    clang-22
riscv                 randconfig-001-20260627    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260627    clang-23
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260627    clang-17
s390                  randconfig-001-20260627    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260627    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260627    clang-23
sh                    randconfig-001-20260627    gcc-16.1.0
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260627    clang-23
sh                    randconfig-002-20260627    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-8.5.0
sparc                 randconfig-001-20260627    gcc-8.5.0
sparc                          randconfig-002    gcc-8.5.0
sparc                 randconfig-002-20260627    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-8.5.0
sparc64               randconfig-001-20260627    gcc-8.5.0
sparc64                        randconfig-002    gcc-8.5.0
sparc64               randconfig-002-20260627    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-8.5.0
um                    randconfig-001-20260627    gcc-8.5.0
um                             randconfig-002    gcc-8.5.0
um                    randconfig-002-20260627    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260627    gcc-14
x86_64      buildonly-randconfig-002-20260627    gcc-14
x86_64      buildonly-randconfig-003-20260627    gcc-14
x86_64      buildonly-randconfig-004-20260627    gcc-14
x86_64      buildonly-randconfig-005-20260627    gcc-14
x86_64      buildonly-randconfig-006-20260627    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260627    clang-22
x86_64                randconfig-002-20260627    clang-22
x86_64                randconfig-003-20260627    clang-22
x86_64                randconfig-004-20260627    clang-22
x86_64                randconfig-005-20260627    clang-22
x86_64                randconfig-006-20260627    clang-22
x86_64                randconfig-011-20260627    gcc-14
x86_64                randconfig-012-20260627    gcc-14
x86_64                randconfig-013-20260627    gcc-14
x86_64                randconfig-014-20260627    gcc-14
x86_64                randconfig-015-20260627    gcc-14
x86_64                randconfig-016-20260627    gcc-14
x86_64                randconfig-071-20260627    clang-22
x86_64                randconfig-072-20260627    clang-22
x86_64                randconfig-073-20260627    clang-22
x86_64                randconfig-074-20260627    clang-22
x86_64                randconfig-075-20260627    clang-22
x86_64                randconfig-076-20260627    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-8.5.0
xtensa                randconfig-001-20260627    gcc-8.5.0
xtensa                         randconfig-002    gcc-8.5.0
xtensa                randconfig-002-20260627    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

