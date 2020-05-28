Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D391E5B20
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 10:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgE1Iq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 04:46:59 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:51419 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgE1Iq6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 04:46:58 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 5F22F23E44;
        Thu, 28 May 2020 10:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590655616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IK4vU5+OQ5YrFbM2Kz/+PVKRgvmjl3u1QdENmhkQt68=;
        b=Hs2fkRNkUbzgXfwyZmr7p3oMzYsTzGg8D81nkF4VYPVdsTxebYmjV6rYEkji6LS12LG/G8
        tRM6Nmg8fC1kcsy4/OMqFV4mgxpySPVY43IltKO/chUviAYQMW2b63fe2g2cHuSgT1mENd
        cnNhdTYHVNZsY504djT2LhiVFcaUieg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 28 May 2020 10:46:56 +0200
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/2] gpio: add a reusable generic gpio_chip using
 regmap
In-Reply-To: <CAHp75Vf7XxNFJMSOr6SzKHm0tssEVKzokaEeZ8nts5xQ2hQLNA@mail.gmail.com>
References: <20200525160741.21729-1-michael@walle.cc>
 <20200525160741.21729-3-michael@walle.cc>
 <d245b4f5-065f-4c82-ef8e-d906b363fdcf@linux.intel.com>
 <6d08ebbfbc9f656cb5650ede988cf36d@walle.cc>
 <fe44039a-4fa9-dab3-cd14-04967b729158@linux.intel.com>
 <143ec2f44c881706db9744465328329f@walle.cc>
 <CAHp75Vf7XxNFJMSOr6SzKHm0tssEVKzokaEeZ8nts5xQ2hQLNA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <0d4bce3de91df9526ada76f4f2347d25@walle.cc>
X-Sender: michael@walle.cc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2020-05-28 10:37, schrieb Andy Shevchenko:
> On Thu, May 28, 2020 at 7:11 AM Michael Walle <michael@walle.cc> wrote:
>> Am 2020-05-28 02:31, schrieb Pierre-Louis Bossart:
> 
> 
>> I've send a v5 with that fix and your names property.
> 
> Did you already?

Yes, I forgot to add you :(

> Because I have a question why we have gpio-regmap.h instead of
> gpio/regmap.h ?

No particular reason, I thought gpio/ was for low level gpio stuff (like
the consumer.h, driver.h etc) or lets say - more integrated stuff.

I don't have a strong opinion. I can send a v6 with that change, on
short notice if the maintainers prefer that location.

-michael
