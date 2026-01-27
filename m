Return-Path: <linux-gpio+bounces-31168-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHdiEizneGmHtwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31168-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 17:26:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4497BB2
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 17:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F064301F320
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 16:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2A235EDC9;
	Tue, 27 Jan 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaucpk/D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050FD34D3A9
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769531141; cv=none; b=iaMGuj82Ff/bBEuwr6V3PViiIJmrlsjCiBnJDS2Mcum3PUS7NGzz9hZApRXsy7yfq8fZWwVqmL08pumb8go1AyZ+kKoXU3592dTnZDaRodxdlC3+cSP16GCtuTZ0AWu/0JNC8fSGrLBjTzHWOKkI+otpeyADCCL2zUApFldFbTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769531141; c=relaxed/simple;
	bh=SquELq7cPUbDPNz1bo/h7E0OnGF1secFHCMpBgcWdQc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=clpzHx+jPZ8V++6tk2u9Zo7AZIQzT7IhiV4YMcc0Ia9Jmv5V4IHqpwz4cGvvtf6ulKf99TsKU3op88qUwGGmvuwUFWaWDXLzOJY3NKRP53JHArfAvQphtuQt0amnfMrBHVJ98GZ/XSM06Os+NbzO8YccChJSmO+/CKCWOZsq+QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaucpk/D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769531140; x=1801067140;
  h=date:from:to:cc:subject:message-id;
  bh=SquELq7cPUbDPNz1bo/h7E0OnGF1secFHCMpBgcWdQc=;
  b=gaucpk/DcPMy/qE26tt7CD4P9YpYNBG6e10JxqqLI1VO4oTEzcgG1yeL
   5kNuQU7BvVwCasIbZHCbTa/1yur0c+3xsac6S5q4IrfUKubrxgPrFzdpU
   ezPH+xuALJcJTeHPD0m3l3ByjXFECRB0yri8tqKYwaZpXt58rwrpzaM3w
   MeNlsI2PDKpCq67kXoJMRv+yRNC8GJSOY6iKDMrbRS+TXMiIbmLLYmevV
   N1bS4lxUpdt+IwEiBBHcXM4YYPqNPZAgnifI0/ZC+Ov8XMDq7z9sMPiFq
   NDF8xhn3V5U8Ysl2eMy1rc+Lt+EK79UU9vV07DoSrA1+fHLSXSYIxanR7
   Q==;
X-CSE-ConnectionGUID: 6BhZE3wIRv+i2wPXuL0B8g==
X-CSE-MsgGUID: mJBRjA+nTwqwP2S2FniBjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81363447"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81363447"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 08:25:40 -0800
X-CSE-ConnectionGUID: /1q6a6LeTtu5V+e8ec9R3A==
X-CSE-MsgGUID: z8UT0OFAQEWT/UzZyfr8nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="239262845"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2026 08:25:38 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vklsl-000000001u5-3kA2;
	Tue, 27 Jan 2026 16:25:35 +0000
Date: Tue, 27 Jan 2026 17:24:53 +0100
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>
Subject: [linusw-pinctrl:devel 39/46] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_PINCTRL when selected by
 PINCTRL_POLARFIRE_SOC
Message-ID: <202601271725.gqlQ8Jl7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[pgazz.com,gmail.com,lists.linux.dev,vger.kernel.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31168-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: ABE4497BB2
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   ebd2f48dff6ae15bc1cbc7c7ae3c5fe10ad08087
commit: 488d704ed7b7e7afeef24ee846c8223b607357b7 [39/46] pinctrl: add polarfire soc mssio pinctrl driver
config: i386-kismet-CONFIG_GENERIC_PINCTRL-CONFIG_PINCTRL_POLARFIRE_SOC-0-0 (https://download.01.org/0day-ci/archive/20260127/202601271725.gqlQ8Jl7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601271725.gqlQ8Jl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271725.gqlQ8Jl7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCTRL when selected by PINCTRL_POLARFIRE_SOC
   WARNING: unmet direct dependencies detected for GENERIC_PINCTRL
     Depends on [n]: PINCTRL [=y] && GENERIC_PINCONF [=y] && GENERIC_PINCTRL_GROUPS [=n] && GENERIC_PINMUX_FUNCTIONS [=y]
     Selected by [y]:
     - PINCTRL_POLARFIRE_SOC [=y] && PINCTRL [=y] && (ARCH_MICROCHIP || COMPILE_TEST [=y]) && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

