Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCE92D913A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 00:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbgLMXqf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 18:46:35 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:49315 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728889AbgLMXqe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Dec 2020 18:46:34 -0500
X-Greylist: delayed 402 seconds by postgrey-1.27 at vger.kernel.org; Sun, 13 Dec 2020 18:46:34 EST
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 884EF5802F6;
        Sun, 13 Dec 2020 18:39:05 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Sun, 13 Dec 2020 18:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=4lHOpViz9Uk605e41Hrs+5fXfKYstr/
        VFbQwhb8nXrg=; b=UbSlnCLDhANCg855IwkVcVmwuahAyDXV27svY2ihosz96I6
        gK5fkE6GfHwOqm5splI79tFW5n23NQyUGo7w+TdYNp3QoG+hrta31NSTnzo+m6EO
        NTfrQQNZQfHbrygy42U9ERoeAF1G/WX4lu9NZsLdIgDKkxcyPfddRV5TOkhYB3ms
        8UhWBmMW2i7j/hxF25ge6NN8CBPXWe3HGpR5+9kVd+42Zo0VkKAHTOzoe3VNjRKZ
        6fA+Yb9n0IdYp9VLwdKc3t2m8nL0wHBBDXT9UBFhAcHXofkGTH/vGdujuxtx8N+A
        PcJz82QE2mo1XdmxR63mV0lSq71nnzViQ9ju51A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4lHOpV
        iz9Uk605e41Hrs+5fXfKYstr/VFbQwhb8nXrg=; b=Kq28aFtvvATd6Vay+s70mN
        PGLpfc6Oq636taHkqOI8AZnP4LvAibjukn9GHz6eBEkSrEkr8bp2Lt1BU+9lyEG2
        tnw0VsuY0YShAmV27Tt8HdCK2QKArm9ziIZV+HSi61bSmsjB6PM0QNiw0otIZflq
        8YscBHKOjfFqZ2zLrvkX3CHnLFMvSyL/O0TIEBmmcyoTwEKSrKfzytGVlsHqdeZT
        I/kcNRqeKGxNroNpGca8jIDqcm8RyTab4+cRijHigtU+Alj3/R8ioav36d+fTykT
        ggByfpBhofiG8x4A84DttPURq2cVOsd1+D8ofY35y5Xq3hW8ik6b5M1qU8ZHF0gA
        ==
X-ME-Sender: <xms:GKbWXwbCHGIlrGcBhT6zGN_cUN0KbRyR_Vlerw2O3SweMTkSTxNPUw>
    <xme:GKbWX7YcDvb2VIfFhQvBhjkSl2Ne83GmwDXDQT13szmb-nfq1De9p4S7uITWCNj6-
    ty4LBfNOcttvsZ4IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekiedgudejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedv
    hefhveeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:GKbWX68V9rQifaf9__a2OrS4urq6q3qm_fUecZO5uHB0w-56aHsieg>
    <xmx:GKbWX6rheSh73kaIFem1PCH1O2U2L5m3CkS6_RNYAh2dh21BwxJ_XA>
    <xmx:GKbWX7qVn20PT3qolmXenLjjQlMMbrpjPXcopomhZ9c0yiDkMYwioQ>
    <xmx:GabWX4gKXz2uVtLJJo1eG4_fHgkdLwppxEZfQ3SiR6cw0OEa7t6cCw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 1EB68E00B2; Sun, 13 Dec 2020 18:39:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <5eec9b11-c0b7-4b77-8c03-ec2c7d52d828@www.fastmail.com>
In-Reply-To: <CAHp75VcMuHiUFgSas26DA-Bh1gGA_G5FT+9cetK=En9Q_oMZtg@mail.gmail.com>
References: <20201210065013.29348-1-troy_lee@aspeedtech.com>
 <CAHp75VcMuHiUFgSas26DA-Bh1gGA_G5FT+9cetK=En9Q_oMZtg@mail.gmail.com>
Date:   Mon, 14 Dec 2020 10:08:42 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Troy Lee" <troy_lee@aspeedtech.com>
Cc:     "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "open list" <linux-kernel@vger.kernel.org>,
        "Troy Lee" <leetroy@gmail.com>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH] gpio: aspeed: Lock GPIO pin used as IRQ
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 11 Dec 2020, at 00:44, Andy Shevchenko wrote:
> On Thu, Dec 10, 2020 at 9:36 AM Troy Lee <troy_lee@aspeedtech.com> wrote:
> >
> > GPIO pins can be used as IRQ indicators. When they do,
> > those pins should be flaged with locks to avoid kernel
> 
> flagged
> 
> > warning message.
> 
> ...
> 
> > @@ -651,6 +651,13 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
> 
> > +       rc = gpiochip_lock_as_irq(&gpio->chip, d->hwirq);
> > +       if (rc) {
> > +               dev_err(gpio->chip.parent, "unable to lock GPIO %lu as IRQ\n",
> > +                       d->hwirq);
> > +               return rc;
> > +       }
> 
> It's a copy'n'paste of generic code. Why do you need it in an unusual
> place, i.e. ->irq_set_type() IIUC?
> Can you elaborate about an issue, because this seems to be a hack?

Yep - Troy please provide more information. What was the warning you saw? How
were the GPIOs allocated on the system that triggered the warning? What did you
do to trigger the warning?

Andrew
