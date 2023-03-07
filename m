Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2018A6AE39A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 16:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjCGPAf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 10:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjCGPAJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 10:00:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A992F8C50B;
        Tue,  7 Mar 2023 06:46:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 410C760FD1;
        Tue,  7 Mar 2023 14:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C655C433EF;
        Tue,  7 Mar 2023 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678200410;
        bh=DN1W8oMPd9PdDeMPD2DYrL5vRQksYBzKs3O+zyH0ccQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ld2jFffGowYJ4d/j3ZmWfnhWzQxHoCwGwF6DbRv5DdjDs4cfRzccq8+gV4PNYlyxx
         9XpQ1hPVBcGLiWmc3ISCHi/vJ6B3IYwyL0C1+JTs5vvtG0fCkzGa/WWatjh+0NZkvY
         n7aF3aG74zH76W4mQoyfq87cuw0g8SwLOj7nxQj8=
Date:   Tue, 7 Mar 2023 15:46:42 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 03/13] pinctrl: Add sysfs support
Message-ID: <ZAdOUtNqM6e6Z57S@kroah.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-4-biju.das.jz@bp.renesas.com>
 <CACRpkdb-gyn29ns3tGXXnrGgySNP7R90h0M7fan=zeNMU7-QKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb-gyn29ns3tGXXnrGgySNP7R90h0M7fan=zeNMU7-QKg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 07, 2023 at 02:41:16PM +0100, Linus Walleij wrote:
> On Mon, Mar 6, 2023 at 10:00 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> 
> > Add a simple sysfs interface to the generic pinctrl framework
> > for configuring pins for output disable operation.
> >
> > /sys/class/pinctrl/
> >   `-- output-disable/
> >       |-- configure    (w/o) ask the kernel to configure a pin group
> >                              for output disable operation.
> >
> >   echo "<group-name function-name 0 1>" > configure
> >
> > The existing "pinmux-functions" debugfs file lists the pin functions
> > registered for the pin controller. For example:
> >
> >   function 0: usb0, groups = [ usb0 ]
> >   function 1: usb1, groups = [ usb1 ]
> >   function 2: gpt4-pins, groups = [ gpt4-pins ]
> >   function 3: scif0, groups = [ scif0 ]
> >   function 4: scif2, groups = [ scif2 ]
> >   function 5: spi1, groups = [ spi1 ]
> >
> > To configure gpt4-pins for output disable activation by user:
> >
> >   echo "gpt4-pins gpt4-pins 0 1" > configure

That is not what sysfs is for (multiple values per file.)  Why not use
configfs for this as that is exactly what this is designed for?

thanks,

greg k-h
