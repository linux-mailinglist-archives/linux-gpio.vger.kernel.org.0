Return-Path: <linux-gpio+bounces-4124-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D03871260
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 02:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 763E62825C2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 01:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C69317C6A;
	Tue,  5 Mar 2024 01:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/m1kkTK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF8917BA0
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709602650; cv=none; b=bS4kGTWxORCVLPZlkfMJL1CE4oCKUQvt0m4LCcnFXBhEQpLCJ2P8itSA6YDYNtSqo4DkvZ4JPAskJnOVyCu0sAv8TxAOeiDPczwREfCv6gyDZho4WROAqm05HAJ4MncLD08eKODEn8nCAeIwWPVYDAJEBPYLT2QL2c/lLl7LfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709602650; c=relaxed/simple;
	bh=NUG0uC4qsZxl8pBMG398Sy4krjqF1JmRXHrAX6rLfNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGtqK/tmQfCPyvTTZpXg44bHIWGt4RdYbRDdaiLYuesP+5CPJo/jL1qYo4gH6cDUGR2ZZ7qpCTaM2HgoblyI7EV8YRfW0SutmSU3sFOeDgKuHVj62nS0UtBTaZYIu9A8xjppl0wu3SZzz8BXP9f4LbsACsJLoKwLoxq/CDSBE5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/m1kkTK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709602650; x=1741138650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUG0uC4qsZxl8pBMG398Sy4krjqF1JmRXHrAX6rLfNc=;
  b=j/m1kkTKynVmL2CRMkBYk3dkqpUagEWPG5vCeRs/cll9bwckYdKAyzH2
   r8/kBrEVXpuaHjt+HKTsEm3IWEcVkxyea7qoC9hEmTVbeQW+AuegiJJab
   N0wiR0y4Sx5hcb1BlzWKsu2oGy2EEMZlcoy/+FIm1786IMu5VbkINIdKw
   6qeSaprXLy0RXikhrxwhiqwuAdLhRuw1IMCk1vWJFnPW0p+W8ELLBZTHc
   4gsZ1ixsZkBHRqzuRpicT2v3pKA/9KqSryzhNThLNczIpDC1Z3uhIvHL1
   6D/zm1wWDzQ/aAVlXcwXG6aLa/YhI4ZN4qyP+vrnyngjkXTF4xB7nDW62
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4252110"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4252110"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 17:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9300256"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2024 17:37:27 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhJkC-0002u9-1n;
	Tue, 05 Mar 2024 01:37:24 +0000
Date: Tue, 5 Mar 2024 09:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	David Bauer <mail@david-bauer.net>
Subject: [linusw-pinctrl:b4/awinic-aw9523 2/2]
 drivers/pinctrl/pinctrl-aw9523.c:582: warning: Function parameter or struct
 member 'awi' not described in '_aw9523_gpio_get_multiple'
Message-ID: <202403050916.KBtE6eEj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git b4/awinic-aw9523
head:   70c38171f464ba4b47c120a90c11388a43fffa6a
commit: 70c38171f464ba4b47c120a90c11388a43fffa6a [2/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240305/202403050916.KBtE6eEj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050916.KBtE6eEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050916.KBtE6eEj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-aw9523.c:582: warning: Function parameter or struct member 'awi' not described in '_aw9523_gpio_get_multiple'
>> drivers/pinctrl/pinctrl-aw9523.c:582: warning: Function parameter or struct member 'mask' not described in '_aw9523_gpio_get_multiple'
>> drivers/pinctrl/pinctrl-aw9523.c:582: warning: Excess function parameter 'regmap' description in '_aw9523_gpio_get_multiple'
>> drivers/pinctrl/pinctrl-aw9523.c:582: warning: Excess function parameter 'pin' description in '_aw9523_gpio_get_multiple'


vim +582 drivers/pinctrl/pinctrl-aw9523.c

   570	
   571	/**
   572	 * _aw9523_gpio_get_multiple - Get I/O state for an entire port
   573	 * @regmap: Regmap structure
   574	 * @pin: gpiolib pin number
   575	 * @regbit: hw pin index, used to retrieve port number
   576	 * @state: returned port I/O state
   577	 *
   578	 * Return: Zero for success or negative number for error
   579	 */
   580	static int _aw9523_gpio_get_multiple(struct aw9523 *awi, u8 regbit,
   581					     u8 *state, u8 mask)
 > 582	{
   583		u32 dir_in, val;
   584		u8 m;
   585		int ret;
   586	
   587		/* Registers are 8-bits wide */
   588		ret = regmap_read(awi->regmap, AW9523_REG_CONF_STATE(regbit), &dir_in);
   589		if (ret)
   590			return ret;
   591		*state = 0;
   592	
   593		m = mask & dir_in;
   594		if (m) {
   595			ret = regmap_read(awi->regmap, AW9523_REG_IN_STATE(regbit),
   596					  &val);
   597			if (ret)
   598				return ret;
   599			*state |= (u8)val & m;
   600		}
   601	
   602		m = mask & ~dir_in;
   603		if (m) {
   604			ret = regmap_read(awi->regmap, AW9523_REG_OUT_STATE(regbit),
   605					  &val);
   606			if (ret)
   607				return ret;
   608			*state |= (u8)val & m;
   609		}
   610	
   611		return 0;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

