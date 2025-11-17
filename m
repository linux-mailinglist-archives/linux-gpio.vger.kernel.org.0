Return-Path: <linux-gpio+bounces-28608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3DC66489
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 22:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 91CA2360A5E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 21:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2092B319860;
	Mon, 17 Nov 2025 21:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXBxU2E6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429D5259CBB;
	Mon, 17 Nov 2025 21:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763415420; cv=none; b=hFvWh1jOFCDczd6iyz8KTiCFtlnMvJuAXeYo5NWeIu4bCQ1n5jIaab+CIML83U/PenH1MYjJxvCejR1q83NlIpzo1lO1cb47w7vWIeEUnZFR+zow12EWV3wkNrg49uwuVsIVPX+cL+XAaznlh1IxrPXwNEiizSL5t0Afa+bZJR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763415420; c=relaxed/simple;
	bh=6CE0XwuC0D25DC3weDTCkqDiTsmuX4PsYo/1eVQJM4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDDanhD0mfRwucaeGJJEgh8uyKb1LBuLMOgpL4tV9Q4uUNBj2u24rXEw1sQ31D8n2wYv2q15gm/imlOCKT2gnNO/beCyAfICBkc1Qt527eHbcTQchdWBtoaCovHIuj8nXfz+DnknzX4+Wd7Ok3NnfiTAARztm2HeMxzQLnC8nZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXBxU2E6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763415418; x=1794951418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6CE0XwuC0D25DC3weDTCkqDiTsmuX4PsYo/1eVQJM4g=;
  b=IXBxU2E64K6ryzqAM0GHRp5Ym8vVwcbLZSwm0MnvAoI2TB+v3kLMy9T4
   +bs8bEPZ2ytTLP/64VNKVY8ptgaIULB2gz9NFk4mKxj1UExotpmGlHKyB
   52jgYem3EHi4dVvxc1U5lQIf+NoWtX7Uz5pbS22Gwlb6fccRAvsDlHjEE
   s0310fUcQ710Xp3IjobEWuXd7XfZwfv4qc8iip7enr2feY9dve3RvHroF
   SbSOY4UX4nvoVDAiekS819+HKgnw0JHH3q4ug11YR9oa4//1Uz/TaSZmE
   gid59y9O1lmEUL8i3MXvO8P0VLORsO+Gh7ZF90MQHEXHXeh3S0F7YlRuT
   g==;
X-CSE-ConnectionGUID: 0MbbC7LQRXuxFMGAug+wnQ==
X-CSE-MsgGUID: 2pnUPnY2RkOS38wLVIC2dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65360959"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65360959"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 13:36:57 -0800
X-CSE-ConnectionGUID: WSUCsyKHTHqrhuC/w77TjQ==
X-CSE-MsgGUID: o64Un8tXRdu8TjTmrq0Dlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="191006778"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Nov 2025 13:36:54 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL6u3-00015P-2d;
	Mon, 17 Nov 2025 21:36:51 +0000
