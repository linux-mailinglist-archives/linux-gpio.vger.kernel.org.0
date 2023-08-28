Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9176C78B2E3
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Aug 2023 16:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjH1OWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Aug 2023 10:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjH1OVn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Aug 2023 10:21:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10DEC7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Aug 2023 07:21:40 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1qad7b-0002KH-9G; Mon, 28 Aug 2023 16:21:39 +0200
Message-ID: <13109ef0-9c4c-1990-4580-661f86778923@pengutronix.de>
Date:   Mon, 28 Aug 2023 16:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Getting legacy GPIO index by line name
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

as part of migrating a project off fixed GPIO numbering, I had ended up with following script:

  # USAGE: gpio_legacy_index NAME [ERROR_STRING]
  # Prints either the sysfs gpio index associated with
  # NAME on success or ${ERROR_STRING:-} on failure.
  # This can be used in scripts as an intermediate step when migrating
  # away from sysfs. It decouples use of gpio-line-names in DT from
  # using the character device
  gpio_legacy_index()
  {
	local gpiod="$(gpiofind $1)"
	if [ "$gpiod" = "" ]; then
		echo "${2:-}"
		return 1
	fi

	set $gpiod
	echo "$(($(cat /sys/bus/gpio/devices/$1/../gpio/gpio*/base) + $2))"
  }

And migration proceeded as follows:

  - add gpio-line-names to DT
  - switch hardcoded GPIOs to use gpio_legacy_index + label,
    optionally with a fallback to the old number
  - test and adapt all device trees for devices that may run the script
  - drop the fallback

Next step would've been dropping sysfs in favor of libgpiod. This is a bit more complicated,
because of the implicit assumption at places that the GPIO state stays the same requiring
some process to step up and feel responsible for it. Therefore the above script that
decouples fixed numbering from /sys/class/gpio to make migration easier. My question isn't
about sysfs, but about the numbering though[1]:


Much to my dismay, I've learnt that my script above doesn't work when the same device
registers multiple GPIO controllers. On my i.MX system with some PCA953x GPIO expanders,
it works ok, but on a STM32MP, were the pinctrl device registers all GPIO chips, the glob
will expand to more than once device.

So my question is: What better way is there to get a legacy GPIO index from within
a shell script (or an alternative way to request a sysfs GPIO by label)?

P.S: I know that most GPIO fiddling should've kernel driver consumers instead. That's under
     way too.

[1]: I appreciate links to any WIP/planned systemd-gpiod or similar patches anyway. While new
     projects should do more fine grained control of GPIOs, migration of most users will
     likely benefit benefit from a single global consumer.

Thanks,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
