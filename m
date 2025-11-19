Return-Path: <linux-gpio+bounces-28719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55AC6C4AA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 02:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D1774E8FD3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 01:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B5620013A;
	Wed, 19 Nov 2025 01:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zsgy0Lqe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF271A9FB0;
	Wed, 19 Nov 2025 01:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763516865; cv=none; b=OYbGTBP/jxrXT6AT5fmTXuQo10/d2s5iDhRq9k9XplsBEan19dyeXJ6bZWWqGnoJQ/1bxz8dytr2NLMRYTzmrSByfxupsxhw32dD7c23CJFXIzF6xBy5AoJXMky5nztZQkvho6ExR3S3bt16eetWOf39QPAGQ7V2d7O1OpwxmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763516865; c=relaxed/simple;
	bh=WcaDjRtRAt/DK9JnOvyw0Lro6ZVU/ftzffYKlN1rZXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQDs4IURSA+DuV810+XljKp7ZOIHzSiw11gKpmPRUk/zXDu4VkqmRbSiOY82zFwyIvBTdcruDQEj0mb++tJ8/jQAvQ/exO17F/KDIrzEYczNMPw/4asPgonQVeUdIFHNIFlPS5h6EUjLskF/qJR07uEcwwlNmFl0WTkT4/9rGTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zsgy0Lqe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763516864; x=1795052864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WcaDjRtRAt/DK9JnOvyw0Lro6ZVU/ftzffYKlN1rZXM=;
  b=Zsgy0Lqe8dn74wUeNEcNdzT+yW3g0zxPukddRPAfRGrN9AlLkCd79Zis
   IRFRcadLsQ5Vj2Ua2WRlf22bChqIRaWK82qBJdeC3OBXnwZ92v1IgsTdM
   wequjc9FyHyBPkUyPFGhfHxYGtgcAT0dmVxj1lbYagBer5jZyStzpqn6F
   Ho/phYho+NKbeUhSl1pHa3aOkjO8XjFgo0dwRyU6VqXFUJMcZaN4F38W/
   c5Kk93NetCJPuJPJ/oZrUJR9I053oK/rPz6krhsMVIXfpbwBYvLg95rxd
   CM2YqL+5zbaVl4u2oCSYsWocDEnjIQp8/Un33IsZv179cWglRyTQb311L
   Q==;
X-CSE-ConnectionGUID: bma9gfepS4KoMmTdcwja9Q==
X-CSE-MsgGUID: m6gtPvuDQcWUXyL5xPvpow==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="75876608"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="75876608"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 17:47:44 -0800
X-CSE-ConnectionGUID: YzR0Pp+cQ8mOtZaiblFtGw==
X-CSE-MsgGUID: 5wonV8YxT7CnEE45U8PqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190190406"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 17:47:41 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLXII-0002Kx-2Y;
	Wed, 19 Nov 2025 01:47:38 +0000
Date: Wed, 19 Nov 2025 09:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: 2724853925@qq.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	2724853925@qq.com
Subject: Re: [PATCH] input: touchscreen: Add ilitek touchscreen driver support
Message-ID: <202511190932.OFk1oMBB-lkp@intel.com>
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
[also build test WARNING on dtor-input/for-linus linus/master v6.18-rc6 next-20251118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/2724853925-qq-com/input-touchscreen-Add-ilitek-touchscreen-driver-support/20251116-215220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/tencent_995E6FC62EDBC1EED14E6052847F270F6406%40qq.com
patch subject: [PATCH] input: touchscreen: Add ilitek touchscreen driver support
config: sh-randconfig-r112-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190932.OFk1oMBB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190932.OFk1oMBB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190932.OFk1oMBB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/input/touchscreen/ilitek/ilitek_tool.c:93:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const *buf @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:93:38: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:93:38: sparse:     got char const *buf
   drivers/input/touchscreen/ilitek/ilitek_tool.c:239:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:239:45: sparse:     expected void const [noderef] __user *from
   drivers/input/touchscreen/ilitek/ilitek_tool.c:239:45: sparse:     got unsigned char [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:268:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:268:35: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:268:35: sparse:     got unsigned char [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:279:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:279:35: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:279:35: sparse:     got unsigned char [usertype] *
   drivers/input/touchscreen/ilitek/ilitek_tool.c:286:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:286:35: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:286:35: sparse:     got unsigned char [usertype] *
>> drivers/input/touchscreen/ilitek/ilitek_tool.c:307:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected signed int [noderef] __user *__pu_addr @@     got signed int [usertype] * @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:307:21: sparse:     expected signed int [noderef] __user *__pu_addr
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
   drivers/input/touchscreen/ilitek/ilitek_tool.c:416:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *buf @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:416:26: sparse:     expected void [noderef] __user *to
   drivers/input/touchscreen/ilitek/ilitek_tool.c:416:26: sparse:     got char *buf
   drivers/input/touchscreen/ilitek/ilitek_tool.c:444:17: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *read )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:444:17: sparse:     expected int ( *read )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:444:17: sparse:     got int ( * )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:445:18: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:445:18: sparse:     expected int ( *write )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:445:18: sparse:     got int ( * )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:457:22: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *proc_read )( ... ) @@     got int ( * )( ... ) @@
   drivers/input/touchscreen/ilitek/ilitek_tool.c:457:22: sparse:     expected int ( *proc_read )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:457:22: sparse:     got int ( * )( ... )
   drivers/input/touchscreen/ilitek/ilitek_tool.c:458:23: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *proc_write )( ... ) @@     got int ( * )( ... ) @@
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

vim +307 drivers/input/touchscreen/ilitek/ilitek_tool.c

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
   239			if (copy_from_user(buffer, (u8 *)arg, len)) {
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
   268			if (copy_to_user((u8 *)arg, buffer, len)) {
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
 > 307			if (put_user(gpio_get_value(ts->irq_gpio), (s32 *)arg))
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

