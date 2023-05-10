Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99006FD75D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 08:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbjEJGrS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 02:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjEJGrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 02:47:17 -0400
Received: from smtpbg153.qq.com (smtpbg153.qq.com [13.245.218.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E528268D;
        Tue,  9 May 2023 23:47:13 -0700 (PDT)
X-QQ-mid: Yeas43t1683701031t773t15393
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.119.253.217])
X-QQ-SSF: 00400000000000F0FNF000000000000
From:   =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 998830972937722514
To:     "'Piotr Raczynski'" <piotr.raczynski@intel.com>
Cc:     <netdev@vger.kernel.org>, <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <Jose.Abreu@synopsys.com>, <andrew@lunn.ch>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <linux-i2c@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <mengyuanlou@net-swift.com>
References: <20230509022734.148970-1-jiawenwu@trustnetic.com> <20230509022734.148970-3-jiawenwu@trustnetic.com> <ZFpQF4hi0FciwQsj@nimitz>
In-Reply-To: <ZFpQF4hi0FciwQsj@nimitz>
Subject: RE: [PATCH net-next v7 2/9] i2c: designware: Add driver support for Wangxun 10Gb NIC
Date:   Wed, 10 May 2023 14:43:50 +0800
Message-ID: <009d01d9830a$c7c6dab0$57549010$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJdw4zS3rpHMobUlf9gBLGLbLpYXQJZ55l3AhfCTYOuJr3zgA==
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_EXCESS_BASE64,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tuesday, May 9, 2023 9:52 PM, Piotr Raczynski wrote:
> On Tue, May 09, 2023 at 10:27:27AM +0800, Jiawen Wu wrote:
> > Wangxun 10Gb ethernet chip is connected to Designware I2C, to
> > communicate with SFP.
> >
> > Introduce the property "snps,i2c-platform" to match device data for
> > Wangxun in software node case. Since IO resource was mapped on the
> > ethernet driver, add a model quirk to get regmap from parent device.
> >
> > The exists IP limitations are dealt as workarounds:
> > - IP does not support interrupt mode, it works on polling mode.
> > - Additionally set FIFO depth address the chip issue.
> >
> > Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
> 
> I'm definitely not an i2c expert, a couple of nit picks below, thanks.
> Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>
> 
> > ---
> >  drivers/i2c/busses/i2c-designware-common.c  |  8 ++
> >  drivers/i2c/busses/i2c-designware-core.h    |  1 +
> >  drivers/i2c/busses/i2c-designware-master.c  | 89
> > +++++++++++++++++++--  drivers/i2c/busses/i2c-designware-platdrv.c |
> > 15 ++++
> >  4 files changed, 108 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-designware-common.c
> > b/drivers/i2c/busses/i2c-designware-common.c
> > index 0dc6b1ce663f..a7c2e67ccbf6 100644
> > --- a/drivers/i2c/busses/i2c-designware-common.c
> > +++ b/drivers/i2c/busses/i2c-designware-common.c
> > @@ -575,6 +575,14 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
> >  	unsigned int param;
> >  	int ret;
> >
> > +	/* DW_IC_COMP_PARAM_1 not implement for IP issue */
> > +	if ((dev->flags & MODEL_MASK) == MODEL_WANGXUN_SP) {
> > +		dev->tx_fifo_depth = 4;
> I understand this is some kind of workaround but is the number chosen
> empirically? Maybe a defined value would be clearer instead of magic
> number.

Yes, this value setting worked and passed test.

> > @@ -559,13 +621,19 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> >  	pm_runtime_get_sync(dev->dev);
> >
> >  	/*
> > -	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
> > +	 * Initiate I2C message transfer when polling mode is enabled,
> >  	 * As it is polling based transfer mechanism, which does not support
> >  	 * interrupt based functionalities of existing DesignWare driver.
> >  	 */
> > -	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
> > +	switch (dev->flags & MODEL_MASK) {
> > +	case MODEL_AMD_NAVI_GPU:
> >  		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> >  		goto done_nolock;
> > +	case MODEL_WANGXUN_SP:
> > +		ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
> > +		goto done_nolock;
> > +	default:
> > +		break;
> >  	}
> Nit pick, when I first saw above code it looked a little weird,
> maybe it would be a little clearer with:
> 
> 	if (i2c_dw_is_model_poll(dev)) {
> 		switch (dev->flags & MODEL_MASK) {
> 		case MODEL_AMD_NAVI_GPU:
> 			ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> 			break;
> 		case MODEL_WANGXUN_SP:
> 			ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
> 			break;
> 		default:
> 			break;
> 		}
> 		goto done_nolock;
> 	}
> 
> I do not insist though.

Sure, it looks more obvious as polling mode quirk.
 

