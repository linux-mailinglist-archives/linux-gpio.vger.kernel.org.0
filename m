Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFD567C29A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 02:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjAZB52 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 20:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjAZB51 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 20:57:27 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED965D10C
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 17:57:26 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id ay1so166703pfb.7
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 17:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxPlX7ridTSjr3xTSBv816b8kxXLWhsYxn3egdiFlAU=;
        b=T5iuMU+0gwQSQKg/TuZ+C1Ml1zK5/9liibNu19Wyg5R/AJyC8X3zOFnVis2oZROFpS
         V453HintodcBn1N3bC5zeNUaNsRzjUSpvKW3u+CobfiAvPk1gryGtXzINcFc1cQHCkld
         LycniwSpkuD7D5vQNxTOnvgJdPUAnHhbEBPzMgPvbuksClNqTGHHZRGbDOFWKHduNVFW
         AQj2Apxzwd1eagM9b0gPC0ux/wrZC628aF4UWDFO8CENHwUQ01DT1cOHNyVm2m0k9Yzq
         GgbQR3uY8upDkvWozqfB0M9bqwdRiavMTdezMqFjhnw5S+mdOQRu31Q1C045T8lKeR55
         oA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxPlX7ridTSjr3xTSBv816b8kxXLWhsYxn3egdiFlAU=;
        b=hqdEwlhxcK1j4uUXpGhazmRaVomNmnB8T9PIEVyz97mFzcI+pPARcdAvj29LlgnUvo
         Av/m2YyAvdggcqy7Wtd6csQpwtgNUxrOAHAEbTNSO91lKYAkr3dF90aB8a2TcOM7tEMj
         lfaYle/vwu3UYnIvB1Jd06UvejvnGtlc4ZDhMF6zqdl8ihsYh5XZvTnATiYuiLlu6rev
         skSgxij4ENroyPmvb9CxCwnfiTCRujEXuiqvZTuI4sv3xvyTMA7PBtWGmHAxxinXual3
         1FakQbjsPSTu7MAcC913ep9k0lKIdpKBHIqltGDwobujH1roZ6DnE3QYKc4uPvJjnwm+
         Xhaw==
X-Gm-Message-State: AFqh2kpm+knA5jAcdH74WPRwUFtSc2XGs/f59XbVU1L7w1aaCDexBPGm
        K4eFIBv6j+Tywoiyk9E0bvI=
X-Google-Smtp-Source: AMrXdXvLSTNEt5a5yyLTxuC447thfZ+Xu2PoOoGxhAUIG5SCnVN88AnYrqCnB0xVwa8hWqbCm5cxEA==
X-Received: by 2002:a62:ea0e:0:b0:577:d10d:6eab with SMTP id t14-20020a62ea0e000000b00577d10d6eabmr34545089pfh.21.1674698245427;
        Wed, 25 Jan 2023 17:57:25 -0800 (PST)
Received: from sol (220-245-168-240.tpgi.com.au. [220.245.168.240])
        by smtp.gmail.com with ESMTPSA id f64-20020a623843000000b0058bc37f3d1csm4322251pfa.44.2023.01.25.17.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 17:57:24 -0800 (PST)
