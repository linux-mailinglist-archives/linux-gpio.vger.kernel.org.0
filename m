Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7CC678C1F9
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Aug 2023 12:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjH2KHa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Aug 2023 06:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233608AbjH2KH1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Aug 2023 06:07:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FBDB4
        for <linux-gpio@vger.kernel.org>; Tue, 29 Aug 2023 03:07:24 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1qavd4-0000wW-IH; Tue, 29 Aug 2023 12:07:22 +0200
Message-ID: <92a02ebc-77ff-523d-68c5-34cd2d3b4a28@pengutronix.de>
Date:   Tue, 29 Aug 2023 12:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: Getting legacy GPIO index by line name
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <13109ef0-9c4c-1990-4580-661f86778923@pengutronix.de>
 <CACRpkdYPhQq2aR+QsAX7QyGB2V63dOAcf3r-BsG3y3GQ8E4ZKw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACRpkdYPhQq2aR+QsAX7QyGB2V63dOAcf3r-BsG3y3GQ8E4ZKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

On 29.08.23 09:24, Linus Walleij wrote:
> On Mon, Aug 28, 2023 at 4:21 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> Much to my dismay, I've learnt that my script above doesn't work when the same device
>> registers multiple GPIO controllers. On my i.MX system with some PCA953x GPIO expanders,
>> it works ok, but on a STM32MP, were the pinctrl device registers all GPIO chips, the glob
>> will expand to more than once device.
>>
>> So my question is: What better way is there to get a legacy GPIO index from within
>> a shell script (or an alternative way to request a sysfs GPIO by label)?
> 
> Don't know if it answers your question, but when there are several GPIO
> chips of the same device/driver the way to determine topology ("which
> device is which") is to use the topology in sysfs, i.e. the directory path,
> where each device will have some unique bus ID (such as the USB
> instance number, the device tree address etc).

I don't want to hardcode device tree paths or I2C addresses into shell scripts.
I have added a GPIO line name in the DT and I want to use for looking up the
legacy GPIO index.

Let's take as an example, this GPIO that can be requested from an I2C expander:

  $ gpiofind HDMI_RESET
  gpiochip5 3
That's the node for the I2C expander:

  /sys/devices/platform/soc@0/30800000.bus/30a30000.i2c/i2c-1/1-003a

Looking into it for gpio*, I see:

/sys/devices/platform/soc@0/30800000.bus/30a30000.i2c/i2c-1/1-003a/gpio/gpiochip512
/sys/devices/platform/soc@0/30800000.bus/30a30000.i2c/i2c-1/1-003a/gpiochip5

gpio/gpiochip512/base is the file I need to read. gpiochip5 is the file I have.

What I do is:

  $ cat /sys/bus/gpio/devices/gpiochip5/../gpio/gpio*/base
  512

But that breaks down if gpio/ has multiple directories:

root@stm32mp157c-lxa-mc1:~ ls /sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip* -d
/sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip0    /sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip48
/sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip112  /sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip64
/sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip128  /sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip80
/sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip16   /sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip96
/sys/bus/gpio/devices/gpiochip8/../gpio/gpiochip32


>> P.S: I know that most GPIO fiddling should've kernel driver consumers instead. That's under
>>      way too.
> 
> Thanks! :)
> 
>> [1]: I appreciate links to any WIP/planned systemd-gpiod or similar patches anyway. While new
>>      projects should do more fine grained control of GPIOs, migration of most users will
>>      likely benefit benefit from a single global consumer.
> 
> I think Bartosz was working at a GPIO daemon for central management at one
> point, but in a controlled embedded system, I think other (custom) solutions for
> a central entity are possible.
> 
> Yours,
> Linus Walleij
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

