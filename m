Return-Path: <linux-gpio+bounces-23840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A73B12A3D
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 13:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 914FF3B79A5
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 11:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC62B23F417;
	Sat, 26 Jul 2025 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtFyVUw9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0D1F4192
	for <linux-gpio@vger.kernel.org>; Sat, 26 Jul 2025 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753528234; cv=none; b=llrwPPwnhrKvKnXgx9W881lLeWOHYH5ag58CVmworUlBtJ8LVhOyUiuprC8xnq+iahdUzEtSlI1cdI7als+V5+4CyYAbj0A3ORcuCCpguxLn4oefdm/2rf2VEsW4RLZu/fbHd1IddRf92cpL/CquouYOP8qT8dD0lyR7ClJBSOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753528234; c=relaxed/simple;
	bh=0znva+OTAB09UEKTngVITdwUAGB5h7bSYSMDrHgKiaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LbFGn/75ZiRoq6NToDaB+bOIZ0E5H6hezMiakQt2qUflYdELqHSa1GmtClEBYWYI5SGlanZ6M48LAzHW9AWcijlusN3UDbFpNIB7a5D20CEWR1/v7j59lPwX6zg13+nH/RZ3tC75On44SvTEuclNLyOq4eSPUgJLVB2umD9BABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtFyVUw9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753528232; x=1785064232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0znva+OTAB09UEKTngVITdwUAGB5h7bSYSMDrHgKiaA=;
  b=FtFyVUw9zMjqAo0LR/znbgEFC0jcWDbi74geNZjy9YNZpnslS/8QjwTM
   H9KE7pYTkKpTiDGFd4PFFvJzOMDtHWCKRw2T3++vs4uCrqqDz+4u+hSp+
   U9Ne6eH6fX0+QnWwo59fN9PFLGdC5nZ8vJy6vUwy3yzeyTIiFmtQPF3BJ
   BR+o29SrM9kVmasR5ycSTF9JTfcLKTIm40ZVJzy+J1lhHZ8KeGmAjEPwd
   14CZBFI68BdCrbzVPPt9vJWUg98OirPJXCQSDqttsJPCdJeuErfnj7+zG
   OvorH5Fw6euVdupR37PXDe7BmXaWMClA8p61hlfCmfREe7SI2r1rUABry
   Q==;
X-CSE-ConnectionGUID: y2bYEpa7TWiOIIa5VRX9DA==
X-CSE-MsgGUID: VHlEXasaSBKX20Ve3L1jow==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55057924"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55057924"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:10:31 -0700
X-CSE-ConnectionGUID: aBgTWPTqTfO+7O4pZEMHfA==
X-CSE-MsgGUID: GYg5QaUGSCOVptIszsJCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192442297"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 04:10:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcnM-000Lv1-1G;
	Sat, 26 Jul 2025 11:10:28 +0000
Date: Sat, 26 Jul 2025 19:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [brgl:gpio/for-next 4/5] drivers/nfc/s3fwrn5/uart.c:147:15: error:
 implicit declaration of function 'devm_gpio_request_one'
Message-ID: <202507261934.yIHeUuEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   4740e1e2f320061c2f0dbadc0dd3dfb58df986d5
commit: 678bae2eaa812662929a83b3de399645e9de93ad [4/5] gpiolib: make legacy interfaces optional
config: um-randconfig-002-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261934.yIHeUuEQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261934.yIHeUuEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261934.yIHeUuEQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
>> drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
     100 |         if (!gpio_is_valid(phy->common.gpio_en))
         |              ^~~~~~~~~~~~~
         |              uuid_is_valid
   drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_probe':
>> drivers/nfc/s3fwrn5/uart.c:147:15: error: implicit declaration of function 'devm_gpio_request_one' [-Werror=implicit-function-declaration]
     147 |         ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/nfc/s3fwrn5/uart.c:148:37: error: 'GPIOF_OUT_INIT_HIGH' undeclared (first use in this function)
     148 |                                     GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
         |                                     ^~~~~~~~~~~~~~~~~~~
   drivers/nfc/s3fwrn5/uart.c:148:37: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nfc/s3fwrn5/uart.c:154:37: error: 'GPIOF_OUT_INIT_LOW' undeclared (first use in this function)
     154 |                                     GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
         |                                     ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/nfc/s3fwrn5/phy_common.c: In function 's3fwrn5_phy_set_wake':
