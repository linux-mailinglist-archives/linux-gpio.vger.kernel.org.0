Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9155C2B8067
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 16:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgKRP04 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 10:26:56 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:33161 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgKRP0z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 10:26:55 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0D22624000C;
        Wed, 18 Nov 2020 15:26:52 +0000 (UTC)
Date:   Wed, 18 Nov 2020 16:26:52 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     cristian.birsan@microchip.com, nicolas.ferre@microchip.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: at91: add pincontrol node for USB Host
Message-ID: <20201118152652.GA11581@piout.net>
References: <20201118120019.1257580-1-cristian.birsan@microchip.com>
 <20201118150336.g3u3ljuhrbrn2cko@sekiro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118150336.g3u3ljuhrbrn2cko@sekiro>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On 18/11/2020 16:03:36+0100, Ludovic Desroches wrote:
> At first glance, there is no trivial way to register the pin range in the
> pinctrl-at91 driver. There is one driver for the pinctrl and one for the gpio.
> I am open to suggestions to fix it in the pinctrl-at91 driver as well if there
> is an elegant way (I have some in mind, but there are not) without having to
> refactor the driver.
> 

But shouldn't that driver be refactored at some point anyway? I know you
are moving away with new SoCs but it causes real issues. For example,
gpio hogs are not working, this is impacting some of your customers.

The other thing is the weird probe order preventing a nice cleanup of
the platform code.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
