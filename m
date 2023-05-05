Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895F66F7F67
	for <lists+linux-gpio@lfdr.de>; Fri,  5 May 2023 10:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjEEIya (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 May 2023 04:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjEEIya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 May 2023 04:54:30 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D7BB150FF;
        Fri,  5 May 2023 01:54:29 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7A93C80FC;
        Fri,  5 May 2023 08:54:28 +0000 (UTC)
Date:   Fri, 5 May 2023 11:54:27 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: Pinconf issues on AMxxx plattforms
Message-ID: <20230505085427.GR14287@atomide.com>
References: <aa493d62327f26e4c65d649a812346cdfb26771f.camel@siemens.com>
 <20230504053509.GN14287@atomide.com>
 <CACRpkdaQe61Jk6WoCr8vYkGKJPMiM7D+iF0w9fKjoOxBWtinhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaQe61Jk6WoCr8vYkGKJPMiM7D+iF0w9fKjoOxBWtinhg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [230504 08:31]:
> On Thu, May 4, 2023 at 7:35 AM Tony Lindgren <tony@atomide.com> wrote:
> > * Niedermayr, BENEDIKT <benedikt.niedermayr@siemens.com> [230503 08:38]:
> 
> > > We encountered some issues when accessing the gpiochardev interface on an
> > > AM65xx plaform.
> 
> Thank you for using contemporary APIs!
> 
> > > The pinctrl offers 3 different options for muxing:
> > >
> > > 1.  Using the generic kernel APIs:
> > >      Call pinctrl_select_state() function as stated
> > > in  Documentation/driver-api/pin-control.rst (section "Pin control requests
> > > from drivers").
> > >      This function will select a defined state which has been defined in DTB
> > > with "pinctrl-0", "pinctrl-1", "pinctrl-x"
> > > 2.  Mux pins with debugfs:
> > >      Write the desired pingroup and pinfunction into the "pinmux-select"
> > > file of the related pin controller.
> > > 3. Mux the GPIO function of a requested GPIO pin by calling the pinctrl
> > > drivers pcs_request_gpio() function.
> > >
> > > The problem now is that only option 1. will store the current mux
> > > information in the pinctrl subsystems core.
> > > The pinctrl-single driver highly depends on that information, which is not
> > > available at all wenn muxing with options 2&3.
> > >
> > > I was able to fix that for option 2 but not for option 3. The problem here
> > > is that the pcs_request_gpio() function just does not provide enough
> > > parameters with sufficient information for achieving that task.
> 
> The fact that 3) doesn't work has to do with how pinctrl-single has
> been engineered I think, what the pinctrl_ops .gpio_request_enable/
> .gpio_disable_free/.gpio_set_direction provide is a "shortcut"
> for drivers that want to take it, in case they can provide the right
> information.
> 
> The pinctrl-single driver only implements .gpio_request_enable()
> but often that is enough.
> 
> Then it is the callbacks for generic config that you said you already
> added to gpio-davinci.c, so that part should be fine, patches welcome!

Thanks for explaining. Sounds like pinctrl-single should possibly
implement the missing functions and update pinctrl core with the
changes when a gpio is requested.

Regards,

Tony
