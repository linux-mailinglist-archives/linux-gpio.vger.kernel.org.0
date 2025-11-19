Return-Path: <linux-gpio+bounces-28849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D0C7105D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0CC6D346AC0
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 20:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6645A2EFD9C;
	Wed, 19 Nov 2025 20:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ufor4LFs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA72EFDA2;
	Wed, 19 Nov 2025 20:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763583279; cv=none; b=Og/82N2ee2PgaHR7D46Phx7Uv2XSUGhy7grruPmNyOL1NIlCiFTiHOMOnXBq1wkqEYlSp0YpTawLlvwgnhpxDsxnsT2OwAe8JMVYk06EHYTpvIiRRrb/PHrQAjPkUm7baE2RoWdubYyPZk9qFxaPBL0N8M6iW2ne1vIha78Iyo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763583279; c=relaxed/simple;
	bh=5zFI2J6L5cGPd8keuXbDZmyTrrKwNaNZTRwSbN8wMhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bwc9jf/gzUqimFgvq3HWoM6/7L4gf71kHkNbXTlNnslNLaJEa62qDfti0ITAwkDHwfUUCYHWOMy8Ioj1ppZBW+3R88ggKOJeqW+4XdkOw5HKRkJzJVLyOu0D9EoqdVU/vXnFzBctE/jt0tQ5dqptcRB+9WJfdUlIDq6ZTc/JorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ufor4LFs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763583277; x=1795119277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5zFI2J6L5cGPd8keuXbDZmyTrrKwNaNZTRwSbN8wMhM=;
  b=Ufor4LFsu7MWGTYYxffQ2c85f8DUGQT80Orkf+jqYw2O5dUzKF20/WVY
   nj4Ywj8vw5+3w8gOAeDmUAjcTGT//h8wXMd7Q5xvHygQPtwssolIdSa6N
   1rNS2AJ6cA9oVeYRfyenZwaVATIEZJc6gIoykRDvNGTdxhSlUxxRhpIoR
   PkN4KIVT71L0BSe+t2ruBHfWfQdEESSEXs+sp5T9dp0jCF4Enzhhugl+l
   Qag1kSRdmDqbhZJVuVp0P5UPyT8vskHxgetO/rZAmo2roZK06W9DPUbJr
   ax0vOG9E3O29HP9bXi6EzCDCVhBKZEoDnmCLA9FzgcmDyCs5Z8+EHR/1P
   A==;
X-CSE-ConnectionGUID: IzwA4XqbRIiHCkf9u3XotQ==
X-CSE-MsgGUID: uZqN7SpaRBGn0DsrYAGU7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69507938"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="69507938"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:14:36 -0800
X-CSE-ConnectionGUID: XlPMtS8OQiWEq/+UwCA5FQ==
X-CSE-MsgGUID: hKY+GDzgR/6wxpaQNZa5vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191593280"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2025 12:14:34 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLoZU-0003Gl-0P;
	Wed, 19 Nov 2025 20:14:32 +0000
Date: Thu, 20 Nov 2025 04:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: 429368636@qq.com, lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pavel@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-gpio@vger.kernel.org, zhangxinyu <gavin.zhang@faiot.com>
Subject: Re: [PATCH] leds: add aw91xxx driver
Message-ID: <202511200356.hnFjtAe6-lkp@intel.com>
References: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/429368636-qq-com/leds-add-aw91xxx-driver/20251117-175335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908%40qq.com
patch subject: [PATCH] leds: add aw91xxx driver
config: arc-randconfig-002-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200356.hnFjtAe6-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200356.hnFjtAe6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200356.hnFjtAe6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/leds/leds-aw91xxx.o: in function `aw91xxx_key_feature_init':
>> leds-aw91xxx.c:(.text+0x11f4): undefined reference to `input_allocate_device'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x11f4): undefined reference to `input_allocate_device'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x128c): undefined reference to `input_register_device'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x128c): undefined reference to `input_register_device'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x1380): undefined reference to `input_free_device'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x1380): undefined reference to `input_free_device'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x1428): undefined reference to `input_unregister_device'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x1428): undefined reference to `input_unregister_device'
   arc-linux-ld: drivers/leds/leds-aw91xxx.o: in function `aw91xxx_i2c_probe':
>> leds-aw91xxx.c:(.text+0x1bc6): undefined reference to `input_unregister_device'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x1bc6): undefined reference to `input_unregister_device'
   arc-linux-ld: leds-aw91xxx.c:(.text+0x1bd0): undefined reference to `input_free_device'
   arc-linux-ld: leds-aw91xxx.c:(.text+0x1bd0): undefined reference to `input_free_device'
   arc-linux-ld: drivers/leds/leds-aw91xxx.o: in function `aw91xxx_key_work':
>> leds-aw91xxx.c:(.text+0x1dac): undefined reference to `input_event'
>> arc-linux-ld: leds-aw91xxx.c:(.text+0x1dac): undefined reference to `input_event'
   arc-linux-ld: leds-aw91xxx.c:(.text+0x1dba): undefined reference to `input_event'
   arc-linux-ld: leds-aw91xxx.c:(.text+0x1dba): undefined reference to `input_event'
   arc-linux-ld: leds-aw91xxx.c:(.text+0x1eb4): undefined reference to `input_event'
   arc-linux-ld: drivers/leds/leds-aw91xxx.o:leds-aw91xxx.c:(.text+0x1eb4): more undefined references to `input_event' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

