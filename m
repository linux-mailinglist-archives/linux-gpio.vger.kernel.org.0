Return-Path: <linux-gpio+bounces-19768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF7BAAF30D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 07:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65C611C02689
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 05:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412A42153C5;
	Thu,  8 May 2025 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZpYc3R1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D68472;
	Thu,  8 May 2025 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682995; cv=none; b=cKl6dINV8LQw59EAXsZaYEGuAmikdaJq4ZhU7Ebpr4Y2eJagIFmFi41dl8FPMrzYFGDcyVR+bKSImMEAzck5u1/aqUT4nuqi2psZbOygJHK7bRXkFnCjii3qWtohEKJGLJ0xirDVgebQT+taoO3cKlAEZCN5Dn5TX7dy4XPVlqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682995; c=relaxed/simple;
	bh=bJnTVWWAoPsi/gOCsSmayqk7WS4HGxFcME0P4yAMNnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcc8jVegTiqwSwHkYmyKUcGxoc8XYtsltS3K0tIBlcM24BEZrWU+MldrkjCMst4qJg7C4wG1ahGef0rFIuJROQH9UgNwD5g0eqMsNpKsFD7qhRoxEvKPCDlEjxICFDStJ7XQwuAM2rdxeCnzozsiKQUq5RUbHBcjNIqH0tgwQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZpYc3R1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746682993; x=1778218993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bJnTVWWAoPsi/gOCsSmayqk7WS4HGxFcME0P4yAMNnk=;
  b=BZpYc3R1sqll+ImXZ6yHGHvbDArb/w/Qurug2T7Pt+qEeZdEM2vKPaYS
   m0TpjB40exo+LytWwVYQV34HbtBjnPihUcW4vYyPbdhhhfOrEN8IBIPY0
   zm66OcB997NfUjAN0AIThmeMPE4BGwIfm8+dDtSVAQfr3FzW3Y8OVc8sM
   ZTyry7s3T+isFfVqWe57tWNeNI8CLNCQyeTlWg/pPSHFjNPimF2rRxqlN
   5P5uLvzA5nNoi5o3pdZsGKxn7kJn5cYstbbHcTMBp2ti8Oys/fQd1xiv4
   C9z+eOFyX6yFHuGGH5j3bX44Bt+Vb8h4EysdpvvYMwhxyBGlKDCXhqCVq
   Q==;
X-CSE-ConnectionGUID: LpZ76HDBQ1e1PIbiwHShQg==
X-CSE-MsgGUID: J9j+G0dZSpS3rTUSyrplsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="73829759"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="73829759"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:43:12 -0700
X-CSE-ConnectionGUID: Wy1ixSdURoa0eiLmwwRbfA==
X-CSE-MsgGUID: XdNwMjLTQf++QnlSFVtUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="137177988"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2025 22:43:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCu2D-000AR5-0z;
	Thu, 08 May 2025 05:43:05 +0000
Date: Thu, 8 May 2025 13:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: luyulin <luyulin@eswincomputing.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kees@kernel.org,
	gustavoars@kernel.org, brgl@bgdev.pl,
	linux-hardening@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, zhengyu@eswincomputing.com,
	ningyu@eswincomputing.com, huangyifeng@eswincomputing.com,
	linmin@eswincomputing.com, fenglin@eswincomputing.com,
	lianghujun@eswincomputing.com, luyulin <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 2/2] pinctrl: eswin: Add eic7700 pinctrl driver
Message-ID: <202505081214.tUfDpIv3-lkp@intel.com>
References: <20250506091241.941-1-luyulin@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506091241.941-1-luyulin@eswincomputing.com>

