Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FE034D130
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 15:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhC2NcI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 09:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbhC2Nbf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 09:31:35 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D158C061574
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 06:31:32 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u20so15878871lja.13
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fABBEBfgzCM6Xpyhqln1sFUYj0t8EK//3zJf01k+0dI=;
        b=OIOvaTy4M4D9/+YS66E3WdcE9/viLaKJ+3Dd3TuHd8mzUoBEJXneRoMaL8RZI5oQAm
         Bffl9vocbAcXtvijBUHfrxjt/szHQPp/y+eKexxGcuD3qEEdQDctJeia+lRZBnB/0/NZ
         CtrFFbgi5PwfF+okzDECgm0eHtMtViloXDA/Y3mt9X99WV4StED8Q0LMsVZvDorPwzT8
         RH3Kgl/nsoEW7QCAeZw2ULBHffEBw/Nz9uEoPSTxNSr99tW1W5/WamN/G8CcFeLZxYYQ
         XIFBbWSepQYI8fgeRdR2/YzNDuLY+T/ZS1spbeQyYOe9sYdSlNIDhYG8xNc7l91RulwG
         tN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fABBEBfgzCM6Xpyhqln1sFUYj0t8EK//3zJf01k+0dI=;
        b=b2zgqskP2awGt2zhszPscGTQ3eBmVVXze5ATKzllOPXXFbDXUE+t69LQhNQ7sCVUbo
         Z0oOn9YFKlnK0fCZpJvFQrwo/EHy5YmRYVTuLFyyRlOX1jcOUaX4eKf6Z+4Ux0eRsLhO
         ve1B5qg347XGBSCfIW+UenqtbbyrQcpQyZhmuRZW8wrtMAwcbV5lvoxPGsy6RDBJw1uQ
         DUDP0a/m7WdTRCvuoTp59L5p+fl/2SKn79q5Sgb/59wGQ2L/iRPW7pf/dI6+8//I1YcZ
         JcItJ+wWRfAVk+QUDZnP9JQ3dK505ddGlvYg0G8N9G9mnNMV+9ipnZp2FnVQoMo9dneK
         wiqg==
X-Gm-Message-State: AOAM533QoEj6iyfhUGrh2rQOklxRzLMCnDxU1EMiyTXRooCqGqW3EaBy
        HYtJdBBwqp/wblKfYFwdB78oN35QH9X06dWkhJpOUeQRaXAg6entqi0=
X-Google-Smtp-Source: ABdhPJzGYPBpk3+eTyTLF9a0Y6PLFQenLlx5lE1v6AkFvnDF/xbneNPs3lldU/vL1/kQYJVYmCDMbVCxJX0sxdITqtE=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr18789027ljw.74.1617024691097;
 Mon, 29 Mar 2021 06:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VfFfJ8g-mHSneNbk4ujDdTbfu3CypSY_e106+3jhS6SWA@mail.gmail.com>
In-Reply-To: <CAHp75VfFfJ8g-mHSneNbk4ujDdTbfu3CypSY_e106+3jhS6SWA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Mar 2021 15:31:19 +0200
Message-ID: <CACRpkdY_uNpeg9Y6k0NeKPxV14Nd3rJ1faFtrKs-16PZ8=boGg@mail.gmail.com>
Subject: Re: gpio_is_valid()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 12:50 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Anybody to shed a light why we have two stubs of gpio_is_valid() and
> one actual declaration?
> % git grep -n -w gpio_is_valid -- include/
> include/asm-generic/gpio.h:44:static inline bool gpio_is_valid(int number)
> include/asm-generic/gpio.h:143:static inline bool gpio_is_valid(int number)
> include/linux/gpio.h:109:static inline bool gpio_is_valid(int number)

Remnants from "generic GPIO" where some custom platform would have
a custom implementation (and semantic!) while using the same
API.

include/linux/gpio.h:109 - this is just a stub !CONFIG_GPIOLIB

include/asm-generic/gpio.h:44 - this one is used if CONFIG_GPIOLIB

This is for all "normal" GPIO providers and consumers, end of
story.

include/asm-generic/gpio.h:143 - this one is used of !CONFIG_GPIOLIB
but only <asm/gpio.h> is included, meaning the system has a
private implementation of the symbols, not those from GPIOLIB.

It makes sense if you realize there are GPIO drivers that only include
<asm/gpio.h> and does not include <linux/gpio.h>. But I wonder if
there still are? (Unfortunately I think so, used to be some weird archs
and some minor ARM systems.)

Generic GPIO was probably not a very good idea, I think at the time
it was a compromise for making custom implementations migrate
to the generic implementation over time.

I think it is actually gone now! We can probably delete:
arch/arm/include/asm/gpio.h
include/asm-generic/gpio.h

And just move the remaining stubs into <linux/gpio.h>.

Interested in the job or should I take a stab at it? :D

Yours,
Linus Walleij
