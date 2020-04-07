Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5341A0D12
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 13:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgDGLwe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 07:52:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:48976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgDGLwe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 07:52:34 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 192F620678;
        Tue,  7 Apr 2020 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586260353;
        bh=II1pwoRWO506IHM9BklJPMIsQjRlhdCQnZOBbPZ90Cw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SifwQlr3atkEZLhSnM4MAmtZm71biNi+AX4LOKYaXknDWl/wCp1Lmk4UVN9+zLMF2
         lDF98dn00tOYCCIZK9KAbfg5Pz8IusxzfNqvIAPiMORjcAfr44WrVFdk3f/6eqBgTX
         8Irnm5JZE0Fp81oQjeh7NcrHG6lEjRvPcf3CPRmw=
Received: by pali.im (Postfix)
        id C19B05F1; Tue,  7 Apr 2020 13:52:30 +0200 (CEST)
Date:   Tue, 7 Apr 2020 13:52:30 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH pinctrl REGRESSION] Revert "pinctrl: mvebu: armada-37xx:
 use use platform api"
Message-ID: <20200407115230.7dsepjfxwbk53x2v@pali>
References: <20200324004413.14355-1-marek.behun@nic.cz>
 <20200324122017.GR3819@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200324122017.GR3819@lunn.ch>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tuesday 24 March 2020 13:20:17 Andrew Lunn wrote:
> On Tue, Mar 24, 2020 at 01:44:13AM +0100, Marek Behún wrote:
> > This reverts commit 06e26b75f5e613b400116fdb7ff6206a681ab271.
> > 
> > This commit caused a regression on Armada 37xx. The pinctrl driver says
> >   armada-37xx-pinctrl d0013800.pinctrl: invalid or no IRQ
> >   armada-37xx-pinctrl d0018800.pinctrl: invalid or no IRQ
> > and afterwards other drivers cannot use GPIOs by this driver as IRQs.
> > 
> > Fixes: 06e26b75f5e6 ("pinctrl: mvebu: armada-37xx: use use platform...")
> > Signed-off-by: Marek Behún <marek.behun@nic.cz>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 +++---------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > index 32f12a388b3c..5f125bd6279d 100644
> > --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/pinctrl/pinconf-generic.h>
> >  #include <linux/pinctrl/pinconf.h>
> >  #include <linux/pinctrl/pinctrl.h>
> > @@ -741,14 +742,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
> >  		return ret;
> >  	}
> >  
> > -	nr_irq_parent = platform_irq_count(pdev);
> 
> Hi Marek
> 
> Could you determine the value of nr_irq_parent(). Is it -EPROBE_DEFER?

Hello Andrew! I have tested it with 5.6 kernel and return value in
nr_irq_parent is in both cases zero. So it is not -EPROBE_DEFER. And
return value of of_irq_count(np) is 12 for d0013800.pinctrl and 5 for
d0018800.pinctrl.

So this is a clear regression introduced by that patch.

> This patch has removed the handling of that.
> 
> > -	if (nr_irq_parent < 0) {
> > -		if (nr_irq_parent != -EPROBE_DEFER)
> > -			dev_err(dev, "Couldn't determine irq count: %pe\n",
> > -				ERR_PTR(nr_irq_parent));
> > -		return nr_irq_parent;
> > -	}
> 
> Thanks
> 	Andrew
