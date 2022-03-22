Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A71F4E424A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 15:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbiCVOvY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 10:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232793AbiCVOvW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 10:51:22 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43FD85652
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 07:49:54 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x34so20793715ede.8
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=prkQt9RpM+7l5K2UvqCUpCZSH7p5IrHg8A49ArllTqM=;
        b=lIeumwJyNYL0NOt/DuMtMmgKBNMr82iwJ8IAhqxLzwR660AQywfKwy1ayNtVTWFoVQ
         afWCOxIcf24q2ksOyLXVCbHE32/V1la3704hf92xopAAWre7Q/F/0yK8Y7DK8oxwSVTp
         Wmc6te0Q9bZpWlgzuhr0qWcTEkNrZcBnLhY0V+fOH0PqxKOaQ8HS3jZ9x36IBiYoW0dL
         q2gu8Mcw6TJpn4F5A4HQ7L7F2ZWaFrKRp0Vhvv/CuFdxfIQQUTHNEUfzb94aYD3aoHoR
         ik0zDQ5uItlFLcF8HW4nYP6DMbnCJJ0cAh+ag06+53WbeiZgzEaPSQ6EaEhjYrwn/rHA
         IkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=prkQt9RpM+7l5K2UvqCUpCZSH7p5IrHg8A49ArllTqM=;
        b=kIazej5FQWwgbQKaPN7j+xfMWJc1aFKIZlm5abTtsTf5v2CvMxgXjCENRvbuSty/JJ
         1MNxMxWVlniHaYNnCe27NdGlYrY6mW4g3RzKSS6OTfKystBPbtEi9/qm6psRVW6ydo18
         y3ALcWmHhKvM8m5qdfyesInv6HGzIhjzw1lCwaqrElupo0DDAVzfQkIOVLpMzL/OOMOh
         C0leMMW+6Ju0y4PIOEb92kCSl0VqFD6hRzEbZxSe/gAQPYUr6Zw7AqCQ65bQFts83wCf
         wDcnuQYsK+7ppnMuL4rFKWVMJ1MjRszhzh1sMz+TyhLEyt/abxnTP6L1/G4uMQ6kh8/U
         eyWA==
X-Gm-Message-State: AOAM530B80SfAkWMfkbxBSZGjShBWBJHQB4T7uvgp/UQ/hhDmnjDG1Wx
        D99Q7isTvYUKZVv9gB0NLmEHcFeskQuM0DqLgtbhSQ==
X-Google-Smtp-Source: ABdhPJySdp9qGr1NlLDPTr1KX1DOtrvc698fyZvizwq73G1HriVNPck+onkZwHbLqv6fbdrxfxCdUEGTrdCPpMlhpas=
X-Received: by 2002:a50:c00f:0:b0:418:d6b8:7f9a with SMTP id
 r15-20020a50c00f000000b00418d6b87f9amr29454855edb.141.1647960593251; Tue, 22
 Mar 2022 07:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220310150905.1.Ie0a005d7a763d501e03b7abe8ee968ca99d23282@changeid>
 <CAHp75Vfbs6sPsrjwxNWLZQu=pEoar2K5sY=fX9a7KkOe=mwsZw@mail.gmail.com>
In-Reply-To: <CAHp75Vfbs6sPsrjwxNWLZQu=pEoar2K5sY=fX9a7KkOe=mwsZw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 22 Mar 2022 15:49:42 +0100
Message-ID: <CAMRc=Mc_bw40uY68jcPYR-Lwe-qLcxmQeZO47WrexZtSiE_M5Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: Drop CONFIG_DEBUG_GPIO
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Brian Norris <briannorris@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2022 at 3:38 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Mar 11, 2022 at 4:55 AM Brian Norris <briannorris@chromium.org> wrote:
>
> ...
>
> > Description: it says nothing about enabling extra printk()s. But -DDEBUG
> > does just that; it turns on every dev_dbg()/pr_debug() that would
> > otherwise be silent.
>
> Which is what some and I are using a lot during development.
>

AFAIK this: https://www.kernel.org/doc/local/pr_debug.txt is the right
way to do it?

https://www.kernel.org/doc/local/pr_debug.txt

This doesn't mention adding Kconfig options just to enable debug messages.

> ...
>
> > -ccflags-$(CONFIG_DEBUG_GPIO)   += -DDEBUG
> > -
>
> NAK to this change.
>
> I'm not against enabling might_sleep() unconditionally.
>

These are already controlled by CONFIG_DEBUG_ATOMIC_SLEEP, no? Or
maybe I can't parse that double negation.

Bart
