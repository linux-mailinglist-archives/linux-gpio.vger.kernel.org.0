Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C6D36CECA
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 00:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236805AbhD0Ww2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 18:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbhD0Ww2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 18:52:28 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664A4C061574;
        Tue, 27 Apr 2021 15:51:44 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id E4F2F2224F;
        Wed, 28 Apr 2021 00:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1619563902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VcBToRRhMOfrMNhTnUcR1FJLk+s3x8OutyOL5PWCA8Q=;
        b=bYHaWtFvv8q7Jg4ItmRmGO9MAHAILbINomZ+BM3jl0/p4kuuD5xXX74GJzvQKN45NAk7p8
        J2SWYr/Sd6Ks6dokLt5Npsv1MiUHRwjJgwW8xkhfeIGjNdxP32SHz2VWHAW6A3R6f2Ovys
        0+FVsAWkx4A53x/GOPpMxtT0WOAPv10=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 28 Apr 2021 00:51:41 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] gpio: Add support for IDT 79RC3243x GPIO
 controller
In-Reply-To: <CAHp75VdRfPPj2pu4GOBVG4+bGUsCRLXYPsFjMwFOYfUTZuvJaQ@mail.gmail.com>
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <CAHp75VdRfPPj2pu4GOBVG4+bGUsCRLXYPsFjMwFOYfUTZuvJaQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6f6bce2f070998db49acca2f6611727b@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2021-04-26 12:29, schrieb Andy Shevchenko:
> On Mon, Apr 26, 2021 at 12:55 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> 
> 2) there is gpio-regmap generic code, that may be worth
> considering.

This driver uses memory mapped registers. While that is
also possible with gpio-regmap, there is one drawback:
it assumes gpiochip->can_sleep = true for now, see [1].
Unfortunately, there is no easy way to ask the regmap
if its mmio/fastio.

-michael

[1] 
https://elixir.bootlin.com/linux/v5.12/source/drivers/gpio/gpio-regmap.c#L257