Date:   Thu, 26 Jan 2023 09:57:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: GPIO static allocation warning with v6.2-rcX
Message-ID: <Y9Hd/mfLkGME6Ed8@sol>
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125093548.GB23347@pengutronix.de>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 25, 2023 at 10:35:48AM +0100, Sascha Hauer wrote:
> On Mon, Jan 23, 2023 at 03:55:18PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Jan 20, 2023 at 11:46 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >
> > > Hi all,
> > >
> > > I stumbled over the following warning while testing the new v6.2-rc4 on
> > > a imx8mm-evk:
> > >
> > > [    1.507131] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > [    1.517786] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > [    1.528273] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > [    1.538739] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > > [    1.549195] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > >
> > > The warning was introduced by commit [1] but at least the following
> > > drivers are parsing the alias for a gpiochip to use it as base:
> > >  - drivers/gpio/gpio-mxs.c
> > >  - drivers/gpio/gpio-mxc.c
> > >  - drivers/gpio/gpio-clps711x.c
> > >  - drivers/gpio/gpio-mvebu.c
> > >  - drivers/gpio/gpio-rockchip.c
> > >  - drivers/gpio/gpio-vf610.c
> > >  - drivers/gpio/gpio-zynq.c
> > >
> > > According commit [2] it seems valid and correct to me to use the alias
> > > and the user-space may rely on this.
> > >
> > > Now my question is how we can get rid of the warning without breaking
> > > the user-space?
> > >
> > > [1] 502df79b86056 gpiolib: Warn on drivers still using static gpiobase allocation
> > > [2] 7e6086d9e54a1 gpio/mxc: specify gpio base for device tree probe
> > >
> > 
> > The warning is there to remind you that static GPIO base numbers have
> > been long deprecated and only user-space programs using sysfs will
> > break if you remove it, everyone else - including user-space programs
> > using libgpiod or scripts using gpio-tools that are part of the
> > project - will be fine.
> > 
> > Any chance you can port your user-space programs to libgpiod?
> > 
> > The warning doesn't break compatibility so I'm not eager to remove it.
> 
> Well it's a warning and sooner or later somebody will come along and
> removes this warning by removing the GPIO controller bases from the dts
> files which in turn will then break things at least for us, but I
> suspect for many other people as well.
> 
> You are trying to remove the GPIO sysfs API for many years now without
> success so far, and I doubt that you will succeed in future because the
> Kernel comes with the promise that userspace won't be broke.
> 
> I can understand that you want to get rid of the global GPIO number
> space. Currently you can't, because there are still hundreds of
> in-Kernel users of the legacy API. When all these are fixed and the GPIO
> sysfs API is the only remaining user of the global GPIO number space
> then we could move the numbering to gpiolib-sysfs.c and no longer bother
> the core with it. At this point the sysfs API would be a GPIO consumer
> just like every other consumer and we could leave it there until only
> the oldest of us remember what it's good for.
> 
> Instead of trying to remove the sysfs API I really think it would be a
> better strategy to push it into a corner where it can stay without
> being a maintenance burden.
> 
> Regarding the usage of libgpiod for our projects: I think one of the
> major shortcomings is that the character interface doesn't allow to
> just set a GPIO to a value and leave it in that state without having
> to keep the process alive. While you may argument that it's cleaner
> to go to a "safe state" (or "idle state") when the process finishes
> that's simply not the way how many projects out there work.

You can argue that, but that is not what cdev and the gpiolib subsystem 
do.

When a line is released cdev and the gpiolib subsystem do not explicitly
change anything, so the line may well remain in the state it was set.
The state becomes "undefined" from the user perspective, as the line is
now accessible to other processes and as the kernel MAY reset it.
The latter is the case where the line being released is the last
requested line on a gpiochip, in which case the gpiolib subsystem 
will release the chip and the chip MAY get reset back to defaults
(depends on the gpiochip).

Given that, you can get sysfs-like behaviour as long as you hold at least
one line on a GPIO chip, and that could be a line hogged from DT or an
other internal kernel user.

e.g. I have a RPi4 which has the STATUS_LED_G_CLK line already held so I
can drive the GPIO5 line, which is on the same chip, just like I could
with sysfs:

$ gpioinfo STATUS_LED_G_CLK GPIO5
gpiochip0 5	"GPIO5"         	input
gpiochip0 42	"STATUS_LED_G_CLK"	output consumer="led0"

# set GPIO5 high
$ gpioset -t0 GPIO5=1

# GPIO5 has been released but is still an output and active:
$ gpioinfo GPIO5
gpiochip0 5	"GPIO5"         	output
$ gpioget --as-is GPIO5
"GPIO5"=active

# set GPIO5 low
$ gpioset -t0 GPIO5=0
$ gpioget --as-is GPIO5
"GPIO5"=inactive

# set GPIO5 high
$ gpioset -t0 GPIO5=1
$ gpioget --as-is GPIO5
"GPIO5"=active
...

That is using the tools from libgpiod v2, btw, but just for the
gpioget "--as-is" option to prevent gpioget switching the line to an
input. The same mechanic works with libgpiod v1.

Would that work for your cases?

Cheers,
Kent.

> Virtually
> everyone has scripts poking GPIO states into sysfs and currently you
> can't do this with the character device API. If you want to get rid
> of the sysfs API then you should work on making the character device
> API more attractive for users and I think this is one point could use
> some improvement.
> 
> Sascha
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
