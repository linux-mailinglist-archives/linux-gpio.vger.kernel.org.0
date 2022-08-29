Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 791F75A4F73
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Aug 2022 16:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiH2Okg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Aug 2022 10:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiH2Okf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Aug 2022 10:40:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8DD2981B
        for <linux-gpio@vger.kernel.org>; Mon, 29 Aug 2022 07:40:34 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oSfwH-0002Oz-9v; Mon, 29 Aug 2022 16:40:33 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oSfwG-0006fd-R4; Mon, 29 Aug 2022 16:40:32 +0200
Date:   Mon, 29 Aug 2022 16:40:32 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add gpio-latch binding document
Message-ID: <20220829144032.GC24324@pengutronix.de>
References: <20220825094132.1268174-1-s.hauer@pengutronix.de>
 <20220825094132.1268174-3-s.hauer@pengutronix.de>
 <CACRpkdYL24cJgo9F1nWYzP=8+XywdUXhSedJRQFJ16MUAx7-dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYL24cJgo9F1nWYzP=8+XywdUXhSedJRQFJ16MUAx7-dQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Aug 26, 2022 at 03:37:40PM +0200, Linus Walleij wrote:
> On Thu, Aug 25, 2022 at 11:41 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > This adds a binding for a GPIO multiplexer driver based on latches
> > connected to other GPIOs.
> >
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Nice overall!
> 
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-latch.yaml
> > @@ -0,0 +1,83 @@
> > +%YAML 1.2
> 
> No license?

Will add in v2.

> 
> > +  data-gpios:
> > +    description: Array of GPIOs to be used as data GPIOs
> 
> Hm I wanted to just call these "gpios" but that is maybe confusing.
> What about "latch-gpios"?

Hm, the clk input is used to latch the current state of the inputs to
the outputs, so "latch-gpios" might even be confused with the GPIO
routed to the clk unput of the latch.  Overall, the whole thing is a
latch, so "latch-gpios" doesn't sound like a good name to distinguish
the different types of inputs of a latch.  I still like data-gpios best
as these lines are described as "Data inputs" in my 74273 data sheet.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
