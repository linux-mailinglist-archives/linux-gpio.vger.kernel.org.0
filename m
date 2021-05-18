Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D720138754B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 11:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241611AbhERJj6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 05:39:58 -0400
Received: from smtp-36-i2.italiaonline.it ([213.209.12.36]:50007 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239636AbhERJj5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 05:39:57 -0400
Received: from oxapps-10-056.iol.local ([10.101.8.66])
        by smtp-36.iol.local with ESMTPA
        id iwBSlou6lQTiRiwBSluMWg; Tue, 18 May 2021 11:38:38 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621330718; bh=RX3VysOeZND07OSeQShv9fUFNUFVbaB2i05WydIcxeo=;
        h=From;
        b=GlIteFyFXSPcd4cg7t8JjvlsMLzV9RQZgw+abU1zDCPqwxE113JpF3izpzcsyRLgq
         4GxFNEuyw7HwYNkRAyXxDOH8BHN83dmYcHi3REgQK+9sc33KjvZxkgie0ur67eBwRZ
         qd/rx5GPDyYwTN38HXyAAeJej2AxiG3UC5LpkJCF2ogZARoVojkBOhBwKhPKdDsbbh
         DuyV+297mvEiVmn6+uiDgc7Oszjymb9YaWpi19Mticj0wjQLxTea3hFVYOgfm8uDHU
         QK9uni0LdAYDI5q4UAORH5ddjjpo0ifLKWuO2xUQN4v36usBQQ7UVzml05/tX49/ZR
         92LC4N7Struog==
X-CNFS-Analysis: v=2.4 cv=TeVTCTch c=1 sm=1 tr=0 ts=60a38b1e cx=a_exe
 a=jBhkkplKmJJfLUdjeloIeA==:117 a=C-c6dMTymFoA:10 a=IkcTkHD0fZMA:10
 a=vesc6bHxzc4A:10 a=fGhLjsSNAAAA:8 a=VwQbUJbxAAAA:8 a=k0ZWKtjwVB-qIq3JdvgA:9
 a=QEXdDO2ut3YA:10 a=LYKFdyShAPKLkGq8p7WX:22 a=AjGcO6oz07-iQ99wixmX:22
Date:   Tue, 18 May 2021 11:38:38 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-ID: <960608833.161310.1621330718253@mail1.libero.it>
In-Reply-To: <20210517225713.GB2936462@x1>
References: <20210516135531.2203-1-dariobin@libero.it>
 <20210516135531.2203-2-dariobin@libero.it>
 <CAHp75Vd8875hRNk1JK6gkmfxjqxBSu4cRNE1zJt9TyEW7TvsMg@mail.gmail.com>
 <20210517225713.GB2936462@x1>
Subject: Re: [PATCH 1/2] pinctrl: core: configure pinmux from pins debug
 file
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 185.33.57.41
X-Originating-Client: open-xchange-appsuite
x-libjamsun: jugf+bqEB+2gl7i8I6Yt2LjItx5DHhHk
x-libjamv: XzFQ/hJAbmQ=
X-CMAE-Envelope: MS4xfNBgZt30XIYL3+/IEZzLHbj1AGZw0iBcP6+Gn2hxLutIfavg2IWrNnKxvNjEKa8Nj8XOQohvkFczm6ofGlSyh9jsKTqnSZuIAd+P/nI7ZSPgzpdRxUak
 r1Q9202e2Rkj/VgPkWjB+UrZgTWvclNqC9os7ZifDw8KdY48IkYJ0LlrFSYNYLU0v9kK2/piZmbEa+XkFP/IJ5A4PlpIcApAwhwFtU7okuoDwEVjpYDyWoMF
 tMRVRsxcKYue8xubNcvLLa67TnSJwLJYy1hIS1mcuShT0hpblvAylHxQBhkpA0bZ/LKhxiurDYmZQqhaDh9QKEY7JFTmBpVlyYTXc9a7Z6kkW5jgER/UnoXc
 EsdyMOaZ
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

> Il 18/05/2021 00:57 Drew Fustini <drew@beagleboard.org> ha scritto:
> 
>  
> On Mon, May 17, 2021 at 11:02:00PM +0300, Andy Shevchenko wrote:
> > On Sun, May 16, 2021 at 7:43 PM Dario Binacchi <dariobin@libero.it> wrote:
> > >
> > > The MPUs of some architectures (e.g AM335x) must be in privileged
> > > operating mode to write on the pinmux
> > 
> > pinmux is not pin configuration. You need to rethink the approach.
> > 
> > > registers. In such cases, where
> > > writes will not work from user space, now it can be done from the pins
> > > debug file if the platform driver exports the pin_dbg_set() helper among
> > > the registered operations.
> > 
> > Drew, is it similar to what you are trying to achieve?
> 
> Yes, I would say this similar to what I was trying to accomplish: being
> able to change contents of conf_<module>_<pin> register [table 9-60]
> from userspace.
> 
> However, I was specifically looking to change bits 2:0 which is mux
> mode. My motivation was to allow BeagleBone users to easily switch
> between pin functions on the expansion headers during runtime to make
> rapid prototyping with a breadboard easier (such as changing header pin
> from GPIO to SPI mode). Most of the header pins have 7 different modes.
> 
> Ultimately, the solution I settled on with feedback from this list was
> to create pinmux-select debugfs file that can activate desired fucntion:
> 6199f6becc86 ("pinctrl: pinmux: Add pinmux-select debugfs file")
> 
> Bits 6:3 are related to what this subsystem would refer to as pin conf
> such as slew, input enable and bias. Thus it might make sense to expose
> something like a select-pinconf file to activate pin conf settings from
> userspace. This would require using 'pinconf-single' compatible.
> 
> I fixed pinctrl-single bug regarding pinconf last year so it should be
> possible to use 'pinconf-single' compatible for the am33xx_pinmux node:
> f46fe79ff1b6 ("pinctrl-single: fix pcs_parse_pinconf() return value")
> 

In the kernel version 4.1.6 that I am using on my custom board, I have fixed
the commit f07512e615dd ("pinctrl/pinconfig: add debug interface"). However, 
this feature was later removed (https://lore.kernel.org/patchwork/patch/1033755/). 
Do you think it is better to bring that functionality back to life or the submitted
patch could be fine too?

Thanks and regards,
Dario

> Thanks,
> Drew
