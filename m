Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A256138DED1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 03:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhEXBMb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 May 2021 21:12:31 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:53486 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232067AbhEXBMa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 23 May 2021 21:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=Mhhm84mF+nGequsSzTA6OZ1mA9wHeyeL0AXVqLdZDQs=; b=fylOy9waMDK2J6c3KiGXVXOj0a
        alkJvcMrMth057IyuwF4BqDH41ifTuIgj0vMgT22XbWvPiAOkfTrNo1ckGlIpPCGnqMshtaRDkwcv
        SnWvCCSYXZtlm0Amjv9bnbUVH8jeqvwQLAMrQ8g98yxUHLYxAbqVkOHaU3iyqKe3TVhQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lkz7L-005tud-8M; Mon, 24 May 2021 03:10:51 +0200
Date:   Mon, 24 May 2021 03:10:51 +0200
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
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
Message-ID: <YKr9G3EfrM34gCsL@lunn.ch>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1621809029.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1621809029.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Changes since v2:
>   - MDIO regmap support was merged, so patch is dropped here

Do you have any idea how this will get merged. It sounds like one of
the Maintainers will need a stable branch of regmap.

>   - Introduce GPIO regmap quirks to set output direction first

I thought you had determined it was possible to set output before
direction?

	Andrew
