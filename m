Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C482638F9DA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 07:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhEYFQw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 01:16:52 -0400
Received: from muru.com ([72.249.23.125]:59920 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230218AbhEYFQt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 01:16:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 64F1D807E;
        Tue, 25 May 2021 05:15:24 +0000 (UTC)
Date:   Tue, 25 May 2021 08:15:12 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Vladimir Zapolskiy <vz@mleia.com>
Cc:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug
 file
Message-ID: <YKyH4BPypsfXiw1o@atomide.com>
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-3-dariobin@libero.it>
 <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
 <1972814783.387983.1621877304255@mail1.libero.it>
 <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

* Vladimir Zapolskiy <vz@mleia.com> [210524 18:52]:
> Thus a higher level of abstraction is wanted:
> 
> * writing data to I/O mem -- not good enough,
> * writing data to pinmux/pinconf I/O mem -- better, but not good enough,
> * writing *valid* data to pinmux/pinconf I/O mem -- that's right.
> 
> The validity of data is defined by a developer, the abstraction name
> has been mentioned multiple times, it's pin groups and pin group functions.

Sounds like the planned interface should only allow changing between
already defined pingroups, and only if the pins are unclaimed. That
would leave out the issues tinkering with raw register data.

And it probably should also allow adding and removing new pingroups out
of the already defined pin functions that are unclaimed.

I also think such interface should be sysfs and not debugfs eventually.

Regards,

Tony
