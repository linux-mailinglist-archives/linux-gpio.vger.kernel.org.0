Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFF7386F76
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 03:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345943AbhERBmH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 21:42:07 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:44746 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238427AbhERBmH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 May 2021 21:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=YDGF/XsZHCLcmCjch90Vpft0mWvLuYXnUPfsQiN/PbY=; b=SueK3RIuW+4DzbiBy3mCGFxX9k
        tfzB2U5RBUWHDgWO7aRUP369doADWzBisAsKI5uFA7B8K/pyRBis/ZfAOAAN6vUwmnhNx6XyRocRs
        JGG7cWn1f+qWGcmtOyVSoH4tgcv02GYw6Zk/ABybsnB7eDLRppo6AorQ/yBmW8toq9+c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lioit-004fCg-NP; Tue, 18 May 2021 03:40:39 +0200
Date:   Tue, 18 May 2021 03:40:39 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] gpio: regmap: Add configurable dir/value order
Message-ID: <YKMbF3Ow8IrBBlXW@lunn.ch>
References: <cover.1621279162.git.sander@svanheule.net>
 <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 09:28:04PM +0200, Sander Vanheule wrote:
> GPIO chips may not support setting the output value when a pin is
> configured as an input

Could you describe what happens with the hardware you are playing
with. Not being able to do this means you will get glitches when
enabling the output so you should not use these GPIOs with bit banging
busses like i2c.

       Andrew
