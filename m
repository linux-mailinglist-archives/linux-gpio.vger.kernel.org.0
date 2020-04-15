Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECFC1AA956
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 16:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633929AbgDOODC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 10:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730833AbgDOOC6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:02:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FC7C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 07:02:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k1so12096060wrx.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yHM4I3UVsMWqFHkcRRV3Uj2fAsEa3/kl34z4h8ubApA=;
        b=RpxZ+mJNoRt4v67f5B/0JZX3K43ow18KduhBvQakY34FTLjgNWVRER6k5rBBYOQC93
         cxtjXNLiLCrXDYSSEwHpJoLzV8iyJcz09kzUsFr5u7GFx8K/cUOAb0Z/hXs5bGfLcb7H
         lsSaMwTuPmltVuz64iOX3QYr/eFW4JuU+6KE7SfhiVR898VaXHs3F9R+Y66QCmOp/rXb
         vD3H/mIyy6BgTgjqf+y9h71akDxFe3KsP6kzAn/CuXKJJwU3xeQzjBRnEN5Fq//IJDGB
         fQVpiy8XHr33x3KkENpGUj81Uo1B0kXiTX0KiyxdjagYTFOxpIuge3DdHC/CG/MHSzMH
         9mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=yHM4I3UVsMWqFHkcRRV3Uj2fAsEa3/kl34z4h8ubApA=;
        b=BzKIMtLKvH/GUa4+ZL59cG0ZY9vm+pYs9y1VQWS/dNXZ4cQhaj6QAFGM1P6i10/XYX
         e0ygTczfkDpo5WHB6nkTOWq8ASmNg4nTQqCHCQ+L0y6sauN7HzpHpeR55+m0Cu9ODg4v
         MbodjiE+VI3OBlhXEzV5dfo0v6HWBwv8ZTtmXw5NjlvS8P6kU+Zz8EnXjgG6XNZS2RhL
         WidFeyFMDT1xcHSuZyzD0R/ZEVLJYwBYJ+Jfp0cHRWqhgCWUoggLM6Kl0X4OkswgHmqQ
         IJL1O/aZvRw0PeVKfKGVFCwwMu9VxtUaGoA0bOGQA6YkpsZhFiHwucWOVcTpLtvKdzt7
         EiaQ==
X-Gm-Message-State: AGi0PubwWa/STH+rcyOr0CpYVakV3d0p33MRx4Ra8R/9jGn1evN5NUxl
        K4h8KhxEGZEJ5EVf0M3mU0E=
X-Google-Smtp-Source: APiQypK2mXgVCTr2Z7J7COa+ELVDDlOd2vmzhQ9xkfjKZJqiK5EbDu1CLJmuSI5kPoFIAUTyEqnm2g==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr1808621wrv.3.1586959376093;
        Wed, 15 Apr 2020 07:02:56 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id u12sm2324622wmu.25.2020.04.15.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 07:02:54 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:03:35 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Kent Gibson <warthog618@gmail.com>, matheus@castello.eng.br
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, bamv2005@gmail.com,
        thomas.petazzoni@bootlin.com
Subject: boards to test gpio line bias flags?
Message-ID: <20200415140335.GA24288@x1>
References: <20191105020429.18942-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105020429.18942-1-warthog618@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 10:04:22AM +0800, Kent Gibson wrote:
> This series adds gross control o:f pull-up/pull-down to the GPIO uAPI.
> Gross control means enabling and disabling of bias functionality,
> not finer grained control such as setting biasing impedances.
> 
> The support allows both input and output lines to have any one of the
> following biases applied as part of the line handle or event request:
>  0. As Is - bias is left alone.  This is the default for ABI compatibility.
>  1. Bias Disable - bias is explicitly disabled.
>  2. Pull Down - pull-down bias is enabled.
>  3. Pull Up - pull-up bias is enabled.
> 
> The biases are set via three flags, BIAS_DISABLE, BIAS_PULL_DOWN
> and BIAS_PULL_UP.  These map directly to the similarly named 
> pinctrl pin_config_param flags.
> As Is corresponds to none of the flags being set.

I had been looking at how to make these flags work on the BeagleBone
(TI Sitara AM3358 SoC) which uses the  gpio-omap driver and
pinctrl-single driver.  Howeverm, it seems that it is not posssible as
the BeagleBone device tree uses compatible of "pinctrl-single" instead
of "padconf-single", and thus pcs_pinconf_set() is not called [0].

The bias flags already work on the Raspberry Pi as the Broadcom SoC uses
pinctrl-bcm2835.c which uses gpiochip_generic_config() from gpiolib.c 
for .set_config in bcm2835_gpio_chip.  This eventually calls
bcm2835_pinconf_set() which handles the PIN_CONFIG_BIAS_* flags.

Thus, I started thinking about what other boards I could test the bias
flags with, and potentially, find drivers that I could add or fix
support.

The PIN_CONFIG_BIAS_* flags exist in these GPIO drivers:

gpio-aspeed.c:
aspeed seems to be used in server BMC so not hardware that I have
access to or could easily acquire.

gpio-mockup.c:
mockup driver that has already been tested and works

gpio-pca953x.c:
an external I2C GPIO expander, easy for me to acquire, it appears
that gpio uapi bias flags should work, but I could test and verify

gpiolib.c:
like the bmc2835 in the raspberry pi, it seems some drivers in pinctrl
directory will define a gpiochip and use gpiochip_generic_config().

Here is a list of other pinctrl drivers which use gpiochip_generic_config:

drivers/pinctrl/pinctrl-stmfx.c and drivers/pinctrl/pinctrl-sx150x.c:
These are both GPIO expanders which I could probably purchase

drivers/pinctrl/intel/pinctrl-intel.c:
Maybe this means that I could try this on x86 boards?

drivers/pinctrl/sunxi/pinctrl-sunxi.c
Maybe the Allwinner boards might work too?


Any other hardware that I should take a look at testing?


Thanks,
Drew


[0] https://lore.kernel.org/linux-gpio/20200413123921.GA32586@x1/T/#t
