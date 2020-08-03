Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A2323A886
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 16:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgHCOcW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 10:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbgHCOcV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 10:32:21 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CA5C06174A;
        Mon,  3 Aug 2020 07:32:20 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id jp10so12285018ejb.0;
        Mon, 03 Aug 2020 07:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k5ONAMIgnqW/EoT6qv9UbU5FWWEPd2oqQYWKvUFmYr4=;
        b=o49HWt60cZbDq0j8saM1Tp6KoL0WnDVsKUoKgXHORgwfECmOrMN8xQPrsEsDW4RGWn
         AnOx5mQH7iFrl2o+mIgrWYYWNeWngJeJT4p0qG6kzbl9QzI9N2fIgCL1pIVl0jZeuRLV
         nvvUJToBgwlox5eUx+I9pi4PkTy8acksgctNWJhltVpIXZFK8jPzs0SYktt/gsxZ3pG4
         2IxjN4k9F8PB6Fe8ny53iNwh7getB30kzDHEnV3h3qKwEhtBqiwmCKxWDZRVjZfqiWq8
         Ut/YHQQ5lVKh8amJIq8H9KbuGxanpyv09Kk5DnWgBoIfhRPJqmp3rzhIder50pIvVk43
         xMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k5ONAMIgnqW/EoT6qv9UbU5FWWEPd2oqQYWKvUFmYr4=;
        b=Oq2CAW04b7xOQooFJrnWLx2S4Lqi2JWgnThSQ1wob2N2l438avkmqH7fNB6c7FBSYr
         M6kjxtPhL8GbYtoOmooESeeLQLhFrwiJDLMIimWGfIAEJ8QjRs2r7evSA8272vzNuHxp
         HyMhU8g8b2sGIxvp3VflfBK4hSs6jqjdSAHEh29gSZjCS5g06irSRmtPFY6vPCdzaO21
         MzDqBv1DuXfLZFgy6s52L0PRoS1DjqoLxAWlCtfd2q6HgOF/+RhxL4XbIvfW8k5DsIqt
         61J/0/KA9wBeCK2eWOUUmVEBZljdiOXLWYZz4yzrHnVs1PQa4MNcDr+9X4xZxhPpXhwD
         8ZCA==
X-Gm-Message-State: AOAM531/V44iVOQF76wXWeFJt5NU2TCJrOz/wqjgyeRNxLCuBVh8pun+
        ROeTHw7gE21L/NTd5Vqp9Yk=
X-Google-Smtp-Source: ABdhPJzlQBB/MGH6Y1vfRZteypGHVIibfKinOM2UIaYnQhJnvKUveQMdnRIj/52fsfvrvlvTsZNkTA==
X-Received: by 2002:a17:906:7e06:: with SMTP id e6mr17732136ejr.236.1596465138563;
        Mon, 03 Aug 2020 07:32:18 -0700 (PDT)
Received: from BV030612LT ([86.121.43.21])
        by smtp.gmail.com with ESMTPSA id u18sm15940973edt.31.2020.08.03.07.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:32:17 -0700 (PDT)
Date:   Mon, 3 Aug 2020 17:32:15 +0300
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 2/3] pinctrl: actions: Add Actions S500 pinctrl driver
Message-ID: <20200803143215.GA1108663@BV030612LT>
References: <cover.1593112402.git.cristian.ciocaltea@gmail.com>
 <5ebf34a13fe4e98342e654e834751d3f2c4285e8.1593112402.git.cristian.ciocaltea@gmail.com>
 <20200626142941.GE8333@Mani-XPS-13-9360>
 <20200626171148.GD6611@BV030612LT>
 <20200802151813.GA6486@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802151813.GA6486@Mani-XPS-13-9360>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 02, 2020 at 08:48:13PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> Sorry for the delay. This has fallen through the cracks...

Hi Mani,

No problem, thanks for finding the time to review this.

