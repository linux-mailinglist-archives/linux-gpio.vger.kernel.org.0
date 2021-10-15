Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3567642F421
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 15:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239999AbhJONss convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 15 Oct 2021 09:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240003AbhJONsj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 09:48:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A6CC061764
        for <linux-gpio@vger.kernel.org>; Fri, 15 Oct 2021 06:46:33 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mbNXU-0001eJ-Na; Fri, 15 Oct 2021 15:46:24 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mbNXT-0003MH-Pj; Fri, 15 Oct 2021 15:46:23 +0200
Message-ID: <045af226c30bde06bff318e9c0673afd86540661.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] pinctrl: microchip sgpio: use reset driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 15 Oct 2021 15:46:23 +0200
In-Reply-To: <20211014143733.t2dov6ajjebxlht6@soft-dev3-1.localhost>
References: <20211014085929.2579695-1-horatiu.vultur@microchip.com>
         <20211014085929.2579695-3-horatiu.vultur@microchip.com>
         <2874212d2f9462880d1b0aae35296162e1277e62.camel@pengutronix.de>
         <20211014143733.t2dov6ajjebxlht6@soft-dev3-1.localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-10-14 at 16:37 +0200, Horatiu Vultur wrote:
> The 10/14/2021 13:47, Philipp Zabel wrote:
> > Hi Horatiu,
> 
> Hi Philipp
> > > +     reset = devm_reset_control_get_shared(&pdev->dev, "switch");
> > 
> > Please use devm_reset_control_get_optional_shared() for optional resets
> > and handle errors. That will return NULL in case the optional reset is
> > not specified in the device tree.
> 
> I will do that.
> 
> > It seems weird to me that the reset input to the GPIO controller is
> > called "switch" reset. You can request a single unnamed reset with
> > 
> >         reset = devm_reset_control_get_shared(&pdev->dev, NULL);
> > 
> > although that would limit future extendability in case this driver will
> > ever require to handle multiple separate resets. If you decide to
> > request the reset control by name, the yaml binding should specify the
> > same name.
> 
> I think this requires a little bit more explanation from my side. On
> lan966x we are facing the following issue. When we try to reset just the
> switch core then also the sgpio device was reset and there was no way
> from HW perspective to prevent this.
> 
> So our solutions was to create a reset driver[1] that will be triggered
> only one time, by the sgpio driver or by the switch driver. That is the
> reason why it was called "switch" reset. And that is the purpose of this
> patch to allow the sgpio driver to reset the switch in case is probed
> before the switch driver so it would not get reset after that.

Thank you for the explanation, it is perfectly fine to request the
shared reset line with another name, or use no name at all if it is the
only reset input to the sgpio controller.

regards
Philipp