Date: Tue, 18 Nov 2025 05:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: 2724853925@qq.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	2724853925@qq.com
Subject: Re: [PATCH] input: touchscreen: Add ilitek touchscreen driver support
Message-ID: <202511180542.hR4anHLj-lkp@intel.com>
References: <tencent_995E6FC62EDBC1EED14E6052847F270F6406@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_995E6FC62EDBC1EED14E6052847F270F6406@qq.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus linus/master v6.18-rc6 next-20251117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/2724853925-qq-com/input-touchscreen-Add-ilitek-touchscreen-driver-support/20251116-215220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/tencent_995E6FC62EDBC1EED14E6052847F270F6406%40qq.com
patch subject: [PATCH] input: touchscreen: Add ilitek touchscreen driver support
config: riscv-randconfig-r133-20251118 (https://download.01.org/0day-ci/archive/20251118/202511180542.hR4anHLj-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180542.hR4anHLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180542.hR4anHLj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:93:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const *buf @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:93:38: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:93:38: sparse:     got char const *buf
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:239:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:239:45: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:239:45: sparse:     got unsigned char [usertype] *
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:268:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:268:35: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:268:35: sparse:     got unsigned char [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:279:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:279:35: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:279:35: sparse:     got unsigned char [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:286:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:286:35: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:286:35: sparse:     got unsigned char [usertype] *
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:307:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__p @@     got signed int [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:307:21: sparse:     expected void [noderef] __user *__p
   drivers/input/touchscreen/ilitek/ilitek_tool.c:307:21: sparse:     got signed int [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:312:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:312:45: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:312:45: sparse:     got unsigned char [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:324:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:324:45: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:324:45: sparse:     got unsigned char [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:340:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:340:45: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:340:45: sparse:     got unsigned char [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:365:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:365:35: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:365:35: sparse:     got unsigned char [usertype] *
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:416:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *buf @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:416:26: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:416:26: sparse:     got char *buf
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:444:17: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *read )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:444:17: sparse:     expected int ( *read )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:444:17: sparse:     got int ( * )( ... )
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:445:18: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:445:18: sparse:     expected int ( *write )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:445:18: sparse:     got int ( * )( ... )
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:457:22: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *proc_read )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:457:22: sparse:     expected int ( *proc_read )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:457:22: sparse:     got int ( * )( ... )
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:458:23: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *proc_write )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:458:23: sparse:     expected int ( *proc_write )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:458:23: sparse:     got int ( * )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:571:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const *buf @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:571:37: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:571:37: sparse:     got char const *buf
   drivers/input/touchscreen/ilitek/ilitek_tool.c:610:23: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *proc_write )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:610:23: sparse:     expected int ( *proc_write )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:610:23: sparse:     got int ( * )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:622:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const *buf @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:622:33: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:622:33: sparse:     got char const *buf
   drivers/input/touchscreen/ilitek/ilitek_tool.c:684:23: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *proc_write )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:684:23: sparse:     expected int ( *proc_write )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:684:23: sparse:     got int ( * )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:693:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const *buf @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:693:36: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:693:36: sparse:     got char const *buf
   drivers/input/touchscreen/ilitek/ilitek_tool.c:731:23: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *proc_write )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:731:23: sparse:     expected int ( *proc_write )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:731:23: sparse:     got int ( * )( ... )
--
>> drivers/input/touchscreen/ilitek/ilitek_main.c:971:5: sparse: sparse: symbol 'event_spacing' was not declared. Should it be static?
>> drivers/input/touchscreen/ilitek/ilitek_main.c:981:15: sparse: sparse: symbol 'start_event_time_jiffies' was not declared. Should it be static?
>> drivers/input/touchscreen/ilitek/ilitek_main.c:1398:31: sparse: sparse: symbol 'update_cb' was not declared. Should it be static?
>> drivers/input/touchscreen/ilitek/ilitek_main.c:2060:27: sparse: sparse: symbol 'dev_cb' was not declared. Should it be static?
--
>> drivers/input/touchscreen/ilitek/ilitek_protocol.c:37:21: sparse: sparse: symbol 'protocol_maps' was not declared. Should it be static?

vim +93 drivers/input/touchscreen/ilitek/ilitek_tool.c

    78	
    79	static ssize_t ilitek_file_write(struct file *filp,
    80					 const char *buf, size_t size, loff_t *f_pos)
    81	{
    82		s32 ret = 0, count = 0;
    83		u8 buffer[512];
    84		u32 *data;
    85		char *token = NULL, *cur = NULL;
    86	
    87		if (size > sizeof(buffer)) {
    88			TP_ERR(NULL, "invalid buf len: %zu > %zu too large\n",
    89				size, sizeof(buffer));
    90			return -EINVAL;
    91		}
    92	
  > 93		ret = copy_from_user(buffer, buf, size);
    94		if (ret < 0) {
    95			TP_ERR(NULL, "copy data from user space, failed");
    96			return -1;
    97		}
    98	
    99		token = cur = buffer;
   100	
   101		data = kcalloc(size, sizeof(u32), GFP_KERNEL);
   102	
   103		while ((token = strsep(&cur, ",")) != NULL) {
   104			//data[count] = str2hex(token);
   105			sscanf(token, "%x", &data[count]);
   106			TP_MSG(NULL, "data[%d] = %x\n", count, data[count]);
   107			count++;
   108		}
   109	
   110		if (buffer[size - 2] == 'I' && (size == 20 || size == 52) && buffer[0] == 0x77 && buffer[1] == 0x77) {
   111	
   112			TP_MSG(NULL, "IOCTL_WRITE CMD = %d\n", buffer[2]);
   113			switch (buffer[2]) {
   114			case 13:
   115				//ilitek_irq_enable();
   116				TP_MSG(NULL, "ilitek_irq_enable. do nothing\n");
   117				break;
   118			case 12:
   119				//ilitek_irq_disable();
   120				TP_MSG(NULL, "ilitek_irq_disable. do nothing\n");
   121				break;
   122			case 19:
   123				ilitek_reset(ts->dev->reset_time);
   124				break;
   125	#ifdef ILITEK_TUNING_MESSAGE
   126			case 21:
   127				TP_MSG(NULL, "ilitek The ilitek_debug_flag = %d.\n", buffer[3]);
   128				if (buffer[3] == 0) {
   129					ilitek_debug_flag = false;
   130				} else if (buffer[3] == 1) {
   131					ilitek_debug_flag = true;
   132				}
   133				break;
   134	#endif
   135			case 15:
   136				if (buffer[3] == 0)
   137					ilitek_irq_disable();
   138				else
   139					ilitek_irq_enable();
   140	
   141				break;
   142			case 16:
   143				ts->operation_protection = buffer[3];
   144				TP_MSG(NULL, "ts->operation_protection = %d\n", ts->operation_protection);
   145				break;
   146			case 18:
   147				ilitek_irq_disable();
   148				mutex_lock(&ts->ilitek_mutex);
   149				ret = ilitek_write(&buffer[3], 33);
   150				mutex_unlock(&ts->ilitek_mutex);
   151				ilitek_irq_enable();
   152				if (ret < 0)
   153					TP_ERR(NULL, "i2c write error, ret %d\n", ret);
   154	
   155				return ret;
   156				break;
   157			default:
   158				return -1;
   159			}
   160		}
   161	
   162		if (buffer[size - 2] == 'W') {
   163			ilitek_irq_disable();
   164			mutex_lock(&ts->ilitek_mutex);
   165			ret = ilitek_write(buffer, size - 2);
   166			mutex_unlock(&ts->ilitek_mutex);
   167			ilitek_irq_enable();
   168			if (ret < 0) {
   169				TP_ERR(NULL, "i2c write error, ret %d\n", ret);
   170				return ret;
   171			}
   172		} else if (!strncmp(buffer, "unhandle_irq", strlen("unhandle_irq"))) {
   173			ts->unhandle_irq = !ts->unhandle_irq;
   174			TP_MSG(NULL, "ts->unhandle_irq = %d.\n", ts->unhandle_irq);
   175		} else if (!strncmp(buffer, "dbg_pkt", strlen("dbg_pkt"))) {
   176			set_log_level(log_level_pkt);
   177			TP_MSG(NULL, "ilitek_log_level_value = %d.\n", log_level_pkt);
   178		} else if (!strncmp(buffer, "dbg_debug", strlen("dbg_debug"))) {
   179			set_log_level(log_level_dbg);
   180			TP_MSG(NULL, "ilitek_log_level_value = %d.\n", log_level_dbg);
   181		} else if (!strncmp(buffer, "dbg_info", strlen("dbg_info"))) {
   182			set_log_level(log_level_msg);
   183			TP_MSG(NULL, "ilitek_log_level_value = %d.\n", log_level_msg);
   184		} else if (!strncmp(buffer, "dbg_err", strlen("dbg_err"))) {
   185			set_log_level(log_level_err);
   186			TP_MSG(NULL, "ilitek_log_level_value = %d.\n", log_level_err);
   187		} else if (!strncmp(buffer, "dbg_num", strlen("dbg_num"))) {
   188			TP_MSG(NULL, "ilitek_log_level_value = %d.\n", tp_log_level);
   189		}
   190	#ifdef ILITEK_TUNING_MESSAGE
   191		else if (!strncmp(buffer, "truning_dbg_flag", strlen("truning_dbg_flag"))) {
   192			ilitek_debug_flag = !ilitek_debug_flag;
   193			TP_MSG(NULL, " %s debug_flag message(%X).\n", ilitek_debug_flag ? "Enabled" : "Disabled", ilitek_debug_flag);
   194		}
   195	#endif
   196		else if (!strncmp(buffer, "irq_status", strlen("irq_status"))) {
   197			TP_MSG(NULL, "gpio_get_value(i2c.irq_gpio) = %d.\n", gpio_get_value(ts->irq_gpio));
   198		} else if (!strncmp(buffer, "enable", strlen("enable"))) {
   199			ilitek_irq_enable();
   200			TP_MSG(NULL, "irq enable\n");
   201		} else if (!strncmp(buffer, "disable", strlen("disable"))) {
   202			ilitek_irq_disable();
   203			TP_MSG(NULL, "irq disable\n");
   204		} else if (!strncmp(buffer, "info", strlen("info"))) {
   205			ilitek_irq_disable();
   206			mutex_lock(&ts->ilitek_mutex);
   207			api_update_ts_info(ts->dev);
   208			mutex_unlock(&ts->ilitek_mutex);
   209			ilitek_irq_enable();
   210		} else if (!strncmp(buffer, "reset", strlen("reset"))) {
   211			ilitek_reset(ts->dev->reset_time);
   212		}
   213	
   214		TP_DBG(NULL, "ilitek return count = %zu\n", size);
   215		kfree(data);
   216		return size;
   217	}
   218	
   219	static FOPS_IOCTL_FUNC(ilitek_file_ioctl, uint32_t cmd, unsigned long arg)
   220	{
   221		static u8 *buffer;
   222		static unsigned long len;
   223		s32 ret = 0;
   224		int tmp;
   225	
   226		buffer = kmalloc(ILITEK_IOCTL_MAX_TRANSFER, GFP_KERNEL);
   227		memset(buffer, 0, ILITEK_IOCTL_MAX_TRANSFER);
   228	
   229		switch (cmd) {
   230		case ILITEK_IOCTL_I2C_WRITE_DATA:
   231		case ILITEK_IOCTL_I2C_WRITE_DATA_COMPAT:
   232			if (len > ILITEK_IOCTL_MAX_TRANSFER) {
   233				TP_ERR(NULL, "invalid write len: %lu > %lu too large\n",
   234					len, ILITEK_IOCTL_MAX_TRANSFER);
   235				ret = -EINVAL;
   236				break;
   237			}
   238	
 > 239			if (copy_from_user(buffer, (u8 *)arg, len)) {
   240				TP_ERR(NULL, "copy data from user space, failed\n");
   241				ret = -EFAULT;
   242				break;
   243			}
   244	
   245			mutex_lock(&ts->ilitek_mutex);
   246			ret = ilitek_write_and_read(buffer, len, 0, NULL, 0);
   247			mutex_unlock(&ts->ilitek_mutex);
   248			if (ret < 0)
   249				TP_ERR(NULL, "i2c write failed, cmd: %x\n", buffer[0]);
   250			break;
   251		case ILITEK_IOCTL_I2C_READ_DATA:
   252		case ILITEK_IOCTL_I2C_READ_DATA_COMPAT:
   253			if (len > ILITEK_IOCTL_MAX_TRANSFER) {
   254				TP_ERR(NULL, "invalid read len: %lu > %lu too large\n",
   255					len, ILITEK_IOCTL_MAX_TRANSFER);
   256				ret = -EINVAL;
   257				break;
   258			}
   259	
   260			mutex_lock(&ts->ilitek_mutex);
   261			ret = ilitek_write_and_read(NULL, 0, 0, buffer, len);
   262			mutex_unlock(&ts->ilitek_mutex);
   263			if (ret < 0) {
   264				TP_ERR(NULL, "i2c read failed, buf: %x\n", buffer[0]);
   265				break;
   266			}
   267	
 > 268			if (copy_to_user((u8 *)arg, buffer, len)) {
   269				ret = -EFAULT;
   270				TP_ERR(NULL, "copy data to user space, failed\n");
   271			}
   272			break;
   273		case ILITEK_IOCTL_I2C_WRITE_LENGTH:
   274		case ILITEK_IOCTL_I2C_READ_LENGTH:
   275			len = arg;
   276			break;
   277		case ILITEK_IOCTL_DRIVER_INFORMATION:
   278			memcpy(buffer, driver_ver, 7);
   279			if (copy_to_user((u8 *)arg, buffer, 7))
   280				ret = -EFAULT;
   281			break;
   282		case ILITEK_IOCTL_I2C_UPDATE:
   283			break;
   284		case ILITEK_IOCTL_I2C_INT_FLAG:
   285			buffer[0] = !(gpio_get_value(ts->irq_gpio));
   286			if (copy_to_user((u8 *)arg, buffer, 1)) {
   287				TP_ERR(NULL, "copy data to user space, failed\n");
   288				ret = -EFAULT;
   289				break;
   290			}
   291			TP_DBG(NULL, "ILITEK_IOCTL_I2C_INT_FLAG = %d.\n", buffer[0]);
   292			break;
   293		case ILITEK_IOCTL_START_READ_DATA:
   294			ilitek_irq_enable();
   295			ts->unhandle_irq = false;
   296			TP_MSG(NULL, "enable_irq and ts->unhandle_irq = false.\n");
   297			break;
   298		case ILITEK_IOCTL_STOP_READ_DATA:
   299			ilitek_irq_disable();
   300			ts->unhandle_irq = true;
   301			TP_MSG(NULL, "disable_irq and ts->unhandle_irq = true.\n");
   302			break;
   303		case ILITEK_IOCTL_RESET:
   304			ilitek_reset(ts->dev->reset_time);
   305			break;
   306		case ILITEK_IOCTL_INT_STATUS:
   307			if (put_user(gpio_get_value(ts->irq_gpio), (s32 *)arg))
   308				ret = -EFAULT;
   309			break;
   310	#ifdef ILITEK_TUNING_MESSAGE
   311		case ILITEK_IOCTL_DEBUG_SWITCH:
   312			if (copy_from_user(buffer, (u8 *)arg, 1)) {
   313				ret = -EFAULT;
   314				break;
   315			}
   316			TP_MSG(NULL, "ilitek The debug_flag = %d.\n", buffer[0]);
   317			if (buffer[0] == 0)
   318				ilitek_debug_flag = false;
   319			else if (buffer[0] == 1)
   320				ilitek_debug_flag = true;
   321			break;
   322	#endif
   323		case ILITEK_IOCTL_I2C_SWITCH_IRQ:
   324			if (copy_from_user(buffer, (u8 *)arg, 1)) {
   325				ret = -EFAULT;
   326				break;
   327			}
   328	
   329			if (buffer[0] == 0)
   330				ilitek_irq_disable();
   331			else
   332				ilitek_irq_enable();
   333	
   334			break;
   335		case ILITEK_IOCTL_UPDATE_FLAG:
   336			ts->operation_protection = arg;
   337			TP_MSG(NULL, "operation_protection = %d\n", ts->operation_protection);
   338			break;
   339		case ILITEK_IOCTL_I2C_UPDATE_FW:
   340			if (copy_from_user(buffer, (u8 *)arg, 35)) {
   341				TP_ERR(NULL, "copy data from user space, failed\n");
   342				ret = -EFAULT;
   343				break;
   344			}
   345	
   346			ilitek_irq_disable();
   347			mutex_lock(&ts->ilitek_mutex);
   348			ret = ilitek_write_and_read(buffer, buffer[34], 0, NULL, 0);
   349			mutex_unlock(&ts->ilitek_mutex);
   350			ilitek_irq_enable();
   351	
   352			if (ret < 0)
   353				TP_ERR(NULL, "i2c write, failed\n");
   354	
   355			break;
   356		case ILITEK_IOCTL_I2C_INT_CLR:
   357			TP_DBG(NULL, "ILITEK_IOCTL_I2C_INT_CLR, set get_INT false\n");
   358			atomic_set(&ts->get_INT, 0);
   359			break;
   360		case ILITEK_IOCTL_I2C_INT_POLL:
   361		case ILITEK_IOCTL_I2C_INT_POLL_COMPAT:
   362			tmp = atomic_read(&ts->get_INT);
   363			TP_DBG(NULL, "ILITEK_IOCTL_I2C_INT_POLL, get_INT: %d\n", tmp);
   364	
   365			if (copy_to_user((u8 *)arg, &tmp, 1)) {
   366				TP_ERR(NULL, "copy data to user space, failed\n");
   367				ret = -EFAULT;
   368			}
   369			break;
   370		case ILITEK_IOCTL_I2C_ISR_TYPE:
   371			TP_MSG(NULL, "ILITEK_IOCTL_I2C_ISR_TYPE, set ISR type: %lu\n", arg);
   372			ts->irq_handle_type = (arg >> 16);
   373			ts->irq_read_len = arg & 0xFFFF;
   374			break;
   375		case ILITEK_IOCTL_I2C_NETLINK:
   376			TP_MSG(NULL, "ILITEK_IOCTL_I2C_NETLINK, set netlink: %s with ETH: %hhu\n",
   377				(arg >> 8) ? "ON" : "OFF", (u8)(arg & 0xFF));
   378	
   379			if (arg >> 8)
   380				ret = ilitek_netlink_init(arg & 0xFF);
   381			else
   382				ilitek_netlink_exit();
   383	
   384			break;
   385		default:
   386			TP_ERR(NULL, "unrecognized ioctl cmd: 0x%04x\n", cmd);
   387			ret = -EINVAL;
   388			break;
   389		}
   390	
   391		kfree(buffer);
   392		return (ret < 0) ? ret : 0;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

