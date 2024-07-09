Return-Path: <linux-gpio+bounces-8127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2C92BCC0
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882EC1F21BD8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 14:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0178018C34F;
	Tue,  9 Jul 2024 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTN3nZf2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B7E180A84
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534954; cv=none; b=hlFdyDdo4LUyvjBPkj3teiTI+j74ufWuH6jSBpVL+ROMpvGR1i/40sXNZ8aDr+Vtts8TH7UP4kmsXmyjLtWnphGwIe/JFOKV/4TdEBwQgBs572rrobyTITjp3DO2a3ajrFNlHhokPXlKb0CHjP1fEd7G+0Yx9hcLfZD0r0doZOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534954; c=relaxed/simple;
	bh=a4ZWQ5Nl+4l470kjq4JyRkYLom0mVgymSqCG8I0HUKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1J/sED2l3o5g9CvcTFFvf6cmwyIkO0ZIAd/NCWFznW4XWpQenyiXOnkwElA/0XO6zgkKbXnCDjFKs0dl08DMAHlpno9uGeV4hbeJ5XrWZGQEcu7UQz8o5QjoIk4Hulpqkoy6iizLNLIhBXzQ0tutZw34vHWAnQhwtJNtP0cyMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTN3nZf2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720534953; x=1752070953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4ZWQ5Nl+4l470kjq4JyRkYLom0mVgymSqCG8I0HUKc=;
  b=dTN3nZf2WitRjaVUdoKi3hd06GY4cyRsXV4nPpZCR3COdF/qJKbQSgUT
   UUTFJHyxs/VrQVwPjBt2/7tF4E/HUOFbpCbsS9dlTJ6EKQmzz1QLY1qrx
   vyuRxaMrU4TwkgQmayCAdhZ2iBkHxyEbJaTwUQhJmMpuq+EP67WdWgbld
   zpHmoXkQhj9efzDkkQH6P0vvp50M5gsOeop6jPEEA0jydxNfwmTQAdI+A
   tsBKmMNbm7NDuqKwoLHeOpqyF9NaUD/gk3a92QJ25Zvh7/GtCQP8f5vRV
   Js45a2CagwkBhiD4Q1NVXohrO7yOwUNh+2zz4IYOkWXjiR9jgxKguh9Zu
   g==;
X-CSE-ConnectionGUID: v3PlRQ3ZTk+4/OdNXwLtrA==
X-CSE-MsgGUID: r+JwO+FaTJ22JOYWoDs8yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35329824"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="35329824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 07:22:33 -0700
X-CSE-ConnectionGUID: pEDhi7k9QBGoVx0TMMU1rA==
X-CSE-MsgGUID: YVQ2uVMSSqG/18PXVM5Fjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="52269109"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jul 2024 07:22:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRBjh-000WkQ-1o;
	Tue, 09 Jul 2024 14:22:29 +0000
Date: Tue, 9 Jul 2024 22:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [brgl:gpio/for-next 38/38] drivers/gpio/gpio-virtuser.c:400:24:
 warning: variable 'trimmed' set but not used
Message-ID: <202407092245.BPnW2mr6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   337049890b8cbbb4fb527c58976ea19f4dc747a0
commit: 91581c4b3f29e2e22aeb1a62e842d529ca638b2d [38/38] gpio: virtuser: new virtual testing driver for the GPIO API
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240709/202407092245.BPnW2mr6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092245.BPnW2mr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407092245.BPnW2mr6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-virtuser.c: In function 'gpio_virtuser_direction_do_write':
>> drivers/gpio/gpio-virtuser.c:400:24: warning: variable 'trimmed' set but not used [-Wunused-but-set-variable]
     400 |         char buf[32], *trimmed;
         |                        ^~~~~~~


vim +/trimmed +400 drivers/gpio/gpio-virtuser.c

   392	
   393	static ssize_t gpio_virtuser_direction_do_write(struct file *file,
   394							const char __user *user_buf,
   395							size_t count, loff_t *ppos,
   396							bool atomic)
   397	{
   398		struct gpio_virtuser_line_data *data = file->private_data;
   399		struct gpio_desc *desc = data->ad.desc;
 > 400		char buf[32], *trimmed;
   401		int ret, dir, val = 0;
   402	
   403		ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
   404		if (ret < 0)
   405			return ret;
   406	
   407		trimmed = strim(buf);
   408	
   409		if (strcmp(buf, "input") == 0) {
   410			dir = 1;
   411		} else if (strcmp(buf, "output-high") == 0) {
   412			dir = 0;
   413			val = 1;
   414		} else if (strcmp(buf, "output-low") == 0) {
   415			dir = val = 0;
   416		} else {
   417			return -EINVAL;
   418		}
   419	
   420		if (!atomic)
   421			ret = gpio_virtuser_set_direction(desc, dir, val);
   422		else
   423			ret = gpio_virtuser_set_direction_atomic(desc, dir, val);
   424		if (ret)
   425			return ret;
   426	
   427		return count;
   428	}
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

