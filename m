Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7C538F86C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 05:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhEYDEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 23:04:34 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:12235 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhEYDEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 23:04:34 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14P2o1K3012766;
        Tue, 25 May 2021 10:50:01 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May
 2021 11:02:58 +0800
Date:   Tue, 25 May 2021 11:02:55 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Andrew Jeffery <andrew@aj.id.au>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "moderated list:ASPEED PINCTRL DRIVERS" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
        "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list" <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v1 3/3] pinctrl: pinctrl-aspeed-g6: Add sgpio pinctrl
 settings
Message-ID: <20210525030254.GA23525@aspeedtech.com>
References: <20210524111338.16049-1-steven_lee@aspeedtech.com>
 <20210524111338.16049-4-steven_lee@aspeedtech.com>
 <43b00f2e-4381-4899-b561-da9a24347f8b@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <43b00f2e-4381-4899-b561-da9a24347f8b@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14P2o1K3012766
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 05/25/2021 08:54, Andrew Jeffery wrote:
> Hi Steven,
> 
> On Mon, 24 May 2021, at 20:43, Steven Lee wrote:
> > AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> > Current pinctrl driver only define the first sgpio master and slave
> > interfaces.
> > The sencond SGPIO master and slave interfaces should be added in
> > pinctrl driver as well.
> > 
> > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++++++++++++----
> >  drivers/pinctrl/aspeed/pinmux-aspeed.h     |  9 ++++++++
> >  2 files changed, 29 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
> > b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > index 5c1a109842a7..d0e9ab9d1a9c 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > @@ -46,8 +46,10 @@
> >  #define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
> >  #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
> >  #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
> > +#define SCU690		0x690 /* Multi-function Pin Control #24 */
> >  #define SCU694		0x694 /* Multi-function Pin Control #25 */
> >  #define SCU69C		0x69C /* Multi-function Pin Control #27 */
> > +#define SCU6D0		0x6D0 /* Multi-function Pin Control #29 */
> >  #define SCUC20		0xC20 /* PCIE configuration Setting Control */
> >  
> >  #define ASPEED_G6_NR_PINS 256
> > @@ -81,13 +83,17 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
> >  #define K26 4
> >  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
> >  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
> > -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
> > +SIG_EXPR_LIST_DECL_SESG(K26, SGPS2CK, SGPS2, SIG_DESC_SET(SCU690, 4));
> > +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4));
> > +PIN_DECL_4(K26, GPIOA4, SGPM2CLK, SGPS2CK, MACLINK1, SCL13);
> 
> Is this the right priority order? Looking at the Multi-Function Pin 
> Mapping and Control table, function 1 is MACLINK1,
> function 2 is SCL13, function 3 is SGPS2CK, and I assume function 4 
> would be SGPM2CLK, except it's not documented in the table in v9 of the 
> datasheet (I hope it will be documented?).
> 
> If function 1 is the highest priority (which is what all the Aspeed 
> pinctrl drivers assume), then this should be:
> 
> PIN_DECL_4(K26, GPIOA4, MACLINK1, SCL13, SGPS2CK, SGPM2CLK);
> 
> Anyway, one of several things could be at fault here:
> 
> 1. I've made a wrong assumption about the priority order in how I've 
> implemented pinctrl support for Aspeed SoCs
> 
> 2. The Multi-Function Pin Mapping and Control table is out of date and 
> needs to be fixed (which it already does as it doesn't list SGPM2CLK).
> 
> 3. The patch needs to align with the assumptions of the Aspeed pinctrl 
> support.
> 
> I don't think it's 1 as I haven't heard of any issues where we are 
> getting incorrect behaviour because of pinmux. I don't think it's 2 as 
> this patch makes a non-linear change to the ordering. So my hunch is
> the issue is 3, that the patch is putting the signals in the wrong order.
> In this case, you want the PIN_DECL_4(...) I outlined above.
> 

Yes, you are right. Per discussion with the designer, the priority order is
MACLINK1 > SCL13 > SGPS2CK > SGPM2CLK

We will add the information in the v10 datasheet.

> >  FUNC_GROUP_DECL(MACLINK1, K26);
> >  
> >  #define L24 5
> >  SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5));
> >  SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13, SIG_DESC_SET(SCU4B0, 5));
> > -PIN_DECL_2(L24, GPIOA5, MACLINK2, SDA13);
> > +SIG_EXPR_LIST_DECL_SESG(L24, SGPS2LD, SGPS2, SIG_DESC_SET(SCU690, 5));
> > +SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5));
> > +PIN_DECL_4(L24, GPIOA5, SGPM2LD, SGPS2LD, MACLINK2, SDA13);
> 
> See above.
> 

Will change the order.

