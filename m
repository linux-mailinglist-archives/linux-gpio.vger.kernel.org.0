Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AED275871
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 15:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIWNNB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 09:13:01 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:51182 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWNNB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Sep 2020 09:13:01 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kL3vt-00FsaQ-GZ; Wed, 23 Sep 2020 14:31:37 +0200
Date:   Wed, 23 Sep 2020 14:31:37 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: Add i2c0 pinctrl information for
 98dx3236
Message-ID: <20200923123137.GF3770354@lunn.ch>
References: <20200907211712.9697-1-chris.packham@alliedtelesis.co.nz>
 <20200907211712.9697-4-chris.packham@alliedtelesis.co.nz>
 <CACRpkdZ13B==RROumpfB1sjO_uPG0Jx-LRwjm-w_6wr_wb1v8A@mail.gmail.com>
 <bb9b129a-7cbf-d303-95e6-da2b53a62df3@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb9b129a-7cbf-d303-95e6-da2b53a62df3@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 03:08:22AM +0000, Chris Packham wrote:
> Hi Jason, Andrew, Gregory,
> 
> On 13/09/20 4:16 am, Linus Walleij wrote:
> > On Mon, Sep 7, 2020 at 11:17 PM Chris Packham
> > <chris.packham@alliedtelesis.co.nz> wrote:
> >
> >> Add pinctrl information for the 98dx3236 (and variants). There is only
> >> one choice for i2c0 MPP14 and MPP15.
> >>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Please merge this through the ARM SoC maintenance path.
> 
> Are you able to pick this up via the mvebu tree or should I send it via 
> the RMKs patch tracking system?

Hi Chris

Gregory should be able to pick this up via mvebu.

> Incidentally I notice there is no longer a linux-mvebu.git on 
> git.infradead.org is there a pending update to MAINTAINERS.

It moved to git.kernel.org.

https://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git/

It does not look like there is a patch to MAINTAINERS queued.

	 Andrew

