Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1368F1AAE16
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 18:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415843AbgDOQ0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 12:26:30 -0400
Received: from lists.nic.cz ([217.31.204.67]:41208 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1415815AbgDOQ0P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 12:26:15 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id CF1AC141613;
        Wed, 15 Apr 2020 18:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1586967972; bh=OUmASI7k6fLdfyHcQ3klpVwKDiKIAMSXlml+xBJkTd8=;
        h=Date:From:To;
        b=CZz2qeZ4NSnc9TF0Qgb/Y/2SyC0PungwiOja4a1nvcLYkOl4QUImTHWIjWIV5xHP2
         xYPOC5gI/s6dMfaAc3GKtB9SyYM70gHlsl7zz22PcKy7k+u8jWdcWhi7UBFf3Mospu
         /HqhSV6O8aogx8SwkaF44LA6XTk3CrzTbSA/RF+o=
Date:   Wed, 15 Apr 2020 18:26:11 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH pinctrl REGRESSION] Revert "pinctrl: mvebu: armada-37xx:
 use use platform api"
Message-ID: <20200415182611.705c96b7@nic.cz>
In-Reply-To: <20200415095307.dv4bwna32llnuy7e@pali>
References: <20200324004413.14355-1-marek.behun@nic.cz>
        <20200324122017.GR3819@lunn.ch>
        <20200407115230.7dsepjfxwbk53x2v@pali>
        <20200415095307.dv4bwna32llnuy7e@pali>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Apr 2020 11:53:07 +0200
Pali Roh=C3=A1r <pali@kernel.org> wrote:

> On Tuesday 07 April 2020 13:52:30 Pali Roh=C3=A1r wrote:
> > On Tuesday 24 March 2020 13:20:17 Andrew Lunn wrote: =20
> > > On Tue, Mar 24, 2020 at 01:44:13AM +0100, Marek Beh=C3=BAn wrote: =20
> > > > This reverts commit 06e26b75f5e613b400116fdb7ff6206a681ab271.
> > > >=20
> > > > This commit caused a regression on Armada 37xx. The pinctrl driver =
says
> > > >   armada-37xx-pinctrl d0013800.pinctrl: invalid or no IRQ
> > > >   armada-37xx-pinctrl d0018800.pinctrl: invalid or no IRQ
> > > > and afterwards other drivers cannot use GPIOs by this driver as IRQ=
s.
> > > >=20
> > > > Fixes: 06e26b75f5e6 ("pinctrl: mvebu: armada-37xx: use use platform=
...")
> > > > Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> > > > Cc: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 12 +++---------
> > > >  1 file changed, 3 insertions(+), 9 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/=
pinctrl/mvebu/pinctrl-armada-37xx.c
> > > > index 32f12a388b3c..5f125bd6279d 100644
> > > > --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > > > +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > > > @@ -15,6 +15,7 @@
> > > >  #include <linux/of.h>
> > > >  #include <linux/of_address.h>
> > > >  #include <linux/of_device.h>
> > > > +#include <linux/of_irq.h>
> > > >  #include <linux/pinctrl/pinconf-generic.h>
> > > >  #include <linux/pinctrl/pinconf.h>
> > > >  #include <linux/pinctrl/pinctrl.h>
> > > > @@ -741,14 +742,7 @@ static int armada_37xx_irqchip_register(struct=
 platform_device *pdev,
> > > >  		return ret;
> > > >  	}
> > > > =20
> > > > -	nr_irq_parent =3D platform_irq_count(pdev); =20
> > >=20
> > > Hi Marek
> > >=20
> > > Could you determine the value of nr_irq_parent(). Is it -EPROBE_DEFER=
? =20
> >=20
> > Hello Andrew! I have tested it with 5.6 kernel and return value in
> > nr_irq_parent is in both cases zero. So it is not -EPROBE_DEFER. And
> > return value of of_irq_count(np) is 12 for d0013800.pinctrl and 5 for
> > d0018800.pinctrl. =20
>=20
> Adding Jason, Gregory and Sebastian into the loop.
>=20
> Could you please look at this problem? If there is no easy solution,
> I would suggest to revert problematic commit as pinctrl in current state
> is broken and unusable.

Pali, the commit is already reverted in upstream.
