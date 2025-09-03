Return-Path: <linux-gpio+bounces-25510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F80B420AE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4815C580865
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202E830275C;
	Wed,  3 Sep 2025 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/iz25jZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F9B3019A5
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905136; cv=none; b=XalI9Sd1yp/fO2uDsF3gV7ch/L2GDk2PBAGwTHOOU/6vPrwPGr4it7c8qohDp/Or1pGxp3RxrzTe6dNWou09r36lGdMUFaMk74QAqyKncIKpH6g9Zph6V+NzF9WIxg84LzZdpBepRCrPwkvCiga/K2rA6FCZGobVU7MoFcTRMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905136; c=relaxed/simple;
	bh=DRvBjbQUhuN8Rmom8K9ZJ7pZFOFohZJ6s3TxfaqeMhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tr3cdH6x7dIaOG7HJmm14mkF3Gbx6nRQq2Y0zT3SM2K4k4QyJHtQgv4dmrxZlTf39vJPQJlrIOG/c2UAwIz0TS8P17uHr2lqJL0OsZ9okkYeSCycf2CN/fxn8kbqshAcSD2jzZZAyY+m+3bGkQf4HgjNt2DhLlAd/2tQTvRrZyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/iz25jZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756905135; x=1788441135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DRvBjbQUhuN8Rmom8K9ZJ7pZFOFohZJ6s3TxfaqeMhA=;
  b=S/iz25jZ6SuJHrAxIOTo1Q37pNLV+obLTXgp2Um6+cNAR9/GvzDC41+M
   Ty0t4v/bZsAZdxaa5Le2apHliA67YQEda8Ymf7L+PPv9TMhKrgkGXEgHD
   5ZJV8ZWp8+kckz7uA6Jnjx8T1kzhNrOdcLY3VfdLQL6DCa8fdU1vKKAsJ
   DPK9sks1CC6OB9oKuWxGGfTbxa6zC28uwH6ld1Lb4s/MAtY1bdYxss79j
   jZC8CQNxP//lUq+J2pi9R15vqO8uZK87+uVWw+vK0Lf2E3iezQSUNW9G5
   tq4MI4WIeC9QzoeyASPWnY+dWLR5wzkw1Q5q7XmvvVvpuE9haC6TTaLLt
   g==;
X-CSE-ConnectionGUID: YEirm7feTsKndUoFLPgT9g==
X-CSE-MsgGUID: 0STC7XsURcCF7N0RbNL5SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="63035039"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="63035039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:12:15 -0700
X-CSE-ConnectionGUID: Yrl708wqRgmv3NKYsvNSCA==
X-CSE-MsgGUID: laUZmMazT0GYFXkaJA9bpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="172415218"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2025 06:12:13 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utnHX-0003uc-1F;
	Wed, 03 Sep 2025 13:12:11 +0000
Date: Wed, 3 Sep 2025 21:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 45/49] drivers/gpio/gpio-nomadik.c:403:27:
 warning: unused variable 'desc'
Message-ID: <202509032125.nXBcPuaf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   3be2d43534aab7291b59c4e66526f911854aa3a7
commit: ddeb66d2cb10f03a43d97a0ff2c3869d1951c87d [45/49] gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
config: i386-buildonly-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509032125.nXBcPuaf-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509032125.nXBcPuaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509032125.nXBcPuaf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-nomadik.c: In function 'nmk_gpio_dbg_show_one':
>> drivers/gpio/gpio-nomadik.c:403:27: warning: unused variable 'desc' [-Wunused-variable]
     403 |         struct gpio_desc *desc;
         |                           ^~~~


vim +/desc +403 drivers/gpio/gpio-nomadik.c

   398	
   399	void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
   400				   struct gpio_chip *chip, unsigned int offset)
   401	{
   402		struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 > 403		struct gpio_desc *desc;
   404		int mode;
   405		bool is_out;
   406		bool data_out;
   407		bool pull;
   408		static const char * const modes[] = {
   409			[NMK_GPIO_ALT_GPIO]	= "gpio",
   410			[NMK_GPIO_ALT_A]	= "altA",
   411			[NMK_GPIO_ALT_B]	= "altB",
   412			[NMK_GPIO_ALT_C]	= "altC",
   413			[NMK_GPIO_ALT_C + 1]	= "altC1",
   414			[NMK_GPIO_ALT_C + 2]	= "altC2",
   415			[NMK_GPIO_ALT_C + 3]	= "altC3",
   416			[NMK_GPIO_ALT_C + 4]	= "altC4",
   417		};
   418	
   419		char *label = gpiochip_dup_line_label(chip, offset);
   420		if (IS_ERR(label))
   421			return;
   422	
   423		clk_enable(nmk_chip->clk);
   424		is_out = !!(readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset));
   425		pull = !(readl(nmk_chip->addr + NMK_GPIO_PDIS) & BIT(offset));
   426		data_out = !!(readl(nmk_chip->addr + NMK_GPIO_DAT) & BIT(offset));
   427		mode = nmk_gpio_get_mode(nmk_chip, offset);
   428	#ifdef CONFIG_PINCTRL_NOMADIK
   429		if (mode == NMK_GPIO_ALT_C && pctldev) {
   430			desc = gpio_device_get_desc(chip->gpiodev, offset);
   431			mode = nmk_prcm_gpiocr_get_mode(pctldev, desc_to_gpio(desc));
   432		}
   433	#endif
   434	
   435		if (is_out) {
   436			seq_printf(s, " gpio-%-3d (%-20.20s) out %s           %s",
   437				   offset, label ?: "(none)", str_hi_lo(data_out),
   438				   (mode < 0) ? "unknown" : modes[mode]);
   439		} else {
   440			int irq = chip->to_irq(chip, offset);
   441			const int pullidx = pull ? 1 : 0;
   442			int val;
   443			static const char * const pulls[] = {
   444				"none        ",
   445				"pull enabled",
   446			};
   447	
   448			seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %s",
   449				   offset, label ?: "(none)", pulls[pullidx],
   450				   (mode < 0) ? "unknown" : modes[mode]);
   451	
   452			val = nmk_gpio_get_input(chip, offset);
   453			seq_printf(s, " VAL %d", val);
   454	
   455			/*
   456			 * This races with request_irq(), set_irq_type(),
   457			 * and set_irq_wake() ... but those are "rare".
   458			 */
   459			if (irq > 0 && irq_has_action(irq)) {
   460				char *trigger;
   461				bool wake;
   462	
   463				if (nmk_chip->edge_rising & BIT(offset))
   464					trigger = "edge-rising";
   465				else if (nmk_chip->edge_falling & BIT(offset))
   466					trigger = "edge-falling";
   467				else
   468					trigger = "edge-undefined";
   469	
   470				wake = !!(nmk_chip->real_wake & BIT(offset));
   471	
   472				seq_printf(s, " irq-%d %s%s",
   473					   irq, trigger, wake ? " wakeup" : "");
   474			}
   475		}
   476		clk_disable(nmk_chip->clk);
   477	}
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

