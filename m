Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326782656BD
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 03:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgIKBia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 21:38:30 -0400
Received: from mga07.intel.com ([134.134.136.100]:9623 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgIKBi1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Sep 2020 21:38:27 -0400
IronPort-SDR: ek2ewvjO0ln4kB0uOc3dSc9TOqSDJxQvKSlJwXhLtW4nBF1KefUw3+bt+KFnnlw5xiExLxEWYK
 KZCQjey+BJCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="222871934"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="gz'50?scan'50,208,50";a="222871934"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 18:38:25 -0700
IronPort-SDR: 0TVKGQKy2nkx3KwXgXS4HWgqmurEstyjepApnb6l9bBK4uzTjSXY48Cw9L0lb4r1WurUJ1ZH64
 U24q7JQM5qAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="gz'50?scan'50,208,50";a="506036625"
Received: from lkp-server01.sh.intel.com (HELO 12ff3cf3f2e9) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Sep 2020 18:38:22 -0700
Received: from kbuild by 12ff3cf3f2e9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kGY18-00019j-22; Fri, 11 Sep 2020 01:38:22 +0000
Date:   Fri, 11 Sep 2020 09:37:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Cc:     kbuild-all@lists.01.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <202009110932.g6FoDGc1%lkp@intel.com>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on gpio/for-next]
[also build test WARNING on v5.9-rc4 next-20200910]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/gpiolib-Fix-line-event-handling-in-syscall-compatible-mode/20200910-182240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: ia64-randconfig-s032-20200909 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-191-g10164920-dirty
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=ia64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpio/gpiolib-cdev.c:432:41: sparse: sparse: expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:432:41: sparse: sparse: Expected } at end of struct-union-enum-specifier
   drivers/gpio/gpiolib-cdev.c:432:41: sparse: sparse: got timestamp
   drivers/gpio/gpiolib-cdev.c:446:17: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:446:17: sparse: sparse: got &&
>> drivers/gpio/gpiolib-cdev.c:446:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpio/gpiolib-cdev.c:449:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:449:9: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:452:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:452:1: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:467:19: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:467:19: sparse: sparse: got <
   drivers/gpio/gpiolib-cdev.c:467:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> drivers/gpio/gpiolib-cdev.c:470:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpio/gpiolib-cdev.c:470:12: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:470:12: sparse: sparse: got {
   drivers/gpio/gpiolib-cdev.c:472:21: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:472:21: sparse: sparse: got (
   drivers/gpio/gpiolib-cdev.c:472:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpio/gpiolib-cdev.c:472:21: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:472:21: sparse: sparse: got ->
   drivers/gpio/gpiolib-cdev.c:472:21: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:472:21: sparse: sparse: got }
>> drivers/gpio/gpiolib-cdev.c:475:33: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/gpio/gpiolib-cdev.c:475:40: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:475:40: sparse: sparse: got bytes_read
   drivers/gpio/gpiolib-cdev.c:476:25: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:476:25: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:480:33: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/gpio/gpiolib-cdev.c:480:40: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:480:40: sparse: sparse: got -
   drivers/gpio/gpiolib-cdev.c:481:25: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:481:25: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got ->
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got 0
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got {
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got break
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got ->
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got &
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got {
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got (
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in nested declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got {
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got (
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got "drivers/gpio/gpiolib-cdev.c"
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got {
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got !
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got }
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in nested declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got task_struct
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'struct' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ) in function declarator
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got 1037
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'switch' as identifier
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'break' as identifier
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got 1016
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'break' as identifier
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got 1019
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'break' as identifier
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: got 1037
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'break' as identifier
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: Expected ; at end of declaration
>> drivers/gpio/gpiolib-cdev.c:483:31: sparse: sparse: too many errors

# https://github.com/0day-ci/linux/commit/402a73d41d7b2b3a72dc346e62d2b4c4403a6277
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-Fix-line-event-handling-in-syscall-compatible-mode/20200910-182240
git checkout 402a73d41d7b2b3a72dc346e62d2b4c4403a6277
vim +432 drivers/gpio/gpiolib-cdev.c

   425	
   426	static ssize_t lineevent_to_user(char __user *buf, struct gpioevent_data *ge)
   427	{
   428	#ifdef __x86_64__
   429		/* i386 has no padding after 'id' */
   430		if (in_ia32_syscall()) {
   431			struct compat_ge {
 > 432				compat_u64	timestamp __packed;
   433				u32		id;
   434			} cge;
   435	
   436			if (buf && ge) {
   437				cge = (struct compat_ge){ ge->timestamp, ge->id };
   438				if (copy_to_user(buf, &cge, sizeof(cge)))
   439					return -EFAULT;
   440			}
   441	
   442			return sizeof(cge);
   443		}
   444	#endif
   445	
 > 446		if (buf && ge) {
   447			if (copy_to_user(buf, ge, sizeof(*ge)))
   448				return -EFAULT;
   449		}
   450	
   451		return sizeof(*ge);
   452	}
   453	
   454	static ssize_t lineevent_read(struct file *file,
   455				      char __user *buf,
   456				      size_t count,
   457				      loff_t *f_ps)
   458	{
   459		struct lineevent_state *le = file->private_data;
   460		struct gpioevent_data ge;
   461		ssize_t bytes_read = 0;
   462		ssize_t ge_size;
   463		int ret;
   464	
   465		/* When argument is NULL it returns size of the structure in user space */
   466		ge_size = lineevent_to_user(NULL, NULL);
   467		if (count < ge_size)
   468			return -EINVAL;
   469	
 > 470		do {
   471			spin_lock(&le->wait.lock);
   472			if (kfifo_is_empty(&le->events)) {
   473				if (bytes_read) {
   474					spin_unlock(&le->wait.lock);
 > 475					return bytes_read;
   476				}
   477	
   478				if (file->f_flags & O_NONBLOCK) {
   479					spin_unlock(&le->wait.lock);
   480					return -EAGAIN;
   481				}
   482	
 > 483				ret = wait_event_interruptible_locked(le->wait,
   484						!kfifo_is_empty(&le->events));
   485				if (ret) {
   486					spin_unlock(&le->wait.lock);
   487					return ret;
   488				}
   489			}
   490	
   491			ret = kfifo_out(&le->events, &ge, 1);
   492			spin_unlock(&le->wait.lock);
   493			if (ret != 1) {
   494				/*
   495				 * This should never happen - we were holding the lock
   496				 * from the moment we learned the fifo is no longer
   497				 * empty until now.
   498				 */
   499				ret = -EIO;
   500				break;
   501			}
   502	
   503			ret = lineevent_to_user(buf + bytes_read, &ge);
   504			if (ret < 0)
   505				return ret;
   506			bytes_read += ret;
   507		} while (count >= bytes_read + ge_size);
   508	
   509		return bytes_read;
   510	}
   511	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--u3/rZRmxL6MmkK24
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AQA=

--u3/rZRmxL6MmkK24--
