Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28996215E24
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 20:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729716AbgGFSTi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 14:19:38 -0400
Received: from smtpcmd10101.aruba.it ([62.149.156.101]:47810 "EHLO
        smtpcmd10101.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbgGFSTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 14:19:37 -0400
Received: from [192.168.1.129] ([93.146.66.165])
        by smtpcmd10.ad.aruba.it with bizsmtp
        id zuKb2200K3Zw7e501uKbKJ; Mon, 06 Jul 2020 20:19:35 +0200
Subject: Re: [RFC] GPIO User I/O
To:     Drew Fustini <drew@beagleboard.org>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <20200706133519.GA1046717@x1>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <68223660-52db-d22c-8e21-475ceefa9ad6@enneenne.com>
Date:   Mon, 6 Jul 2020 20:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200706133519.GA1046717@x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1594059575; bh=FMmjujyBp7wig/QMipAVMtJuwLqybZNsK2a54o83Ado=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=a/K+HQ3ZNvBk7RiyAioHxvSnrAEXOyrrPFeuJk0nmF3jshfONAQnHidLKDL9P57IU
         L4+KObStQqF7tDOyxiCXARlTCs2g7CAooSgr6KF6+55Gk0cj+Q8P0+4NG9MqYwN6Sx
         sk2DqXw3whuRs9QoR0V/wUUkzqYSGS63YRAvRQbnYtngEdGx5JedEY/cx5vrv8xLv4
         ofJcrU49WgbrsMWRZkbPB3aT1+zhzOjm+/4LXqYaPPVC6nYGFEgvJ127P5pM02dziS
         4VKH33L70iII45UvfDE4HM2Z1OsyYP886LiMXSQoqAcdngzba05RlD2EquRhZVcgpN
         kwSLsew0G7PrQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/07/2020 15:35, Drew Fustini wrote:
> This is similar to an out-of-tree driver we use in the kernel build for
> our BeagleBoard.org Debian images called gpio-of-helper [0].
> 
> It is a DT based driver created by Pantelis Antoniou back in 2013.  It
> allows our downstream BeagleBoard.org dts files to describe the gpio
> lines that will be controlled from userspace.  We failed to get the
> driver upstream back then, and it has remained out-of-tree since.

I see.

However my support is not designed for a general purpose board where GPIOs usage
may vary, but for final products where GPIO lines are well-defined (even if the
patch can be easily modified in order to support unregister() operations).

> Currently, I am trying to shrink our out-of-tree patches [1] so we can
> eventually get our BeagleBoard.org kernel builds on to mainline. Thus
> coming up with a mainline solution for this is important to me. I was to
> chat virtually last week with Bart [2], Geert and Linus and it does seem
> like the new GPIO aggregator [3] could address this use case. I need to
> do some experimentation to understand how that would work.

As already stated in my last e-mail to Linus GPIO aggregator doesn't allow board
manufacturer to define meaningful GPIO lines within the device tree without
additional patches or by forcing users to define them by additional commands
after boot.

Why a LED should be easily and completely managed within the device-tree and a
relè, a photo-diode or any other input/output digital line should not? :-/

The driver by Pantelis Antoniou and my support does this jobs without interfere
with other GPIOs mechanisms.

I think the maintainers should seriously consider it.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
