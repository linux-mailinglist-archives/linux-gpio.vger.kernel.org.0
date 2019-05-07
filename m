Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4CD16CE1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 23:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbfEGVMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 17:12:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:32994 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbfEGVMe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 May 2019 17:12:34 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 May 2019 14:12:33 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 May 2019 14:12:32 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hO7O3-0007BZ-S5; Wed, 08 May 2019 05:12:31 +0800
Date:   Wed, 8 May 2019 05:11:31 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi 4/8] drivers/hid/hid-cp2112.c:1206:69:
 sparse: sparse: incorrect type in argument 4 (invalid types)
Message-ID: <201905080518.k6UYnFz4%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   e0be1da1758837a9ba07726648ac75d9a27fe8ae
commit: 30170dbebec2a25e7ae92a521798d4f02967236a [4/8] gpio: pass lookup and descriptor flags to request_own
reproduce:
        # apt-get install sparse
        git checkout 30170dbebec2a25e7ae92a521798d4f02967236a
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/hid/hid-cp2112.c:1206:69: sparse: sparse: incorrect type in argument 4 (invalid types) @@    expected incomplete type enum gpio_lookup_flags lflags @@    got gs lflags @@
>> drivers/hid/hid-cp2112.c:1206:69: sparse:    expected incomplete type enum gpio_lookup_flags lflags
>> drivers/hid/hid-cp2112.c:1206:69: sparse:    got int

vim +1206 drivers/hid/hid-cp2112.c

  1196	
  1197	static int __maybe_unused cp2112_allocate_irq(struct cp2112_device *dev,
  1198						      int pin)
  1199	{
  1200		int ret;
  1201	
  1202		if (dev->desc[pin])
  1203			return -EINVAL;
  1204	
  1205		dev->desc[pin] = gpiochip_request_own_desc(&dev->gc, pin,
> 1206							   "HID/I2C:Event", 0, 0);
  1207		if (IS_ERR(dev->desc[pin])) {
  1208			dev_err(dev->gc.parent, "Failed to request GPIO\n");
  1209			return PTR_ERR(dev->desc[pin]);
  1210		}
  1211	
  1212		ret = gpiochip_lock_as_irq(&dev->gc, pin);
  1213		if (ret) {
  1214			dev_err(dev->gc.parent, "Failed to lock GPIO as interrupt\n");
  1215			goto err_desc;
  1216		}
  1217	
  1218		ret = gpiod_to_irq(dev->desc[pin]);
  1219		if (ret < 0) {
  1220			dev_err(dev->gc.parent, "Failed to translate GPIO to IRQ\n");
  1221			goto err_lock;
  1222		}
  1223	
  1224		return ret;
  1225	
  1226	err_lock:
  1227		gpiochip_unlock_as_irq(&dev->gc, pin);
  1228	err_desc:
  1229		gpiochip_free_own_desc(dev->desc[pin]);
  1230		dev->desc[pin] = NULL;
  1231		return ret;
  1232	}
  1233	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
