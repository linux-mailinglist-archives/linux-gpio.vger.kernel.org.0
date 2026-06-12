Return-Path: <linux-gpio+bounces-38375-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HEkOAQpPLGqoPAQAu9opvQ
	(envelope-from <linux-gpio+bounces-38375-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 20:25:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6272A67BA88
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 20:25:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=QySR2KP0;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38375-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38375-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0943E31F3532
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 18:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6905337BE9C;
	Fri, 12 Jun 2026 18:18:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A7638239B
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 18:18:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288295; cv=none; b=XnI4ve+/1OLAALt+9qLcI3rLApXF9kIG/ilBwXfDsewN3VqoCQZnkIoDTaqjnI04ySihg1I+vmJXpW92T3ag3cdKvpV7bKBEYMlAX4Jeq1t1YzKll6oW5KrAPROzPxkujcdQ42kvGqRlBQyiLFBb1liMdhKslwtNP2UA5niNHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288295; c=relaxed/simple;
	bh=GgXwtHCxCdjGr2EMLikfw9VatVYG3ZHRAJxS0RtI0o0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iJJ64oJxjHeBahtBFgCWMG5RGRFw//yyLxXnGoL9/w7Uh11G1tQcTuV08mZpA4U4L5wlvifoGwgmrkwInZJGyVKyLQF/HkonWr8vVS+A6cAXowIUmPHmyroPUYiQCicZRzOnKrOH+kmQNUazVD5BPt8fx50Vjvx35vtQl9bWfzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QySR2KP0; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781288294; x=1812824294;
  h=date:from:to:cc:subject:message-id;
  bh=GgXwtHCxCdjGr2EMLikfw9VatVYG3ZHRAJxS0RtI0o0=;
  b=QySR2KP0RyNKo3EoALDdQbjNTPqGul48lRv7ri3s+5eqQydaUUX33SlY
   +vTrhIq8JG4IzR+DOqDP6MUDfA55iJU+DwTnRfMllrjGuiAw2pAJZHn8t
   xKGqRQvJQb/o2X1U0HoCjhkQMKt9G/wdvyTdWIXY8pP/BXRQwHZLFdgHN
   jE50nfQ75FhxfI9B6smn+tb+a90M7OubzTJvD0MTaBqy/wjcyxszxLlRE
   npSVUySkBhNFvXME1Q3USs0dzQkLftPHEIhwYUKsYQ363Z92EWpoAVMyj
   KNLACRLcdSe5P4EvfvljlPYrDEisoXP+fwpldd94gKbGNlyk+6F6usyd1
   w==;
X-CSE-ConnectionGUID: oPyqtaFTQ8KjFgTH0TwQPw==
X-CSE-MsgGUID: ZwpLRV1qTIu8ZhLuh4tZKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85969208"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="85969208"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 11:18:13 -0700
X-CSE-ConnectionGUID: +vqLKWf9T+irdFBg0Zrxtg==
X-CSE-MsgGUID: gisD8UCbQmeAb2PyXyWVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="251170555"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2026 11:18:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY6SG-00000000PBJ-1fAc;
	Fri, 12 Jun 2026 18:18:08 +0000
Date: Sat, 13 Jun 2026 02:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [linusw-pinctrl:devel 125/127] ERROR: modpost:
 "pinctrl_get_group_selector" [drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.ko]
 undefined!
Message-ID: <202606130210.ytVPxHlm-lkp@intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38375-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wangjia@ultrarisc.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6272A67BA88

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   981aefd53b3cdafae0e45332a1023b80d67f52be
commit: cb7037924836a352e767f69f1aa65b82f3e815f4 [125/127] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606130210.ytVPxHlm-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c8ad049db78ae52052722b6f42b54cd2a666072b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130210.ytVPxHlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pinctrl_get_group_selector" [drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

