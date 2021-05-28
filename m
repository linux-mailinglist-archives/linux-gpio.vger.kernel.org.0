Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42AA1393D44
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 08:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhE1GpW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 02:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbhE1GoZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 02:44:25 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99477C061761
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 23:42:37 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:e61:1a84:3c9e:f60d] (unknown [IPv6:2a02:a03f:eafb:ee01:e61:1a84:3c9e:f60d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id CACAD204D5E;
        Fri, 28 May 2021 08:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622184155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KKIS4ZUN9i6MWB+AhutHSvQiNOpqKIa8lJpcUHwOWtQ=;
        b=zgjDpiCcjVro2xYk7FZix+R1YlO+sjJNh/WTxPD8/HsQNUYT3nVldBxF/Bod/ftukDfYAg
        bRDeToIy+W2AytimN2V5Y1zsRRNqAUk2vmZqiaQxCanwJa80ijYiPdgs4H+IGj8JwZQgYo
        ILkJb/EwhceHEfJisL2uViyRYrI7GjzpDLO5rCsaWGqHoVe+mnl4yUIkT+bRWrA0WvSrux
        PWPaS9ebp/y/zRq2WFxQxlEzszj/sxphpGYafrCj89if34gZ6B+gBV8ONJsvzlKRZneSw1
        C/5hq2lrk+lywmzhs7YYqqVq4R6Rt6v+aTLtzaYvzUhe0SbuNUJwid5sae61mg==
Message-ID: <b7660b9deff694f7a00431b7e4706635fd4aa2be.camel@svanheule.net>
Subject: Re: [PATCH v3 5/6] pinctrl: Add RTL8231 pin control and GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     Michael Walle <michael@walle.cc>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Date:   Fri, 28 May 2021 08:42:32 +0200
In-Reply-To: <452144b056cb474321481c011ac9ccfb@walle.cc>
References: <cover.1621809029.git.sander@svanheule.net>
         <185e8c61893502575c542750c8f27b09029e3078.1621809029.git.sander@svanheule.net>
         <452144b056cb474321481c011ac9ccfb@walle.cc>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

On Fri, 2021-05-28 at 08:29 +0200, Michael Walle wrote:
> > +       gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
> > +       gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
> > +       gpio_cfg.reg_dir_in_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DIR0);
> 
> Btw. you'd only need GPIO_REGMAP_ADDR(x) if x might be 0. Because you 
> have
> a constant != 0 there, you could save the GPIO_REGMAP_ADDR() call. You
> could drop this if you like, but no need to respin the series for this.

I will need to respin this series anyway, so I can drop the GPIO_REGMAP_ADDR()
calls. I was aware they are no-ops in this case, as register address 0 is not
used for the GPIO functions, so mainly included them as a form of documentation.

Best,
Sander


