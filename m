Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78324754CD
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 10:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241018AbhLOJDD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 04:03:03 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37170 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241012AbhLOJDB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 04:03:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9E57AB81EAE;
        Wed, 15 Dec 2021 09:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29670C34605;
        Wed, 15 Dec 2021 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639558979;
        bh=xcXsC2S7h/WU8rIJGNHqJ+c1UF+IcCTQyW+26OUfnxA=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=AqVYy2lINOI4oxR3X1TPkguu7btsSUb5BCP0aiOc7p1QrTXOMn51eRuPdRu0QeRhd
         ot/TvYzSqJbbD7kUV2Q+y3ead1gSe/L1+OxqJQ1jMkboKqsXeV+lke9LWn9k45ggfi
         ayuFhDaSfGh4lp9b8B70ZAiOCzOyovxxz4pbHGCKwBYPO0gUEwWF/iVAoD3pRUxzt8
         Ylm8W5AqhyFlqZ3LLbR6QkNYuLC+GDb8a1o7nu5S6F7u+3ADhiFs5qIbNQ6IkY+T4I
         4A5ftwTwXq2caQgUaQhFtC8KxzTne5UhL1D+bePXqIFa7+3r93PYg4v0zIDyUtsPGb
         5/QmO3LwX7RFA==
Message-ID: <83bda801c9be665086f94acce46d44da5d24ba9c.camel@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linus.walleij" <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Date:   Wed, 15 Dec 2021 10:02:54 +0100
In-Reply-To: <dbba6665-9688-9a5e-091b-eaa8e92e6886@gmail.com>
References: <20211206092237.4105895-1-phil@raspberrypi.com>
         <20211206092237.4105895-3-phil@raspberrypi.com>
         <CGME20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db@eucas1p1.samsung.com>
         <8671ebd8-a853-7394-9864-0457514337e2@samsung.com>
         <2ce5956f-ce8c-80f0-df9a-492a8da00a08@raspberrypi.com>
         <dbba6665-9688-9a5e-091b-eaa8e92e6886@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Florian,

On Tue, 2021-12-14 at 09:12 -0800, Florian Fainelli wrote:
> On 12/14/21 6:32 AM, Phil Elwell wrote:
> > Hi Marek,
> > 
> > On 14/12/2021 14:21, Marek Szyprowski wrote:
> > > Hi Phil,
> > > 
> > > On 06.12.2021 10:22, Phil Elwell wrote:
> > > > Since [1], added in 5.7, the absence of a gpio-ranges property has
> > > > prevented GPIOs from being restored to inputs when released.
> > > > Add those properties for BCM283x and BCM2711 devices.
> > > > 
> > > > [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
> > > >       pin-ranges")
> > > > 
> > > > Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without
> > > > pin-ranges")
> > > > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > > 
> > > This patch breaks today's linux-next (next-20211214) on RPi3 and RPi4.
> > > Either there is something missing or wrong here. Booting stops after
> > > following messages (on RPi4):
> > > 
> > > [    3.186786] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
> > > [    3.234513] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
> > > [    3.276703] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc]
> > > using ADMA
> > > [    3.287191] pinctrl-bcm2835 fe200000.gpio
> > 
> > This patch is part of a two-patch set, the cover note for which says:
> > 
> >     2. Since [1], a "gpio-ranges" property is required in order for pins
> >     to be returned to inputs when freed. Note that without patch 1, the
> >     device never gets out of EPROBE_DEFER.
> > 
> > It looks as though patch 2 has been merged without/before patch 1
> > ("pinctrl: bcm2835: Change init order for gpio hogs").
> 
> Yes, the hope was that there would be no such breakage, I suppose we
> will have to work out a plan to address that and coordinate both changes
> landing in at the same time.
> 
> I will work with Arnd to back out the Device Tree changes, sorry about that.

This is linux-next, so I can back out the DT change myself. Sorry for the
breakage.

As for channeling the path, would it make sense for linusw to take it alonside
GPIO fix?

Regards,
Nicolas
