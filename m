Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E460F55087
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbfFYNjK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:39:10 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:35129 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbfFYNjK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:39:10 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1C7AD4000C;
        Tue, 25 Jun 2019 13:38:59 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>, alpawi@amazon.com
Cc:     Benjamin Herrenschmidt <benh@amazon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 0/2] pinctl: armada-37xx: fix for pins 32+
In-Reply-To: <CACRpkdYgXZzvFKyvySWnsJ2_1pA1e_VHEY-QNzNYCikMUc_WVg@mail.gmail.com>
References: <20190618160105.26343-1-alpawi@amazon.com> <CACRpkdYgXZzvFKyvySWnsJ2_1pA1e_VHEY-QNzNYCikMUc_WVg@mail.gmail.com>
Date:   Tue, 25 Jun 2019 15:38:59 +0200
Message-ID: <871rzhlr7w.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

> On Tue, Jun 18, 2019 at 6:01 PM <alpawi@amazon.com> wrote:
>
>> From: Patrick Williams <alpawi@amazon.com>
>>
>> The 37xx GPIO config registers are only 32 bits long and
>> span 2 registers for the NB GPIO controller.  The function
>> to calculate the offset was missing the increase to the
>> config register.
>>
>> I have tested both raw gpio access and interrupts using
>> libgpiod utilities on an Espressonbin.
>>
>> The first patch is a simple rename of a function because
>> the original name implied it was doing IO itself ("update
>> reg").  This patch could be dropped if undesired.
>>
>> The second patch contains the fix for GPIOs 32+.

First you can add my
Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Then as the second patch is a fix, you should add the fix tag: "Fixes:
5715092a458c ("pinctrl: armada-37xx: Add gpio support") " as well as the
'CC: <stable@vger.kernel.org>" tags.

But your change in the first patch made this second patch more difficult
to backport.

Actually, when I wrote "_update_reg" I was thinking to the update of the
variable, whereas with a function named "_calculate_reg" I am expecting
having the result as a return of the function.

However I am not against your change, as I pointed my main concern is
about the backport of the patch to the stable branch.

Maybe you could change the order of those 2 patches?

Thanks,

Gregory

>
> This looks good overall. I am waiting for a maintainer review.
> If nothing happens in a week, poke me and I'll just apply
> the patches.
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
