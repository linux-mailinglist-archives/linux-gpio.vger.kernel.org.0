Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC68A36FE36
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 18:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhD3QCl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 12:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhD3QCl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 12:02:41 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C1AC06174A;
        Fri, 30 Apr 2021 09:01:51 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 67BF622172;
        Fri, 30 Apr 2021 18:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1619798509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T5lkASPPxhJg172ppkZBtJ4gBjbigrHyx+1Fnjt/29I=;
        b=bHJU/iKzqKLs3plvE0cJlNnSl4NNjJaHz2q+Bd1JReZdDt24CkSrk6z1pCMMyFyMnU3lp/
        eT1eJIRnhvh8HDtdaUao3P2R6X0sPmELryw0yx+zheUBkFQxX3vLYHIWKy1h+5CkFGnd3S
        DWRt6cgwfBO6L4WtqWLjQoU/B6Nph0M=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 30 Apr 2021 18:01:49 +0200
From:   Michael Walle <michael@walle.cc>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] regmap: add regmap_might_sleep()
In-Reply-To: <20210430151908.GC5981@sirena.org.uk>
References: <20210430130645.31562-1-michael@walle.cc>
 <20210430151908.GC5981@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <df27a6508e9edcd8b56058ac4834fd56@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-04-30 17:19, schrieb Mark Brown:
> On Fri, Apr 30, 2021 at 03:06:44PM +0200, Michael Walle wrote:
> 
>> Sometimes a driver needs to know if the underlying regmap could sleep.
>> For example, consider the gpio-regmap driver which needs to fill the
>> gpiochip->can_sleep property.
> 
> Whatever is creating the regmap really ought to know what device it's
> dealing with...

But creating and using the regmap are two seperate things, no? Consider
the gpio-sl28cpld. It will just use whatever regmap the parent has 
created.
How would it know what type of regmap it is?

>> It might be possible to pass this information via the
>> gpio_regmap_config, but this has the following drawbacks. First, that
>> property is redundant and both places might contratict each other. And
>> secondly, the driver might not even know the type of the regmap 
>> because
>> it just gets an opaque pointer by querying the device tree.
> 
> If it's a generic GPIO driver from a code correctness point of view 
> it's
> always got a risk of sleeping...

I can't follow you here.

-michael
