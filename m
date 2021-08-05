Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8FD3E15DC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 15:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236438AbhHENk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 09:40:26 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:50581 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235812AbhHENk0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Aug 2021 09:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1628170812; x=1659706812;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=65HjR0V0cAqIlq+0QHUMgU49xMCTYXtw5R29ksxbXBs=;
  b=i1OESVIV5kfViBmrxhRu+A/5vCvEpib19BwBAdG39mGpgw+ldeFooxLn
   1yyHL9uk0QjaA9TA+GeQGzTv39zRdWbzH/cEFmc4v9roFUL3OBFOrglXy
   hrd7PqSsj2shlMqCxEcsmAKw/wZDDaDi2yxrc93uKn2EqZ3tiIH16zoJb
   qgSiD/TtBhccGstBpyKugNuq7tIsZdU6C57JSrSzKJXYZr7ObnyX8iltM
   v4pDDKuKXh/8ue9XuwyQcAbYBpHuOrRIqcIf7nn9JDx9YT7lh3gkgw9fv
   3NMyTQOvZOdG6z8ZE9qjUPM/+Xz4JaeVlutLwwLS0eQ3Tl2JskaMZ6g7k
   w==;
X-IronPort-AV: E=Sophos;i="5.84,296,1620684000"; 
   d="scan'208";a="18843437"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 05 Aug 2021 15:40:11 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 05 Aug 2021 15:40:11 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 05 Aug 2021 15:40:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1628170811; x=1659706811;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=65HjR0V0cAqIlq+0QHUMgU49xMCTYXtw5R29ksxbXBs=;
  b=dGr2NbBDXWFdPnkt7NmUOGzmDjFgqbcOsql68h3R0yPgjn401VHPDihN
   j29XhIhgoM/2+FyqClEUFujekwbkMoEgZLRc2zHA/ybHm7ZxAKRSNslTa
   aX5bh6LVEVAZneDc11in9heZPSmO1AhcPEKrwrHCWyG26mWVzQekMmP5u
   /CbUaRVROGks6q+vXBup4gUt8+Z73xctrplCa0lVDS80r6/A2un/ONXsv
   NxPbr+ScPmHh/PTysujt5rs//MgRYzviExItTMEtBemTyNuNmIIzk0zww
   DSdo/WcJVVgaqXR4kyfMJWgFbdZbsE0ZRjFONMJKPxEmL3Ir/7Q+xTURB
   A==;
X-IronPort-AV: E=Sophos;i="5.84,296,1620684000"; 
   d="scan'208";a="18843436"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Aug 2021 15:40:11 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 0E522280070;
        Thu,  5 Aug 2021 15:40:11 +0200 (CEST)
Message-ID: <9dc9fb4b37f7afa661bf1bb9148e5109b3f4329c.camel@ew.tq-group.com>
Subject: Re: [PATCH v3 2/7] mfd: tqmx86: clear GPIO IRQ resource when no IRQ
 is set
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 05 Aug 2021 15:40:08 +0200
In-Reply-To: <YQvn9dkFluRYj80r@google.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
         <65f9787ebd6725e90fad9ea7f936ee0d5712da94.1626429286.git.matthias.schiffer@ew.tq-group.com>
         <YQvn9dkFluRYj80r@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-08-05 at 14:30 +0100, Lee Jones wrote:
> On Fri, 16 Jul 2021, Matthias Schiffer wrote:
> 
> > The driver was registering IRQ 0 when no IRQ was set. This leads to
> > warnings with newer kernels.
> > 
> > Clear the resource flags, so no resource is registered at all in this
> > case.
> > 
> > Fixes: 2f17dd34ffed ("mfd: tqmx86: IO controller with I2C, Wachdog and GPIO")
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> > 
> > v2: add Fixes line
> > v3: no changes
> > 
> >  drivers/mfd/tqmx86.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> > index ddddf08b6a4c..732013f40e4e 100644
> > --- a/drivers/mfd/tqmx86.c
> > +++ b/drivers/mfd/tqmx86.c
> > @@ -209,6 +209,8 @@ static int tqmx86_probe(struct platform_device *pdev)
> >  
> >  		/* Assumes the IRQ resource is first. */
> >  		tqmx_gpio_resources[0].start = gpio_irq;
> > +	} else {
> > +		tqmx_gpio_resources[0].flags = 0;
> 
> Strange - why is this !0 in the first place?

I don't see anything strange here. DEFINE_RES_IRQ() sets flags to
IORESOURCE_IRQ. We reset it to 0 when there is no IRQ to clear that
resource entry.

An alternative would be to start with an empty entry and only fill in
the fields when an IRQ is used, but that seems more cumbersome than the
current code to me.

> 
> >  	}
> >  
> >  	ocores_platfom_data.clock_khz = tqmx86_board_id_to_clk_rate(board_id);
> 
> 

