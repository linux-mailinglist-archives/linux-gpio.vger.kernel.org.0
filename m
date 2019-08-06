Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6E482BA7
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 08:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731711AbfHFG3k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 02:29:40 -0400
Received: from mga18.intel.com ([134.134.136.126]:45277 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfHFG3k (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 02:29:40 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Aug 2019 23:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; 
   d="gz'50?scan'50,208,50";a="181886250"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2019 23:28:56 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1husxs-000Din-1b; Tue, 06 Aug 2019 14:28:56 +0800
Date:   Tue, 6 Aug 2019 14:28:03 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi 5/5] drivers//spi/spi-pl022.c:442:22:
 error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
Message-ID: <201908061430.ufS6yCH5%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fnbpvj57hjrzl6wk"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--fnbpvj57hjrzl6wk
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   6e5614b6476001adb8ce6e2859bc2ca0a4339398
commit: 6e5614b6476001adb8ce6e2859bc2ca0a4339398 [5/5] slask
config: arm-allmodconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6e5614b6476001adb8ce6e2859bc2ca0a4339398
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=arm 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers//spi/spi-pl022.c:17:
   drivers//spi/spi-pl022.c: In function 'pl022_set_cs':
>> drivers//spi/spi-pl022.c:442:22: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
      tmp &= ~BIT(pl022->cur_cs);
                         ^
   include/linux/bits.h:8:30: note: in definition of macro 'BIT'
    #define BIT(nr)   (UL(1) << (nr))
                                 ^~
   drivers//spi/spi-pl022.c:444:21: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
      tmp |= BIT(pl022->cur_cs);
                        ^
   include/linux/bits.h:8:30: note: in definition of macro 'BIT'
    #define BIT(nr)   (UL(1) << (nr))
                                 ^~
   drivers//spi/spi-pl022.c: In function 'giveback':
>> drivers//spi/spi-pl022.c:493:4: error: implicit declaration of function 'pl022_cs_control'; did you mean 'pl022_set_cs'? [-Werror=implicit-function-declaration]
       pl022_cs_control(pl022, SSP_CHIP_DESELECT);
       ^~~~~~~~~~~~~~~~
       pl022_set_cs
   drivers//spi/spi-pl022.c: In function 'pl022_transfer_one_message':
   drivers//spi/spi-pl022.c:1571:9: error: 'struct pl022' has no member named 'cur_cs'; did you mean 'cur_msg'?
     pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
            ^~~~~~
            cur_msg
>> drivers//spi/spi-pl022.c:1571:23: error: 'struct pl022' has no member named 'chipselects'
     pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
                          ^~
   drivers//spi/spi-pl022.c: In function 'pl022_setup':
>> drivers//spi/spi-pl022.c:1852:4: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
       of_property_read_u32(np, "pl022,interface",
       ^~~~~~~~~~~~~~~~~~~~
>> drivers//spi/spi-pl022.c:1914:7: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
     if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
          ^~~~~~~~~~~~~
          uuid_is_valid
   drivers//spi/spi-pl022.c:1914:26: error: 'struct pl022' has no member named 'chipselects'
     if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
                             ^~
   drivers//spi/spi-pl022.c: In function 'pl022_platform_data_dt_get':
>> drivers//spi/spi-pl022.c:2081:11: error: implicit declaration of function 'of_property_read_bool' [-Werror=implicit-function-declaration]
     pd->rt = of_property_read_bool(np, "pl022,rt");
              ^~~~~~~~~~~~~~~~~~~~~
   drivers//spi/spi-pl022.c: In function 'pl022_probe':
   drivers//spi/spi-pl022.c:2125:7: error: 'struct pl022' has no member named 'chipselects'
     pl022->chipselects = devm_kcalloc(dev, num_cs, sizeof(int),
          ^~
   drivers//spi/spi-pl022.c:2127:12: error: 'struct pl022' has no member named 'chipselects'
     if (!pl022->chipselects) {
               ^~
   drivers//spi/spi-pl022.c:2137:8: warning: statement with no effect [-Wunused-value]
     master->use_gpio_descriptors;
     ~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   drivers//spi/spi-pl022.c:2150:9: error: 'struct pl022' has no member named 'chipselects'
       pl022->chipselects[i] = i;
            ^~
>> drivers//spi/spi-pl022.c:2153:18: error: implicit declaration of function 'of_get_named_gpio'; did you mean 'fwnode_get_named_gpiod'? [-Werror=implicit-function-declaration]
       int cs_gpio = of_get_named_gpio(np, "cs-gpios", i);
                     ^~~~~~~~~~~~~~~~~
                     fwnode_get_named_gpiod
   drivers//spi/spi-pl022.c:2160:9: error: 'struct pl022' has no member named 'chipselects'
       pl022->chipselects[i] = cs_gpio;
            ^~
>> drivers//spi/spi-pl022.c:2163:9: error: implicit declaration of function 'devm_gpio_request'; did you mean 'devm_gpiod_put'? [-Werror=implicit-function-declaration]
        if (devm_gpio_request(dev, cs_gpio, "ssp-pl022"))
            ^~~~~~~~~~~~~~~~~
            devm_gpiod_put
>> drivers//spi/spi-pl022.c:2167:14: error: implicit declaration of function 'gpio_direction_output'; did you mean 'gpiod_direction_output'? [-Werror=implicit-function-declaration]
        else if (gpio_direction_output(cs_gpio, 1))
                 ^~~~~~~~~~~~~~~~~~~~~
                 gpiod_direction_output
   cc1: some warnings being treated as errors

vim +442 drivers//spi/spi-pl022.c

b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   421  
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   422  static void pl022_set_cs(struct spi_device *spi, bool enable)
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17   423  {
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   424  	struct pl022 *pl022 = spi_controller_get_devdata(spi->controller);
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17   425  	u32 tmp;
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17   426  
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   427  	/*
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   428  	 * This callback will ONLY be called of no GPIO descriptors were found
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   429  	 * for the device, so we know we are dealing exclusively with variants
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   430  	 * that have internal CS control here, but just to be sure: extra check
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   431  	 * for now.
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   432  	 */
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   433  	if (!pl022->vendor->internal_cs_ctrl) {
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   434  		dev_err(&spi->dev,
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   435  			"called internal CS control on unsupported device\n");
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   436  		return;
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   437  	}
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   438  
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   439  	/* We draw a line low here to imply we enable it */
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17   440  	tmp = readw(SSP_CSR(pl022->virtbase));
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25   441  	if (enable)
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  @442  		tmp &= ~BIT(pl022->cur_cs);
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17   443  	else
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  @444  		tmp |= BIT(pl022->cur_cs);
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17   445  	writew(tmp, SSP_CSR(pl022->virtbase));
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17   446  }
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17   447  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   448  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   449   * giveback - current spi_message is over, schedule next message and call
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   450   * callback of this message. Assumes that caller already
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   451   * set message->status; dma and pio irqs are blocked
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   452   * @pl022: SSP driver private data structure
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   453   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   454  static void giveback(struct pl022 *pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   455  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   456  	struct spi_transfer *last_transfer;
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   457  	pl022->next_msg_cs_active = false;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   458  
23e2c2aa45a213e drivers/spi/spi-pl022.c  Axel Lin                 2014-02-12   459  	last_transfer = list_last_entry(&pl022->cur_msg->transfers,
23e2c2aa45a213e drivers/spi/spi-pl022.c  Axel Lin                 2014-02-12   460  					struct spi_transfer, transfer_list);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   461  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   462  	/* Delay if requested before any change in chip select */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   463  	if (last_transfer->delay_usecs)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   464  		/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   465  		 * FIXME: This runs in interrupt context.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   466  		 * Is this really smart?
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   467  		 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   468  		udelay(last_transfer->delay_usecs);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   469  
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   470  	if (!last_transfer->cs_change) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   471  		struct spi_message *next_msg;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   472  
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   473  		/*
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   474  		 * cs_change was not set. We can keep the chip select
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   475  		 * enabled if there is message in the queue and it is
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   476  		 * for the same spi device.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   477  		 *
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   478  		 * We cannot postpone this until pump_messages, because
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   479  		 * after calling msg->complete (below) the driver that
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   480  		 * sent the current message could be unloaded, which
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   481  		 * could invalidate the cs_control() callback...
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   482  		 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   483  		/* get a pointer to the next message, if any */
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22   484  		next_msg = spi_get_next_queued_message(pl022->master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   485  
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   486  		/*
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   487  		 * see if the next and current messages point
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   488  		 * to the same spi device.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   489  		 */
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   490  		if (next_msg && next_msg->spi != pl022->cur_msg->spi)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   491  			next_msg = NULL;
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   492  		if (!next_msg || pl022->cur_msg->state == STATE_ERROR)
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  @493  			pl022_cs_control(pl022, SSP_CHIP_DESELECT);
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   494  		else
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   495  			pl022->next_msg_cs_active = true;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22   496  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   497  	}
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   498  
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   499  	pl022->cur_msg = NULL;
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   500  	pl022->cur_transfer = NULL;
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10   501  	pl022->cur_chip = NULL;
fd316941cfee1fb drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12   502  
fd316941cfee1fb drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12   503  	/* disable the SPI/SSP operation */
fd316941cfee1fb drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12   504  	writew((readw(SSP_CR1(pl022->virtbase)) &
fd316941cfee1fb drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12   505  		(~SSP_CR1_MASK_SSE)), SSP_CR1(pl022->virtbase));
fd316941cfee1fb drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12   506  
cd6fa8d2ca53cac drivers/spi/spi-pl022.c  Alexander Sverdlin       2015-02-27   507  	spi_finalize_current_message(pl022->master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   508  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   509  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   510  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   511   * flush - flush the FIFO to reach a clean state
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   512   * @pl022: SSP driver private data structure
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   513   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   514  static int flush(struct pl022 *pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   515  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   516  	unsigned long limit = loops_per_jiffy << 1;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   517  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   518  	dev_dbg(&pl022->adev->dev, "flush\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   519  	do {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   520  		while (readw(SSP_SR(pl022->virtbase)) & SSP_SR_MASK_RNE)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   521  			readw(SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   522  	} while ((readw(SSP_SR(pl022->virtbase)) & SSP_SR_MASK_BSY) && limit--);
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   523  
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   524  	pl022->exp_fifo_level = 0;
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   525  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   526  	return limit;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   527  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   528  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   529  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   530   * restore_state - Load configuration of current chip
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   531   * @pl022: SSP driver private data structure
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   532   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   533  static void restore_state(struct pl022 *pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   534  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   535  	struct chip_data *chip = pl022->cur_chip;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   536  
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   537  	if (pl022->vendor->extended_cr)
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   538  		writel(chip->cr0, SSP_CR0(pl022->virtbase));
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   539  	else
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   540  		writew(chip->cr0, SSP_CR0(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   541  	writew(chip->cr1, SSP_CR1(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   542  	writew(chip->dmacr, SSP_DMACR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   543  	writew(chip->cpsr, SSP_CPSR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   544  	writew(DISABLE_ALL_INTERRUPTS, SSP_IMSC(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   545  	writew(CLEAR_ALL_INTERRUPTS, SSP_ICR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   546  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   547  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   548  /*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   549   * Default SSP Register Values
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   550   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   551  #define DEFAULT_SSP_REG_CR0 ( \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   552  	GEN_MASK_BITS(SSP_DATA_BITS_12, SSP_CR0_MASK_DSS, 0)	| \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   553  	GEN_MASK_BITS(SSP_INTERFACE_MOTOROLA_SPI, SSP_CR0_MASK_FRF, 4) | \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   554  	GEN_MASK_BITS(SSP_CLK_POL_IDLE_LOW, SSP_CR0_MASK_SPO, 6) | \
ee2b805c8eb6459 drivers/spi/amba-pl022.c Linus Walleij            2009-08-15   555  	GEN_MASK_BITS(SSP_CLK_SECOND_EDGE, SSP_CR0_MASK_SPH, 7) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   556  	GEN_MASK_BITS(SSP_DEFAULT_CLKRATE, SSP_CR0_MASK_SCR, 8) \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   557  )
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   558  
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   559  /* ST versions have slightly different bit layout */
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   560  #define DEFAULT_SSP_REG_CR0_ST ( \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   561  	GEN_MASK_BITS(SSP_DATA_BITS_12, SSP_CR0_MASK_DSS_ST, 0)	| \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   562  	GEN_MASK_BITS(SSP_MICROWIRE_CHANNEL_FULL_DUPLEX, SSP_CR0_MASK_HALFDUP_ST, 5) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   563  	GEN_MASK_BITS(SSP_CLK_POL_IDLE_LOW, SSP_CR0_MASK_SPO, 6) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   564  	GEN_MASK_BITS(SSP_CLK_SECOND_EDGE, SSP_CR0_MASK_SPH, 7) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   565  	GEN_MASK_BITS(SSP_DEFAULT_CLKRATE, SSP_CR0_MASK_SCR, 8) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   566  	GEN_MASK_BITS(SSP_BITS_8, SSP_CR0_MASK_CSS_ST, 16)	| \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   567  	GEN_MASK_BITS(SSP_INTERFACE_MOTOROLA_SPI, SSP_CR0_MASK_FRF_ST, 21) \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   568  )
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   569  
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   570  /* The PL023 version is slightly different again */
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   571  #define DEFAULT_SSP_REG_CR0_ST_PL023 ( \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   572  	GEN_MASK_BITS(SSP_DATA_BITS_12, SSP_CR0_MASK_DSS_ST, 0)	| \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   573  	GEN_MASK_BITS(SSP_CLK_POL_IDLE_LOW, SSP_CR0_MASK_SPO, 6) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   574  	GEN_MASK_BITS(SSP_CLK_SECOND_EDGE, SSP_CR0_MASK_SPH, 7) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   575  	GEN_MASK_BITS(SSP_DEFAULT_CLKRATE, SSP_CR0_MASK_SCR, 8) \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   576  )
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   577  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   578  #define DEFAULT_SSP_REG_CR1 ( \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   579  	GEN_MASK_BITS(LOOPBACK_DISABLED, SSP_CR1_MASK_LBM, 0) | \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   580  	GEN_MASK_BITS(SSP_DISABLED, SSP_CR1_MASK_SSE, 1) | \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   581  	GEN_MASK_BITS(SSP_MASTER, SSP_CR1_MASK_MS, 2) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   582  	GEN_MASK_BITS(DO_NOT_DRIVE_TX, SSP_CR1_MASK_SOD, 3) \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   583  )
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   584  
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   585  /* ST versions extend this register to use all 16 bits */
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   586  #define DEFAULT_SSP_REG_CR1_ST ( \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   587  	DEFAULT_SSP_REG_CR1 | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   588  	GEN_MASK_BITS(SSP_RX_MSB, SSP_CR1_MASK_RENDN_ST, 4) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   589  	GEN_MASK_BITS(SSP_TX_MSB, SSP_CR1_MASK_TENDN_ST, 5) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   590  	GEN_MASK_BITS(SSP_MWIRE_WAIT_ZERO, SSP_CR1_MASK_MWAIT_ST, 6) |\
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   591  	GEN_MASK_BITS(SSP_RX_1_OR_MORE_ELEM, SSP_CR1_MASK_RXIFLSEL_ST, 7) | \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   592  	GEN_MASK_BITS(SSP_TX_1_OR_MORE_EMPTY_LOC, SSP_CR1_MASK_TXIFLSEL_ST, 10) \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   593  )
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   594  
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   595  /*
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   596   * The PL023 variant has further differences: no loopback mode, no microwire
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   597   * support, and a new clock feedback delay setting.
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   598   */
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   599  #define DEFAULT_SSP_REG_CR1_ST_PL023 ( \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   600  	GEN_MASK_BITS(SSP_DISABLED, SSP_CR1_MASK_SSE, 1) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   601  	GEN_MASK_BITS(SSP_MASTER, SSP_CR1_MASK_MS, 2) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   602  	GEN_MASK_BITS(DO_NOT_DRIVE_TX, SSP_CR1_MASK_SOD, 3) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   603  	GEN_MASK_BITS(SSP_RX_MSB, SSP_CR1_MASK_RENDN_ST, 4) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   604  	GEN_MASK_BITS(SSP_TX_MSB, SSP_CR1_MASK_TENDN_ST, 5) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   605  	GEN_MASK_BITS(SSP_RX_1_OR_MORE_ELEM, SSP_CR1_MASK_RXIFLSEL_ST, 7) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   606  	GEN_MASK_BITS(SSP_TX_1_OR_MORE_EMPTY_LOC, SSP_CR1_MASK_TXIFLSEL_ST, 10) | \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   607  	GEN_MASK_BITS(SSP_FEEDBACK_CLK_DELAY_NONE, SSP_CR1_MASK_FBCLKDEL_ST, 13) \
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   608  )
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   609  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   610  #define DEFAULT_SSP_REG_CPSR ( \
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   611  	GEN_MASK_BITS(SSP_DEFAULT_PRESCALE, SSP_CPSR_MASK_CPSDVSR, 0) \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   612  )
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   613  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   614  #define DEFAULT_SSP_REG_DMACR (\
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   615  	GEN_MASK_BITS(SSP_DMA_DISABLED, SSP_DMACR_MASK_RXDMAE, 0) | \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   616  	GEN_MASK_BITS(SSP_DMA_DISABLED, SSP_DMACR_MASK_TXDMAE, 1) \
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   617  )
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   618  
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   619  /**
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   620   * load_ssp_default_config - Load default configuration for SSP
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   621   * @pl022: SSP driver private data structure
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   622   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   623  static void load_ssp_default_config(struct pl022 *pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   624  {
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   625  	if (pl022->vendor->pl023) {
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   626  		writel(DEFAULT_SSP_REG_CR0_ST_PL023, SSP_CR0(pl022->virtbase));
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   627  		writew(DEFAULT_SSP_REG_CR1_ST_PL023, SSP_CR1(pl022->virtbase));
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07   628  	} else if (pl022->vendor->extended_cr) {
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   629  		writel(DEFAULT_SSP_REG_CR0_ST, SSP_CR0(pl022->virtbase));
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   630  		writew(DEFAULT_SSP_REG_CR1_ST, SSP_CR1(pl022->virtbase));
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   631  	} else {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   632  		writew(DEFAULT_SSP_REG_CR0, SSP_CR0(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   633  		writew(DEFAULT_SSP_REG_CR1, SSP_CR1(pl022->virtbase));
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05   634  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   635  	writew(DEFAULT_SSP_REG_DMACR, SSP_DMACR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   636  	writew(DEFAULT_SSP_REG_CPSR, SSP_CPSR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   637  	writew(DISABLE_ALL_INTERRUPTS, SSP_IMSC(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   638  	writew(CLEAR_ALL_INTERRUPTS, SSP_ICR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   639  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   640  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   641  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   642   * This will write to TX and read from RX according to the parameters
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   643   * set in pl022.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   644   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   645  static void readwriter(struct pl022 *pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   646  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   647  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   648  	/*
25985edcedea639 drivers/spi/amba-pl022.c Lucas De Marchi          2011-03-30   649  	 * The FIFO depth is different between primecell variants.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   650  	 * I believe filling in too much in the FIFO might cause
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   651  	 * errons in 8bit wide transfers on ARM variants (just 8 words
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   652  	 * FIFO, means only 8x8 = 64 bits in FIFO) at least.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   653  	 *
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   654  	 * To prevent this issue, the TX FIFO is only filled to the
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   655  	 * unused RX FIFO fill length, regardless of what the TX
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   656  	 * FIFO status flag indicates.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   657  	 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   658  	dev_dbg(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   659  		"%s, rx: %p, rxend: %p, tx: %p, txend: %p\n",
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   660  		__func__, pl022->rx, pl022->rx_end, pl022->tx, pl022->tx_end);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   661  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   662  	/* Read as much as you can */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   663  	while ((readw(SSP_SR(pl022->virtbase)) & SSP_SR_MASK_RNE)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   664  	       && (pl022->rx < pl022->rx_end)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   665  		switch (pl022->read) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   666  		case READING_NULL:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   667  			readw(SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   668  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   669  		case READING_U8:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   670  			*(u8 *) (pl022->rx) =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   671  				readw(SSP_DR(pl022->virtbase)) & 0xFFU;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   672  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   673  		case READING_U16:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   674  			*(u16 *) (pl022->rx) =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   675  				(u16) readw(SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   676  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   677  		case READING_U32:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   678  			*(u32 *) (pl022->rx) =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   679  				readl(SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   680  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   681  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   682  		pl022->rx += (pl022->cur_chip->n_bytes);
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   683  		pl022->exp_fifo_level--;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   684  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   685  	/*
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   686  	 * Write as much as possible up to the RX FIFO size
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   687  	 */
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   688  	while ((pl022->exp_fifo_level < pl022->vendor->fifodepth)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   689  	       && (pl022->tx < pl022->tx_end)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   690  		switch (pl022->write) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   691  		case WRITING_NULL:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   692  			writew(0x0, SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   693  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   694  		case WRITING_U8:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   695  			writew(*(u8 *) (pl022->tx), SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   696  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   697  		case WRITING_U16:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   698  			writew((*(u16 *) (pl022->tx)), SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   699  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   700  		case WRITING_U32:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   701  			writel(*(u32 *) (pl022->tx), SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   702  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   703  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   704  		pl022->tx += (pl022->cur_chip->n_bytes);
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   705  		pl022->exp_fifo_level++;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   706  		/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   707  		 * This inner reader takes care of things appearing in the RX
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   708  		 * FIFO as we're transmitting. This will happen a lot since the
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   709  		 * clock starts running when you put things into the TX FIFO,
25985edcedea639 drivers/spi/amba-pl022.c Lucas De Marchi          2011-03-30   710  		 * and then things are continuously clocked into the RX FIFO.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   711  		 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   712  		while ((readw(SSP_SR(pl022->virtbase)) & SSP_SR_MASK_RNE)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   713  		       && (pl022->rx < pl022->rx_end)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   714  			switch (pl022->read) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   715  			case READING_NULL:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   716  				readw(SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   717  				break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   718  			case READING_U8:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   719  				*(u8 *) (pl022->rx) =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   720  					readw(SSP_DR(pl022->virtbase)) & 0xFFU;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   721  				break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   722  			case READING_U16:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   723  				*(u16 *) (pl022->rx) =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   724  					(u16) readw(SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   725  				break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   726  			case READING_U32:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   727  				*(u32 *) (pl022->rx) =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   728  					readl(SSP_DR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   729  				break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   730  			}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   731  			pl022->rx += (pl022->cur_chip->n_bytes);
fc05475f867624d drivers/spi/amba-pl022.c Linus Walleij            2010-01-22   732  			pl022->exp_fifo_level--;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   733  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   734  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   735  	/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   736  	 * When we exit here the TX FIFO should be full and the RX FIFO
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   737  	 * should be empty
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   738  	 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   739  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   740  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   741  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   742   * next_transfer - Move to the Next transfer in the current spi message
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   743   * @pl022: SSP driver private data structure
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   744   *
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   745   * This function moves though the linked list of spi transfers in the
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   746   * current spi message and returns with the state of current spi
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   747   * message i.e whether its last transfer is done(STATE_DONE) or
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   748   * Next transfer is ready(STATE_RUNNING)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   749   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   750  static void *next_transfer(struct pl022 *pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   751  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   752  	struct spi_message *msg = pl022->cur_msg;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   753  	struct spi_transfer *trans = pl022->cur_transfer;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   754  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   755  	/* Move to next transfer */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   756  	if (trans->transfer_list.next != &msg->transfers) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   757  		pl022->cur_transfer =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   758  		    list_entry(trans->transfer_list.next,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   759  			       struct spi_transfer, transfer_list);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   760  		return STATE_RUNNING;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   761  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   762  	return STATE_DONE;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09   763  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   764  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   765  /*
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   766   * This DMA functionality is only compiled in if we have
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   767   * access to the generic DMA devices/DMA engine.
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   768   */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   769  #ifdef CONFIG_DMA_ENGINE
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   770  static void unmap_free_dma_scatter(struct pl022 *pl022)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   771  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   772  	/* Unmap and free the SG tables */
b729889686afb7d drivers/spi/amba-pl022.c Linus Walleij            2010-12-22   773  	dma_unmap_sg(pl022->dma_tx_channel->device->dev, pl022->sgt_tx.sgl,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   774  		     pl022->sgt_tx.nents, DMA_TO_DEVICE);
b729889686afb7d drivers/spi/amba-pl022.c Linus Walleij            2010-12-22   775  	dma_unmap_sg(pl022->dma_rx_channel->device->dev, pl022->sgt_rx.sgl,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   776  		     pl022->sgt_rx.nents, DMA_FROM_DEVICE);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   777  	sg_free_table(&pl022->sgt_rx);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   778  	sg_free_table(&pl022->sgt_tx);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   779  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   780  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   781  static void dma_callback(void *data)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   782  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   783  	struct pl022 *pl022 = data;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   784  	struct spi_message *msg = pl022->cur_msg;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   785  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   786  	BUG_ON(!pl022->sgt_rx.sgl);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   787  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   788  #ifdef VERBOSE_DEBUG
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   789  	/*
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   790  	 * Optionally dump out buffers to inspect contents, this is
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   791  	 * good if you want to convince yourself that the loopback
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   792  	 * read/write contents are the same, when adopting to a new
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   793  	 * DMA engine.
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   794  	 */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   795  	{
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   796  		struct scatterlist *sg;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   797  		unsigned int i;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   798  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   799  		dma_sync_sg_for_cpu(&pl022->adev->dev,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   800  				    pl022->sgt_rx.sgl,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   801  				    pl022->sgt_rx.nents,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   802  				    DMA_FROM_DEVICE);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   803  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   804  		for_each_sg(pl022->sgt_rx.sgl, sg, pl022->sgt_rx.nents, i) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   805  			dev_dbg(&pl022->adev->dev, "SPI RX SG ENTRY: %d", i);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   806  			print_hex_dump(KERN_ERR, "SPI RX: ",
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   807  				       DUMP_PREFIX_OFFSET,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   808  				       16,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   809  				       1,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   810  				       sg_virt(sg),
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   811  				       sg_dma_len(sg),
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   812  				       1);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   813  		}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   814  		for_each_sg(pl022->sgt_tx.sgl, sg, pl022->sgt_tx.nents, i) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   815  			dev_dbg(&pl022->adev->dev, "SPI TX SG ENTRY: %d", i);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   816  			print_hex_dump(KERN_ERR, "SPI TX: ",
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   817  				       DUMP_PREFIX_OFFSET,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   818  				       16,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   819  				       1,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   820  				       sg_virt(sg),
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   821  				       sg_dma_len(sg),
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   822  				       1);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   823  		}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   824  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   825  #endif
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   826  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   827  	unmap_free_dma_scatter(pl022);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   828  
25985edcedea639 drivers/spi/amba-pl022.c Lucas De Marchi          2011-03-30   829  	/* Update total bytes transferred */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   830  	msg->actual_length += pl022->cur_transfer->len;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   831  	/* Move to next transfer */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   832  	msg->state = next_transfer(pl022);
c0b07605f1a0285 drivers/spi/spi-pl022.c  Fredrik Ternerot         2018-11-13   833  	if (msg->state != STATE_DONE && pl022->cur_transfer->cs_change)
c0b07605f1a0285 drivers/spi/spi-pl022.c  Fredrik Ternerot         2018-11-13   834  		pl022_cs_control(pl022, SSP_CHIP_DESELECT);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   835  	tasklet_schedule(&pl022->pump_transfers);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   836  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   837  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   838  static void setup_dma_scatter(struct pl022 *pl022,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   839  			      void *buffer,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   840  			      unsigned int length,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   841  			      struct sg_table *sgtab)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   842  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   843  	struct scatterlist *sg;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   844  	int bytesleft = length;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   845  	void *bufp = buffer;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   846  	int mapbytes;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   847  	int i;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   848  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   849  	if (buffer) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   850  		for_each_sg(sgtab->sgl, sg, sgtab->nents, i) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   851  			/*
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   852  			 * If there are less bytes left than what fits
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   853  			 * in the current page (plus page alignment offset)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   854  			 * we just feed in this, else we stuff in as much
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   855  			 * as we can.
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   856  			 */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   857  			if (bytesleft < (PAGE_SIZE - offset_in_page(bufp)))
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   858  				mapbytes = bytesleft;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   859  			else
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   860  				mapbytes = PAGE_SIZE - offset_in_page(bufp);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   861  			sg_set_page(sg, virt_to_page(bufp),
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   862  				    mapbytes, offset_in_page(bufp));
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   863  			bufp += mapbytes;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   864  			bytesleft -= mapbytes;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   865  			dev_dbg(&pl022->adev->dev,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   866  				"set RX/TX target page @ %p, %d bytes, %d left\n",
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   867  				bufp, mapbytes, bytesleft);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   868  		}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   869  	} else {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   870  		/* Map the dummy buffer on every page */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   871  		for_each_sg(sgtab->sgl, sg, sgtab->nents, i) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   872  			if (bytesleft < PAGE_SIZE)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   873  				mapbytes = bytesleft;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   874  			else
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   875  				mapbytes = PAGE_SIZE;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   876  			sg_set_page(sg, virt_to_page(pl022->dummypage),
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   877  				    mapbytes, 0);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   878  			bytesleft -= mapbytes;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   879  			dev_dbg(&pl022->adev->dev,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   880  				"set RX/TX to dummy page %d bytes, %d left\n",
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   881  				mapbytes, bytesleft);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   882  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   883  		}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   884  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   885  	BUG_ON(bytesleft);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   886  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   887  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   888  /**
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   889   * configure_dma - configures the channels for the next transfer
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   890   * @pl022: SSP driver's private data structure
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   891   */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   892  static int configure_dma(struct pl022 *pl022)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   893  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   894  	struct dma_slave_config rx_conf = {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   895  		.src_addr = SSP_DR(pl022->phybase),
a485df4b4404379 drivers/spi/spi-pl022.c  Vinod Koul               2011-10-14   896  		.direction = DMA_DEV_TO_MEM,
258aea76f552cc7 drivers/spi/spi-pl022.c  Viresh Kumar             2012-02-01   897  		.device_fc = false,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   898  	};
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   899  	struct dma_slave_config tx_conf = {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   900  		.dst_addr = SSP_DR(pl022->phybase),
a485df4b4404379 drivers/spi/spi-pl022.c  Vinod Koul               2011-10-14   901  		.direction = DMA_MEM_TO_DEV,
258aea76f552cc7 drivers/spi/spi-pl022.c  Viresh Kumar             2012-02-01   902  		.device_fc = false,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   903  	};
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   904  	unsigned int pages;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   905  	int ret;
082086f2ce53c69 drivers/spi/amba-pl022.c Linus Walleij            2010-12-22   906  	int rx_sglen, tx_sglen;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   907  	struct dma_chan *rxchan = pl022->dma_rx_channel;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   908  	struct dma_chan *txchan = pl022->dma_tx_channel;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   909  	struct dma_async_tx_descriptor *rxdesc;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   910  	struct dma_async_tx_descriptor *txdesc;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   911  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   912  	/* Check that the channels are available */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   913  	if (!rxchan || !txchan)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   914  		return -ENODEV;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   915  
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   916  	/*
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   917  	 * If supplied, the DMA burstsize should equal the FIFO trigger level.
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   918  	 * Notice that the DMA engine uses one-to-one mapping. Since we can
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   919  	 * not trigger on 2 elements this needs explicit mapping rather than
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   920  	 * calculation.
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   921  	 */
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   922  	switch (pl022->rx_lev_trig) {
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   923  	case SSP_RX_1_OR_MORE_ELEM:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   924  		rx_conf.src_maxburst = 1;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   925  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   926  	case SSP_RX_4_OR_MORE_ELEM:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   927  		rx_conf.src_maxburst = 4;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   928  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   929  	case SSP_RX_8_OR_MORE_ELEM:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   930  		rx_conf.src_maxburst = 8;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   931  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   932  	case SSP_RX_16_OR_MORE_ELEM:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   933  		rx_conf.src_maxburst = 16;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   934  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   935  	case SSP_RX_32_OR_MORE_ELEM:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   936  		rx_conf.src_maxburst = 32;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   937  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   938  	default:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   939  		rx_conf.src_maxburst = pl022->vendor->fifodepth >> 1;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   940  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   941  	}
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   942  
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   943  	switch (pl022->tx_lev_trig) {
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   944  	case SSP_TX_1_OR_MORE_EMPTY_LOC:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   945  		tx_conf.dst_maxburst = 1;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   946  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   947  	case SSP_TX_4_OR_MORE_EMPTY_LOC:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   948  		tx_conf.dst_maxburst = 4;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   949  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   950  	case SSP_TX_8_OR_MORE_EMPTY_LOC:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   951  		tx_conf.dst_maxburst = 8;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   952  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   953  	case SSP_TX_16_OR_MORE_EMPTY_LOC:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   954  		tx_conf.dst_maxburst = 16;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   955  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   956  	case SSP_TX_32_OR_MORE_EMPTY_LOC:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   957  		tx_conf.dst_maxburst = 32;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   958  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   959  	default:
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   960  		tx_conf.dst_maxburst = pl022->vendor->fifodepth >> 1;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   961  		break;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   962  	}
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16   963  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   964  	switch (pl022->read) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   965  	case READING_NULL:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   966  		/* Use the same as for writing */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   967  		rx_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_UNDEFINED;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   968  		break;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   969  	case READING_U8:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   970  		rx_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   971  		break;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   972  	case READING_U16:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   973  		rx_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   974  		break;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   975  	case READING_U32:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   976  		rx_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   977  		break;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   978  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   979  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   980  	switch (pl022->write) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   981  	case WRITING_NULL:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   982  		/* Use the same as for reading */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   983  		tx_conf.dst_addr_width = DMA_SLAVE_BUSWIDTH_UNDEFINED;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   984  		break;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   985  	case WRITING_U8:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   986  		tx_conf.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   987  		break;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   988  	case WRITING_U16:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   989  		tx_conf.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   990  		break;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   991  	case WRITING_U32:
bc3f67a3e1b2075 drivers/spi/amba-pl022.c Joe Perches              2010-11-14   992  		tx_conf.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   993  		break;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   994  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   995  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   996  	/* SPI pecularity: we need to read and write the same width */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   997  	if (rx_conf.src_addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   998  		rx_conf.src_addr_width = tx_conf.dst_addr_width;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29   999  	if (tx_conf.dst_addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1000  		tx_conf.dst_addr_width = rx_conf.src_addr_width;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1001  	BUG_ON(rx_conf.src_addr_width != tx_conf.dst_addr_width);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1002  
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1003  	dmaengine_slave_config(rxchan, &rx_conf);
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1004  	dmaengine_slave_config(txchan, &tx_conf);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1005  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1006  	/* Create sglists for the transfers */
b181565ee6a0f89 drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1007  	pages = DIV_ROUND_UP(pl022->cur_transfer->len, PAGE_SIZE);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1008  	dev_dbg(&pl022->adev->dev, "using %d pages for transfer\n", pages);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1009  
538a18dc189ef5d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1010  	ret = sg_alloc_table(&pl022->sgt_rx, pages, GFP_ATOMIC);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1011  	if (ret)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1012  		goto err_alloc_rx_sg;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1013  
538a18dc189ef5d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1014  	ret = sg_alloc_table(&pl022->sgt_tx, pages, GFP_ATOMIC);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1015  	if (ret)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1016  		goto err_alloc_tx_sg;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1017  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1018  	/* Fill in the scatterlists for the RX+TX buffers */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1019  	setup_dma_scatter(pl022, pl022->rx,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1020  			  pl022->cur_transfer->len, &pl022->sgt_rx);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1021  	setup_dma_scatter(pl022, pl022->tx,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1022  			  pl022->cur_transfer->len, &pl022->sgt_tx);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1023  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1024  	/* Map DMA buffers */
082086f2ce53c69 drivers/spi/amba-pl022.c Linus Walleij            2010-12-22  1025  	rx_sglen = dma_map_sg(rxchan->device->dev, pl022->sgt_rx.sgl,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1026  			   pl022->sgt_rx.nents, DMA_FROM_DEVICE);
082086f2ce53c69 drivers/spi/amba-pl022.c Linus Walleij            2010-12-22  1027  	if (!rx_sglen)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1028  		goto err_rx_sgmap;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1029  
082086f2ce53c69 drivers/spi/amba-pl022.c Linus Walleij            2010-12-22  1030  	tx_sglen = dma_map_sg(txchan->device->dev, pl022->sgt_tx.sgl,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1031  			   pl022->sgt_tx.nents, DMA_TO_DEVICE);
082086f2ce53c69 drivers/spi/amba-pl022.c Linus Walleij            2010-12-22  1032  	if (!tx_sglen)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1033  		goto err_tx_sgmap;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1034  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1035  	/* Send both scatterlists */
16052827d98fbc1 drivers/spi/spi-pl022.c  Alexandre Bounine        2012-03-08  1036  	rxdesc = dmaengine_prep_slave_sg(rxchan,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1037  				      pl022->sgt_rx.sgl,
082086f2ce53c69 drivers/spi/amba-pl022.c Linus Walleij            2010-12-22  1038  				      rx_sglen,
a485df4b4404379 drivers/spi/spi-pl022.c  Vinod Koul               2011-10-14  1039  				      DMA_DEV_TO_MEM,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1040  				      DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1041  	if (!rxdesc)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1042  		goto err_rxdesc;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1043  
16052827d98fbc1 drivers/spi/spi-pl022.c  Alexandre Bounine        2012-03-08  1044  	txdesc = dmaengine_prep_slave_sg(txchan,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1045  				      pl022->sgt_tx.sgl,
082086f2ce53c69 drivers/spi/amba-pl022.c Linus Walleij            2010-12-22  1046  				      tx_sglen,
a485df4b4404379 drivers/spi/spi-pl022.c  Vinod Koul               2011-10-14  1047  				      DMA_MEM_TO_DEV,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1048  				      DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1049  	if (!txdesc)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1050  		goto err_txdesc;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1051  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1052  	/* Put the callback on the RX transfer only, that should finish last */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1053  	rxdesc->callback = dma_callback;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1054  	rxdesc->callback_param = pl022;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1055  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1056  	/* Submit and fire RX and TX with TX last so we're ready to read! */
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1057  	dmaengine_submit(rxdesc);
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1058  	dmaengine_submit(txdesc);
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1059  	dma_async_issue_pending(rxchan);
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1060  	dma_async_issue_pending(txchan);
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1061  	pl022->dma_running = true;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1062  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1063  	return 0;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1064  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1065  err_txdesc:
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1066  	dmaengine_terminate_all(txchan);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1067  err_rxdesc:
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1068  	dmaengine_terminate_all(rxchan);
b729889686afb7d drivers/spi/amba-pl022.c Linus Walleij            2010-12-22  1069  	dma_unmap_sg(txchan->device->dev, pl022->sgt_tx.sgl,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1070  		     pl022->sgt_tx.nents, DMA_TO_DEVICE);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1071  err_tx_sgmap:
b729889686afb7d drivers/spi/amba-pl022.c Linus Walleij            2010-12-22  1072  	dma_unmap_sg(rxchan->device->dev, pl022->sgt_rx.sgl,
3ffa6158f002e09 drivers/spi/spi-pl022.c  Ray Jui                  2014-10-09  1073  		     pl022->sgt_rx.nents, DMA_FROM_DEVICE);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1074  err_rx_sgmap:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1075  	sg_free_table(&pl022->sgt_tx);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1076  err_alloc_tx_sg:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1077  	sg_free_table(&pl022->sgt_rx);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1078  err_alloc_rx_sg:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1079  	return -ENOMEM;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1080  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1081  
fd4a319bc933ae9 drivers/spi/spi-pl022.c  Grant Likely             2012-12-07  1082  static int pl022_dma_probe(struct pl022 *pl022)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1083  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1084  	dma_cap_mask_t mask;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1085  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1086  	/* Try to acquire a generic DMA engine slave channel */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1087  	dma_cap_zero(mask);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1088  	dma_cap_set(DMA_SLAVE, mask);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1089  	/*
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1090  	 * We need both RX and TX channels to do DMA, else do none
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1091  	 * of them.
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1092  	 */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1093  	pl022->dma_rx_channel = dma_request_channel(mask,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1094  					    pl022->master_info->dma_filter,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1095  					    pl022->master_info->dma_rx_param);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1096  	if (!pl022->dma_rx_channel) {
43c640157d4366a drivers/spi/amba-pl022.c Viresh Kumar             2011-05-16  1097  		dev_dbg(&pl022->adev->dev, "no RX DMA channel!\n");
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1098  		goto err_no_rxchan;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1099  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1100  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1101  	pl022->dma_tx_channel = dma_request_channel(mask,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1102  					    pl022->master_info->dma_filter,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1103  					    pl022->master_info->dma_tx_param);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1104  	if (!pl022->dma_tx_channel) {
43c640157d4366a drivers/spi/amba-pl022.c Viresh Kumar             2011-05-16  1105  		dev_dbg(&pl022->adev->dev, "no TX DMA channel!\n");
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1106  		goto err_no_txchan;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1107  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1108  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1109  	pl022->dummypage = kmalloc(PAGE_SIZE, GFP_KERNEL);
77538f4a98dc542 drivers/spi/spi-pl022.c  Jingoo Han               2014-04-29  1110  	if (!pl022->dummypage)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1111  		goto err_no_dummypage;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1112  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1113  	dev_info(&pl022->adev->dev, "setup for DMA on RX %s, TX %s\n",
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1114  		 dma_chan_name(pl022->dma_rx_channel),
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1115  		 dma_chan_name(pl022->dma_tx_channel));
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1116  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1117  	return 0;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1118  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1119  err_no_dummypage:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1120  	dma_release_channel(pl022->dma_tx_channel);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1121  err_no_txchan:
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1122  	dma_release_channel(pl022->dma_rx_channel);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1123  	pl022->dma_rx_channel = NULL;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1124  err_no_rxchan:
43c640157d4366a drivers/spi/amba-pl022.c Viresh Kumar             2011-05-16  1125  	dev_err(&pl022->adev->dev,
43c640157d4366a drivers/spi/amba-pl022.c Viresh Kumar             2011-05-16  1126  			"Failed to work in dma mode, work without dma!\n");
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1127  	return -ENODEV;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1128  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1129  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1130  static int pl022_dma_autoprobe(struct pl022 *pl022)
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1131  {
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1132  	struct device *dev = &pl022->adev->dev;
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1133  	struct dma_chan *chan;
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1134  	int err;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1135  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1136  	/* automatically configure DMA channels from platform, normally using DT */
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1137  	chan = dma_request_slave_channel_reason(dev, "rx");
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1138  	if (IS_ERR(chan)) {
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1139  		err = PTR_ERR(chan);
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1140  		goto err_no_rxchan;
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1141  	}
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1142  
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1143  	pl022->dma_rx_channel = chan;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1144  
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1145  	chan = dma_request_slave_channel_reason(dev, "tx");
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1146  	if (IS_ERR(chan)) {
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1147  		err = PTR_ERR(chan);
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1148  		goto err_no_txchan;
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1149  	}
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1150  
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1151  	pl022->dma_tx_channel = chan;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1152  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1153  	pl022->dummypage = kmalloc(PAGE_SIZE, GFP_KERNEL);
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1154  	if (!pl022->dummypage) {
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1155  		err = -ENOMEM;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1156  		goto err_no_dummypage;
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1157  	}
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1158  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1159  	return 0;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1160  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1161  err_no_dummypage:
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1162  	dma_release_channel(pl022->dma_tx_channel);
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1163  	pl022->dma_tx_channel = NULL;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1164  err_no_txchan:
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1165  	dma_release_channel(pl022->dma_rx_channel);
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1166  	pl022->dma_rx_channel = NULL;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1167  err_no_rxchan:
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  1168  	return err;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1169  }
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1170  		
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1171  static void terminate_dma(struct pl022 *pl022)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1172  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1173  	struct dma_chan *rxchan = pl022->dma_rx_channel;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1174  	struct dma_chan *txchan = pl022->dma_tx_channel;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1175  
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1176  	dmaengine_terminate_all(rxchan);
ecd442fd9e388a3 drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  1177  	dmaengine_terminate_all(txchan);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1178  	unmap_free_dma_scatter(pl022);
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1179  	pl022->dma_running = false;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1180  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1181  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1182  static void pl022_dma_remove(struct pl022 *pl022)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1183  {
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1184  	if (pl022->dma_running)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1185  		terminate_dma(pl022);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1186  	if (pl022->dma_tx_channel)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1187  		dma_release_channel(pl022->dma_tx_channel);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1188  	if (pl022->dma_rx_channel)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1189  		dma_release_channel(pl022->dma_rx_channel);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1190  	kfree(pl022->dummypage);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1191  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1192  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1193  #else
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1194  static inline int configure_dma(struct pl022 *pl022)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1195  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1196  	return -ENODEV;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1197  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1198  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1199  static inline int pl022_dma_autoprobe(struct pl022 *pl022)
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1200  {
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1201  	return 0;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1202  }
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  1203  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1204  static inline int pl022_dma_probe(struct pl022 *pl022)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1205  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1206  	return 0;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1207  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1208  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1209  static inline void pl022_dma_remove(struct pl022 *pl022)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1210  {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1211  }
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1212  #endif
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1213  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1214  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1215   * pl022_interrupt_handler - Interrupt handler for SSP controller
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1216   *
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1217   * This function handles interrupts generated for an interrupt based transfer.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1218   * If a receive overrun (ROR) interrupt is there then we disable SSP, flag the
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1219   * current message's state as STATE_ERROR and schedule the tasklet
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1220   * pump_transfers which will do the postprocessing of the current message by
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1221   * calling giveback(). Otherwise it reads data from RX FIFO till there is no
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1222   * more data, and writes data in TX FIFO till it is not full. If we complete
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1223   * the transfer we move to the next transfer and schedule the tasklet.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1224   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1225  static irqreturn_t pl022_interrupt_handler(int irq, void *dev_id)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1226  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1227  	struct pl022 *pl022 = dev_id;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1228  	struct spi_message *msg = pl022->cur_msg;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1229  	u16 irq_status = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1230  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1231  	if (unlikely(!msg)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1232  		dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1233  			"bad message state in interrupt handler");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1234  		/* Never fail */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1235  		return IRQ_HANDLED;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1236  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1237  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1238  	/* Read the Interrupt Status Register */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1239  	irq_status = readw(SSP_MIS(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1240  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1241  	if (unlikely(!irq_status))
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1242  		return IRQ_NONE;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1243  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1244  	/*
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1245  	 * This handles the FIFO interrupts, the timeout
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1246  	 * interrupts are flatly ignored, they cannot be
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1247  	 * trusted.
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1248  	 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1249  	if (unlikely(irq_status & SSP_MIS_MASK_RORMIS)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1250  		/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1251  		 * Overrun interrupt - bail out since our Data has been
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1252  		 * corrupted
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1253  		 */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1254  		dev_err(&pl022->adev->dev, "FIFO overrun\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1255  		if (readw(SSP_SR(pl022->virtbase)) & SSP_SR_MASK_RFF)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1256  			dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1257  				"RXFIFO is full\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1258  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1259  		/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1260  		 * Disable and clear interrupts, disable SSP,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1261  		 * mark message with bad status so it can be
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1262  		 * retried.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1263  		 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1264  		writew(DISABLE_ALL_INTERRUPTS,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1265  		       SSP_IMSC(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1266  		writew(CLEAR_ALL_INTERRUPTS, SSP_ICR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1267  		writew((readw(SSP_CR1(pl022->virtbase)) &
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1268  			(~SSP_CR1_MASK_SSE)), SSP_CR1(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1269  		msg->state = STATE_ERROR;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1270  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1271  		/* Schedule message queue handler */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1272  		tasklet_schedule(&pl022->pump_transfers);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1273  		return IRQ_HANDLED;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1274  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1275  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1276  	readwriter(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1277  
7183d1ebda477c4 drivers/spi/spi-pl022.c  Alexander Sverdlin       2015-02-27  1278  	if (pl022->tx == pl022->tx_end) {
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1279  		/* Disable Transmit interrupt, enable receive interrupt */
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1280  		writew((readw(SSP_IMSC(pl022->virtbase)) &
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1281  		       ~SSP_IMSC_MASK_TXIM) | SSP_IMSC_MASK_RXIM,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1282  		       SSP_IMSC(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1283  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1284  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1285  	/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1286  	 * Since all transactions must write as much as shall be read,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1287  	 * we can conclude the entire transaction once RX is complete.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1288  	 * At this point, all TX will always be finished.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1289  	 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1290  	if (pl022->rx >= pl022->rx_end) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1291  		writew(DISABLE_ALL_INTERRUPTS,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1292  		       SSP_IMSC(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1293  		writew(CLEAR_ALL_INTERRUPTS, SSP_ICR(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1294  		if (unlikely(pl022->rx > pl022->rx_end)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1295  			dev_warn(&pl022->adev->dev, "read %u surplus "
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1296  				 "bytes (did you request an odd "
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1297  				 "number of bytes on a 16bit bus?)\n",
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1298  				 (u32) (pl022->rx - pl022->rx_end));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1299  		}
25985edcedea639 drivers/spi/amba-pl022.c Lucas De Marchi          2011-03-30  1300  		/* Update total bytes transferred */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1301  		msg->actual_length += pl022->cur_transfer->len;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1302  		/* Move to next transfer */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1303  		msg->state = next_transfer(pl022);
c0b07605f1a0285 drivers/spi/spi-pl022.c  Fredrik Ternerot         2018-11-13  1304  		if (msg->state != STATE_DONE && pl022->cur_transfer->cs_change)
c0b07605f1a0285 drivers/spi/spi-pl022.c  Fredrik Ternerot         2018-11-13  1305  			pl022_cs_control(pl022, SSP_CHIP_DESELECT);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1306  		tasklet_schedule(&pl022->pump_transfers);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1307  		return IRQ_HANDLED;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1308  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1309  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1310  	return IRQ_HANDLED;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1311  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1312  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1313  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1314   * This sets up the pointers to memory for the next message to
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1315   * send out on the SPI bus.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1316   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1317  static int set_up_next_transfer(struct pl022 *pl022,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1318  				struct spi_transfer *transfer)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1319  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1320  	int residue;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1321  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1322  	/* Sanity check the message for this bus width */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1323  	residue = pl022->cur_transfer->len % pl022->cur_chip->n_bytes;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1324  	if (unlikely(residue != 0)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1325  		dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1326  			"message of %u bytes to transmit but the current "
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1327  			"chip bus has a data width of %u bytes!\n",
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1328  			pl022->cur_transfer->len,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1329  			pl022->cur_chip->n_bytes);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1330  		dev_err(&pl022->adev->dev, "skipping this message\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1331  		return -EIO;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1332  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1333  	pl022->tx = (void *)transfer->tx_buf;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1334  	pl022->tx_end = pl022->tx + pl022->cur_transfer->len;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1335  	pl022->rx = (void *)transfer->rx_buf;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1336  	pl022->rx_end = pl022->rx + pl022->cur_transfer->len;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1337  	pl022->write =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1338  	    pl022->tx ? pl022->cur_chip->write : WRITING_NULL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1339  	pl022->read = pl022->rx ? pl022->cur_chip->read : READING_NULL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1340  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1341  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1342  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1343  /**
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1344   * pump_transfers - Tasklet function which schedules next transfer
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1345   * when running in interrupt or DMA transfer mode.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1346   * @data: SSP driver private data structure
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1347   *
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1348   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1349  static void pump_transfers(unsigned long data)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1350  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1351  	struct pl022 *pl022 = (struct pl022 *) data;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1352  	struct spi_message *message = NULL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1353  	struct spi_transfer *transfer = NULL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1354  	struct spi_transfer *previous = NULL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1355  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1356  	/* Get current state information */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1357  	message = pl022->cur_msg;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1358  	transfer = pl022->cur_transfer;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1359  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1360  	/* Handle for abort */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1361  	if (message->state == STATE_ERROR) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1362  		message->status = -EIO;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1363  		giveback(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1364  		return;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1365  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1366  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1367  	/* Handle end of message */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1368  	if (message->state == STATE_DONE) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1369  		message->status = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1370  		giveback(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1371  		return;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1372  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1373  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1374  	/* Delay if requested at end of transfer before CS change */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1375  	if (message->state == STATE_RUNNING) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1376  		previous = list_entry(transfer->transfer_list.prev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1377  					struct spi_transfer,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1378  					transfer_list);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1379  		if (previous->delay_usecs)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1380  			/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1381  			 * FIXME: This runs in interrupt context.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1382  			 * Is this really smart?
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1383  			 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1384  			udelay(previous->delay_usecs);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1385  
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  1386  		/* Reselect chip select only if cs_change was requested */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1387  		if (previous->cs_change)
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1388  			pl022_cs_control(pl022, SSP_CHIP_SELECT);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1389  	} else {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1390  		/* STATE_START */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1391  		message->state = STATE_RUNNING;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1392  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1393  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1394  	if (set_up_next_transfer(pl022, transfer)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1395  		message->state = STATE_ERROR;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1396  		message->status = -EIO;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1397  		giveback(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1398  		return;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1399  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1400  	/* Flush the FIFOs and let's go! */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1401  	flush(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1402  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1403  	if (pl022->cur_chip->enable_dma) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1404  		if (configure_dma(pl022)) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1405  			dev_dbg(&pl022->adev->dev,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1406  				"configuration of DMA failed, fall back to interrupt mode\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1407  			goto err_config_dma;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1408  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1409  		return;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1410  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1411  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1412  err_config_dma:
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1413  	/* enable all interrupts except RX */
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1414  	writew(ENABLE_ALL_INTERRUPTS & ~SSP_IMSC_MASK_RXIM, SSP_IMSC(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1415  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1416  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1417  static void do_interrupt_dma_transfer(struct pl022 *pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1418  {
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1419  	/*
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1420  	 * Default is to enable all interrupts except RX -
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1421  	 * this will be enabled once TX is complete
172289df4004ccc drivers/spi/spi-pl022.c  Chris Blair              2011-06-04  1422  	 */
d555ea05f9d8ebf drivers/spi/spi-pl022.c  Mark Brown               2014-08-01  1423  	u32 irqflags = (u32)(ENABLE_ALL_INTERRUPTS & ~SSP_IMSC_MASK_RXIM);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1424  
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  1425  	/* Enable target chip, if not already active */
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  1426  	if (!pl022->next_msg_cs_active)
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1427  		pl022_cs_control(pl022, SSP_CHIP_SELECT);
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  1428  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1429  	if (set_up_next_transfer(pl022, pl022->cur_transfer)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1430  		/* Error path */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1431  		pl022->cur_msg->state = STATE_ERROR;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1432  		pl022->cur_msg->status = -EIO;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1433  		giveback(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1434  		return;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1435  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1436  	/* If we're using DMA, set up DMA here */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1437  	if (pl022->cur_chip->enable_dma) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1438  		/* Configure DMA transfer */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1439  		if (configure_dma(pl022)) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1440  			dev_dbg(&pl022->adev->dev,
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1441  				"configuration of DMA failed, fall back to interrupt mode\n");
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1442  			goto err_config_dma;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1443  		}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1444  		/* Disable interrupts in DMA mode, IRQ from DMA controller */
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1445  		irqflags = DISABLE_ALL_INTERRUPTS;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1446  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1447  err_config_dma:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1448  	/* Enable SSP, turn on interrupts */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1449  	writew((readw(SSP_CR1(pl022->virtbase)) | SSP_CR1_MASK_SSE),
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1450  	       SSP_CR1(pl022->virtbase));
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1451  	writew(irqflags, SSP_IMSC(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1452  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1453  
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1454  static void print_current_status(struct pl022 *pl022)
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1455  {
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1456  	u32 read_cr0;
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1457  	u16 read_cr1, read_dmacr, read_sr;
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1458  
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1459  	if (pl022->vendor->extended_cr)
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1460  		read_cr0 = readl(SSP_CR0(pl022->virtbase));
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1461  	else
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1462  		read_cr0 = readw(SSP_CR0(pl022->virtbase));
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1463  	read_cr1 = readw(SSP_CR1(pl022->virtbase));
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1464  	read_dmacr = readw(SSP_DMACR(pl022->virtbase));
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1465  	read_sr = readw(SSP_SR(pl022->virtbase));
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1466  
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1467  	dev_warn(&pl022->adev->dev, "spi-pl022 CR0: %x\n", read_cr0);
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1468  	dev_warn(&pl022->adev->dev, "spi-pl022 CR1: %x\n", read_cr1);
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1469  	dev_warn(&pl022->adev->dev, "spi-pl022 DMACR: %x\n", read_dmacr);
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1470  	dev_warn(&pl022->adev->dev, "spi-pl022 SR: %x\n", read_sr);
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1471  	dev_warn(&pl022->adev->dev,
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1472  			"spi-pl022 exp_fifo_level/fifodepth: %u/%d\n",
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1473  			pl022->exp_fifo_level,
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1474  			pl022->vendor->fifodepth);
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1475  
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1476  }
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1477  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1478  static void do_polling_transfer(struct pl022 *pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1479  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1480  	struct spi_message *message = NULL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1481  	struct spi_transfer *transfer = NULL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1482  	struct spi_transfer *previous = NULL;
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1483  	unsigned long time, timeout;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1484  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1485  	message = pl022->cur_msg;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1486  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1487  	while (message->state != STATE_DONE) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1488  		/* Handle for abort */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1489  		if (message->state == STATE_ERROR)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1490  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1491  		transfer = pl022->cur_transfer;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1492  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1493  		/* Delay if requested at end of transfer */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1494  		if (message->state == STATE_RUNNING) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1495  			previous =
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1496  			    list_entry(transfer->transfer_list.prev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1497  				       struct spi_transfer, transfer_list);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1498  			if (previous->delay_usecs)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1499  				udelay(previous->delay_usecs);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1500  			if (previous->cs_change)
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1501  				pl022_cs_control(pl022, SSP_CHIP_SELECT);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1502  		} else {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1503  			/* STATE_START */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1504  			message->state = STATE_RUNNING;
8b8d719161c3866 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  1505  			if (!pl022->next_msg_cs_active)
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1506  				pl022_cs_control(pl022, SSP_CHIP_SELECT);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1507  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1508  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1509  		/* Configuration Changing Per Transfer */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1510  		if (set_up_next_transfer(pl022, transfer)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1511  			/* Error path */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1512  			message->state = STATE_ERROR;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1513  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1514  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1515  		/* Flush FIFOs and enable SSP */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1516  		flush(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1517  		writew((readw(SSP_CR1(pl022->virtbase)) | SSP_CR1_MASK_SSE),
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1518  		       SSP_CR1(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1519  
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1520  		dev_dbg(&pl022->adev->dev, "polling transfer ongoing ...\n");
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1521  
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1522  		timeout = jiffies + msecs_to_jiffies(SPI_POLLING_TIMEOUT);
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1523  		while (pl022->tx < pl022->tx_end || pl022->rx < pl022->rx_end) {
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1524  			time = jiffies;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1525  			readwriter(pl022);
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1526  			if (time_after(time, timeout)) {
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1527  				dev_warn(&pl022->adev->dev,
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1528  				"%s: timeout!\n", __func__);
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1529  				message->state = STATE_TIMEOUT;
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1530  				print_current_status(pl022);
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1531  				goto out;
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1532  			}
521999bd4a8c47a drivers/spi/amba-pl022.c Linus Walleij            2011-05-19  1533  			cpu_relax();
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1534  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1535  
25985edcedea639 drivers/spi/amba-pl022.c Lucas De Marchi          2011-03-30  1536  		/* Update total byte transferred */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1537  		message->actual_length += pl022->cur_transfer->len;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1538  		/* Move to next transfer */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1539  		message->state = next_transfer(pl022);
c0b07605f1a0285 drivers/spi/spi-pl022.c  Fredrik Ternerot         2018-11-13  1540  		if (message->state != STATE_DONE
c0b07605f1a0285 drivers/spi/spi-pl022.c  Fredrik Ternerot         2018-11-13  1541  		    && pl022->cur_transfer->cs_change)
c0b07605f1a0285 drivers/spi/spi-pl022.c  Fredrik Ternerot         2018-11-13  1542  			pl022_cs_control(pl022, SSP_CHIP_DESELECT);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1543  	}
a18c266f8e43004 drivers/spi/amba-pl022.c Magnus Templing          2011-05-19  1544  out:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1545  	/* Handle end of message */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1546  	if (message->state == STATE_DONE)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1547  		message->status = 0;
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1548  	else if (message->state == STATE_TIMEOUT)
7aef2b646b24247 drivers/spi/spi-pl022.c  Jiwei Sun                2019-01-18  1549  		message->status = -EAGAIN;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1550  	else
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1551  		message->status = -EIO;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1552  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1553  	giveback(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1554  	return;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1555  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1556  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1557  static int pl022_transfer_one_message(struct spi_master *master,
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1558  				      struct spi_message *msg)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1559  {
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1560  	struct pl022 *pl022 = spi_master_get_devdata(master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1561  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1562  	/* Initial message state */
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1563  	pl022->cur_msg = msg;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1564  	msg->state = STATE_START;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1565  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1566  	pl022->cur_transfer = list_entry(msg->transfers.next,
f1e45f86ed93b9e drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1567  					 struct spi_transfer, transfer_list);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1568  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1569  	/* Setup the SPI using the per chip configuration */
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1570  	pl022->cur_chip = spi_get_ctldata(msg->spi);
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1571  	pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
d4b6af2e0e29278 drivers/spi/spi-pl022.c  Chris Blair              2011-11-04  1572  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1573  	restore_state(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1574  	flush(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1575  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1576  	if (pl022->cur_chip->xfer_type == POLLING_TRANSFER)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1577  		do_polling_transfer(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1578  	else
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1579  		do_interrupt_dma_transfer(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1580  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1581  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1582  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1583  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1584  static int pl022_unprepare_transfer_hardware(struct spi_master *master)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1585  {
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1586  	struct pl022 *pl022 = spi_master_get_devdata(master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1587  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1588  	/* nothing more to do - disable spi/ssp and power off */
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1589  	writew((readw(SSP_CR1(pl022->virtbase)) &
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  1590  		(~SSP_CR1_MASK_SSE)), SSP_CR1(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1591  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1592  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1593  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1594  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1595  static int verify_controller_parameters(struct pl022 *pl022,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1596  				struct pl022_config_chip const *chip_info)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1597  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1598  	if ((chip_info->iface < SSP_INTERFACE_MOTOROLA_SPI)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1599  	    || (chip_info->iface > SSP_INTERFACE_UNIDIRECTIONAL)) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1600  		dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1601  			"interface is configured incorrectly\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1602  		return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1603  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1604  	if ((chip_info->iface == SSP_INTERFACE_UNIDIRECTIONAL) &&
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1605  	    (!pl022->vendor->unidir)) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1606  		dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1607  			"unidirectional mode not supported in this "
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1608  			"hardware version\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1609  		return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1610  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1611  	if ((chip_info->hierarchy != SSP_MASTER)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1612  	    && (chip_info->hierarchy != SSP_SLAVE)) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1613  		dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1614  			"hierarchy is configured incorrectly\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1615  		return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1616  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1617  	if ((chip_info->com_mode != INTERRUPT_TRANSFER)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1618  	    && (chip_info->com_mode != DMA_TRANSFER)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1619  	    && (chip_info->com_mode != POLLING_TRANSFER)) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1620  		dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1621  			"Communication mode is configured incorrectly\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1622  		return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1623  	}
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1624  	switch (chip_info->rx_lev_trig) {
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1625  	case SSP_RX_1_OR_MORE_ELEM:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1626  	case SSP_RX_4_OR_MORE_ELEM:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1627  	case SSP_RX_8_OR_MORE_ELEM:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1628  		/* These are always OK, all variants can handle this */
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1629  		break;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1630  	case SSP_RX_16_OR_MORE_ELEM:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1631  		if (pl022->vendor->fifodepth < 16) {
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1632  			dev_err(&pl022->adev->dev,
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1633  			"RX FIFO Trigger Level is configured incorrectly\n");
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1634  			return -EINVAL;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1635  		}
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1636  		break;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1637  	case SSP_RX_32_OR_MORE_ELEM:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1638  		if (pl022->vendor->fifodepth < 32) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1639  			dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1640  			"RX FIFO Trigger Level is configured incorrectly\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1641  			return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1642  		}
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1643  		break;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1644  	default:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1645  		dev_err(&pl022->adev->dev,
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1646  			"RX FIFO Trigger Level is configured incorrectly\n");
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1647  		return -EINVAL;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1648  	}
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1649  	switch (chip_info->tx_lev_trig) {
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1650  	case SSP_TX_1_OR_MORE_EMPTY_LOC:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1651  	case SSP_TX_4_OR_MORE_EMPTY_LOC:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1652  	case SSP_TX_8_OR_MORE_EMPTY_LOC:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1653  		/* These are always OK, all variants can handle this */
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1654  		break;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1655  	case SSP_TX_16_OR_MORE_EMPTY_LOC:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1656  		if (pl022->vendor->fifodepth < 16) {
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1657  			dev_err(&pl022->adev->dev,
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1658  			"TX FIFO Trigger Level is configured incorrectly\n");
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1659  			return -EINVAL;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1660  		}
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1661  		break;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1662  	case SSP_TX_32_OR_MORE_EMPTY_LOC:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1663  		if (pl022->vendor->fifodepth < 32) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1664  			dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1665  			"TX FIFO Trigger Level is configured incorrectly\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1666  			return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1667  		}
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1668  		break;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1669  	default:
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1670  		dev_err(&pl022->adev->dev,
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1671  			"TX FIFO Trigger Level is configured incorrectly\n");
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1672  		return -EINVAL;
78b2b911bf70203 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1673  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1674  	if (chip_info->iface == SSP_INTERFACE_NATIONAL_MICROWIRE) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1675  		if ((chip_info->ctrl_len < SSP_BITS_4)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1676  		    || (chip_info->ctrl_len > SSP_BITS_32)) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1677  			dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1678  				"CTRL LEN is configured incorrectly\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1679  			return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1680  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1681  		if ((chip_info->wait_state != SSP_MWIRE_WAIT_ZERO)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1682  		    && (chip_info->wait_state != SSP_MWIRE_WAIT_ONE)) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1683  			dev_err(&pl022->adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1684  				"Wait State is configured incorrectly\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1685  			return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1686  		}
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1687  		/* Half duplex is only available in the ST Micro version */
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1688  		if (pl022->vendor->extended_cr) {
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1689  			if ((chip_info->duplex !=
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1690  			     SSP_MICROWIRE_CHANNEL_FULL_DUPLEX)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1691  			    && (chip_info->duplex !=
4a4fd47155ac49b drivers/spi/amba-pl022.c Julia Lawall             2010-09-29  1692  				SSP_MICROWIRE_CHANNEL_HALF_DUPLEX)) {
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1693  				dev_err(&pl022->adev->dev,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1694  					"Microwire duplex mode is configured incorrectly\n");
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1695  				return -EINVAL;
4a4fd47155ac49b drivers/spi/amba-pl022.c Julia Lawall             2010-09-29  1696  			}
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1697  		} else {
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1698  			if (chip_info->duplex != SSP_MICROWIRE_CHANNEL_FULL_DUPLEX)
5a1c98be1de165c drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1699  				dev_err(&pl022->adev->dev,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1700  					"Microwire half duplex mode requested,"
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1701  					" but this is only available in the"
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1702  					" ST version of PL022\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1703  			return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1704  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1705  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1706  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1707  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1708  
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1709  static inline u32 spi_rate(u32 rate, u16 cpsdvsr, u16 scr)
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1710  {
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1711  	return rate / (cpsdvsr * (1 + scr));
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1712  }
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1713  
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1714  static int calculate_effective_freq(struct pl022 *pl022, int freq, struct
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1715  				    ssp_clock_params * clk_freq)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1716  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1717  	/* Lets calculate the frequency parameters */
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1718  	u16 cpsdvsr = CPSDVR_MIN, scr = SCR_MIN;
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1719  	u32 rate, max_tclk, min_tclk, best_freq = 0, best_cpsdvsr = 0,
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1720  		best_scr = 0, tmp, found = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1721  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1722  	rate = clk_get_rate(pl022->clk);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1723  	/* cpsdvscr = 2 & scr 0 */
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1724  	max_tclk = spi_rate(rate, CPSDVR_MIN, SCR_MIN);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1725  	/* cpsdvsr = 254 & scr = 255 */
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1726  	min_tclk = spi_rate(rate, CPSDVR_MAX, SCR_MAX);
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1727  
ea505bc99f77f3f drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1728  	if (freq > max_tclk)
ea505bc99f77f3f drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1729  		dev_warn(&pl022->adev->dev,
ea505bc99f77f3f drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1730  			"Max speed that can be programmed is %d Hz, you requested %d\n",
ea505bc99f77f3f drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1731  			max_tclk, freq);
ea505bc99f77f3f drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1732  
ea505bc99f77f3f drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1733  	if (freq < min_tclk) {
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1734  		dev_err(&pl022->adev->dev,
ea505bc99f77f3f drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1735  			"Requested frequency: %d Hz is less than minimum possible %d Hz\n",
ea505bc99f77f3f drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1736  			freq, min_tclk);
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1737  		return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1738  	}
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1739  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1740  	/*
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1741  	 * best_freq will give closest possible available rate (<= requested
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1742  	 * freq) for all values of scr & cpsdvsr.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1743  	 */
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1744  	while ((cpsdvsr <= CPSDVR_MAX) && !found) {
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1745  		while (scr <= SCR_MAX) {
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1746  			tmp = spi_rate(rate, cpsdvsr, scr);
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1747  
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1748  			if (tmp > freq) {
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1749  				/* we need lower freq */
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1750  				scr++;
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1751  				continue;
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1752  			}
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1753  
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1754  			/*
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1755  			 * If found exact value, mark found and break.
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1756  			 * If found more closer value, update and break.
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1757  			 */
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1758  			if (tmp > best_freq) {
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1759  				best_freq = tmp;
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1760  				best_cpsdvsr = cpsdvsr;
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1761  				best_scr = scr;
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1762  
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1763  				if (tmp == freq)
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1764  					found = 1;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1765  			}
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1766  			/*
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1767  			 * increased scr will give lower rates, which are not
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1768  			 * required
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1769  			 */
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1770  			break;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1771  		}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1772  		cpsdvsr += 2;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1773  		scr = SCR_MIN;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1774  	}
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1775  
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1776  	WARN(!best_freq, "pl022: Matching cpsdvsr and scr not found for %d Hz rate \n",
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1777  			freq);
5eb806a3a68920a drivers/spi/spi-pl022.c  Viresh Kumar             2012-04-19  1778  
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1779  	clk_freq->cpsdvsr = (u8) (best_cpsdvsr & 0xFF);
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1780  	clk_freq->scr = (u8) (best_scr & 0xFF);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1781  	dev_dbg(&pl022->adev->dev,
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1782  		"SSP Target Frequency is: %u, Effective Frequency is %u\n",
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1783  		freq, best_freq);
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1784  	dev_dbg(&pl022->adev->dev, "SSP cpsdvsr = %d, scr = %d\n",
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1785  		clk_freq->cpsdvsr, clk_freq->scr);
0379b2a33a8a03d drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  1786  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1787  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1788  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1789  
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1790  /*
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1791   * A piece of default chip info unless the platform
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1792   * supplies it.
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1793   */
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1794  static const struct pl022_config_chip pl022_default_chip_info = {
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1795  	.com_mode = POLLING_TRANSFER,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1796  	.iface = SSP_INTERFACE_MOTOROLA_SPI,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1797  	.hierarchy = SSP_SLAVE,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1798  	.slave_tx_disable = DO_NOT_DRIVE_TX,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1799  	.rx_lev_trig = SSP_RX_1_OR_MORE_ELEM,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1800  	.tx_lev_trig = SSP_TX_1_OR_MORE_EMPTY_LOC,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1801  	.ctrl_len = SSP_BITS_8,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1802  	.wait_state = SSP_MWIRE_WAIT_ZERO,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1803  	.duplex = SSP_MICROWIRE_CHANNEL_FULL_DUPLEX,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1804  };
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1805  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1806  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1807   * pl022_setup - setup function registered to SPI master framework
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1808   * @spi: spi device which is requesting setup
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1809   *
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1810   * This function is registered to the SPI framework for this SPI master
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1811   * controller. If it is the first time when setup is called by this device,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1812   * this function will initialize the runtime state for this chip and save
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1813   * the same in the device structure. Else it will update the runtime info
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1814   * with the updated chip info. Nothing is really being written to the
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1815   * controller hardware here, that is not done until the actual transfer
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1816   * commence.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1817   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1818  static int pl022_setup(struct spi_device *spi)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1819  {
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1820  	struct pl022_config_chip const *chip_info;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1821  	struct pl022_config_chip chip_info_dt;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1822  	struct chip_data *chip;
c4a4784308f5cb8 drivers/spi/spi-pl022.c  Jonas Aaberg             2011-02-28  1823  	struct ssp_clock_params clk_freq = { .cpsdvsr = 0, .scr = 0};
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1824  	int status = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1825  	struct pl022 *pl022 = spi_master_get_devdata(spi->master);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1826  	unsigned int bits = spi->bits_per_word;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1827  	u32 tmp;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1828  	struct device_node *np = spi->dev.of_node;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1829  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1830  	if (!spi->max_speed_hz)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1831  		return -EINVAL;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1832  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1833  	/* Get controller_state if one is supplied */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1834  	chip = spi_get_ctldata(spi);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1835  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1836  	if (chip == NULL) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1837  		chip = kzalloc(sizeof(struct chip_data), GFP_KERNEL);
77538f4a98dc542 drivers/spi/spi-pl022.c  Jingoo Han               2014-04-29  1838  		if (!chip)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1839  			return -ENOMEM;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1840  		dev_dbg(&spi->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1841  			"allocated memory for controller's runtime state\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1842  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1843  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1844  	/* Get controller data if one is supplied */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1845  	chip_info = spi->controller_data;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1846  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1847  	if (chip_info == NULL) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1848  		if (np) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1849  			chip_info_dt = pl022_default_chip_info;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1850  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1851  			chip_info_dt.hierarchy = SSP_MASTER;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1852  			of_property_read_u32(np, "pl022,interface",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1853  				&chip_info_dt.iface);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1854  			of_property_read_u32(np, "pl022,com-mode",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1855  				&chip_info_dt.com_mode);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1856  			of_property_read_u32(np, "pl022,rx-level-trig",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1857  				&chip_info_dt.rx_lev_trig);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1858  			of_property_read_u32(np, "pl022,tx-level-trig",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1859  				&chip_info_dt.tx_lev_trig);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1860  			of_property_read_u32(np, "pl022,ctrl-len",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1861  				&chip_info_dt.ctrl_len);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1862  			of_property_read_u32(np, "pl022,wait-state",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1863  				&chip_info_dt.wait_state);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1864  			of_property_read_u32(np, "pl022,duplex",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1865  				&chip_info_dt.duplex);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1866  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1867  			chip_info = &chip_info_dt;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1868  		} else {
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1869  			chip_info = &pl022_default_chip_info;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1870  			/* spi_board_info.controller_data not is supplied */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1871  			dev_dbg(&spi->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1872  				"using default controller_data settings\n");
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1873  		}
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1874  	} else
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1875  		dev_dbg(&spi->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1876  			"using user supplied controller_data settings\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1877  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1878  	/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1879  	 * We can override with custom divisors, else we use the board
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1880  	 * frequency setting
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1881  	 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1882  	if ((0 == chip_info->clk_freq.cpsdvsr)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1883  	    && (0 == chip_info->clk_freq.scr)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1884  		status = calculate_effective_freq(pl022,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1885  						  spi->max_speed_hz,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1886  						  &clk_freq);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1887  		if (status < 0)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1888  			goto err_config_params;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1889  	} else {
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1890  		memcpy(&clk_freq, &chip_info->clk_freq, sizeof(clk_freq));
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1891  		if ((clk_freq.cpsdvsr % 2) != 0)
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1892  			clk_freq.cpsdvsr =
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1893  				clk_freq.cpsdvsr - 1;
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1894  	}
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1895  	if ((clk_freq.cpsdvsr < CPSDVR_MIN)
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1896  	    || (clk_freq.cpsdvsr > CPSDVR_MAX)) {
e3f88ae99609205 drivers/spi/amba-pl022.c Virupax Sadashivpetimath 2011-06-13  1897  		status = -EINVAL;
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1898  		dev_err(&spi->dev,
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1899  			"cpsdvsr is configured incorrectly\n");
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1900  		goto err_config_params;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1901  	}
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1902  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1903  	status = verify_controller_parameters(pl022, chip_info);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1904  	if (status) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1905  		dev_err(&spi->dev, "controller data is incorrect");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1906  		goto err_config_params;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1907  	}
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1908  
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1909  	pl022->rx_lev_trig = chip_info->rx_lev_trig;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1910  	pl022->tx_lev_trig = chip_info->tx_lev_trig;
083be3f05371b8f drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  1911  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1912  	/* Now set controller state based on controller data */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1913  	chip->xfer_type = chip_info->com_mode;
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1914  	if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1915  		dev_warn(&spi->dev,
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  1916  			 "invalid chip select\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1917  
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1918  	/* Check bits per word with vendor specific range */
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1919  	if ((bits <= 3) || (bits > pl022->vendor->max_bpw)) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1920  		status = -ENOTSUPP;
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1921  		dev_err(&spi->dev, "illegal data size for this controller!\n");
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1922  		dev_err(&spi->dev, "This controller can only handle 4 <= n <= %d bit words\n",
eb798c641a34ae9 drivers/spi/spi-pl022.c  Vinit Shenoy             2012-04-17  1923  				pl022->vendor->max_bpw);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1924  		goto err_config_params;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1925  	} else if (bits <= 8) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1926  		dev_dbg(&spi->dev, "4 <= n <=8 bits per word\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1927  		chip->n_bytes = 1;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1928  		chip->read = READING_U8;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1929  		chip->write = WRITING_U8;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1930  	} else if (bits <= 16) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1931  		dev_dbg(&spi->dev, "9 <= n <= 16 bits per word\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1932  		chip->n_bytes = 2;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1933  		chip->read = READING_U16;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1934  		chip->write = WRITING_U16;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1935  	} else {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1936  		dev_dbg(&spi->dev, "17 <= n <= 32 bits per word\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1937  		chip->n_bytes = 4;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1938  		chip->read = READING_U32;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1939  		chip->write = WRITING_U32;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1940  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1941  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1942  	/* Now Initialize all register settings required for this chip */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1943  	chip->cr0 = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1944  	chip->cr1 = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1945  	chip->dmacr = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1946  	chip->cpsr = 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1947  	if ((chip_info->com_mode == DMA_TRANSFER)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1948  	    && ((pl022->master_info)->enable_dma)) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1949  		chip->enable_dma = true;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1950  		dev_dbg(&spi->dev, "DMA mode set in controller state\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1951  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_ENABLED,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1952  			       SSP_DMACR_MASK_RXDMAE, 0);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1953  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_ENABLED,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1954  			       SSP_DMACR_MASK_TXDMAE, 1);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1955  	} else {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  1956  		chip->enable_dma = false;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1957  		dev_dbg(&spi->dev, "DMA mode NOT set in controller state\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1958  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_DISABLED,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1959  			       SSP_DMACR_MASK_RXDMAE, 0);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1960  		SSP_WRITE_BITS(chip->dmacr, SSP_DMA_DISABLED,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1961  			       SSP_DMACR_MASK_TXDMAE, 1);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1962  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1963  
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  1964  	chip->cpsr = clk_freq.cpsdvsr;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  1965  
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1966  	/* Special setup for the ST micro extended control registers */
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1967  	if (pl022->vendor->extended_cr) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1968  		u32 etx;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1969  
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1970  		if (pl022->vendor->pl023) {
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1971  			/* These bits are only in the PL023 */
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1972  			SSP_WRITE_BITS(chip->cr1, chip_info->clkdelay,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1973  				       SSP_CR1_MASK_FBCLKDEL_ST, 13);
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1974  		} else {
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1975  			/* These bits are in the PL022 but not PL023 */
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1976  			SSP_WRITE_BITS(chip->cr0, chip_info->duplex,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1977  				       SSP_CR0_MASK_HALFDUP_ST, 5);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1978  			SSP_WRITE_BITS(chip->cr0, chip_info->ctrl_len,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1979  				       SSP_CR0_MASK_CSS_ST, 16);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1980  			SSP_WRITE_BITS(chip->cr0, chip_info->iface,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1981  				       SSP_CR0_MASK_FRF_ST, 21);
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1982  			SSP_WRITE_BITS(chip->cr1, chip_info->wait_state,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1983  				       SSP_CR1_MASK_MWAIT_ST, 6);
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1984  		}
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1985  		SSP_WRITE_BITS(chip->cr0, bits - 1,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  1986  			       SSP_CR0_MASK_DSS_ST, 0);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1987  
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1988  		if (spi->mode & SPI_LSB_FIRST) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1989  			tmp = SSP_RX_LSB;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1990  			etx = SSP_TX_LSB;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1991  		} else {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1992  			tmp = SSP_RX_MSB;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1993  			etx = SSP_TX_MSB;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1994  		}
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1995  		SSP_WRITE_BITS(chip->cr1, tmp, SSP_CR1_MASK_RENDN_ST, 4);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  1996  		SSP_WRITE_BITS(chip->cr1, etx, SSP_CR1_MASK_TENDN_ST, 5);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1997  		SSP_WRITE_BITS(chip->cr1, chip_info->rx_lev_trig,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1998  			       SSP_CR1_MASK_RXIFLSEL_ST, 7);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  1999  		SSP_WRITE_BITS(chip->cr1, chip_info->tx_lev_trig,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2000  			       SSP_CR1_MASK_TXIFLSEL_ST, 10);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2001  	} else {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2002  		SSP_WRITE_BITS(chip->cr0, bits - 1,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2003  			       SSP_CR0_MASK_DSS, 0);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2004  		SSP_WRITE_BITS(chip->cr0, chip_info->iface,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2005  			       SSP_CR0_MASK_FRF, 4);
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2006  	}
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2007  
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2008  	/* Stuff that is common for all versions */
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2009  	if (spi->mode & SPI_CPOL)
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2010  		tmp = SSP_CLK_POL_IDLE_HIGH;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2011  	else
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2012  		tmp = SSP_CLK_POL_IDLE_LOW;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2013  	SSP_WRITE_BITS(chip->cr0, tmp, SSP_CR0_MASK_SPO, 6);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2014  
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2015  	if (spi->mode & SPI_CPHA)
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2016  		tmp = SSP_CLK_SECOND_EDGE;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2017  	else
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2018  		tmp = SSP_CLK_FIRST_EDGE;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2019  	SSP_WRITE_BITS(chip->cr0, tmp, SSP_CR0_MASK_SPH, 7);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2020  
f9d629c737cb668 drivers/spi/amba-pl022.c Linus Walleij            2010-10-01  2021  	SSP_WRITE_BITS(chip->cr0, clk_freq.scr, SSP_CR0_MASK_SCR, 8);
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2022  	/* Loopback is available on all versions except PL023 */
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2023  	if (pl022->vendor->loopback) {
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2024  		if (spi->mode & SPI_LOOP)
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2025  			tmp = LOOPBACK_ENABLED;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2026  		else
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2027  			tmp = LOOPBACK_DISABLED;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2028  		SSP_WRITE_BITS(chip->cr1, tmp, SSP_CR1_MASK_LBM, 0);
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2029  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2030  	SSP_WRITE_BITS(chip->cr1, SSP_DISABLED, SSP_CR1_MASK_SSE, 1);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2031  	SSP_WRITE_BITS(chip->cr1, chip_info->hierarchy, SSP_CR1_MASK_MS, 2);
f1e45f86ed93b9e drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2032  	SSP_WRITE_BITS(chip->cr1, chip_info->slave_tx_disable, SSP_CR1_MASK_SOD,
f1e45f86ed93b9e drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2033  		3);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2034  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2035  	/* Save controller_state */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2036  	spi_set_ctldata(spi, chip);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2037  	return status;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2038   err_config_params:
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2039  	spi_set_ctldata(spi, NULL);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2040  	kfree(chip);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2041  	return status;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2042  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2043  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2044  /**
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2045   * pl022_cleanup - cleanup function registered to SPI master framework
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2046   * @spi: spi device which is requesting cleanup
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2047   *
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2048   * This function is registered to the SPI framework for this SPI master
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2049   * controller. It will free the runtime state of chip.
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2050   */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2051  static void pl022_cleanup(struct spi_device *spi)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2052  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2053  	struct chip_data *chip = spi_get_ctldata(spi);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2054  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2055  	spi_set_ctldata(spi, NULL);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2056  	kfree(chip);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2057  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2058  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2059  static struct pl022_ssp_controller *
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2060  pl022_platform_data_dt_get(struct device *dev)
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2061  {
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2062  	struct device_node *np = dev->of_node;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2063  	struct pl022_ssp_controller *pd;
849794c50b24b93 drivers/spi/spi-pl022.c  Rabin Vincent            2017-04-06  2064  	u32 tmp = 0;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2065  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2066  	if (!np) {
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2067  		dev_err(dev, "no dt node defined\n");
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2068  		return NULL;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2069  	}
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2070  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2071  	pd = devm_kzalloc(dev, sizeof(struct pl022_ssp_controller), GFP_KERNEL);
77538f4a98dc542 drivers/spi/spi-pl022.c  Jingoo Han               2014-04-29  2072  	if (!pd)
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2073  		return NULL;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2074  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2075  	pd->bus_id = -1;
dbd897b9c6fac8b drivers/spi/spi-pl022.c  Linus Walleij            2013-05-23  2076  	pd->enable_dma = 1;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2077  	of_property_read_u32(np, "num-cs", &tmp);
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2078  	pd->num_chipselect = tmp;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2079  	of_property_read_u32(np, "pl022,autosuspend-delay",
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2080  			     &pd->autosuspend_delay);
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2081  	pd->rt = of_property_read_bool(np, "pl022,rt");
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2082  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2083  	return pd;
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2084  }
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2085  
fd4a319bc933ae9 drivers/spi/spi-pl022.c  Grant Likely             2012-12-07  2086  static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2087  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2088  	struct device *dev = &adev->dev;
8074cf063e410a2 drivers/spi/spi-pl022.c  Jingoo Han               2013-07-30  2089  	struct pl022_ssp_controller *platform_info =
8074cf063e410a2 drivers/spi/spi-pl022.c  Jingoo Han               2013-07-30  2090  			dev_get_platdata(&adev->dev);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2091  	struct spi_master *master;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2092  	struct pl022 *pl022 = NULL;	/*Data for this driver */
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2093  	struct device_node *np = adev->dev.of_node;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2094  	int status = 0, i, num_cs;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2095  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2096  	dev_info(&adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2097  		 "ARM PL022 driver, device ID: 0x%08x\n", adev->periphid);
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2098  	if (!platform_info && IS_ENABLED(CONFIG_OF))
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2099  		platform_info = pl022_platform_data_dt_get(dev);
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2100  
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2101  	if (!platform_info) {
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2102  		dev_err(dev, "probe: no platform data defined\n");
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2103  		return -ENODEV;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2104  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2105  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2106  	if (platform_info->num_chipselect) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2107  		num_cs = platform_info->num_chipselect;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2108  	} else {
39a6ac11df6579d drivers/spi/spi-pl022.c  Roland Stigge            2012-09-18  2109  		dev_err(dev, "probe: no chip select defined\n");
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2110  		return -ENODEV;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2111  	}
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2112  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2113  	/* Allocate master with space for data */
b4b8482690d97ea drivers/spi/spi-pl022.c  Roland Stigge            2012-09-03  2114  	master = spi_alloc_master(dev, sizeof(struct pl022));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2115  	if (master == NULL) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2116  		dev_err(&adev->dev, "probe - cannot alloc SPI master\n");
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2117  		return -ENOMEM;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2118  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2119  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2120  	pl022 = spi_master_get_devdata(master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2121  	pl022->master = master;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2122  	pl022->master_info = platform_info;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2123  	pl022->adev = adev;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2124  	pl022->vendor = id->data;
a86854d0c599b32 drivers/spi/spi-pl022.c  Kees Cook                2018-06-12  2125  	pl022->chipselects = devm_kcalloc(dev, num_cs, sizeof(int),
b4b8482690d97ea drivers/spi/spi-pl022.c  Roland Stigge            2012-09-03  2126  					  GFP_KERNEL);
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2127  	if (!pl022->chipselects) {
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2128  		status = -ENOMEM;
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2129  		goto err_no_mem;
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2130  	}
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2131  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2132  	/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2133  	 * Bus Number Which has been Assigned to this SSP controller
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2134  	 * on this board
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2135  	 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2136  	master->bus_num = platform_info->bus_id;
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  2137  	master->use_gpio_descriptors;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2138  	master->num_chipselect = num_cs;
6e5614b6476001a drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  2139  	master->set_cs = pl022_set_cs;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2140  	master->cleanup = pl022_cleanup;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2141  	master->setup = pl022_setup;
29b6e906a70a47c drivers/spi/spi-pl022.c  Mark Brown               2013-07-28  2142  	master->auto_runtime_pm = true;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2143  	master->transfer_one_message = pl022_transfer_one_message;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2144  	master->unprepare_transfer_hardware = pl022_unprepare_transfer_hardware;
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2145  	master->rt = platform_info->rt;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2146  	master->dev.of_node = dev->of_node;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2147  
516843702bb5fd8 drivers/spi/spi-pl022.c  Linus Walleij            2019-04-28  2148  	if (pl022->vendor->internal_cs_ctrl) {
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2149  		for (i = 0; i < num_cs; i++)
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2150  			pl022->chipselects[i] = i;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2151  	} else if (IS_ENABLED(CONFIG_OF)) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2152  		for (i = 0; i < num_cs; i++) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2153  			int cs_gpio = of_get_named_gpio(np, "cs-gpios", i);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2154  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2155  			if (cs_gpio == -EPROBE_DEFER) {
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2156  				status = -EPROBE_DEFER;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2157  				goto err_no_gpio;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2158  			}
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2159  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2160  			pl022->chipselects[i] = cs_gpio;
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2161  
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2162  			if (gpio_is_valid(cs_gpio)) {
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2163  				if (devm_gpio_request(dev, cs_gpio, "ssp-pl022"))
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2164  					dev_err(&adev->dev,
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2165  						"could not request %d gpio\n",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2166  						cs_gpio);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2167  				else if (gpio_direction_output(cs_gpio, 1))
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2168  					dev_err(&adev->dev,
61e89e65e31516c drivers/spi/spi-pl022.c  Roland Stigge            2014-09-09  2169  						"could not set gpio %d as output\n",
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2170  						cs_gpio);
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2171  			}
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2172  		}
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2173  	}
f6f46de1063c882 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2174  
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2175  	/*
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2176  	 * Supports mode 0-3, loopback, and active low CS. Transfers are
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2177  	 * always MS bit first on the original pl022.
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2178  	 */
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2179  	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LOOP;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2180  	if (pl022->vendor->extended_cr)
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2181  		master->mode_bits |= SPI_LSB_FIRST;
bde435a9ca376d0 drivers/spi/amba-pl022.c Kevin Wells              2010-09-16  2182  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2183  	dev_dbg(&adev->dev, "BUSNO: %d\n", master->bus_num);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2184  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2185  	status = amba_request_regions(adev, NULL);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2186  	if (status)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2187  		goto err_no_ioregion;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2188  
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2189  	pl022->phybase = adev->res.start;
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2190  	pl022->virtbase = devm_ioremap(dev, adev->res.start,
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2191  				       resource_size(&adev->res));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2192  	if (pl022->virtbase == NULL) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2193  		status = -ENOMEM;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2194  		goto err_no_ioremap;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2195  	}
2c067509a1e3540 drivers/spi/spi-pl022.c  Jingoo Han               2013-10-11  2196  	dev_info(&adev->dev, "mapped registers from %pa to %p\n",
7085f403517615c drivers/spi/spi-pl022.c  Fabio Estevam            2013-08-21  2197  		&adev->res.start, pl022->virtbase);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2198  
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2199  	pl022->clk = devm_clk_get(&adev->dev, NULL);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2200  	if (IS_ERR(pl022->clk)) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2201  		status = PTR_ERR(pl022->clk);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2202  		dev_err(&adev->dev, "could not retrieve SSP/SPI bus clock\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2203  		goto err_no_clk;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2204  	}
7ff6bcf048e6a98 drivers/spi/spi-pl022.c  Russell King             2011-09-22  2205  
6cac167b826eced drivers/spi/spi-pl022.c  Ulf Hansson              2014-02-04  2206  	status = clk_prepare_enable(pl022->clk);
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2207  	if (status) {
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2208  		dev_err(&adev->dev, "could not enable SSP/SPI bus clock\n");
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2209  		goto err_no_clk_en;
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2210  	}
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2211  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2212  	/* Initialize transfer pump */
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2213  	tasklet_init(&pl022->pump_transfers, pump_transfers,
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2214  		     (unsigned long)pl022);
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2215  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2216  	/* Disable SSP */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2217  	writew((readw(SSP_CR1(pl022->virtbase)) & (~SSP_CR1_MASK_SSE)),
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2218  	       SSP_CR1(pl022->virtbase));
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2219  	load_ssp_default_config(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2220  
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2221  	status = devm_request_irq(dev, adev->irq[0], pl022_interrupt_handler,
aeef9915b9a40d2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2222  				  0, "pl022", pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2223  	if (status < 0) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2224  		dev_err(&adev->dev, "probe - cannot get IRQ (%d)\n", status);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2225  		goto err_no_irq;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2226  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2227  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2228  	/* Get DMA channels, try autoconfiguration first */
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2229  	status = pl022_dma_autoprobe(pl022);
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  2230  	if (status == -EPROBE_DEFER) {
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  2231  		dev_dbg(dev, "deferring probe to get DMA channel\n");
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  2232  		goto err_no_irq;
f3d4bb3342630cd drivers/spi/spi-pl022.c  Rabin Vincent            2015-11-23  2233  	}
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2234  
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2235  	/* If that failed, use channels from platform_info */
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2236  	if (status == 0)
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2237  		platform_info->enable_dma = 1;
dc715452e914515 drivers/spi/spi-pl022.c  Arnd Bergmann            2013-01-28  2238  	else if (platform_info->enable_dma) {
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2239  		status = pl022_dma_probe(pl022);
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2240  		if (status != 0)
43c640157d4366a drivers/spi/amba-pl022.c Viresh Kumar             2011-05-16  2241  			platform_info->enable_dma = 0;
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2242  	}
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2243  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2244  	/* Register with the SPI framework */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2245  	amba_set_drvdata(adev, pl022);
35794a77168b739 drivers/spi/spi-pl022.c  Jingoo Han               2013-09-24  2246  	status = devm_spi_register_master(&adev->dev, master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2247  	if (status != 0) {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2248  		dev_err(&adev->dev,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2249  			"probe - problem registering spi master\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2250  		goto err_spi_register;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2251  	}
25985edcedea639 drivers/spi/amba-pl022.c Lucas De Marchi          2011-03-30  2252  	dev_dbg(dev, "probe succeeded\n");
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2253  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2254  	/* let runtime pm put suspend */
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2255  	if (platform_info->autosuspend_delay > 0) {
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2256  		dev_info(&adev->dev,
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2257  			"will use autosuspend for runtime pm, delay %dms\n",
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2258  			platform_info->autosuspend_delay);
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2259  		pm_runtime_set_autosuspend_delay(dev,
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2260  			platform_info->autosuspend_delay);
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2261  		pm_runtime_use_autosuspend(dev);
53e4acea0e819a6 drivers/spi/spi-pl022.c  Chris Blair              2011-11-08  2262  	}
0df349945752bf0 drivers/spi/spi-pl022.c  Ulf Hansson              2012-10-17  2263  	pm_runtime_put(dev);
0df349945752bf0 drivers/spi/spi-pl022.c  Ulf Hansson              2012-10-17  2264  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2265  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2266  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2267   err_spi_register:
3e3ea716270dc64 drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2268  	if (platform_info->enable_dma)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2269  		pl022_dma_remove(pl022);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2270   err_no_irq:
6cac167b826eced drivers/spi/spi-pl022.c  Ulf Hansson              2014-02-04  2271  	clk_disable_unprepare(pl022->clk);
71e63e748ee6f4b drivers/spi/spi-pl022.c  Ulf Hansson              2011-11-04  2272   err_no_clk_en:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2273   err_no_clk:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2274   err_no_ioremap:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2275  	amba_release_regions(adev);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2276   err_no_ioregion:
6d3952a7dfa8091 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22  2277   err_no_gpio:
73e3f1eb5188830 drivers/spi/spi-pl022.c  Kiran Padwal             2014-09-18  2278   err_no_mem:
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2279  	spi_master_put(master);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2280  	return status;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2281  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2282  
fd4a319bc933ae9 drivers/spi/spi-pl022.c  Grant Likely             2012-12-07  2283  static int
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2284  pl022_remove(struct amba_device *adev)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2285  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2286  	struct pl022 *pl022 = amba_get_drvdata(adev);
50658b6602dad6d drivers/spi/spi-pl022.c  Linus Walleij            2011-08-02  2287  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2288  	if (!pl022)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2289  		return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2290  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2291  	/*
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2292  	 * undo pm_runtime_put() in probe.  I assume that we're not
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2293  	 * accessing the primecell here.
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2294  	 */
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2295  	pm_runtime_get_noresume(&adev->dev);
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2296  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2297  	load_ssp_default_config(pl022);
3e3ea716270dc64 drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2298  	if (pl022->master_info->enable_dma)
b1b6b9aa6fd32db drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  2299  		pl022_dma_remove(pl022);
3e3ea716270dc64 drivers/spi/spi-pl022.c  Viresh Kumar             2011-08-10  2300  
6cac167b826eced drivers/spi/spi-pl022.c  Ulf Hansson              2014-02-04  2301  	clk_disable_unprepare(pl022->clk);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2302  	amba_release_regions(adev);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2303  	tasklet_disable(&pl022->pump_transfers);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2304  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2305  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2306  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2307  #ifdef CONFIG_PM_SLEEP
6cfa6279edbffa9 drivers/spi/spi-pl022.c  Peter Hüwe               2011-09-05  2308  static int pl022_suspend(struct device *dev)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2309  {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2310  	struct pl022 *pl022 = dev_get_drvdata(dev);
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2311  	int ret;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2312  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2313  	ret = spi_master_suspend(pl022->master);
7c5d8a249acadc3 drivers/spi/spi-pl022.c  Geert Uytterhoeven       2018-09-05  2314  	if (ret)
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2315  		return ret;
4964a26df72c4a8 drivers/spi/spi-pl022.c  Ulf Hansson              2012-10-17  2316  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2317  	ret = pm_runtime_force_suspend(dev);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2318  	if (ret) {
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2319  		spi_master_resume(pl022->master);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2320  		return ret;
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2321  	}
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2322  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2323  	pinctrl_pm_select_sleep_state(dev);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2324  
6cfa6279edbffa9 drivers/spi/spi-pl022.c  Peter Hüwe               2011-09-05  2325  	dev_dbg(dev, "suspended\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2326  	return 0;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2327  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2328  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2329  static int pl022_resume(struct device *dev)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2330  {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2331  	struct pl022 *pl022 = dev_get_drvdata(dev);
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2332  	int ret;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2333  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2334  	ret = pm_runtime_force_resume(dev);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2335  	if (ret)
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2336  		dev_err(dev, "problem resuming\n");
ada7aec7eec0ca2 drivers/spi/spi-pl022.c  Linus Walleij            2012-09-26  2337  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2338  	/* Start the queue running */
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2339  	ret = spi_master_resume(pl022->master);
7c5d8a249acadc3 drivers/spi/spi-pl022.c  Geert Uytterhoeven       2018-09-05  2340  	if (!ret)
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2341  		dev_dbg(dev, "resumed\n");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2342  
ffbbdd21329f3e1 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  2343  	return ret;
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2344  }
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2345  #endif
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2346  
736198b0486c8d5 drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2347  #ifdef CONFIG_PM
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2348  static int pl022_runtime_suspend(struct device *dev)
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2349  {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2350  	struct pl022 *pl022 = dev_get_drvdata(dev);
4f5e1b370845a0a drivers/spi/spi-pl022.c  Patrice Chotard          2012-09-19  2351  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2352  	clk_disable_unprepare(pl022->clk);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2353  	pinctrl_pm_select_idle_state(dev);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2354  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2355  	return 0;
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2356  }
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2357  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2358  static int pl022_runtime_resume(struct device *dev)
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2359  {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2360  	struct pl022 *pl022 = dev_get_drvdata(dev);
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2361  
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2362  	pinctrl_pm_select_default_state(dev);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2363  	clk_prepare_enable(pl022->clk);
84a5dc41f64faad drivers/spi/spi-pl022.c  Ulf Hansson              2014-03-01  2364  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2365  	return 0;
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2366  }
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2367  #endif
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2368  
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2369  static const struct dev_pm_ops pl022_dev_pm_ops = {
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2370  	SET_SYSTEM_SLEEP_PM_OPS(pl022_suspend, pl022_resume)
6ed23b806e73bdd drivers/spi/spi-pl022.c  Rafael J. Wysocki        2014-12-04  2371  	SET_RUNTIME_PM_OPS(pl022_runtime_suspend, pl022_runtime_resume, NULL)
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2372  };
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2373  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2374  static struct vendor_data vendor_arm = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2375  	.fifodepth = 8,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2376  	.max_bpw = 16,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2377  	.unidir = false,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2378  	.extended_cr = false,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2379  	.pl023 = false,
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2380  	.loopback = true,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2381  	.internal_cs_ctrl = false,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2382  };
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2383  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2384  static struct vendor_data vendor_st = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2385  	.fifodepth = 32,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2386  	.max_bpw = 32,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2387  	.unidir = false,
556f4aeb7d9dfac drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  2388  	.extended_cr = true,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2389  	.pl023 = false,
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2390  	.loopback = true,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2391  	.internal_cs_ctrl = false,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2392  };
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2393  
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2394  static struct vendor_data vendor_st_pl023 = {
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2395  	.fifodepth = 32,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2396  	.max_bpw = 32,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2397  	.unidir = false,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2398  	.extended_cr = true,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2399  	.pl023 = true,
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2400  	.loopback = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2401  	.internal_cs_ctrl = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2402  };
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2403  
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2404  static struct vendor_data vendor_lsi = {
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2405  	.fifodepth = 8,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2406  	.max_bpw = 16,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2407  	.unidir = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2408  	.extended_cr = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2409  	.pl023 = false,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2410  	.loopback = true,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2411  	.internal_cs_ctrl = true,
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2412  };
06fb01fd1dc624d drivers/spi/amba-pl022.c Philippe Langlais        2011-03-23  2413  
5b8d5ad2308d2d5 drivers/spi/spi-pl022.c  Arvind Yadav             2017-08-23  2414  static const struct amba_id pl022_ids[] = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2415  	{
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2416  		/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2417  		 * ARM PL022 variant, this has a 16bit wide
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2418  		 * and 8 locations deep TX/RX FIFO
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2419  		 */
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2420  		.id	= 0x00041022,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2421  		.mask	= 0x000fffff,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2422  		.data	= &vendor_arm,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2423  	},
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2424  	{
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2425  		/*
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2426  		 * ST Micro derivative, this has 32bit wide
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2427  		 * and 32 locations deep TX/RX FIFO
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2428  		 */
e89e04fcdce6146 drivers/spi/amba-pl022.c Srinidhi Kasagar         2009-10-05  2429  		.id	= 0x01080022,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2430  		.mask	= 0xffffffff,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2431  		.data	= &vendor_st,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2432  	},
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2433  	{
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2434  		/*
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2435  		 * ST-Ericsson derivative "PL023" (this is not
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2436  		 * an official ARM number), this is a PL022 SSP block
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2437  		 * stripped to SPI mode only, it has 32bit wide
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2438  		 * and 32 locations deep TX/RX FIFO but no extended
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2439  		 * CR0/CR1 register
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2440  		 */
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2441  		.id	= 0x00080023,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2442  		.mask	= 0xffffffff,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2443  		.data	= &vendor_st_pl023,
781c7b129b1beb8 drivers/spi/amba-pl022.c Linus Walleij            2010-05-07  2444  	},
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2445  	{
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2446  		/*
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2447  		 * PL022 variant that has a chip select control register whih
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2448  		 * allows control of 5 output signals nCS[0:4].
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2449  		 */
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2450  		.id	= 0x000b6022,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2451  		.mask	= 0x000fffff,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2452  		.data	= &vendor_lsi,
db4fa45ed3182d8 drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  2453  	},
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2454  	{ 0, 0 },
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2455  };
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2456  
7eeac71b9fc9b3d drivers/spi/spi-pl022.c  Dave Martin              2011-10-05  2457  MODULE_DEVICE_TABLE(amba, pl022_ids);
7eeac71b9fc9b3d drivers/spi/spi-pl022.c  Dave Martin              2011-10-05  2458  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2459  static struct amba_driver pl022_driver = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2460  	.drv = {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2461  		.name	= "ssp-pl022",
92b97f0aaccbf9d drivers/spi/spi-pl022.c  Russell King             2011-08-14  2462  		.pm	= &pl022_dev_pm_ops,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2463  	},
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2464  	.id_table	= pl022_ids,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2465  	.probe		= pl022_probe,
fd4a319bc933ae9 drivers/spi/spi-pl022.c  Grant Likely             2012-12-07  2466  	.remove		= pl022_remove,
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2467  };
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2468  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2469  static int __init pl022_init(void)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2470  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2471  	return amba_driver_register(&pl022_driver);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2472  }
25c8e03bdb769df drivers/spi/amba-pl022.c Linus Walleij            2010-09-06  2473  subsys_initcall(pl022_init);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2474  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2475  static void __exit pl022_exit(void)
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2476  {
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2477  	amba_driver_unregister(&pl022_driver);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2478  }
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2479  module_exit(pl022_exit);
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2480  
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2481  MODULE_AUTHOR("Linus Walleij <linus.walleij@stericsson.com>");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2482  MODULE_DESCRIPTION("PL022 SSP Controller Driver");
b43d65f7e818485 drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  2483  MODULE_LICENSE("GPL");

:::::: The code at line 442 was first introduced by commit
:::::: db4fa45ed3182d8206af241811dfc99369ffa849 spi: pl022: Add support for chip select extension

:::::: TO: Anders Berg <anders.berg@avagotech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--fnbpvj57hjrzl6wk
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--fnbpvj57hjrzl6wk--
