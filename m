Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F311366950
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 12:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhDUKiF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 06:38:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:34973 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230000AbhDUKiE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Apr 2021 06:38:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZAEb-00038d-00; Wed, 21 Apr 2021 12:37:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9D1F2C07E0; Wed, 21 Apr 2021 12:37:20 +0200 (CEST)
Date:   Wed, 21 Apr 2021 12:37:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
Message-ID: <20210421103720.GA7390@alpha.franken.de>
References: <20210420123932.24634-1-tsbogend@alpha.franken.de>
 <CAHp75VcQ4WXm3uS2r=uDpA4+0vPWdKjev6=vV_JDxMLPzpHDRw@mail.gmail.com>
 <20210421083214.GA5694@alpha.franken.de>
 <CAHp75VeeWTdYjSgyjgzmFSpO=Zc+Q6SCS-06LVcVoghuF9vNgA@mail.gmail.com>
 <20210421091843.GA6174@alpha.franken.de>
 <CAHp75Vf921iQUR=VgMXTD-M_Ah+8UeAmKXXqgvB8WFz58pQ5Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf921iQUR=VgMXTD-M_Ah+8UeAmKXXqgvB8WFz58pQ5Qg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 12:54:53PM +0300, Andy Shevchenko wrote:
> As I promised you, I will do a deep review later on, I'm giving you
> time to find issues yourself. That's how you may actually learn the
> things. It's solely your choice to follow or not, my promise will be
> kept and you will get an answer anyway.

so let's make it a challenge ;-)

I see I could use gpiochip_get_data() in few place. 

Is there more you see ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