Hi luyulin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/luyulin/pinctrl-eswin-Add-eic7700-pinctrl-driver/20250506-181212
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250506091241.941-1-luyulin%40eswincomputing.com
patch subject: [PATCH 2/2] pinctrl: eswin: Add eic7700 pinctrl driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505081214.tUfDpIv3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081214.tUfDpIv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081214.tUfDpIv3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:123:9: note: in expansion of macro 'EIC7700_PIN'
     123 |         EIC7700_PIN(0,   "chip_mode",           [0] = F_CHIP_MODE),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:123:9: note: in expansion of macro 'EIC7700_PIN'
     123 |         EIC7700_PIN(0,   "chip_mode",           [0] = F_CHIP_MODE),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:123:9: note: in expansion of macro 'EIC7700_PIN'
     123 |         EIC7700_PIN(0,   "chip_mode",           [0] = F_CHIP_MODE),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:124:9: note: in expansion of macro 'EIC7700_PIN'
     124 |         EIC7700_PIN(1,   "mode_set0",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:124:9: note: in expansion of macro 'EIC7700_PIN'
     124 |         EIC7700_PIN(1,   "mode_set0",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:124:9: note: in expansion of macro 'EIC7700_PIN'
     124 |         EIC7700_PIN(1,   "mode_set0",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:125:9: note: in expansion of macro 'EIC7700_PIN'
     125 |         EIC7700_PIN(2,   "mode_set1",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:125:9: note: in expansion of macro 'EIC7700_PIN'
     125 |         EIC7700_PIN(2,   "mode_set1",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:125:9: note: in expansion of macro 'EIC7700_PIN'
     125 |         EIC7700_PIN(2,   "mode_set1",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:126:9: note: in expansion of macro 'EIC7700_PIN'
     126 |         EIC7700_PIN(3,   "mode_set2",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:126:9: note: in expansion of macro 'EIC7700_PIN'
     126 |         EIC7700_PIN(3,   "mode_set2",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:126:9: note: in expansion of macro 'EIC7700_PIN'
     126 |         EIC7700_PIN(3,   "mode_set2",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:127:9: note: in expansion of macro 'EIC7700_PIN'
     127 |         EIC7700_PIN(4,   "mode_set3",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:127:9: note: in expansion of macro 'EIC7700_PIN'
     127 |         EIC7700_PIN(4,   "mode_set3",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:127:9: note: in expansion of macro 'EIC7700_PIN'
     127 |         EIC7700_PIN(4,   "mode_set3",           [0] = F_SDIO, [2] = F_GPIO),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:128:9: note: in expansion of macro 'EIC7700_PIN'
     128 |         EIC7700_PIN(5,   "xin",                 [0] = F_OSC),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:128:9: note: in expansion of macro 'EIC7700_PIN'
     128 |         EIC7700_PIN(5,   "xin",                 [0] = F_OSC),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:128:9: note: in expansion of macro 'EIC7700_PIN'
     128 |         EIC7700_PIN(5,   "xin",                 [0] = F_OSC),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:129:9: note: in expansion of macro 'EIC7700_PIN'
     129 |         EIC7700_PIN(6,   "rtc_xin",             [0] = F_DISABLED),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:129:9: note: in expansion of macro 'EIC7700_PIN'
     129 |         EIC7700_PIN(6,   "rtc_xin",             [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:129:9: note: in expansion of macro 'EIC7700_PIN'
     129 |         EIC7700_PIN(6,   "rtc_xin",             [0] = F_DISABLED),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:130:9: note: in expansion of macro 'EIC7700_PIN'
     130 |         EIC7700_PIN(7,   "rst_out_n",           [0] = F_RESET),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:130:9: note: in expansion of macro 'EIC7700_PIN'
     130 |         EIC7700_PIN(7,   "rst_out_n",           [0] = F_RESET),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:130:9: note: in expansion of macro 'EIC7700_PIN'
     130 |         EIC7700_PIN(7,   "rst_out_n",           [0] = F_RESET),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:131:9: note: in expansion of macro 'EIC7700_PIN'
     131 |         EIC7700_PIN(8,   "key_reset_n",         [0] = F_RESET),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:131:9: note: in expansion of macro 'EIC7700_PIN'
     131 |         EIC7700_PIN(8,   "key_reset_n",         [0] = F_RESET),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:131:9: note: in expansion of macro 'EIC7700_PIN'
     131 |         EIC7700_PIN(8,   "key_reset_n",         [0] = F_RESET),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:132:9: note: in expansion of macro 'EIC7700_PIN'
     132 |         EIC7700_PIN(9,   "rst_in_n",            [0] = F_DISABLED),
         |         ^~~~~~~~~~~
>> drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:132:9: note: in expansion of macro 'EIC7700_PIN'
     132 |         EIC7700_PIN(9,   "rst_in_n",            [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:132:9: note: in expansion of macro 'EIC7700_PIN'
     132 |         EIC7700_PIN(9,   "rst_in_n",            [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:133:9: note: in expansion of macro 'EIC7700_PIN'
     133 |         EIC7700_PIN(10,  "por_in_n",            [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:133:9: note: in expansion of macro 'EIC7700_PIN'
     133 |         EIC7700_PIN(10,  "por_in_n",            [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:133:9: note: in expansion of macro 'EIC7700_PIN'
     133 |         EIC7700_PIN(10,  "por_in_n",            [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:134:9: note: in expansion of macro 'EIC7700_PIN'
     134 |         EIC7700_PIN(11,  "por_out_n",           [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:134:9: note: in expansion of macro 'EIC7700_PIN'
     134 |         EIC7700_PIN(11,  "por_out_n",           [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:134:9: note: in expansion of macro 'EIC7700_PIN'
     134 |         EIC7700_PIN(11,  "por_out_n",           [0] = F_DISABLED),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:135:9: note: in expansion of macro 'EIC7700_PIN'
     135 |         EIC7700_PIN(12,  "gpio0",               [0] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:135:9: note: in expansion of macro 'EIC7700_PIN'
     135 |         EIC7700_PIN(12,  "gpio0",               [0] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:135:9: note: in expansion of macro 'EIC7700_PIN'
     135 |         EIC7700_PIN(12,  "gpio0",               [0] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:136:9: note: in expansion of macro 'EIC7700_PIN'
     136 |         EIC7700_PIN(13,  "por_sel",             [0] = F_RESET),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:136:9: note: in expansion of macro 'EIC7700_PIN'
     136 |         EIC7700_PIN(13,  "por_sel",             [0] = F_RESET),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:136:9: note: in expansion of macro 'EIC7700_PIN'
     136 |         EIC7700_PIN(13,  "por_sel",             [0] = F_RESET),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:39: error: expected expression before 'static'
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                       ^~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:137:9: note: in expansion of macro 'EIC7700_PIN'
     137 |         EIC7700_PIN(14,  "jtag0_tck",           [0] = F_JTAG, [1] = F_SPI, [2] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:119:72: error: expected '}' before '{' token
     119 |                 .drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
         |                                                                        ^
   drivers/pinctrl/pinctrl-eic7700.c:137:9: note: in expansion of macro 'EIC7700_PIN'
     137 |         EIC7700_PIN(14,  "jtag0_tck",           [0] = F_JTAG, [1] = F_SPI, [2] = F_GPIO),
         |         ^~~~~~~~~~~
   drivers/pinctrl/pinctrl-eic7700.c:116:9: note: to match this '{'
     116 |         { \
         |         ^
   drivers/pinctrl/pinctrl-eic7700.c:137:9: note: in expansion of macro 'EIC7700_PIN'
     137 |         EIC7700_PIN(14,  "jtag0_tck",           [0] = F_JTAG, [1] = F_SPI, [2] = F_GPIO),


vim +/static +119 drivers/pinctrl/pinctrl-eic7700.c

   114	
   115	#define EIC7700_PIN(_number, _name, ...) \
   116		{ \
   117			.number	= _number, \
   118			.name = _name, \
 > 119			.drv_data = (void *)&(static const struct eic7700_pin) { { __VA_ARGS__ } } \
   120		}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

