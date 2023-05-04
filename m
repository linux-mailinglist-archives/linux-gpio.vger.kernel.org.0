Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D186F6470
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 07:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjEDFfO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 May 2023 01:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjEDFfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 01:35:14 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2DEE11BEB;
        Wed,  3 May 2023 22:35:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DD92580C1;
        Thu,  4 May 2023 05:35:10 +0000 (UTC)
Date:   Thu, 4 May 2023 08:35:09 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Cc:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "haojian.zhuang@linaro.org" <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: Pinconf issues on AMxxx plattforms
Message-ID: <20230504053509.GN14287@atomide.com>
References: <aa493d62327f26e4c65d649a812346cdfb26771f.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa493d62327f26e4c65d649a812346cdfb26771f.camel@siemens.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Adding linux-gpio and Linus W to Cc. Some questions and comments below
towards the end.

* Niedermayr, BENEDIKT <benedikt.niedermayr@siemens.com> [230503 08:38]:
> Hello,
> 
> We encountered some issues when accessing the gpiochardev interface on an
> AM65xx plaform.
>  
> The basic idea was to fully rely on all features the gpiochardev seems to
> offer. 
> I got all relevant information from the Linux Kernel Documentation
> (Documentation/driver-api/pin-control.rst) and saw 
> some presentations from Linus Walleij  regarding the gpiochardev
> capabilities.
> 
> If I understand that correctly the gpiochardev interface should support the
> following features:
> * Requesting gpio pins from userspace
> * Set input/output directions
> * Set BIAS settings (pull-up, pull-down, etc.)
> * Gpio function of that pin automatically gets muxed in if requested 
> 
> Requesting pins worked for me as expected after I added the required DTB
> properties:
> * pinctrl-single: Add each required pin to "pinctrl-single,gpio-range" in
> the pincontroller node 
> * gpio: Add each required pin to gpio-range property in the gpio node
> 
> I also added the required childnodes in the pinctrl node:
> 
> &main_pmx0 {
>   ... 
>    d6_gpio: d6-gpio {
> pinctrl-single,pins = <
> /* (AH16) GPIO0_38 */
> AM65X_IOPAD(0x0098, PIN_INPUT, 7)
> >;
> pinctrl-single,bias-pullup   = <0x20000  0x20000  0x10000  0x30000>;
> pinctrl-single,bias-pulldown = <0x00000  0x0      0x10000  0x30000>;
> };
> ...
> }
> 
> When I tried to set any BIAS settings nothing happened or some error occured
> in the kernel logs (i'm not 100% sure anymore since almost 2 months have
> past). 
> The first thing I had to do was to assign the gpiochip_generic_config
> callback to the gpiochiop for that (gpio-davinci.c). This callback in turn
> will finally call pcs_pinconf_set(), which
> is the pinctrl drivers related callback for setting the pinconf.
> But still no success...
> 
> Then I went deeper into the rabbit whole and encountered that the error had
> to do with pcs_get_function() (pinctrl-single.c).
> I found out that this function requests the current function (or pinmux
> state) from the pinctrl subsystem core. 
> The pinctrl driver needs this information for accessing the correct pinctrl
> childnode bits. 
> 
> So what is the Problem here?
> The pinctrl offers 3 different options for muxing:
> 
> 1.  Using the generic kernel APIs: 
>      Call pinctrl_select_state() function as stated
> in  Documentation/driver-api/pin-control.rst (section "Pin control requests
> from drivers").
>      This function will select a defined state which has been defined in DTB
> with "pinctrl-0", "pinctrl-1", "pinctrl-x"
> 2.  Mux pins with debugfs:
>      Write the desired pingroup and pinfunction into the "pinmux-select"
> file of the related pin controller.
> 3. Mux the GPIO function of a requested GPIO pin by calling the pinctrl
> drivers pcs_request_gpio() function.
> 
> The problem now is that only option 1. will store the current mux
> information in the pinctrl subsystems core. 
> The pinctrl-single driver highly depends on that information, which is not
> available at all wenn muxing with options 2&3.
> 
> I was able to fix that for option 2 but not for option 3. The problem here
> is that the pcs_request_gpio() function just does not provide enough
> parameters with sufficient information for achieving that task.

Care to post what your fix for #2 above looks like?

> I'm not sure if I miss something important here?
> Are you aware of this issue? 

Sounds like something needs to be implemented for pinctrl-single.c.

Regards,

Tony
