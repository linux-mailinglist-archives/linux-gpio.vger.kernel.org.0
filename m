Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C4E32C7EC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355720AbhCDAdK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384311AbhCCPmG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 10:42:06 -0500
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F98DC061761;
        Wed,  3 Mar 2021 07:39:12 -0800 (PST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 48FAE2223A;
        Wed,  3 Mar 2021 16:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614785948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3tg9/2YH88B53ii3tFImN3rADlNo36/ozFOz8uqRXwI=;
        b=Fn6DrK1xAp2SF5XU/kuySfh9K2VMKZXKhSDOv1F+37YhnZ3Q4BzysP3D38yIgLC8O2K8m3
        bHxFXdHSGVfPO7ApAhPQrexFuRrXwutwTEQl5G1iBDjbfVPmvrHo5UxOydWJsInUEJfixt
        sAz9wGwBZlgYQ9jvr8N+JDSoLyhDt6A=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 03 Mar 2021 16:39:08 +0100
From:   Michael Walle <michael@walle.cc>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 01/14] gpio: regmap: set gpio_chip of_node
In-Reply-To: <CACRpkdb56dB+f89Neuix=KKtAsYSTHKuCifhmmzN7jy2LuUbdQ@mail.gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
 <20210303142310.6371-2-noltari@gmail.com>
 <CACRpkdb56dB+f89Neuix=KKtAsYSTHKuCifhmmzN7jy2LuUbdQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ab50e6dddcbf418a41d39cc09356834a@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-03 16:27, schrieb Linus Walleij:
> On Wed, Mar 3, 2021 at 3:23 PM Álvaro Fernández Rojas 
> <noltari@gmail.com> wrote:
> 
>> This is needed for properly registering gpio regmap as a child of a 
>> regmap
>> pin controller.
>> 
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>> ---
>>  v3: introduce patch needed for properly parsing gpio-ranges.
> 
> Oops a little bug. I suggest that I merge this into the pinctrl tree
> together with the rest of the patches when we are done with review.

Ha, I've just debugged this because it puzzled me why it was working
for me.

I was about to suggesting using the following instead:
chip->of_node = config->of_node ?: dev_of_node(config->parent);

It turns out this is already done in of_gpio_dev_init():
https://elixir.bootlin.com/linux/v5.12-rc1/source/drivers/gpio/gpiolib-of.c#L1043

So config->of_node is still optional. But I'm not sure if we
should add the line above for clarity in gpio-regmap.c.

-michael