> >  FUNC_GROUP_DECL(MACLINK2, L24);
> >  
> >  FUNC_GROUP_DECL(I2C13, K26, L24);
> > @@ -95,16 +101,22 @@ FUNC_GROUP_DECL(I2C13, K26, L24);
> >  #define L23 6
> >  SIG_EXPR_LIST_DECL_SESG(L23, MACLINK3, MACLINK3, SIG_DESC_SET(SCU410, 6));
> >  SIG_EXPR_LIST_DECL_SESG(L23, SCL14, I2C14, SIG_DESC_SET(SCU4B0, 6));
> > -PIN_DECL_2(L23, GPIOA6, MACLINK3, SCL14);
> > +SIG_EXPR_LIST_DECL_SESG(L23, SGPS2O, SGPS2, SIG_DESC_SET(SCU690, 6));
> > +SIG_EXPR_LIST_DECL_SESG(L23, SGPM2O, SGPM2, SIG_DESC_SET(SCU6D0, 6));
> > +PIN_DECL_4(L23, GPIOA6, SGPM2O, SGPS2O, MACLINK3, SCL14);
> 
> See above.
> 

Will change the order.

> >  FUNC_GROUP_DECL(MACLINK3, L23);
> >  
> >  #define K25 7
> >  SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
> >  SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
> > -PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
> > +SIG_EXPR_LIST_DECL_SESG(K25, SGPS2I, SGPS2, SIG_DESC_SET(SCU690, 7));
> > +SIG_EXPR_LIST_DECL_SESG(K25, SGPM2I, SGPM2, SIG_DESC_SET(SCU6D0, 7));
> > +PIN_DECL_4(K25, GPIOA7, SGPM2I, SGPS2I, MACLINK4, SDA14);
> 
> See above.
> 

Will change the order.

> >  FUNC_GROUP_DECL(MACLINK4, K25);
> >  
> >  FUNC_GROUP_DECL(I2C14, L23, K25);
> > +FUNC_GROUP_DECL(SGPM2, K26, L24, L23, K25);
> > +FUNC_GROUP_DECL(SGPS2, K26, L24, L23, K25);
> >  
> >  #define J26 8
> >  SIG_EXPR_LIST_DECL_SESG(J26, SALT1, SALT1, SIG_DESC_SET(SCU410, 8));
> > @@ -2060,7 +2072,9 @@ static const struct aspeed_pin_group 
> > aspeed_g6_groups[] = {
> >  	ASPEED_PINCTRL_GROUP(EMMCG4),
> >  	ASPEED_PINCTRL_GROUP(EMMCG8),
> >  	ASPEED_PINCTRL_GROUP(SGPM1),
> > +	ASPEED_PINCTRL_GROUP(SGPM2),
> >  	ASPEED_PINCTRL_GROUP(SGPS1),
> > +	ASPEED_PINCTRL_GROUP(SGPS2),
> >  	ASPEED_PINCTRL_GROUP(SIOONCTRL),
> >  	ASPEED_PINCTRL_GROUP(SIOPBI),
> >  	ASPEED_PINCTRL_GROUP(SIOPBO),
> > @@ -2276,7 +2290,9 @@ static const struct aspeed_pin_function 
> > aspeed_g6_functions[] = {
> >  	ASPEED_PINCTRL_FUNC(SD1),
> >  	ASPEED_PINCTRL_FUNC(SD2),
> >  	ASPEED_PINCTRL_FUNC(SGPM1),
> > +	ASPEED_PINCTRL_FUNC(SGPM2),
> >  	ASPEED_PINCTRL_FUNC(SGPS1),
> > +	ASPEED_PINCTRL_FUNC(SGPS2),
> >  	ASPEED_PINCTRL_FUNC(SIOONCTRL),
> >  	ASPEED_PINCTRL_FUNC(SIOPBI),
> >  	ASPEED_PINCTRL_FUNC(SIOPBO),
> > diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h 
> > b/drivers/pinctrl/aspeed/pinmux-aspeed.h
> > index dba5875ff276..125df796af36 100644
> > --- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
> > +++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
> > @@ -730,6 +730,15 @@ struct aspeed_pin_desc {
> >  			SIG_EXPR_LIST_PTR(pin, low), \
> >  			SIG_EXPR_LIST_PTR(pin, other))
> >  
> > +#define PIN_DECL_4(pin, other, high, medium, low1, low2) \
> 
> Bit of a nit pick, but we might as well drop identifying the priorities 
> as high, medium and low given we now have low1 and low2. Maybe 
> something like this:
> 
> #define PIN_DECL_4(pin, other, prio1, prio2, prio3, prio4)
> 

Will modify the the macros.

> Cheers,
> 
> Andrew
