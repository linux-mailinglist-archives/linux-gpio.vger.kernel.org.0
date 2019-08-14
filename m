Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09058D332
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 14:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfHNMfF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 08:35:05 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56735 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfHNMfF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 08:35:05 -0400
X-Originating-IP: 90.30.228.116
Received: from windsurf.home (atoulouse-659-1-185-116.w90-30.abo.wanadoo.fr [90.30.228.116])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4B3DC240005;
        Wed, 14 Aug 2019 12:34:58 +0000 (UTC)
Date:   Wed, 14 Aug 2019 14:34:57 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>
Subject: Re: [PATCH 0/3] CP115 pinctrl support
Message-ID: <20190814143457.664b04c8@windsurf.home>
In-Reply-To: <CACRpkdbEw5eCKb=nTCK4wuMsPEadEQdGx62cGRhk7F78p5X2CA@mail.gmail.com>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
        <CACRpkdar5jE116CcywYxLR9JKWunRusJjNw7f3C0SFK4-4+dNQ@mail.gmail.com>
        <CACRpkdbEw5eCKb=nTCK4wuMsPEadEQdGx62cGRhk7F78p5X2CA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

On Wed, 14 Aug 2019 10:12:36 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Wed, Aug 7, 2019 at 2:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Mon, Aug 5, 2019 at 12:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  
> > > This is the second batch of changes (out of three) to support the brand
> > > new Marvell CN9130 SoCs which are made of one AP807 and one CP115.
> > >
> > > We add a new compatible (and the relevant support in the pinctrl
> > > driver) before the addition in batch 3/3 of CN9130 SoCs DT using it.  
> >
> > Waiting for review from the Mvebu maintainers.
> >
> > If it takes too long just nudge me, it looks good to me.  
> 
> So if the other MVEBU maintainers don't really look much at MVEBU
> patches anymore while Miquel is working a lot on the platform,
> what about listing Miquel as maintainer under the SoC entry, hm?

Miquel sent his series on August 5, i.e 9 days ago. We're in August, in
the middle of the summer vacations for many people. While it is nice to
see subsystem maintainers who want to get code merged in a timely
fashion, I think it is probably wise to give it some more time for
review in this period of the year.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
