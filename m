Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E9455D07
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 02:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfFZAnP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 20:43:15 -0400
Received: from mga01.intel.com ([192.55.52.88]:3675 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbfFZAnO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 20:43:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jun 2019 17:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,417,1557212400"; 
   d="gz'50?scan'50,208,50";a="162076755"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jun 2019 17:43:09 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hfw1l-000FkT-Cz; Wed, 26 Jun 2019 08:43:09 +0800
Date:   Wed, 26 Jun 2019 08:42:56 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi 14/14] drivers/spi/spi-pl022.c:451:27:
 error: no member named 'cur_cs' in 'struct pl022'; did you mean 'cur_msg'?
Message-ID: <201906260851.tWmwom4U%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   d52781e8bf3600398a5da184d4df22072a8e5e57
commit: d52781e8bf3600398a5da184d4df22072a8e5e57 [14/14] slask
config: arm64-defconfig (attached as .config)
compiler: clang version 9.0.0 (git://gitmirror/llvm_project fee855b5bc1abe1f3f89e977ce4c81cf9bdbc2e4)
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d52781e8bf3600398a5da184d4df22072a8e5e57
        # save the attached .config to linux build tree
        make.cross ARCH=arm64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/spi/spi-pl022.c:451:27: error: no member named 'cur_cs' in 'struct pl022'; did you mean 'cur_msg'?
     tmp &= ~(1UL << (pl022->cur_cs));
                             ^~~~~~
                             cur_msg
   drivers/spi/spi-pl022.c:379:22: note: 'cur_msg' declared here
    struct spi_message *cur_msg;
                        ^
>> drivers/spi/spi-pl022.c:451:16: error: invalid operands to binary expression ('unsigned long' and 'struct spi_message *')
     tmp &= ~(1UL << (pl022->cur_cs));
              ~~~ ^  ~~~~~~~~~~~~~~~
   drivers/spi/spi-pl022.c:453:26: error: no member named 'cur_cs' in 'struct pl022'; did you mean 'cur_msg'?
     tmp |= (1UL << (pl022->cur_cs));
                            ^~~~~~
                            cur_msg
   drivers/spi/spi-pl022.c:379:22: note: 'cur_msg' declared here
    struct spi_message *cur_msg;
                        ^
   drivers/spi/spi-pl022.c:453:15: error: invalid operands to binary expression ('unsigned long' and 'struct spi_message *')
     tmp |= (1UL << (pl022->cur_cs));
             ~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/spi/spi-pl022.c:502:4: error: implicit declaration of function 'pl022_cs_control' [-Werror,-Wimplicit-function-declaration]
      pl022_cs_control(pl022, SSP_CHIP_DESELECT);
      ^
   drivers/spi/spi-pl022.c:843:3: error: implicit declaration of function 'pl022_cs_control' [-Werror,-Wimplicit-function-declaration]
     pl022_cs_control(pl022, SSP_CHIP_DESELECT);
     ^
   drivers/spi/spi-pl022.c:1314:4: error: implicit declaration of function 'pl022_cs_control' [-Werror,-Wimplicit-function-declaration]
      pl022_cs_control(pl022, SSP_CHIP_DESELECT);
      ^
   drivers/spi/spi-pl022.c:1397:4: error: implicit declaration of function 'pl022_cs_control' [-Werror,-Wimplicit-function-declaration]
      pl022_cs_control(pl022, SSP_CHIP_SELECT);
      ^
   drivers/spi/spi-pl022.c:1436:3: error: implicit declaration of function 'pl022_cs_control' [-Werror,-Wimplicit-function-declaration]
     pl022_cs_control(pl022, SSP_CHIP_SELECT);
     ^
   drivers/spi/spi-pl022.c:1510:5: error: implicit declaration of function 'pl022_cs_control' [-Werror,-Wimplicit-function-declaration]
       pl022_cs_control(pl022, SSP_CHIP_SELECT);
       ^
   drivers/spi/spi-pl022.c:1515:5: error: implicit declaration of function 'pl022_cs_control' [-Werror,-Wimplicit-function-declaration]
       pl022_cs_control(pl022, SSP_CHIP_SELECT);
       ^
   drivers/spi/spi-pl022.c:1551:4: error: implicit declaration of function 'pl022_cs_control' [-Werror,-Wimplicit-function-declaration]
      pl022_cs_control(pl022, SSP_CHIP_DESELECT);
      ^
>> drivers/spi/spi-pl022.c:1580:25: error: no member named 'chipselects' in 'struct pl022'
    pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
                    ~~~~~  ^
   drivers/spi/spi-pl022.c:1580:9: error: no member named 'cur_cs' in 'struct pl022'; did you mean 'cur_msg'?
    pl022->cur_cs = pl022->chipselects[msg->spi->chip_select];
           ^~~~~~
           cur_msg
   drivers/spi/spi-pl022.c:379:22: note: 'cur_msg' declared here
    struct spi_message *cur_msg;
                        ^
>> drivers/spi/spi-pl022.c:1861:4: error: implicit declaration of function 'of_property_read_u32' [-Werror,-Wimplicit-function-declaration]
      of_property_read_u32(np, "pl022,interface",
      ^
>> drivers/spi/spi-pl022.c:1923:7: error: implicit declaration of function 'gpio_is_valid' [-Werror,-Wimplicit-function-declaration]
    if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
         ^
   drivers/spi/spi-pl022.c:1923:7: note: did you mean 'uuid_is_valid'?
   include/linux/uuid.h:79:46: note: 'uuid_is_valid' declared here
   bool __attribute__((__warn_unused_result__)) uuid_is_valid(const char *uuid);
                                                ^
   drivers/spi/spi-pl022.c:1923:28: error: no member named 'chipselects' in 'struct pl022'
    if (!gpio_is_valid(pl022->chipselects[spi->chip_select]))
                       ~~~~~  ^
   drivers/spi/spi-pl022.c:2086:2: error: implicit declaration of function 'of_property_read_u32' [-Werror,-Wimplicit-function-declaration]
    of_property_read_u32(np, "num-cs", &tmp);
    ^
>> drivers/spi/spi-pl022.c:2090:11: error: implicit declaration of function 'of_property_read_bool' [-Werror,-Wimplicit-function-declaration]
    pd->rt = of_property_read_bool(np, "pl022,rt");
             ^
   drivers/spi/spi-pl022.c:2090:11: note: did you mean 'of_property_read_u32'?
   drivers/spi/spi-pl022.c:1861:4: note: 'of_property_read_u32' declared here
      of_property_read_u32(np, "pl022,interface",
      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

vim +451 drivers/spi/spi-pl022.c

b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  338  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  339  /**
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  340   * struct pl022 - This is the private SSP driver data structure
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  341   * @adev: AMBA device model hookup
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  342   * @vendor: vendor data for the IP block
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  343   * @phybase: the physical memory where the SSP device resides
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  344   * @virtbase: the virtual memory where the SSP is mapped
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  345   * @clk: outgoing clock "SPICLK" for the SPI bus
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  346   * @master: SPI framework hookup
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  347   * @master_info: controller-specific data from machine setup
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  348   * @pump_transfers: Tasklet used in Interrupt Transfer mode
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  349   * @cur_msg: Pointer to current spi_message being processed
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  350   * @cur_transfer: Pointer to current spi_transfer
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  351   * @cur_chip: pointer to current clients chip(assigned from controller_state)
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  352   * @next_msg_cs_active: the next message in the queue has been examined
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  353   *  and it was found that it uses the same chip select as the previous
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  354   *  message, so we left it active after the previous transfer, and it's
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  355   *  active already.
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  356   * @tx: current position in TX buffer to be read
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  357   * @tx_end: end position in TX buffer to be read
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  358   * @rx: current position in RX buffer to be written
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  359   * @rx_end: end position in RX buffer to be written
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  360   * @read: the type of read currently going on
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  361   * @write: the type of write currently going on
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  362   * @exp_fifo_level: expected FIFO level
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  363   * @dma_rx_channel: optional channel for RX DMA
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  364   * @dma_tx_channel: optional channel for TX DMA
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  365   * @sgt_rx: scattertable for the RX transfer
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  366   * @sgt_tx: scattertable for the TX transfer
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  367   * @dummypage: a dummy page used for driving data on the bus with DMA
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  368   */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  369  struct pl022 {
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  370  	struct amba_device		*adev;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  371  	struct vendor_data		*vendor;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  372  	resource_size_t			phybase;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  373  	void __iomem			*virtbase;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  374  	struct clk			*clk;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  375  	struct spi_master		*master;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  376  	struct pl022_ssp_controller	*master_info;
ffbbdd213 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  377  	/* Message per-transfer pump */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  378  	struct tasklet_struct		pump_transfers;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09 @379  	struct spi_message		*cur_msg;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  380  	struct spi_transfer		*cur_transfer;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  381  	struct chip_data		*cur_chip;
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  382  	bool				next_msg_cs_active;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  383  	void				*tx;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  384  	void				*tx_end;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  385  	void				*rx;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  386  	void				*rx_end;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  387  	enum ssp_reading		read;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  388  	enum ssp_writing		write;
fc05475f8 drivers/spi/amba-pl022.c Linus Walleij            2010-01-22  389  	u32				exp_fifo_level;
083be3f05 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  390  	enum ssp_rx_level_trig		rx_lev_trig;
083be3f05 drivers/spi/spi-pl022.c  Linus Walleij            2011-06-16  391  	enum ssp_tx_level_trig		tx_lev_trig;
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  392  	/* DMA settings */
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  393  #ifdef CONFIG_DMA_ENGINE
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  394  	struct dma_chan			*dma_rx_channel;
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  395  	struct dma_chan			*dma_tx_channel;
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  396  	struct sg_table			sgt_rx;
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  397  	struct sg_table			sgt_tx;
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  398  	char				*dummypage;
ffbbdd213 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  399  	bool				dma_running;
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  400  #endif
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  401  };
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  402  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  403  /**
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  404   * struct chip_data - To maintain runtime state of SSP for each client chip
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  405   * @cr0: Value of control register CR0 of SSP - on later ST variants this
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  406   *       register is 32 bits wide rather than just 16
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  407   * @cr1: Value of control register CR1 of SSP
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  408   * @dmacr: Value of DMA control Register of SSP
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  409   * @cpsr: Value of Clock prescale register
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  410   * @n_bytes: how many bytes(power of 2) reqd for a given data width of client
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  411   * @enable_dma: Whether to enable DMA or not
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  412   * @read: function ptr to be used to read when doing xfer for this chip
12e8b325f drivers/spi/amba-pl022.c Linus Walleij            2011-02-08  413   * @write: function ptr to be used to write when doing xfer for this chip
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  414   * @xfer_type: polling/interrupt/DMA
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  415   *
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  416   * Runtime state of the SSP controller, maintained per chip,
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  417   * This would be set according to the current message that would be served
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  418   */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  419  struct chip_data {
556f4aeb7 drivers/spi/amba-pl022.c Linus Walleij            2010-05-05  420  	u32 cr0;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  421  	u16 cr1;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  422  	u16 dmacr;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  423  	u16 cpsr;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  424  	u8 n_bytes;
b1b6b9aa6 drivers/spi/amba-pl022.c Linus Walleij            2010-09-29  425  	bool enable_dma;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  426  	enum ssp_reading read;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  427  	enum ssp_writing write;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  428  	int xfer_type;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  429  };
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  430  
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  431  static void pl022_set_cs(struct spi_device *spi, bool enable)
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  432  {
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  433  	struct pl022 *pl022 = spi_controller_get_devdata(spi->controller);
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  434  	u32 tmp;
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  435  
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  436  	/*
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  437  	 * This callback will ONLY be called of no GPIO descriptors were found
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  438  	 * for the device, so we know we are dealing exclusively with variants
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  439  	 * that have internal CS control here, but just to be sure: extra check
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  440  	 * for now.
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  441  	 */
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  442  	if (!pl022->vendor->internal_cs_ctrl) {
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  443  		dev_err(&spi->dev,
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  444  			"called internal CS control on unsupported device\n");
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  445  		return;
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  446  	}
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  447  
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  448  	/* We draw a line low here to imply we enable it */
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  449  	tmp = readw(SSP_CSR(pl022->virtbase));
d52781e8b drivers/spi/spi-pl022.c  Linus Walleij            2019-06-25  450  	if (enable)
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17 @451  		tmp &= ~BIT(pl022->cur_cs);
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  452  	else
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  453  		tmp |= BIT(pl022->cur_cs);
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  454  	writew(tmp, SSP_CSR(pl022->virtbase));
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  455  }
db4fa45ed drivers/spi/spi-pl022.c  Anders Berg              2014-09-17  456  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  457  /**
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  458   * giveback - current spi_message is over, schedule next message and call
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  459   * callback of this message. Assumes that caller already
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  460   * set message->status; dma and pio irqs are blocked
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  461   * @pl022: SSP driver private data structure
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  462   */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  463  static void giveback(struct pl022 *pl022)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  464  {
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  465  	struct spi_transfer *last_transfer;
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  466  	pl022->next_msg_cs_active = false;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  467  
23e2c2aa4 drivers/spi/spi-pl022.c  Axel Lin                 2014-02-12  468  	last_transfer = list_last_entry(&pl022->cur_msg->transfers,
23e2c2aa4 drivers/spi/spi-pl022.c  Axel Lin                 2014-02-12  469  					struct spi_transfer, transfer_list);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  470  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  471  	/* Delay if requested before any change in chip select */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  472  	if (last_transfer->delay_usecs)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  473  		/*
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  474  		 * FIXME: This runs in interrupt context.
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  475  		 * Is this really smart?
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  476  		 */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  477  		udelay(last_transfer->delay_usecs);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  478  
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  479  	if (!last_transfer->cs_change) {
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  480  		struct spi_message *next_msg;
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  481  
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  482  		/*
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  483  		 * cs_change was not set. We can keep the chip select
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  484  		 * enabled if there is message in the queue and it is
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  485  		 * for the same spi device.
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  486  		 *
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  487  		 * We cannot postpone this until pump_messages, because
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  488  		 * after calling msg->complete (below) the driver that
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  489  		 * sent the current message could be unloaded, which
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  490  		 * could invalidate the cs_control() callback...
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  491  		 */
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  492  		/* get a pointer to the next message, if any */
ffbbdd213 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  493  		next_msg = spi_get_next_queued_message(pl022->master);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  494  
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  495  		/*
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  496  		 * see if the next and current messages point
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  497  		 * to the same spi device.
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  498  		 */
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  499  		if (next_msg && next_msg->spi != pl022->cur_msg->spi)
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  500  			next_msg = NULL;
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  501  		if (!next_msg || pl022->cur_msg->state == STATE_ERROR)
f6f46de10 drivers/spi/spi-pl022.c  Roland Stigge            2012-08-22 @502  			pl022_cs_control(pl022, SSP_CHIP_DESELECT);
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  503  		else
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  504  			pl022->next_msg_cs_active = true;
ffbbdd213 drivers/spi/spi-pl022.c  Linus Walleij            2012-02-22  505  
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  506  	}
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  507  
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  508  	pl022->cur_msg = NULL;
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  509  	pl022->cur_transfer = NULL;
8b8d71916 drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2011-11-10  510  	pl022->cur_chip = NULL;
fd316941c drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12  511  
fd316941c drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12  512  	/* disable the SPI/SSP operation */
fd316941c drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12  513  	writew((readw(SSP_CR1(pl022->virtbase)) &
fd316941c drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12  514  		(~SSP_CR1_MASK_SSE)), SSP_CR1(pl022->virtbase));
fd316941c drivers/spi/spi-pl022.c  Virupax Sadashivpetimath 2012-06-12  515  
cd6fa8d2c drivers/spi/spi-pl022.c  Alexander Sverdlin       2015-02-27  516  	spi_finalize_current_message(pl022->master);
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  517  }
b43d65f7e drivers/spi/amba-pl022.c Linus Walleij            2009-06-09  518  

:::::: The code at line 451 was first introduced by commit
:::::: db4fa45ed3182d8206af241811dfc99369ffa849 spi: pl022: Add support for chip select extension

:::::: TO: Anders Berg <anders.berg@avagotech.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--WIyZ46R2i8wDzkSu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
2ZYYhakSrtFV0UqVB/4HMfJ0FnD+AgA=

--WIyZ46R2i8wDzkSu--
