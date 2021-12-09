Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8AE246E5B3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Dec 2021 10:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhLIJnv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 9 Dec 2021 04:43:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhLIJnv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 04:43:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA85C061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 01:40:18 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mvFuQ-0001Gj-Uo; Thu, 09 Dec 2021 10:40:14 +0100
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mvFuJ-0004ES-Gu; Thu, 09 Dec 2021 10:40:07 +0100
Message-ID: <33ab37f5b30252e41f3e0769c7702764a9e77d7f.camel@pengutronix.de>
Subject: Re: [PATCH v9 3/6] dt-bindings: reset: Add Delta TN48M
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Robert Marko <robert.marko@sartura.hr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>
Cc:     Luka Perkov <luka.perkov@sartura.hr>,
        Bruno Banelli <bruno.banelli@sartura.hr>
Date:   Thu, 09 Dec 2021 10:40:07 +0100
In-Reply-To: <CA+HBbNGH9ih5RovU9YHL91osFxDJbWw2Qk=ed30GGQvndNJPKw@mail.gmail.com>
References: <20211109113239.93493-1-robert.marko@sartura.hr>
         <20211109113239.93493-3-robert.marko@sartura.hr>
         <CA+HBbNGH9ih5RovU9YHL91osFxDJbWw2Qk=ed30GGQvndNJPKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Robert,

On Wed, 2021-12-01 at 22:28 +0100, Robert Marko wrote:
> On Tue, Nov 9, 2021 at 12:32 PM Robert Marko <robert.marko@sartura.hr> wrote:
> > 
> > Add header for the Delta TN48M CPLD provided
> > resets.
> > 
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  include/dt-bindings/reset/delta,tn48m-reset.h | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/delta,tn48m-reset.h
> > 
> > diff --git a/include/dt-bindings/reset/delta,tn48m-reset.h b/include/dt-bindings/reset/delta,tn48m-reset.h
> > new file mode 100644
> > index 000000000000..d4e9ed12de3e
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/delta,tn48m-reset.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Delta TN48M CPLD GPIO driver
> > + *
> > + * Copyright (C) 2021 Sartura Ltd.
> > + *
> > + * Author: Robert Marko <robert.marko@sartura.hr>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_RESET_TN48M_H
> > +#define _DT_BINDINGS_RESET_TN48M_H
> > +
> > +#define CPU_88F7040_RESET      0
> > +#define CPU_88F6820_RESET      1
> > +#define MAC_98DX3265_RESET     2
> > +#define PHY_88E1680_RESET      3
> > +#define PHY_88E1512_RESET      4
> > +#define POE_RESET              5
> > +
> > +#endif /* _DT_BINDINGS_RESET_TN48M_H */
> > --
> > 2.33.1
> > 
> 
> Does anybody have any comments on the patch as the reset driver got reviewed and
> the bindings have not?

Not much to review here, I can't tell if the indices are correct.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

To be merged with the rest of the series. Or do you want me to pick up
the reset parts individually? In that case you'd have to split out the
reset bindings into a separate patch.


regards
Philipp
