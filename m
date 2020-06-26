Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B193D20AFDC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 12:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgFZKg5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 06:36:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40738 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgFZKg5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 06:36:57 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05QAarH1101439;
        Fri, 26 Jun 2020 05:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593167813;
        bh=q9DoDRWRGSci4wX2xbYiQLL40B8/3652pTDNwd7KIE0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Swm9GtN9P1k/0h++Tyc4FbYNGXfuwI5AMNbGTJ5sWKJ/t90aYDhgu+/MBS1m5WauN
         JDARMcf7iYjAlIjI7vieHQHZkSRG4sJ+Ztpdr5ygg/SSYOjuNOXnXvB/J4Nkud0PYe
         BgvarobE75YUFCnxTxrsDdwYhM+M8wKONnr6CNuU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05QAar1m015557
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jun 2020 05:36:53 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 26
 Jun 2020 05:36:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 26 Jun 2020 05:36:53 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05QAapou032231;
        Fri, 26 Jun 2020 05:36:51 -0500
Subject: Re: AM335x: how to mux a pin for libgpiod to use?
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
References: <20200625231633.GA9012@x1>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <8d5ff801-62a1-935e-3746-e1c51817a3b6@ti.com>
Date:   Fri, 26 Jun 2020 13:36:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625231633.GA9012@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 26/06/2020 02:22, Drew Fustini wrote:
> I am trying to determine an upstream method to be able to mux an AM3358
> pin to gpio and then allow that line to be used from the gpiod userspace
> ABI.  A "pinctrl-single,pins" device tree property can easily define a
> gpio mux for a given pin.  For example, the P9_14 pin on the BeagleBone
> [0] can be set to gpio (mode 7) with this node:
> 
> P9_14_gpio_pin: pinmux_P9_14_gpio_pin {
> 	pinctrl-single,pins = <
> 	AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_INPUT_PULLDOWN, MUX_MODE7)
> 	>;
> };
> 
> GPMC_A2 is gpio1_18 per the AM3358 datasheet [1].  Normally, a node for
> a driver, like gpio-keys, would have a gpio property that cause the
> driver to claim the gpio line.  But, in that case, the line will not be
> available to be used through the gpiod userspace ABI.
> 
> If no driver claims the gpio line, then I find that the pin mux in
> "pinctrl-single,pins" does not get applied by the pinctrl-single driver.

pinmux node can have default node by itself, like

&am43xx_pinmux {
	pinctrl-names = "default";
	pinctrl-0 = <&cm_t43_led_pins>;

> 
> Thus, I can't figure out how to mux a pin to gpio and then use that gpio
> line from userspace.  The natural question is why try access a gpio line
> from userspace.  BeagleBone users do want this capability for prototyping
> and I believe that is an accepted use case based on what Linus Walleij
> wrote in "Using GPIO Lines in Linux" [2].
> 
> The kernel used in our BeagleBoard.org Debian images has an out-of-tree
> driver [3] named gpio-of-helper will claim the gpio line but a hack [4]
> allows the line to still be controlled through the gpiod userspace ABI.
> This does not seem to be an acceptable upstream solution, so I am trying
> to figure out what an upstream solution would look like.
> 
> Maybe one soltion would be to make pinctrl-single set the mux for any
> "pinctrl-single,pins" properties regardless of whether a driver
> references it or not.  Thus, the pin would be muxed to gpio by
> pinctrl-single and libgpiod would be able to use the line as it was not
> claimed by any driver.
> 
> I would very much appreciate any feedback.
> 
> Thanks,
> Drew
> 
> [0] https://git.io/JfjYH
> [1] http://www.ti.com/lit/ds/symlink/am3358.pdf
> [2] Documentation/driver-api/gpio/using-gpio.rst
> [3] https://git.io/JfjYf
> [4] https://git.io/JfjYJ
> 

-- 
Best regards,
grygorii
