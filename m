Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87071B7CD6
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 19:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgDXRcC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 13:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726908AbgDXRcC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 13:32:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFA2C09B047;
        Fri, 24 Apr 2020 10:32:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t14so11841695wrw.12;
        Fri, 24 Apr 2020 10:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ae2C36KNbBQoFJm+SENJYtAiUq+SZIwuCb0GpfbkICI=;
        b=FH7R9vhcb+UeUh6+IRdyYb5LSIPFWRMjcMb81HxkQfUDPhIt/yz0eqVyw0P+tdLEEP
         pjlavhyDtE+t0XH7W+vdPAS6/fqoDy6CKgX6eskkW9emdUE33Hrn6fOY9p6W0neeH++h
         7mTP3pTlX7gbLw9kAlcbVzkmJe8BhCAknXEEZHxAUdqfzfnd8FlxCF/ASLVLMCoPx44D
         Ci3ygxVQPsBw8TXEkgSI5m3ZKPVMIQR3BfJ62rUYz7LT0qbF98ki3TVrrWhyjxCckmYW
         GCxbVg+mISbBr5vAiqe14NCCZrAXW5hgVDScbpSLLu3hzw7hExeSJw+b+OKB/b7b/lFv
         ZcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ae2C36KNbBQoFJm+SENJYtAiUq+SZIwuCb0GpfbkICI=;
        b=VCx0E6/A5Z+qIvFh6xCXjb3A1CTn2TsJAQmXxEYowybBdZdYT3/st27C9Geu1Krc9u
         cZ39AgOzwL311Am9TjVvdDVHhJgQTs1EmIhrUtqzmH110UwIsyhmE3xuni8mE7be7cgL
         TaoqOWtZckYmt9YqeuBNbQe9ibwBzV1EsQeodw3pUNBqyYBoF1HkAFMs0sPqdstCI1ii
         uPRCOxhAiRV4Y/Rivr2oJNncYyaT2KJZveoR9TDqP3Cmvg0wcrgUQ5aAKsyW3bbI95Av
         iJMvrnbM7Fo3iqrjncEx1tGIuYBXd0lATxUc0oqI9soS7BekOg1Z+2mkGLwb1xEG/K5D
         tU4A==
X-Gm-Message-State: AGi0PubtYvGXPJCQwpl7dW4VO+BNSkgR/S9D+4t4W7CZ52buJ9KSQd/Z
        xYBXJe7xM2EJhqGIruZF9Bg=
X-Google-Smtp-Source: APiQypLJDqSYs5XQe9GB3uV+4jAE5ISFOez3VrCttUxWQ6bcQSLbr7Ug0dEzliuG/XooxUDIbNL9Eg==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr12570471wrp.275.1587749519640;
        Fri, 24 Apr 2020 10:31:59 -0700 (PDT)
Received: from x1 ([2001:16b8:5cf0:5701:d87f:9aa1:fac7:9493])
        by smtp.gmail.com with ESMTPSA id i13sm9128041wro.50.2020.04.24.10.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 10:31:58 -0700 (PDT)
Date:   Fri, 24 Apr 2020 19:32:42 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
Message-ID: <20200424173242.GA25624@x1>
References: <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1>
 <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
 <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1>
 <20200416163215.GH37466@atomide.com>
 <20200423131738.GA16584@x1>
 <20200423164208.GF37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423164208.GF37466@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 23, 2020 at 09:42:08AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@pdp7.com> [200423 13:17]:
> > Thanks, Tony.  I was able to apply your patch cleanly to 5.5.9 kernel
> > and boot it ok on the PocketBeagle (AM3358) which is what I'm currently
> > testing with.  I can switch to 5.7.x but I just happened to be on 5.5.x
> > because that is when bias flags were added to gpiolib uapi.
> 
> OK. BTW, with PocketBeagle and mainline v5.6 kernel, I see the micro-USB
> connection always get disconnected after few hours of use. Are you aware
> ofthat?
> 
> This is with the micro-USB configured as acm and ecm gadget via configfs.

I've been rebooting often as I build new kernels with debug output but I
will do a test with 5.6 by leaving it running overnight and see if it gets
disrupted.  I use the PocketBeagle with the TechLab PocketCape [0] for
kernel development as there is no eMMC to confuse the boot sequence and
the TechLab has a seperate USB to serial converter so I can easily see
u-boot and kernel console.

I asked Robert Nelson if he'd heard of this issue and he had not.  But he
asked how you are powering the board as any blip would probably reset the
board instantly as not enough cap's on the PocketBeagle's USB power rail.  

> > I'm a somewhat confused about the difference between the "gpio-ranges"
> > property for the gpio[0-3] nodes and the "pinctrl-single,gpio-range"
> > property for the am33xx_pinmux node.
> > 
> > For a test, I tried adding "gpio-ranges" to arch/arm/boot/dts/am33xx-l4.dtsi:
> > 
> >                         gpio0: gpio@0 {
> >                                 compatible = "ti,omap4-gpio";
> >                                 gpio-controller;
> >                                 #gpio-cells = <2>;
> >                                 interrupt-controller;
> >                                 #interrupt-cells = <2>;
> >                                 reg = <0x0 0x1000>;
> >                                 interrupts = <96>;
> >                                 gpio-ranges = <&am33xx_pinmux 0 0 1>;
> > 			}
> 
> So the gpio-ranges tells the gpio contorller what pinctrl device pin
> to use for configuring things.

Thanks, that makes sense. 

But in this case, pinctrl-single also needs to parse "gpio-ranges"
property from the gpio nodes?

> > and "pinctrl-single,gpio-range" like this:
> > 
> >                                 am33xx_pinmux: pinmux@800 {
> >                                         compatible = "pinctrl-single";
> >                                         reg = <0x800 0x238>;
> >                                         #pinctrl-cells = <1>;
> >                                         pinctrl-single,register-width = <32>;
> >                                         pinctrl-single,function-mask = <0x7f>;
> > 
> >                                         pinctrl-single,gpio-range = <&range 0 1 0>;
> > 
> >                                         range: gpio-range {
> >                                                 #pinctrl-single,gpio-range-cells = <3>;
> >                                         };
> >                                 };
> > 
> > Do you think both of those properties would be needed?
> 
> No I don't think so. The pinctrl-single could be additionally
> configured for gpio functionality too. For omaps, that gpio
> functionality would be mostly limited to output toggling using the
> internal pulls. Would be still usable on some systems though.

What woud it mean for the pinctrl-single to be configured for gpio
functionality?

Would that be needed for pinctrl_gpio_request() to succeed?

> Also, it's been a while so I don't remember where I started running
> into addressing issues though.. My guess is that you will soon hit
> them too and notice :)
> 
> But basically we want to reference the pinctrl pins based on their
> physical offset from the padconf base register, and not based on an
> invented number in the dts. Well maybe you can describe the problem
> further for us to discuss when you see it :)

Wouldn't the pinctrl pin numbering be from 0 to pcs_device.size /
pcs_device.width ?  

That index number of the pin plus pcs_device would give the physical
address of the padconf register.


Thanks,
Drew

[0] https://beagleboard.org/techlab
