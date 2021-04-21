Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47699366708
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 10:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhDUIdM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 04:33:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:34771 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235179AbhDUIdM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Apr 2021 04:33:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZ8Hh-0002Aq-00; Wed, 21 Apr 2021 10:32:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C9008C07C6; Wed, 21 Apr 2021 10:32:14 +0200 (CEST)
Date:   Wed, 21 Apr 2021 10:32:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
Message-ID: <20210421083214.GA5694@alpha.franken.de>
References: <20210420123932.24634-1-tsbogend@alpha.franken.de>
 <CAHp75VcQ4WXm3uS2r=uDpA4+0vPWdKjev6=vV_JDxMLPzpHDRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcQ4WXm3uS2r=uDpA4+0vPWdKjev6=vV_JDxMLPzpHDRw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 11:09:51AM +0300, Andy Shevchenko wrote:
> On Tuesday, April 20, 2021, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> wrote:
> 
> > IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> > to 32 gpios. All gpios could be used as interrupt source.
> 
> 
> 
> I would recommend looking for latest new drivers in GPIO subsystem to see
> how you may improve yours.

Could give me a better pointer to it ? I looked at a lot of gpio driver
and took what fitted best.

> Here just one question, why it can not be a module

that's probably doable...

> why arch_initcall() is used

without that interrupts weren't avaiable early enough. 

> and why you put a dead code into it (see the first part of the
> question)?

hmm, pointer please ?

> I will perform a deep review later on.

thank you.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
