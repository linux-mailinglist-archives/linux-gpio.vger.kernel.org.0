Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626C320A8BC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 01:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407665AbgFYXW2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 19:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406461AbgFYXW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 19:22:26 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D071BC08C5C1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2020 16:22:25 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id dp10so3686485qvb.10
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2020 16:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0guyCSZb2qP8o2IUk636PDtdRqdio/fpsuCzGrRuv5A=;
        b=tOCe+sk62aF0p4xsgsGC/plF9LnysSLandNmRsxCtGbLTuI/zXC8C9N0mY8biQUHmE
         89gxgHUvu2syJPTbCGHThYen+1QLW+YKKdjfqDpiC6Ag4jokQpslbbBwIXzy/OrzP/mZ
         95Z15cc8oBfPJdLQ5H21L/OpRs5B1otl395d/2rAjNvpy7lfBvuwFFUANYGX4H4S4qo5
         aXMqnnXCqEXln79c4jHv6lpyxSD+S4n1YWD8J9OfL2m9Jid8tVainXM0SOqCKwaYpDtR
         i1cQKR6VbTff/Z8mYw1ZIsk1Whj7V4NDnGmxJ+OWcyDvlsjDCYVQuzw2Fo6ilk+0SvDj
         8APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0guyCSZb2qP8o2IUk636PDtdRqdio/fpsuCzGrRuv5A=;
        b=OV+2eYQ8VrNvTmDX46m+km66/1DCMiSVlTmmkVojv5gY+P3dH7Hx0k01EO3CTBLL/j
         8UrR7A0yEYSWhSaHRO2pLl10SZnbRZiZDIKhnZKiH2ra8xg+TmHDyb/OXdtGKmx73wg0
         6j3LrI7XKfRmsODCjLJrv85VYysMcHpwVLBia+mQzniI31WjSs0sINriGQB1PZiRH8c3
         Jmg7Z9NGYJxpHsY6gHscI5KUUtj1H5v2/o6/XuTFKf5LPzSlXFLzwggwXHxfwR8U8T7e
         +aw80yutE78K5KQH2LHsF2+TKRXlEQ/gdV0yiIWyB05C7cNTiTztaPdfbtCbWUcBnWVZ
         FXMQ==
X-Gm-Message-State: AOAM530w/ZP2KRHodIGsXCWVcbZRdrPHCBdCMZMhmrsI8Yvg5GuHto4F
        pIW43/05AEqmXd/xrdaEqZSLEuoISeoKjg==
X-Google-Smtp-Source: ABdhPJz8qW4ecIf89PIdzWErqNXw5BTKwN3V79oBVCVrM7RMUn8ctrbuNZAsIIef70N30H1EfHjFPQ==
X-Received: by 2002:a0c:e554:: with SMTP id n20mr571227qvm.14.1593127344935;
        Thu, 25 Jun 2020 16:22:24 -0700 (PDT)
Received: from x1 (i59F7FC93.versanet.de. [89.247.252.147])
        by smtp.gmail.com with ESMTPSA id l127sm6773648qkc.117.2020.06.25.16.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 16:22:24 -0700 (PDT)
Date:   Fri, 26 Jun 2020 01:22:07 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: AM335x: how to mux a pin for libgpiod to use?
Message-ID: <20200625231633.GA9012@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am trying to determine an upstream method to be able to mux an AM3358
pin to gpio and then allow that line to be used from the gpiod userspace
ABI.  A "pinctrl-single,pins" device tree property can easily define a
gpio mux for a given pin.  For example, the P9_14 pin on the BeagleBone
[0] can be set to gpio (mode 7) with this node:

P9_14_gpio_pin: pinmux_P9_14_gpio_pin {
	pinctrl-single,pins = <
	AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_INPUT_PULLDOWN, MUX_MODE7)
	>;
};

GPMC_A2 is gpio1_18 per the AM3358 datasheet [1].  Normally, a node for
a driver, like gpio-keys, would have a gpio property that cause the
driver to claim the gpio line.  But, in that case, the line will not be
available to be used through the gpiod userspace ABI.

If no driver claims the gpio line, then I find that the pin mux in
"pinctrl-single,pins" does not get applied by the pinctrl-single driver.

Thus, I can't figure out how to mux a pin to gpio and then use that gpio
line from userspace.  The natural question is why try access a gpio line
from userspace.  BeagleBone users do want this capability for prototyping
and I believe that is an accepted use case based on what Linus Walleij
wrote in "Using GPIO Lines in Linux" [2].

The kernel used in our BeagleBoard.org Debian images has an out-of-tree
driver [3] named gpio-of-helper will claim the gpio line but a hack [4]
allows the line to still be controlled through the gpiod userspace ABI.
This does not seem to be an acceptable upstream solution, so I am trying
to figure out what an upstream solution would look like.

Maybe one soltion would be to make pinctrl-single set the mux for any
"pinctrl-single,pins" properties regardless of whether a driver
references it or not.  Thus, the pin would be muxed to gpio by
pinctrl-single and libgpiod would be able to use the line as it was not
claimed by any driver.

I would very much appreciate any feedback.

Thanks,
Drew

[0] https://git.io/JfjYH
[1] http://www.ti.com/lit/ds/symlink/am3358.pdf
[2] Documentation/driver-api/gpio/using-gpio.rst
[3] https://git.io/JfjYf
[4] https://git.io/JfjYJ
