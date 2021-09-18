Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F32D4102FC
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Sep 2021 04:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235380AbhIRC2L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 22:28:11 -0400
Received: from mx22.baidu.com ([220.181.50.185]:44824 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236906AbhIRC2L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Sep 2021 22:28:11 -0400
Received: from BJHW-MAIL-EX04.internal.baidu.com (unknown [10.127.64.14])
        by Forcepoint Email with ESMTPS id 3EDD9F079D5133A07D0D;
        Sat, 18 Sep 2021 10:26:37 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 18 Sep 2021 10:26:37 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 18
 Sep 2021 10:26:36 +0800
Date:   Sat, 18 Sep 2021 10:26:36 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>, open list:
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>, ;
        linux-kernel <linux-kernel@vger.kernel.org>
Illegal-Object: Syntax error in CC: address found on vger.kernel.org:
        CC:     ;linux-kernel <linux-kernel@vger.kernel.org>
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
Subject: Re: [PATCH] pinctrl: freescale: Add helper dependency on COMPILE_TEST
Message-ID: <20210918022636.GA18195@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210825082251.2484-1-caihuoqing@baidu.com>
 <CAOMZO5DKGv1GQBpwr0ff0YC1yDmCH2A5Xpq7jzUA2h75bmN6eQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DKGv1GQBpwr0ff0YC1yDmCH2A5Xpq7jzUA2h75bmN6eQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17 9月 21 08:50:55, Fabio Estevam wrote:
> Hi Cai,
> 
> On Wed, Aug 25, 2021 at 5:23 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
> >
> > it's helpful for complie test in other platform(e.g.X86)
> >
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > ---
> >  drivers/pinctrl/freescale/Kconfig | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> > index 21fa21c6547b..defc1f38efc7 100644
> > --- a/drivers/pinctrl/freescale/Kconfig
> > +++ b/drivers/pinctrl/freescale/Kconfig
> > @@ -119,28 +119,28 @@ config PINCTRL_IMX7ULP
> >
> >  config PINCTRL_IMX8MM
> >         tristate "IMX8MM pinctrl driver"
> > -       depends on ARCH_MXC
> > +       depends on ARCH_MXC || (COMPILE_TEST && OF)
> >         select PINCTRL_IMX
> 
> I am not sure why you need the && OF, as we have a "select PINCTRL_IMX",
> that already depends on OF.
No, it's just an invalid dependency. PINCTRL_IMX can be selected without OF
opened.
> 
> Also, why was PINCTRL_IMX8DXL not updated?
Ok, I'll update all pinctrl IMX.
> 
> Thanks
