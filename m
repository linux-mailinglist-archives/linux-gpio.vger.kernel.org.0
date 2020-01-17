Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 604E4140596
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 09:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729715AbgAQIpK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 03:45:10 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42839 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgAQIpJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 03:45:09 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1isNFY-0004Ep-AO; Fri, 17 Jan 2020 09:45:04 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1isNFX-0003wZ-EE; Fri, 17 Jan 2020 09:45:03 +0100
Date:   Fri, 17 Jan 2020 09:45:03 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] pinctrl: da9062: add driver support
Message-ID: <20200117084503.hysueo4rkxhfhrei@pengutronix.de>
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
 <20200108104746.1765-4-m.felsch@pengutronix.de>
 <20200115162915.ccudevxvre3v5c3d@pengutronix.de>
 <CACRpkdbwuaA6CnUW_s1i=cf1ix_jHrqGoZZENXdAG-VXcAd_Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbwuaA6CnUW_s1i=cf1ix_jHrqGoZZENXdAG-VXcAd_Mw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:43:39 up 63 days, 2 min, 56 users,  load average: 0.02, 0.03,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20-01-17 09:16, Linus Walleij wrote:
> On Wed, Jan 15, 2020 at 5:29 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > Hi Linus,
> >
> > On 20-01-08 11:47, Marco Felsch wrote:
> > > The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> > > be used as input, output or have a special use-case.
> > >
> > > The patch adds the support for the normal input/output use-case.
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> >
> > Is it possible to get this into 5.6?
> 
> It's patch 3/3 and patch 2/3 which makes it useful is not merged?
> 
> If you are convinced that 2/3 will be merged I can apply it.

I will ping the MFD Guys to.

Regards,
  Marco

> Yours,
> Linus Walleij
