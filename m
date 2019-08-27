Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06E869EADB
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 16:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfH0OZA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 10:25:00 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40713 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfH0OZA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Aug 2019 10:25:00 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 899236000A;
        Tue, 27 Aug 2019 14:24:57 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Yan Markman <ymarkman@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list\:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>
Subject: Re: [PATCH 0/3] CP115 pinctrl support
In-Reply-To: <CACRpkdZ+zSCSc9Q40=_+K0kfZ4evuOTAShVYWYvuSeOfgkxZng@mail.gmail.com>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com> <CACRpkdar5jE116CcywYxLR9JKWunRusJjNw7f3C0SFK4-4+dNQ@mail.gmail.com> <CACRpkdbEw5eCKb=nTCK4wuMsPEadEQdGx62cGRhk7F78p5X2CA@mail.gmail.com> <20190814143457.664b04c8@windsurf.home> <CACRpkdY-AtaS67u4s58PifFtP5C7xp4P15J+hW_Dba=Gb4rhSQ@mail.gmail.com> <20190824133317.371dec4f@xps13> <CACRpkdZ+zSCSc9Q40=_+K0kfZ4evuOTAShVYWYvuSeOfgkxZng@mail.gmail.com>
Date:   Tue, 27 Aug 2019 16:24:57 +0200
Message-ID: <87imqiznwm.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> On Sat, Aug 24, 2019 at 1:33 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>> Linus Walleij <linus.walleij@linaro.org> wrote on Thu, 15 Aug 2019
>
>> > OK then maybe I am a bit impatient.
>>
>> Actually Gregory is on vacation until September, so if we still are in
>> time for this merge window I suppose you can take it.
>
> OK I applied the patches.
>
> If someone is upset we can always revert them in the -rc phase.

I had a look on the series and it looks good for me.

Gregory

>
> Yours,
> Linus Walleij

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
