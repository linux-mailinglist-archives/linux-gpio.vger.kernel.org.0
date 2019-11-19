Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03CC51021D8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 11:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbfKSKRT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 05:17:19 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:34489 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfKSKRT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 05:17:19 -0500
X-Greylist: delayed 423 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Nov 2019 05:17:18 EST
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 1A1CD23E27;
        Tue, 19 Nov 2019 11:10:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
        s=mail2016061301; t=1574158214;
        bh=2gjaAluYE5S671JdpVIbeRx1/CVxFO29m3oWfUtycpY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Hi6LHHBy2qIJem7KFASOPmhSvCuMPqbkuvnU6Pgxg8QcFXTg41roDgM8mMZlONRl/
         YBdYLvVnSi2u1/zDZW7C/+7i1aF7pN570c/ORCzCIGd4s/GEarTgWVOGr30XVDFlY1
         O1pH51ETD1qoT4oKCIOoc5vSf647aMU9odpK+1Os=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 Nov 2019 11:10:14 +0100
From:   Michael Walle <michael@walle.cc>
To:     olteanv@gmail.com
Cc:     bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.oltean@nxp.com
Subject: Re: [PATCH] gpio: mpc8xxx: Don't overwrite default irq_set_type
 callback
In-Reply-To: <20191115125551.31061-1-olteanv@gmail.com>
Message-ID: <81c15c43b1d1228a0d015f232ce7ec46@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Virus-Scanned: clamav-milter 0.101.4 at web
X-Virus-Status: Clean
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> The per-SoC devtype structures can contain their own callbacks that
> overwrite mpc8xxx_gpio_devtype_default.
> 
> The clear intention is that mpc8xxx_irq_set_type is used in case the 
> SoC
> does not specify a more specific callback. But what happens is that if
> the SoC doesn't specify one, its .irq_set_type is de-facto NULL, and
> this overwrites mpc8xxx_irq_set_type to a no-op. This means that the
> following SoCs are affected:
> 
> - fsl,mpc8572-gpio
> - fsl,ls1028a-gpio
> - fsl,ls1088a-gpio
> 
> On these boards, the irq_set_type does exactly nothing, and the GPIO
> controller keeps its GPICR register in the hardware-default state. On
> the LS1028A, that is ACTIVE_BOTH, which means 2 interrupts are raised
> even if the IRQ client requests LEVEL_HIGH. Another implication is that
> the IRQs are not checked (e.g. level-triggered interrupts are not
> rejected, although they are not supported).
> 
> Fixes: 82e39b0d8566 ("gpio: mpc8xxx: handle differences between 
> incarnations at a single place")
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Tested-by: Michael Walle <michael@walle.cc>
