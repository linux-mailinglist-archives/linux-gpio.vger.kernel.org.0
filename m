Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E7A2D068E
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 19:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgLFSuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 13:50:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:60150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726440AbgLFSuu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 6 Dec 2020 13:50:50 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D756722D01;
        Sun,  6 Dec 2020 18:50:09 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1klz6l-00Ga5v-Hg; Sun, 06 Dec 2020 18:50:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 06 Dec 2020 18:50:07 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        luojiaxing <luojiaxing@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
In-Reply-To: <CACRpkdawv2NUahn2gniH=29T6qqqFYSa53giC01PS1wq91+Ksg@mail.gmail.com>
References: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
 <20201130112250.GK4077@smile.fi.intel.com>
 <63f7dcc4-a924-515a-2fea-31ec80f3353e@huawei.com>
 <20201205221522.ifjravnir5bzmjff@mobilestation>
 <CACRpkdawv2NUahn2gniH=29T6qqqFYSa53giC01PS1wq91+Ksg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <a18dfb3ef4dd80dddbd038507d9b8b2f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, fancer.lancer@gmail.com, luojiaxing@huawei.com, tglx@linutronix.de, andy.shevchenko@gmail.com, bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-12-06 15:02, Linus Walleij wrote:
> On Sat, Dec 5, 2020 at 11:15 PM Serge Semin <fancer.lancer@gmail.com> 
> wrote:
> 
>> Hmm, that sounds like a problem, but the explanation is a bit unclear
>> to me. AFAICS you are saying that the only callbacks which are
>> called during the IRQ request/release are the irq_enable(), right? If
>> so then the only reason why we haven't got a problem reported due to
>> that so far is that the IRQs actually unmasked by default.
> 
> What we usually do in cases like that (and I have discussed this
> with tglx in the past I think) is to simply mask off all IRQs in 
> probe().
> Then they will be unmasked when requested by drivers.
> 
> See e.g. gpio-pl061 that has this line in probe():
> writeb(0, pl061->base + GPIOIE); /* disable irqs */

This should definitely be the default behaviour. The code code
expects all interrupt sources to be masked until actively enabled,
usually with the IRQ being requested.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
