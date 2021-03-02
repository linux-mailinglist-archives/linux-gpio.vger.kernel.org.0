Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D4B32AD40
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384053AbhCBV3e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:29:34 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:56911 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1576788AbhCBT1O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 14:27:14 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 4D7412223E;
        Tue,  2 Mar 2021 20:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1614713078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6eEV6lINxDy3bnV6PBJ9hbLC1cOGc3ZDkPwme/58AuM=;
        b=a4yWeqGCGS93HcgESPkmrCHKOH9jPDOyb/hRL9lBOmoC65Z8awsbWfxEPXgMQ/yFN/15Q9
        sTN2iFHaLXpGtflJb6IsBZaJofSinwusHrTiICRzLOuMoisZ57EhKslpWlBzjnlqsykBMo
        3kdbVoP6IGOxWaAGryo/tYN1/bqyp5E=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 02 Mar 2021 20:24:38 +0100
From:   Michael Walle <michael@walle.cc>
To:     =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: regmap: move struct gpio_regmap definition
In-Reply-To: <4af4b519-84eb-3cb4-bb0e-9c5ac6204348@gmail.com>
References: <20210302180601.12082-1-noltari@gmail.com>
 <b4a344af55ad238a554c56e31b1b87ed@walle.cc>
 <4af4b519-84eb-3cb4-bb0e-9c5ac6204348@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8f703cfde0245a280340f2c9c8a5359a@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2021-03-02 19:14, schrieb Álvaro Fernández Rojas:
> El 02/03/2021 a las 19:10, Michael Walle escribió:
>> Am 2021-03-02 19:06, schrieb Álvaro Fernández Rojas:
>>> struct gpio_regmap should be declared in gpio/regmap.h.
>>> This way other drivers can access the structure data when registering 
>>> a gpio
>>> regmap controller.
>> 
>> The intention was really to keep this private to the gpio-regmap
>> driver. Why do you need to access to the properties?
> 
> I'm trying to add support for bcm63xx pin controllers, and Linus
> suggested that I could use gpio regmap instead of adding duplicated
> code.

nice!

> However, I need to access gpio_chip inside gpio_regmap to call
> pinctrl_add_gpio_range() with gpio_chip.base.

Can't we add something to gpio-regmap.c which will (1) either call
pinctrl_add_gpio_range(), just (2) return the struct gpio_chip* or
(3) even only gpio_chip.base?

I don't know how many sense (1) make and how reusable that code would
be for other drivers, though. Linus?

-michael
