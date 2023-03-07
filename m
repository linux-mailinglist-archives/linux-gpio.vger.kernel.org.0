Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 287186AE460
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 16:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjCGPS7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 10:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjCGPRj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 10:17:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39B836686;
        Tue,  7 Mar 2023 07:15:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26FD5B818BA;
        Tue,  7 Mar 2023 15:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0C8C433EF;
        Tue,  7 Mar 2023 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678202128;
        bh=sSrgJXd3eC/UJaa75DjscRVlXfUg1LVThKRBxE67DRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E3V01B8hrXqSeA28Q0Z5ou0ZV37Tq+zOUgkLsAe9ASOEjITzCIZ5puFxcjPO1p6rx
         OSeZCbBAaRIm6C/tIBInUrf1qMt1OaQuZp8OSkUmxxJI9qx7jaOqyHdcWTLlFfunr/
         GuDU/HbsvYC6wqzWJI9sNLe9kw/iFzaQsIBYoaIE=
Date:   Tue, 7 Mar 2023 16:15:25 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 03/13] pinctrl: Add sysfs support
Message-ID: <ZAdVDaxoSuwd57hP@kroah.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
 <CACRpkdb-gyn29ns3tGXXnrGgySNP7R90h0M7fan=zeNMU7-QKg@mail.gmail.com>
 <OS0PR01MB5922171F49133EB3793BCDBF86B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922171F49133EB3793BCDBF86B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 07, 2023 at 02:43:54PM +0000, Biju Das wrote:
> Hi Linus Walleij,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v6 03/13] pinctrl: Add sysfs support
> > 
> > On Mon, Mar 6, 2023 at 10:00 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > 
> > > Add a simple sysfs interface to the generic pinctrl framework for
> > > configuring pins for output disable operation.
> > >
> > > /sys/class/pinctrl/
> > >   `-- output-disable/
> > >       |-- configure    (w/o) ask the kernel to configure a pin group
> > >                              for output disable operation.
> > >
> > >   echo "<group-name function-name 0 1>" > configure
> > >
> > > The existing "pinmux-functions" debugfs file lists the pin functions
> > > registered for the pin controller. For example:
> > >
> > >   function 0: usb0, groups = [ usb0 ]
> > >   function 1: usb1, groups = [ usb1 ]
> > >   function 2: gpt4-pins, groups = [ gpt4-pins ]
> > >   function 3: scif0, groups = [ scif0 ]
> > >   function 4: scif2, groups = [ scif2 ]
> > >   function 5: spi1, groups = [ spi1 ]
> > >
> > > To configure gpt4-pins for output disable activation by user:
> > >
> > >   echo "gpt4-pins gpt4-pins 0 1" > configure
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > 
> > You have to run things like this by Greg K-H (adde on To)
> > 
> > > +static struct class pinctrl_class = {
> > > +       .name = "pinctrl",
> > > +       .owner = THIS_MODULE,
> > > +       .dev_groups = pinctrl_groups,
> > > +};
> > 
> > Why are you adding a new device class?
> > 
> > IIRC Greg don't like them, we should probably just deal with the devices
> > directly on the bus where they are, which also implies some topology search
> > etc which is a feature.
> 
> I am ok for both, 
> 
> I thought adding new device class will be more generic and 
> people can use simple sysfs[1] like pwm for output disable operation
> rather than the SoC specific operation[2].
> 
> [1]
> /sys/class/pinctrl/output-disable/configure

That's fine, but you don't need a class for it, use configfs for
configuring things like this, that is what it is there for.

thanks,

greg k-h