>> drivers/nfc/s3fwrn5/phy_common.c:22:9: error: implicit declaration of function 'gpio_set_value'; did you mean 'pte_set_val'? [-Werror=implicit-function-declaration]
      22 |         gpio_set_value(phy->gpio_fw_wake, wake);
         |         ^~~~~~~~~~~~~~
         |         pte_set_val
   cc1: some warnings being treated as errors


vim +/devm_gpio_request_one +147 drivers/nfc/s3fwrn5/uart.c

3f52c2cb7e3ada Bongsu Jeon 2020-12-02   90  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   91  static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   92  {
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   93  	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   94  	struct device_node *np = serdev->dev.of_node;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   95  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   96  	if (!np)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   97  		return -ENODEV;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   98  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02   99  	phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02 @100  	if (!gpio_is_valid(phy->common.gpio_en))
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  101  		return -ENODEV;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  102  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  103  	phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  104  	if (!gpio_is_valid(phy->common.gpio_fw_wake))
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  105  		return -ENODEV;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  106  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  107  	return 0;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  108  }
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  109  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  110  static int s3fwrn82_uart_probe(struct serdev_device *serdev)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  111  {
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  112  	struct s3fwrn82_uart_phy *phy;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  113  	int ret = -ENOMEM;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  114  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  115  	phy = devm_kzalloc(&serdev->dev, sizeof(*phy), GFP_KERNEL);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  116  	if (!phy)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  117  		goto err_exit;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  118  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  119  	phy->recv_skb = alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  120  	if (!phy->recv_skb)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  121  		goto err_exit;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  122  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  123  	mutex_init(&phy->common.mutex);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  124  	phy->common.mode = S3FWRN5_MODE_COLD;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  125  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  126  	phy->ser_dev = serdev;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  127  	serdev_device_set_drvdata(serdev, phy);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  128  	serdev_device_set_client_ops(serdev, &s3fwrn82_serdev_ops);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  129  	ret = serdev_device_open(serdev);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  130  	if (ret) {
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  131  		dev_err(&serdev->dev, "Unable to open device\n");
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  132  		goto err_skb;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  133  	}
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  134  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  135  	ret = serdev_device_set_baudrate(serdev, 115200);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  136  	if (ret != 115200) {
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  137  		ret = -EINVAL;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  138  		goto err_serdev;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  139  	}
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  140  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  141  	serdev_device_set_flow_control(serdev, false);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  142  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  143  	ret = s3fwrn82_uart_parse_dt(serdev);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  144  	if (ret < 0)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  145  		goto err_serdev;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  146  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02 @147  	ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
3f52c2cb7e3ada Bongsu Jeon 2020-12-02 @148  				    GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  149  	if (ret < 0)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  150  		goto err_serdev;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  151  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  152  	ret = devm_gpio_request_one(&phy->ser_dev->dev,
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  153  				    phy->common.gpio_fw_wake,
3f52c2cb7e3ada Bongsu Jeon 2020-12-02 @154  				    GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  155  	if (ret < 0)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  156  		goto err_serdev;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  157  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  158  	ret = s3fwrn5_probe(&phy->common.ndev, phy, &phy->ser_dev->dev,
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  159  			    &uart_phy_ops);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  160  	if (ret < 0)
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  161  		goto err_serdev;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  162  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  163  	return ret;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  164  
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  165  err_serdev:
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  166  	serdev_device_close(serdev);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  167  err_skb:
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  168  	kfree_skb(phy->recv_skb);
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  169  err_exit:
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  170  	return ret;
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  171  }
3f52c2cb7e3ada Bongsu Jeon 2020-12-02  172  

:::::: The code at line 147 was first introduced by commit
:::::: 3f52c2cb7e3ada37513dabb69a22cf917dba754f nfc: s3fwrn5: Support a UART interface

:::::: TO: Bongsu Jeon <bongsu.jeon@samsung.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

