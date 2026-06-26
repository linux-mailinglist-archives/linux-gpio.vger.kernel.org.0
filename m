Return-Path: <linux-gpio+bounces-39043-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +ryDHDzePmrBMQkAu9opvQ
	(envelope-from <linux-gpio+bounces-39043-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 22:17:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B16CFF65
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 22:16:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=HNbhUYg2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39043-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39043-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34B4B301545A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 20:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFB83859FA;
	Fri, 26 Jun 2026 20:16:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED634DCE0
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 20:16:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505017; cv=none; b=PV9fUq2b/0cteWqz3fnpH/2u520GiLcSuSR+dyj5IUT6yRtPcsUyFhxpxuD7K5x3TLCEhunu7MbQ5k8TeAu5rztVGcxPVY+1gN86P8ptHu06fT9JqtStfyXagVtnt/7knPTtOCgcIlZvJjWAKyPbNge30MZms9LACxsBQui6JqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505017; c=relaxed/simple;
	bh=QfGrZVSiThOJ/J2WR61RKD9Udq/paJBr8MsowsZ0CWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bRroRO0tPlks3m1ul2lxq/lU5YiTvPHtGtL82Wey/XYMfXdMS/0AVQck3X+azLAX+g5gYTqMxBGAFsVlY+chVnuTECe78ALvdTeOI6fXi6jrYeUEYf3mWevQpIKX2btYM7If7m9C1uoj6Xgfwig/WI/vfn+rTbu//L+zXr2q8U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNbhUYg2; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782505015; x=1814041015;
  h=date:from:to:cc:subject:message-id;
  bh=QfGrZVSiThOJ/J2WR61RKD9Udq/paJBr8MsowsZ0CWU=;
  b=HNbhUYg2Qu/q2Bg4VBKQ41XPSdCxgcoum686Gq8xHPn8Sy0ugBpsWwWI
   mKtVJSSflOHG5NOdEvSg4fTuxeIbWGke9sQHxudo6KAIuzzwka7SpD+rz
   DpeIVIJxZpmsVL1tBD5/9OO+DC/k0Ijcuu3UAUJkw+HLbk6ZJ0p2yuxj9
   gHb0LbekoePmknqBk5IfSSBtndBBY5i4pzsjEHD0khQK06wzGJKyWd+zH
   Rs51wsQGXE93oq8Zv+g96i73Tl/iMeIaOTK02DG/DF+7r4kQmQK/mDQ0n
   aB75uuRrjt6PkrtTBmz6ThtbDwkdn6Z1BWk2hpoxN0CZVc0KG/UOAqr/7
   Q==;
X-CSE-ConnectionGUID: 30WquF11SuSLwY71X611qQ==
X-CSE-MsgGUID: ceeDwZKBSzWETOnT4E7K1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94790270"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="94790270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 13:16:55 -0700
X-CSE-ConnectionGUID: IIzqgK3BTtq2PLKzgbXTsg==
X-CSE-MsgGUID: oXmmBPkrS9mIdwRXqEmTQQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jun 2026 13:16:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdCyo-000000005PR-15nU;
	Fri, 26 Jun 2026 20:16:50 +0000
Date: Sat, 27 Jun 2026 04:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tzuyi Chang <tychang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 "Yu-Chun Lin" <eleanor.lin@realtek.com>
Subject: [brgl:gpio/for-next 7/8] Warning:
 drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in
 'rtd1625_gpio_info'
Message-ID: <202606270433.gAWekfd3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39043-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tychang@realtek.com,m:oe-kbuild-all@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:eleanor.lin@realtek.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 689B16CFF65

Hi Tzuyi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   415c63896b76fd98883e190bc7518383cb01779c
commit: a57e27c43b0315ee86c6896510d69be5257e093e [7/8] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
config: sh-randconfig-002-20260627 (https://download.01.org/0day-ci/archive/20260627/202606270433.gAWekfd3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270433.gAWekfd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270433.gAWekfd3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'
>> Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

