Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E1E393D17
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 08:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhE1GbO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 02:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhE1GbO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 02:31:14 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270B2C061574;
        Thu, 27 May 2021 23:29:40 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 3577F22239;
        Fri, 28 May 2021 08:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622183376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tvDryGjFc2b0KujgcUtBe5I3gcYMEk3E/mVvu6Bxf/A=;
        b=LjKnecBf9GWDYelaXriWtkwJLN0XzciFDPhk3Py6yqDSW73C1NwfxuMyy9lCqPtU8rzdvc
        CwAxmkDMpa/6TXJzBSxvbbOaHxLaufxpeSwWkbl53Ml1b3+IJEymd8ydw8x/j/8tjYm9PO
        8YkC/Nr1g8H9TgFJZnNJGEvnDe5ntYE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 08:29:33 +0200
From:   Michael Walle <michael@walle.cc>
To:     Sander Vanheule <sander@svanheule.net>
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
Subject: Re: [PATCH v3 5/6] pinctrl: Add RTL8231 pin control and GPIO support
In-Reply-To: <185e8c61893502575c542750c8f27b09029e3078.1621809029.git.sander@svanheule.net>
References: <cover.1621809029.git.sander@svanheule.net>
 <185e8c61893502575c542750c8f27b09029e3078.1621809029.git.sander@svanheule.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <452144b056cb474321481c011ac9ccfb@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> +	gpio_cfg.reg_dat_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
> +	gpio_cfg.reg_set_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DATA0);
> +	gpio_cfg.reg_dir_in_base = GPIO_REGMAP_ADDR(RTL8231_REG_GPIO_DIR0);

Btw. you'd only need GPIO_REGMAP_ADDR(x) if x might be 0. Because you 
have
a constant != 0 there, you could save the GPIO_REGMAP_ADDR() call. You
could drop this if you like, but no need to respin the series for this.

-michael
