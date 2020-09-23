Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45224275A6A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 16:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgIWOkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 10:40:45 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:39142 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgIWOki (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 10:40:38 -0400
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 3CBD23A9FC0;
        Wed, 23 Sep 2020 14:38:27 +0000 (UTC)
X-Originating-IP: 90.65.92.90
Received: from localhost (lfbn-lyo-1-1913-90.w90-65.abo.wanadoo.fr [90.65.92.90])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CCA362000A;
        Wed, 23 Sep 2020 14:38:03 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        jason@lakedaemon.net, andrew@lunn.ch,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 0/3] 98dx3236 i2c related fixes
In-Reply-To: <20200907211712.9697-1-chris.packham@alliedtelesis.co.nz>
References: <20200907211712.9697-1-chris.packham@alliedtelesis.co.nz>
Date:   Wed, 23 Sep 2020 16:38:03 +0200
Message-ID: <87ft78imno.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris,

> I noticed these while adding support for i2c recovery for a couple of our
> boards. They date back to when I initially added support for the 98dx3236. They
> probably haven't been causing a problem because the HW defaults are correct and
> unless you attempt to use the specific pinctrl functions there won't be a
> problem.
>
> Change in v2:
> - Fix grammo in patch 2/3
> - Add r-by from Andrew
>
> Chris Packham (3):
>   pinctrl: mvebu: Fix i2c sda definition for 98DX3236
>   ARM: dts: Remove non-existent i2c1 from 98dx3236
>   ARM: dts: Add i2c0 pinctrl information for 98dx3236

Applied the 2 dts pacthes on mvebu/dt

Thanks,

Gregory


>
>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 12 +++++++-----
>  drivers/pinctrl/mvebu/pinctrl-armada-xp.c |  2 +-
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> -- 
> 2.28.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