> On Fri, Jun 26, 2020 at 08:11:48PM +0300, Cristian Ciocaltea wrote:
> > On Fri, Jun 26, 2020 at 07:59:41PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Jun 25, 2020 at 11:16:19PM +0300, Cristian Ciocaltea wrote:
> > > > Add pinctrl and gpio driver for Actions Semi S500 SoC.
> > > > 
> > > > The driver supports pinctrl, pinmux, pinconf, gpio and interrupt
> > > > functions using a set of registers shared between gpio and pinctrl.
> > > > 
> > > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > > > ---
> > > >  drivers/pinctrl/actions/Kconfig        |    6 +
> > > >  drivers/pinctrl/actions/Makefile       |    1 +
> > > >  drivers/pinctrl/actions/pinctrl-s500.c | 1727 ++++++++++++++++++++++++
> > > >  3 files changed, 1734 insertions(+)
> > > >  create mode 100644 drivers/pinctrl/actions/pinctrl-s500.c
> > > > 
> > > > diff --git a/drivers/pinctrl/actions/Kconfig b/drivers/pinctrl/actions/Kconfig
> > > > index 966f1c2c89d6..a1d16e8280e5 100644
> > > > --- a/drivers/pinctrl/actions/Kconfig
> > > > +++ b/drivers/pinctrl/actions/Kconfig
> > > > @@ -10,6 +10,12 @@ config PINCTRL_OWL
> > > >  	help
> > > >  	  Say Y here to enable Actions Semi OWL pinctrl driver
> > > >  
> > > > +config PINCTRL_S500
> > > > +	bool "Actions Semi S500 pinctrl driver"
> > > > +	depends on PINCTRL_OWL
> > > > +	help
> > > > +	  Say Y here to enable Actions Semi S500 pinctrl driver
> > > > +
> > > >  config PINCTRL_S700
> > > >  	bool "Actions Semi S700 pinctrl driver"
> > > >  	depends on PINCTRL_OWL
> > > > diff --git a/drivers/pinctrl/actions/Makefile b/drivers/pinctrl/actions/Makefile
> > > > index 61aa9107a43a..b9e2c527c9d3 100644
> > > > --- a/drivers/pinctrl/actions/Makefile
> > > > +++ b/drivers/pinctrl/actions/Makefile
> > > > @@ -1,4 +1,5 @@
> > > >  # SPDX-License-Identifier: GPL-2.0-only
> > > >  obj-$(CONFIG_PINCTRL_OWL)	+= pinctrl-owl.o
> > > > +obj-$(CONFIG_PINCTRL_S500) 	+= pinctrl-s500.o
> > > >  obj-$(CONFIG_PINCTRL_S700) 	+= pinctrl-s700.o
> > > >  obj-$(CONFIG_PINCTRL_S900) 	+= pinctrl-s900.o
> > > > diff --git a/drivers/pinctrl/actions/pinctrl-s500.c b/drivers/pinctrl/actions/pinctrl-s500.c
> > > > new file mode 100644
> > > > index 000000000000..38e30914af6e
> > > > --- /dev/null
> > > > +++ b/drivers/pinctrl/actions/pinctrl-s500.c
> > > > @@ -0,0 +1,1727 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > +/*
> > > > + * Actions Semi S500 SoC Pinctrl driver
> > > > + *
> > > > + * Copyright (c) 2014 Actions Semi Inc.
> > > > + * Copyright (c) 2020 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> > > > + */
> > > > +
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/pinctrl/pinconf-generic.h>
> > > > +#include <linux/pinctrl/pinctrl.h>
> > > > +#include "pinctrl-owl.h"
> > > > +
> > > > +/* Pinctrl registers offset */
> > > > +#define MFCTL0			(0x0040)
> > > > +#define MFCTL1			(0x0044)
> > > > +#define MFCTL2			(0x0048)
> > > > +#define MFCTL3			(0x004C)
> > > > +#define PAD_PULLCTL0		(0x0060)
> > > > +#define PAD_PULLCTL1		(0x0064)
> > > > +#define PAD_PULLCTL2		(0x0068)
> > > > +#define PAD_ST0			(0x006C)
> > > > +#define PAD_ST1			(0x0070)
> > > > +#define PAD_CTL			(0x0074)
> > > > +#define PAD_DRV0		(0x0080)
> > > > +#define PAD_DRV1		(0x0084)
> > > > +#define PAD_DRV2		(0x0088)
> > > > +
> > > > +#define _GPIOA(offset)		(offset)
> > > > +#define _GPIOB(offset)		(32 + (offset))
> > > > +#define _GPIOC(offset)		(64 + (offset))
> > > > +#define _GPIOD(offset)		(96 + (offset))
> > > > +#define _GPIOE(offset)		(128 + (offset))
> > > > +
> > > > +#define NUM_GPIOS		(_GPIOE(3) + 1)
> > > > +#define _PIN(offset)		(NUM_GPIOS + (offset))
> > > > +
> > > > +#define DNAND_DQS		_GPIOA(12)
> > > > +#define DNAND_DQSN		_GPIOA(13)
> > > > +#define ETH_TXD0		_GPIOA(14)
> > > > +#define ETH_TXD1		_GPIOA(15)
> > > > +#define ETH_TXEN		_GPIOA(16)
> > > > +#define ETH_RXER		_GPIOA(17)
> > > > +#define ETH_CRS_DV		_GPIOA(18)
> > > > +#define ETH_RXD1		_GPIOA(19)
> > > > +#define ETH_RXD0		_GPIOA(20)
> > > > +#define ETH_REF_CLK		_GPIOA(21)
> > > > +#define ETH_MDC			_GPIOA(22)
> > > > +#define ETH_MDIO		_GPIOA(23)
> > > > +#define SIRQ0			_GPIOA(24)
> > > > +#define SIRQ1			_GPIOA(25)
> > > > +#define SIRQ2			_GPIOA(26)
> > > > +#define I2S_D0			_GPIOA(27)
> > > > +#define I2S_BCLK0		_GPIOA(28)
> > > > +#define I2S_LRCLK0		_GPIOA(29)
> > > > +#define I2S_MCLK0		_GPIOA(30)
> > > > +#define I2S_D1			_GPIOA(31)
> > > > +
> > > > +#define I2S_BCLK1		_GPIOB(0)
> > > > +#define I2S_LRCLK1		_GPIOB(1)
> > > > +#define I2S_MCLK1		_GPIOB(2)
> > > > +#define KS_IN0			_GPIOB(3)
> > > > +#define KS_IN1			_GPIOB(4)
> > > > +#define KS_IN2			_GPIOB(5)
> > > > +#define KS_IN3			_GPIOB(6)
> > > > +#define KS_OUT0			_GPIOB(7)
> > > > +#define KS_OUT1			_GPIOB(8)
> > > > +#define KS_OUT2			_GPIOB(9)
> > > > +#define LVDS_OEP		_GPIOB(10)
> > > > +#define LVDS_OEN		_GPIOB(11)
> > > > +#define LVDS_ODP		_GPIOB(12)
> > > > +#define LVDS_ODN		_GPIOB(13)
> > > > +#define LVDS_OCP		_GPIOB(14)
> > > > +#define LVDS_OCN		_GPIOB(15)
> > > > +#define LVDS_OBP		_GPIOB(16)
> > > > +#define LVDS_OBN		_GPIOB(17)
> > > > +#define LVDS_OAP		_GPIOB(18)
> > > > +#define LVDS_OAN		_GPIOB(19)
> > > > +#define LVDS_EEP		_GPIOB(20)
> > > > +#define LVDS_EEN		_GPIOB(21)
> > > > +#define LVDS_EDP		_GPIOB(22)
> > > > +#define LVDS_EDN		_GPIOB(23)
> > > > +#define LVDS_ECP		_GPIOB(24)
> > > > +#define LVDS_ECN		_GPIOB(25)
> > > > +#define LVDS_EBP		_GPIOB(26)
> > > > +#define LVDS_EBN		_GPIOB(27)
> > > > +#define LVDS_EAP		_GPIOB(28)
> > > > +#define LVDS_EAN		_GPIOB(29)
> > > > +#define LCD0_D18		_GPIOB(30)
> > > > +#define LCD0_D17		_GPIOB(31)
> > > > +
> > > > +#define DSI_DP3			_GPIOC(0)
> > > > +#define DSI_DN3			_GPIOC(1)
> > > > +#define DSI_DP1			_GPIOC(2)
> > > > +#define DSI_DN1			_GPIOC(3)
> > > > +#define DSI_CP			_GPIOC(4)
> > > > +#define DSI_CN			_GPIOC(5)
> > > > +#define DSI_DP0			_GPIOC(6)
> > > > +#define DSI_DN0			_GPIOC(7)
> > > > +#define DSI_DP2			_GPIOC(8)
> > > > +#define DSI_DN2			_GPIOC(9)
> > > > +#define SD0_D0			_GPIOC(10)
> > > > +#define SD0_D1			_GPIOC(11)
> > > > +#define SD0_D2			_GPIOC(12)
> > > > +#define SD0_D3			_GPIOC(13)
> > > > +#define SD1_D0			_GPIOC(14) /* SD0_D4 */
> > > > +#define SD1_D1			_GPIOC(15) /* SD0_D5 */
> > > > +#define SD1_D2			_GPIOC(16) /* SD0_D6 */
> > > > +#define SD1_D3			_GPIOC(17) /* SD0_D7 */
> > > > +#define SD0_CMD			_GPIOC(18)
> > > > +#define SD0_CLK			_GPIOC(19)
> > > > +#define SD1_CMD			_GPIOC(20)
> > > > +#define SD1_CLK			_GPIOC(21)
> > > > +#define SPI0_SCLK		_GPIOC(22)
> > > > +#define SPI0_SS			_GPIOC(23)
> > > > +#define SPI0_MISO		_GPIOC(24)
> > > > +#define SPI0_MOSI		_GPIOC(25)
> > > > +#define UART0_RX		_GPIOC(26)
> > > > +#define UART0_TX		_GPIOC(27)
> > > > +#define I2C0_SCLK		_GPIOC(28)
> > > > +#define I2C0_SDATA		_GPIOC(29)
> > > > +#define SENSOR0_PCLK		_GPIOC(31)
> > > > +
> > > > +#define SENSOR0_CKOUT		_GPIOD(10)
> > > > +#define DNAND_ALE		_GPIOD(12)
> > > > +#define DNAND_CLE		_GPIOD(13)
> > > > +#define DNAND_CEB0		_GPIOD(14)
> > > > +#define DNAND_CEB1		_GPIOD(15)
> > > > +#define DNAND_CEB2		_GPIOD(16)
> > > > +#define DNAND_CEB3		_GPIOD(17)
> > > > +#define UART2_RX		_GPIOD(18)
> > > > +#define UART2_TX		_GPIOD(19)
> > > > +#define UART2_RTSB		_GPIOD(20)
> > > > +#define UART2_CTSB		_GPIOD(21)
> > > > +#define UART3_RX		_GPIOD(22)
> > > > +#define UART3_TX		_GPIOD(23)
> > > > +#define UART3_RTSB		_GPIOD(24)
> > > > +#define UART3_CTSB		_GPIOD(25)
> > > > +#define PCM1_IN			_GPIOD(28)
> > > > +#define PCM1_CLK		_GPIOD(29)
> > > > +#define PCM1_SYNC		_GPIOD(30)
> > > > +#define PCM1_OUT		_GPIOD(31)
> > > > +
> > > > +#define I2C1_SCLK		_GPIOE(0)
> > > > +#define I2C1_SDATA		_GPIOE(1)
> > > > +#define I2C2_SCLK		_GPIOE(2)
> > > > +#define I2C2_SDATA		_GPIOE(3)
> > > > +
> > > > +#define CSI_DN0			_PIN(0)
> > > > +#define CSI_DP0			_PIN(1)
> > > > +#define CSI_DN1			_PIN(2)
> > > > +#define CSI_DP1			_PIN(3)
> > > > +#define CSI_CN			_PIN(4)
> > > > +#define CSI_CP			_PIN(5)
> > > > +#define CSI_DN2			_PIN(6)
> > > > +#define CSI_DP2			_PIN(7)
> > > > +#define CSI_DN3			_PIN(8)
> > > > +#define CSI_DP3			_PIN(9)
> > > > +
> > > > +#define DNAND_D0		_PIN(10)
> > > > +#define DNAND_D1		_PIN(11)
> > > > +#define DNAND_D2		_PIN(12)
> > > > +#define DNAND_D3		_PIN(13)
> > > > +#define DNAND_D4		_PIN(14)
> > > > +#define DNAND_D5		_PIN(15)
> > > > +#define DNAND_D6		_PIN(16)
> > > > +#define DNAND_D7		_PIN(17)
> > > > +#define DNAND_WRB		_PIN(18)
> > > > +#define DNAND_RDB		_PIN(19)
> > > > +#define DNAND_RDBN		_PIN(20)
> > > > +#define DNAND_RB		_PIN(21)
> > > > +
> > > > +#define PORB			_PIN(22)
> > > > +#define CLKO_25M		_PIN(23)
> > > > +#define BSEL			_PIN(24)
> > > > +#define PKG0			_PIN(25)
> > > > +#define PKG1			_PIN(26)
> > > > +#define PKG2			_PIN(27)
> > > > +#define PKG3			_PIN(28)
> > > > +
> > > > +#define _FIRSTPAD		_GPIOA(0)
> > > > +#define _LASTPAD		PKG3
> > > > +#define NUM_PADS		(_PIN(28) + 1)
> > > > +
> > > 
> > > [...]
> > > 
> > > > +static const struct owl_gpio_port s500_gpio_ports[] = {
> > > > +	OWL_GPIO_PORT(A, 0x0000, 32, 0x0, 0x4, 0x8, 0x204, 0x208, 0x20C, 0x230, 0),
> > > > +	OWL_GPIO_PORT(B, 0x000C, 32, 0x0, 0x4, 0x8, 0x1F8, 0x204, 0x208, 0x22C, 1),
> > > > +	OWL_GPIO_PORT(C, 0x0018, 32, 0x0, 0x4, 0x8, 0x1EC, 0x200, 0x204, 0x228, 2),
> > > > +	OWL_GPIO_PORT(D, 0x0024, 32, 0x0, 0x4, 0x8, 0x1E0, 0x1FC, 0x200, 0x224, 3),
> > > > +	OWL_GPIO_PORT(E, 0x0030,  4, 0x0, 0x4, 0x8, 0x1D4, 0x1F8, 0x1FC, 0x220, 4),
> > > 
> > > Except PORT-A, rest of the offsets for ports seems to be wrong. From where did
> > > you get these?
> > > 
> > > Thanks,
> > > Mani
> > 
> > I computed the offsets using the S500 Datasheet, v1.6 (2016-03-07).
> > 
> > Below is an excerpt from chapter '30.4 Register List':
> > 
> > -------+--------------
> > Offset | Register Name
> > -------+--------------
> > 0x000C | GPIO_BOUTEN
> > 0x0010 | GPIO_BINEN
> > 0x0014 | GPIO_BDAT
> > ...
> > 0x0204 | INTC_GPIOCTL
> > 0x0210 | INTC_GPIOB_PD
> > 0x0214 | INTC_GPIOB_MSK
> > ...
> > 0x0238 | INTC_GPIOB_TYPE0
> > -------+--------------
> > 
> > Hence, for PORT-B, I got the following values:
> > 
> > OWL_GPIO_PORT(B,
> >   0x000C, /* base = GPIO_BOUTEN = 0x000C */
> >   32,
> >   0x0,    /* GPIO_BOUTEN - base */
> >   0x4,    /* GPIO_BINEN - base */
> >   0x8,    /* GPIO_BDAT - base */
> >   0x1F8,  /* INTC_GPIOCTL - base */
> >   0x204,  /* INTC_GPIOB_PD - base */
> >   0x208,  /* INTC_GPIOB_MSK - base */
> >   0x22C,  /* INTC_GPIOB_TYPE0 - base */
> >   1),
> > 
> > Did I miss something?
> > 
> 
> No, I missed the fact that the pinctrl-owl.c takes the per port offset into
> account for calculating the offsets... Sorry for the noise, please go ahead!

No problem, I have just submitted v2:
https://lore.kernel.org/lkml/cover.1596461275.git.cristian.ciocaltea@gmail.com/

Thanks again,
Cristi

> Thanks,
> Mani
> 
> > Thanks,
> > Cristi
> > 
> > > 
> > > > +};
> > > > +
> > > > +enum s500_pinconf_pull {
> > > > +	OWL_PINCONF_PULL_DOWN,
> > > > +	OWL_PINCONF_PULL_UP,
> > > > +};
> > > > +
> > > > +static int s500_pad_pinconf_arg2val(const struct owl_padinfo *info,
> > > > +				    unsigned int param, u32 *arg)
> > > > +{
> > > > +	switch (param) {
> > > > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > +		*arg = OWL_PINCONF_PULL_DOWN;
> > > > +		break;
> > > > +	case PIN_CONFIG_BIAS_PULL_UP:
> > > > +		*arg = OWL_PINCONF_PULL_UP;
> > > > +		break;
> > > > +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > > > +		*arg = (*arg >= 1 ? 1 : 0);
> > > > +		break;
> > > > +	default:
> > > > +		return -EOPNOTSUPP;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int s500_pad_pinconf_val2arg(const struct owl_padinfo *padinfo,
> > > > +				    unsigned int param, u32 *arg)
> > > > +{
> > > > +	switch (param) {
> > > > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > +		*arg = *arg == OWL_PINCONF_PULL_DOWN;
> > > > +		break;
> > > > +	case PIN_CONFIG_BIAS_PULL_UP:
> > > > +		*arg = *arg == OWL_PINCONF_PULL_UP;
> > > > +		break;
> > > > +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > > > +		*arg = *arg == 1;
> > > > +		break;
> > > > +	default:
> > > > +		return -EOPNOTSUPP;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static struct owl_pinctrl_soc_data s500_pinctrl_data = {
> > > > +	.padinfo = s500_padinfo,
> > > > +	.pins = (const struct pinctrl_pin_desc *)s500_pads,
> > > > +	.npins = ARRAY_SIZE(s500_pads),
> > > > +	.functions = s500_functions,
> > > > +	.nfunctions = ARRAY_SIZE(s500_functions),
> > > > +	.groups = s500_groups,
> > > > +	.ngroups = ARRAY_SIZE(s500_groups),
> > > > +	.ngpios = NUM_GPIOS,
> > > > +	.ports = s500_gpio_ports,
> > > > +	.nports = ARRAY_SIZE(s500_gpio_ports),
> > > > +	.padctl_arg2val = s500_pad_pinconf_arg2val,
> > > > +	.padctl_val2arg = s500_pad_pinconf_val2arg,
> > > > +};
> > > > +
> > > > +static int s500_pinctrl_probe(struct platform_device *pdev)
> > > > +{
> > > > +	return owl_pinctrl_probe(pdev, &s500_pinctrl_data);
> > > > +}
> > > > +
> > > > +static const struct of_device_id s500_pinctrl_of_match[] = {
> > > > +	{ .compatible = "actions,s500-pinctrl", },
> > > > +	{ }
> > > > +};
> > > > +
> > > > +static struct platform_driver s500_pinctrl_driver = {
> > > > +	.driver = {
> > > > +		.name = "pinctrl-s500",
> > > > +		.of_match_table = of_match_ptr(s500_pinctrl_of_match),
> > > > +	},
> > > > +	.probe = s500_pinctrl_probe,
> > > > +};
> > > > +
> > > > +static int __init s500_pinctrl_init(void)
> > > > +{
> > > > +	return platform_driver_register(&s500_pinctrl_driver);
> > > > +}
> > > > +arch_initcall(s500_pinctrl_init);
> > > > +
> > > > +static void __exit s500_pinctrl_exit(void)
> > > > +{
> > > > +	platform_driver_unregister(&s500_pinctrl_driver);
> > > > +}
> > > > +module_exit(s500_pinctrl_exit);
> > > > +
> > > > +MODULE_AUTHOR("Actions Semi Inc.");
> > > > +MODULE_AUTHOR("Cristian Ciocaltea <cristian.ciocaltea@gmail.com>");
> > > > +MODULE_DESCRIPTION("Actions Semi S500 SoC Pinctrl Driver");
> > > > +MODULE_LICENSE("GPL");
> > > > -- 
> > > > 2.27.0
> > > > 
