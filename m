Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B662F0E72
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 09:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbhAKIqS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 11 Jan 2021 03:46:18 -0500
Received: from aposti.net ([89.234.176.197]:60172 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727240AbhAKIqS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Jan 2021 03:46:18 -0500
Date:   Mon, 11 Jan 2021 08:45:23 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/2] kconfig.h: Add IF_ENABLED() macro
To:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     od@zcrc.me, GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-Id: <NNHRMQ.2ALS3SQBYT352@crapouillou.net>
In-Reply-To: <CACRpkdYautJ+aNrK+gqmAUzVCOgQH-WuXqEOn4FyW1hfeWa2zg@mail.gmail.com>
References: <20201213235447.138271-1-paul@crapouillou.net>
        <CACRpkdYautJ+aNrK+gqmAUzVCOgQH-WuXqEOn4FyW1hfeWa2zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Le lun. 14 déc. 2020 à 10:05, Linus Walleij 
<linus.walleij@linaro.org> a écrit :
> On Mon, Dec 14, 2020 at 12:54 AM Paul Cercueil <paul@crapouillou.net> 
> wrote:
> 
>>  IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set 
>> to 'y'
>>  or 'm', NULL otherwise. The (ptr) argument must be a pointer.
>> 
>>  The IF_ENABLED() macro can be very useful to help GCC drop dead 
>> code.
> 
> I can apply this with the other patch to the pinctrl subsystem if 
> Arnd or
> someone else who is good at KConfig provides an ACK.

Arnd? Any feedback?

Cheers,
-Paul


