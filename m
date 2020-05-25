Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1591E04A8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 04:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388136AbgEYCW7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 May 2020 22:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388110AbgEYCW7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 May 2020 22:22:59 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B803C061A0E;
        Sun, 24 May 2020 19:22:59 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 124so1843932pgi.9;
        Sun, 24 May 2020 19:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d8IQtioZ7tAaGIpCYlIE9t07C1q42CfFRthXKpxFviI=;
        b=foIFhuSaOgDhkLTKkQ4cVEJe5DECQUyGnKRSixKZTRFVC7lfc8FfrQiydZwB3Xn2nM
         9lZ+ckp3pVnawYw3cr1LC0IMAb8P09YXKi8K7qnK+t/SVLsSM4fKnTd1AtiHh5W1sQ1o
         oMNaLxbmeRhbsPNW4kRCR2ZHyuCj1G2Fhyfc6MwFZy6zfbnUsZVNyxAa7QF39K1ZFgbu
         wu0lij9Bt48UcMvO0Hk6UA7Nb/eNNMP9DVcxQO216ZJp83BLzCQ1mONVWhmn4nE/ryof
         mQRRmhrcJPoQJ4rAWDmL/vbNAFUOPxGo7OLSK0i/q+raJzLI7hOh/ztbsnEULYswMiqm
         IIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d8IQtioZ7tAaGIpCYlIE9t07C1q42CfFRthXKpxFviI=;
        b=Ri9k6KZxV8aODHSLUiQ7kG0F2m1qztn/fiMGpHPZvHmTwhlBhi0lpZG4q9zVYr2uWQ
         gYxgn88sRWd5ZETvQzDZMITnOp/N3fAf9wMzMXMcuByQba+i7SKwyU5QPgRCIitkG5RC
         FH0FxqHHebSq5l7kynhFsGXDhJjuQXPDDD3RCGOuLVlini68aFSA14l4b5s+BMci4jdT
         Cg0X4dqgh9CYP1hKDNd2lHuB8z/KvCyO0xlVrLb1qgIVo9ZX6FIcS2R9/XXni3gWaEA7
         zFfpce/4ztafsZlpQ7PsfdVnORSPDdS56oR46ARLukZMH3oqmO5RMrg3me5ef5REzgVl
         VFCQ==
X-Gm-Message-State: AOAM532sw3DsDUr6ZpqPz7zrLOL/fmkYL3Yyk59j574ZMuDUCfK/r1ko
        ynXi3KRy/JGnTOtDx0ptO2A=
X-Google-Smtp-Source: ABdhPJzBgKrmlULrHcze0yAlriGTP7IQ7jxSKzMCpIib4b5i+hhJtVJDvqlUZ6TpjZ72dFoNNsxe7w==
X-Received: by 2002:a65:678c:: with SMTP id e12mr23847241pgr.375.1590373378714;
        Sun, 24 May 2020 19:22:58 -0700 (PDT)
Received: from sol (220-235-68-201.dyn.iinet.net.au. [220.235.68.201])
        by smtp.gmail.com with ESMTPSA id e18sm11832305pfh.75.2020.05.24.19.22.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 May 2020 19:22:57 -0700 (PDT)
Date:   Mon, 25 May 2020 10:22:52 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Bujanda <hector.bujanda@digi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpiolib: add GPIO_SET_DEBOUNCE_IOCTL
Message-ID: <20200525022252.GA22956@sol>
References: <20200419001858.105281-1-hector.bujanda@digi.com>
 <CAMRc=MeHun_WEApEXP59ZszGa2n+wbU9qq3wU1VO9o590rO-Pw@mail.gmail.com>
 <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaeXFW5K=Npy2ubWsffc7aepEQ5kSJ2HrkrESjaTy_psQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 02:38:13PM +0200, Linus Walleij wrote:
> On Wed, Apr 29, 2020 at 2:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > I understand the need to set debounce time to make line events
> > reliable. As I see it: there'll be a couple steps to add this.
> 
> I think there is a serious user-facing problem here though, because
> not all GPIO controllers supports debounce, so the call may return
> "nope" (error code).
> 
> I think that is unavoidable with things like pull-up/down or drive
> strength, but for debounce I think we could do better.
> drivers/input/keyboard/gpio_keys.c contains generic
> debounce code using kernel timers if the GPIO driver
> cannot provide debouncing, and I have thought for a long
> time that it would be nice if we could do this generic, so that
> we always provide debouncing if requested, even for in-kernel
> consumers but most certainly for userspace consumers,
> else userspace will just start to reinvent this too.
> 

I'm looking at implementing the software debounce you suggest here,
using the gpio_keys example as a starting point, but find that there are
actually two different debounce strategies in gpio_keys. For gpio pins
that don't support debounce in hw, it uses mod_delayed_work to put off
reading the new value until the line has settled (i.e. no interrupts
received) for the debounce period.
For non-gpio lines it uses timers to poll the line at the debounce
period.

You mention timers for the gpio pins that cannot provide debounce, 
so I'm confused. Could you clarify which strategy you have in mind?

I've also had a quick look at the possibility of providing the software
debounce for in-kernel consumers.  Are you anticipating new API for
that?  e.g. allowing consumers to request gpio events?  Cos, gpio_keys
grabs the irq itself - and that would bypass the software debouncer,
or even conflict with it.

Thanks,
Kent.

