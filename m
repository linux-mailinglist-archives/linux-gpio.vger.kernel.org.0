Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54231468E50
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 01:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241568AbhLFAfk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Dec 2021 19:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhLFAfk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Dec 2021 19:35:40 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743F9C061751
        for <linux-gpio@vger.kernel.org>; Sun,  5 Dec 2021 16:32:12 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso11519776otj.11
        for <linux-gpio@vger.kernel.org>; Sun, 05 Dec 2021 16:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NvHVC3feQ9FsVqSdfa3CBVko1JP2mWKHqgbb8nC83xE=;
        b=SDmGVGKNC56bqqz7lbtaEgfP30S3O8x9gLsZgpEbX3BWA9xg8YcqWt+x+0rOSdJOYw
         NAyZCoATHfEghgH6AqdMqXMfa88ugDI0uBvTDFAzY5ZSoz9noTg/Bn1MDYyAHSS5FCAx
         uzBT+xiPjusSR0ZS9B32bVGgGOWuIILihA5O55EwKjCC7sOAEMKyW7UIcLXEalhxJwET
         Koh7aVSzWAQi/pYetwdaK70WieCvEuV0EN7fsoy0lbUV9qb9qSS2pbgrvTooLls9zycy
         DhSEppbwofe++tnDnXAjB7gNPU9EqUPYsPJOhLWWro3u3Z4NDWsD080+2YWbKB63cCKn
         /93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NvHVC3feQ9FsVqSdfa3CBVko1JP2mWKHqgbb8nC83xE=;
        b=522Bf2S11KFGswFfSjVvQiFHby+lQYL8B9ZHmmOTto0mGbO3oUQV+QcLf1+9VdSwvM
         KTywOclyPwzhSgJ78GOtSCDG0oWezwg82glBSbza+LiDNZvx7CBGCtW2eUD2I3A30lKL
         YMxpCfVPBgKwfLp04VVuCPAvxY9IjrmTEf/7/xl17AXICzm6lCPdrM8EJedg/sgpkgMQ
         FvTA73lml/PpUCGOH5NoJDIqZWCuZmPIA9qBzzEdKKcSgOHAEQKsHEMTqzL1CukpozE9
         nqMqOCS2ch9pdVKjjq/RMFBtZRGZR9o2pmEnFHvlOaAPZC7PXQ1ZspMiVHcNAro4otsO
         cleQ==
X-Gm-Message-State: AOAM531OsMz5B+mwKGrl3/dFR6E2JD1E1lFFgAMCJ+ZePIbhHXqJtNPH
        LYts6ErlPMD0K3VfVsLvufJJIS1I/YO/d0HyEfhVfO+1zhEnAw==
X-Google-Smtp-Source: ABdhPJz1MJ54++JvDX35WnEeQx0k0wfp+VMkNXfoO/+Q7YFjdHIeOYGELLYiC/yo3vZMdbn8/PzshHM9YlXyS74QOkg=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr26666966otj.35.1638750731769;
 Sun, 05 Dec 2021 16:32:11 -0800 (PST)
MIME-Version: 1.0
References: <a06e7c55-f25d-8339-faea-9be6d31d1c87@xs4all.nl>
 <CACRpkdYrZ2pyj+_yS6gn1n-TCQtHMqwrg+4eJRmiKGGyDNPnbQ@mail.gmail.com>
 <1ad23a2a-bd91-526c-ab75-25543c1f4dd5@xs4all.nl> <fabc35fb-f0ea-d4a5-e615-66a185e7b7c9@xs4all.nl>
In-Reply-To: <fabc35fb-f0ea-d4a5-e615-66a185e7b7c9@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Dec 2021 01:32:00 +0100
Message-ID: <CACRpkda0iEpPOv+D9CeE_jjEubMYY6+toLhuYpZAS_6Jxq0ntg@mail.gmail.com>
Subject: Re: gpiod_set_value(): BUG: sleeping function called from invalid context
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Petko Manolov <petko.manolov@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 5, 2021 at 12:59 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Are pinctrl drivers supposed to call pinctrl_gpio_direction_output() from
> the direction_output() op? Isn't that perhaps the bug?

Yes they are. But they might not have to.

Here is how pinctrl_gpio_direction_input() and pinctrl_gpio_direction_output()
work:

pinctrl_gpio_direction_output()
   pinctrl_gpio_direction(OUTPUT)
       pinctrl_get_device_gpio_range() <- find the range
       gpio_to_pin() <- Look up corresponding pin on the pin controller
       pinmux_gpio_direction() <- shortcut to set the pin into right direction
            ops->gpio_set_direction() <- Call the pin mux driver

So GPIO drivers that are backed by pin controllers cross call to set
up the pin controller properties of the pin into the right mode.
So it becomes a GPIO line with the expected direction from the pin
control side of things.

This is especially necessary if the GPIO driver and pin control (mux)
driver are two different drivers that communicate with each other like
this.

This happens for example with drivers/gpio/gpio-pl061.c that is
used with a few different pin controllers, so we don't know which
pin controller is providing the pin control back-end.

For combined GPIO and pin controllers (all of it in the same file)
it is of course possible to shortcut this cumbersome path and just
call whatever mux function we need instead of going in and
out of the subsystems like this. That should be done dropping
some comment but drivers are free to do what they like
to optimize.

You can maybe fix the BCM2835 like this, but that will not fix
the problem for everyone else.

I'd prefer if everyone called pinctrl_gpio_direction_output() and
we got this fixed... because many are affected.

Maybe we should just make these mutexes into spinlocks
if no other solution is possible? It's not like this is
called constantly other than by the CEC driver ;)

Yours,
Linus Walleij
