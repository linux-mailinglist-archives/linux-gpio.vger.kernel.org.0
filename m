Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B430124A85
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 16:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfLRPAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 10:00:07 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:59822 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727189AbfLRPAH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 10:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=f44HdFAV8jybth2ZGlrp2hEZQWpq0Dc4ywyfBLAszj4=; b=qodjHLIOjJUGem2f4qg51/s7Pf
        XjP1b+NCalVACpUltTaqVVWbKGlumPJs0bfHSiN/nm5rsvvvj+lPG5573a4MXP+LcmP3XyqtuNsO0
        9DhNDx2fLVCoiaJnWgDZ5KdMBGlHKA2N0+4MZ5ZaQoe8AqIpcbNJ0PcNvXYcIRxsL1jU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ihanr-0004A0-HM; Wed, 18 Dec 2019 15:59:55 +0100
Date:   Wed, 18 Dec 2019 15:59:55 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Peng Fan <peng.fan@nxp.com>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] pinctrl: mvebu: armada-37xx: use use platform api
Message-ID: <20191218145955.GE26938@lunn.ch>
References: <1576672860-14420-1-git-send-email-peng.fan@nxp.com>
 <CAOMZO5DeA24EUjr-E=V=tGNaZ7UkOEi+F5-kEBqEB288DSNSoA@mail.gmail.com>
 <AM0PR04MB4481B3EAB2DDC42A137E8AAB88530@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CAOMZO5BK0Pa6Aw6n7Tf+C6+Fg15WNbEUOzKCQTaWqTUu6yoPjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5BK0Pa6Aw6n7Tf+C6+Fg15WNbEUOzKCQTaWqTUu6yoPjA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 09:57:57AM -0300, Fabio Estevam wrote:
> Hi Peng,
> 
> On Wed, Dec 18, 2019 at 9:53 AM Peng Fan <peng.fan@nxp.com> wrote:
> 
> > Please see:
> > https://lkml.org/lkml/2019/12/4/64

  +                       dev_err(dev, "Couldn't determine irq count: %pe\n",
  +                               ERR_PTR(nr_irq_parent));


> Still think it makes things more complicated than simply returning the
> error code directly.

Hi Fabio

Look closer. This is not about returning an error, it is about
printing an error.

I think the API could better. A %ie formatter would make a lot of
sense, so avoiding the ERR_PTR().

       Andrew
