Return-Path: <linux-gpio+bounces-34354-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLZ4JfRLyGn1jgUAu9opvQ
	(envelope-from <linux-gpio+bounces-34354-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 22:45:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 123F7350108
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 22:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E47653020860
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Mar 2026 21:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD8F372690;
	Sat, 28 Mar 2026 21:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaqvtwxP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84B2346AC2;
	Sat, 28 Mar 2026 21:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774734247; cv=none; b=clhb8AUlrkh0aKW9hWuVg/TBjf/K7fTSqHeD2DfZfn+182eAJSG0OKP0eY0Lui+A56W/OQUv/w2bmUIQjZMWKoQjLJanULjvDBjPipIwSjhVLCelZA219XAcoNNNNmfg2Kym5EPVY724GaOzmHq2goYATcgo7grHrABropzebXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774734247; c=relaxed/simple;
	bh=pTaIRF05eUSnh7ITUOAxQRdSFzmhR1m8AG4YR7CBpy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZloWn7EuW69hNAotU/zDNX2ihvrk/UpLYkfwxrS88ksBDwCwiU2lv72MoSL+qSaqiRSb+8cOBHDvtef8ceBPyNdTWTyumZUEfT/MpeQRglg7VtSzrLOI8IU3AwrWCBYgmsAM6M/i1a4KYUuJQNOVIK7hAZ6nSGxvmdgJCUxIMpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaqvtwxP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774734244; x=1806270244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pTaIRF05eUSnh7ITUOAxQRdSFzmhR1m8AG4YR7CBpy8=;
  b=GaqvtwxPPSmMCzwiZt/5b+l+eeRqkZxFqJC2wZKVsce07ZT82xx66+yY
   dd6LhhosgA6/h1aPOs/44MkV0SWHAbbNmzoHUMjNTVzTltvSPbkcwdRRJ
   d4jn52t4paetMoZOCYP50BdZJTfW39luR9Q3dbMHGnefJxzaWgrX+W67L
   tUq84JFb+ZXVg4I5zFriomh//m9gIW3fnaqHR1/Vj0WNWGe/PEEgMHLCo
   Bv8vPrvC9SUeW0Iax1s6lT6v51YdZaqm9kEarO0gIrscSDmz/RUnNLS5H
   iKKwDO013l3m9IK57WYcYsZ3kGre0KSDBAwG2dFRKVdfy2Sa8Cf00QPi5
   A==;
X-CSE-ConnectionGUID: u1J43wbYQMuVMLdLiQ/RqQ==
X-CSE-MsgGUID: e6QMMBcnSk6LbJAkeVoUCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86078190"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86078190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 14:44:04 -0700
X-CSE-ConnectionGUID: 4tDmfR+KTXCKh2mQvlbrHA==
X-CSE-MsgGUID: qilT9Ai5Suyuaq+7qEE82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="222330962"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2026 14:44:01 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6bRm-00000000Bnp-3xr8;
	Sat, 28 Mar 2026 21:43:58 +0000
Date: Sun, 29 Mar 2026 05:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
Message-ID: <202603290505.16AYT5so-lkp@intel.com>
References: <20260325-ipq5210_tlmm-v3-2-3a4b9bb6b1fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ipq5210_tlmm-v3-2-3a4b9bb6b1fc@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34354-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 123F7350108
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kathiravan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c]

url:    https://github.com/intel-lab-lkp/linux/commits/Kathiravan-Thirumoorthy/dt-bindings-pinctrl-qcom-add-IPQ5210-pinctrl/20260327-002731
base:   85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
patch link:    https://lore.kernel.org/r/20260325-ipq5210_tlmm-v3-2-3a4b9bb6b1fc%40oss.qualcomm.com
patch subject: [PATCH v3 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260329/202603290505.16AYT5so-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290505.16AYT5so-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290505.16AYT5so-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-ipq5210.c:377:30: warning: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Wstring-concatenation]
     377 |         "gpio40", "gpio41", "gpio42""gpio43",
         |                                     ^
         |                                     ,
   drivers/pinctrl/qcom/pinctrl-ipq5210.c:377:22: note: place parentheses around the string literal to silence warning
     377 |         "gpio40", "gpio41", "gpio42""gpio43",
         |                             ^
   1 warning generated.


vim +377 drivers/pinctrl/qcom/pinctrl-ipq5210.c

   375	
   376	static const char *const audio_sec_groups[] = {
 > 377		"gpio40", "gpio41", "gpio42""gpio43",
   378	};
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

