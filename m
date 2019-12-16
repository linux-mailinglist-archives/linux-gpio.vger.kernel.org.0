Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4109D120060
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfLPIzd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:55:33 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:32967 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfLPIzd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:55:33 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1igmA2-0003x9-Gv; Mon, 16 Dec 2019 09:55:26 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1igmA1-0001w3-8N; Mon, 16 Dec 2019 09:55:25 +0100
Date:   Mon, 16 Dec 2019 09:55:25 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: mfd: da9062: add regulator voltage
 selection documentation
Message-ID: <20191216085525.csr2aglm5md4vtsw@pengutronix.de>
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
 <20191129172537.31410-4-m.felsch@pengutronix.de>
 <20191204134631.GT1998@sirena.org.uk>
 <20191210094144.mxximpuouchy3fqu@pengutronix.de>
 <AM5PR1001MB099497419E4DCA69D424EC35805A0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191211170918.q7kqkd4lrwwp7jl3@pengutronix.de>
 <20191212161019.GF4310@sirena.org.uk>
 <20191212162152.5uu3feacduetysq7@pengutronix.de>
 <20191212165124.GJ4310@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212165124.GJ4310@sirena.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:40:13 up 30 days, 23:58, 39 users,  load average: 0.04, 0.06,
 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-12-12 16:51, Mark Brown wrote:
> On Thu, Dec 12, 2019 at 05:21:53PM +0100, Marco Felsch wrote:
> 
> > "... what's driving the input ..":
> > Sorry I didn't get you here. What did you mean? The input is driven by
> > the host. This can be any gpio line and in my case it is a gpio line
> > driven by the soc-hw during a suspend operation.
> 
> Something needs to say what that thing is, especially if it's runtime
> controllable.  In your case from the point of view of software there is
> actually no enable control so we shouldn't be providing an enable
> operation to the framework.

The enabel control signal is always available, please check [1] table
63. There is a mux in front of the enable pin so:

             +-------------
 Seq. |\     |   Regulator
 GPI1 | \    |
 GPI2 | | -- > Enable
 GPI3 | /    |
      |/     .
             .
             .

Adam please correct me if this is wrong.

[1] https://www.dialog-semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf

Regards,
  Marco

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
