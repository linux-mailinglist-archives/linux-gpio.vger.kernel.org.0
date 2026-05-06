Return-Path: <linux-gpio+bounces-36258-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKpDHo/p+mlIUAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36258-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 09:11:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB64D70B5
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 09:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3E06301468C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 07:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A3A36EA8D;
	Wed,  6 May 2026 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qmluxh7Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D7336895D
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051463; cv=none; b=b2X078uECl6NbI/wsCHMwT4PLCJ/0bP3vlexhApGzdi0+4cUN4rDHTP7bACsfeWXa1JEuPssQiwENCGS2561g+SyCNP4H4mIwUMyUNz7wTjp1g2//6G2O7lErwOo0Y7kmQ/EoXBdtKdcZtKONQSiT3z7URMxrNfpMsWIYuUlvB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051463; c=relaxed/simple;
	bh=IHFHOBmXYBPm5KTZiarU0GfsN2kwgiTDNhjCA27wrEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZdugRPiqMo5R7vEEVLoz+D6ekYpM4EDhfqFjkowr4tzI3Ex1r6cdlf4XWkh6o65xGwnKqJtPD9LT5Jqp17lhg8A0E58x1TSiCCS33e0wSzwnOd92z3pYXVf6EY/Onsmnsfwpi0bLLw3SbWOslsAhTrZRC0ep8eclp7DRALyhIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qmluxh7Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778051463; x=1809587463;
  h=date:from:to:cc:subject:message-id;
  bh=IHFHOBmXYBPm5KTZiarU0GfsN2kwgiTDNhjCA27wrEc=;
  b=Qmluxh7ZQZjPmE+NiWHupGWdLeEyn3THuUoEmB1Nwzus/qSH+DTu0D3c
   9NtnXetdSlzBNZxq5qkFmnsdhRIVMZ0HMGxs/C8rOkkKEaYxj+Y9vEil8
   UyjalE/K/W1NJKjY7XVOQi0Pua3dJNAoIHkvGY/ODtAuhIVm2LKfxHSdt
   JWrqHybjCz2RqtI/J0Az7L97iP0t+EwFRem2EPHyETqLZ3jZUsFbnn3MP
   fthnHd6AIKT9+20EvLpA28AtsymaoCldX90KtBjTv+53eAThyo4Cw0vBJ
   z+xzqXDsHuUEXQEgCsQop/S1z2LCFZncaWQeh6uS5Fiy+3RwKPxm+oM5C
   w==;
X-CSE-ConnectionGUID: ij7fAteYQ/qqs901S4IL3Q==
X-CSE-MsgGUID: yALz/HuFRBKEO11fv0zDPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78861839"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78861839"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 00:11:02 -0700
X-CSE-ConnectionGUID: L+ropou7Sv+A7pLNphVvDQ==
X-CSE-MsgGUID: SgBf4SRCSnqtAQhZNZQQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="274188907"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 May 2026 00:11:01 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKWPK-000000000my-0W4Z;
	Wed, 06 May 2026 07:10:58 +0000
Date: Wed, 06 May 2026 15:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:ib-mux-pinctrl 1/5] Warning:
 drivers/mux/core.c:783 function parameter 'np' not described in
 '__devm_mux_state_get'
Message-ID: <202605061502.ullLjmtN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: F0AB64D70B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36258-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-mux-pinctrl
head:   34acc5a8adfb76f2de63c8b8317397fb72b0aec8
commit: 05e58da46d8e8f8b29bc9b47053bb0637891c06f [1/5] mux: add devm_mux_state_get_from_np() to get mux from child node
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260506/202605061502.ullLjmtN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061502.ullLjmtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061502.ullLjmtN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mux/core.c:783 function parameter 'np' not described in '__devm_mux_state_get'
>> Warning: drivers/mux/core.c:783 function parameter 'np' not described in '__devm_mux_state_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

