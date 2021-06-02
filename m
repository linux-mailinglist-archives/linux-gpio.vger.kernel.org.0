Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360A239847C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 10:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhFBIsx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 2 Jun 2021 04:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbhFBIsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 04:48:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A855C061756
        for <linux-gpio@vger.kernel.org>; Wed,  2 Jun 2021 01:47:10 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1loMWm-0007FC-Sy; Wed, 02 Jun 2021 10:47:04 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1loMWl-0006td-5d; Wed, 02 Jun 2021 10:47:03 +0200
Message-ID: <0601d2800a285b44271d2b5a5e28669aa913522b.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/6] reset: Add Delta TN48M CPLD reset controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Date:   Wed, 02 Jun 2021 10:47:03 +0200
In-Reply-To: <CA+HBbNG3O_QORj1NEKvoC4C5FfyfXyO_PMOZS0pHJimGn+HTUA@mail.gmail.com>
References: <20210531125143.257622-1-robert.marko@sartura.hr>
         <20210531125143.257622-4-robert.marko@sartura.hr>
         <20210601153818.GA20254@pengutronix.de>
         <CA+HBbNG3O_QORj1NEKvoC4C5FfyfXyO_PMOZS0pHJimGn+HTUA@mail.gmail.com>
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

On Tue, 2021-06-01 at 19:09 +0200, Robert Marko wrote:
[...]
> Yes, it's self-clearing, per spec they will be cleared after 100ms.

Can you make sure the function only returns after the reset is
deasserted again, for example by using regmap_read_poll_timeout() on the
reset bit?

> Will drop assert then, I saw that reset was for self-clearing, but other
> drivers I looked for example implemented both which was confusing.

If you have full control over the reset line, you can implement .reset
by manually asserting and deasserting (possibly after a delay). But if
the reset is self-clearing, you can't properly implement .(de)assert,
which have an expectation about the state of the reset line after the
function returns.

> > > +}
> > > +
> > > +static int tn48m_control_status(struct reset_controller_dev *rcdev,
> > > +                             unsigned long id)
> > > +{
> > > +     struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
> > > +     unsigned int regval;
> > > +     int ret;
> > > +
> > > +     ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     if (BIT(tn48m_resets[id].bit) & regval)
> > > +             return 0;
> > > +     else
> > > +             return 1;
> > > +}
> > > +
> > > +static const struct reset_control_ops tn48_reset_ops = {
> > > +     .reset          = tn48m_control_reset,
> > > +     .assert         = tn48m_control_assert,
> > > +     .status         = tn48m_control_status,
> > > +};
> > > +
> > > +static int tn48m_reset_probe(struct platform_device *pdev)
> > > +{
> > > +     struct tn48_reset_data *data;
> > > +     struct regmap *regmap;
> > > +
> > > +     if (!pdev->dev.parent)
> > > +             return -ENODEV;
> > 
> > That shouldn't be necessary.
> 
> This driver depends on having a parent as it needs to get the
> regmap from it.
> The parent is a CPLD using simple-i2c-mfd.
> So it's nice to check.

pdev->dev.parent is always set to &platform_bus if there is no parent.

regards
Philipp
