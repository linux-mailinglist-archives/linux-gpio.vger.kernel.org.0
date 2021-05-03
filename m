Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3A6371672
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 16:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234208AbhECONg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 10:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbhECONd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 10:13:33 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9BFC06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 May 2021 07:12:39 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id h20so2886016plr.4
        for <linux-gpio@vger.kernel.org>; Mon, 03 May 2021 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2gyDkn118E7K6GOWCXQpDffZmJF+ep7Ld2ShsWZQHo=;
        b=URcZhgqz0N5hkyRRjnWjFyBRcp8ubopw/R/eD+m+oAZOg33Vbmsq9FxEcQxFY08BQQ
         ft06QXATqnTO6vNvMJeDKA/bE44D/97fqq1Eki7KzepiooPQ4aM/lOw+L1eG/+AsFYZ5
         S43UjziQbCurNJNvVSGc4ZBvPch6zfBWePgYMoRWKN5kiwsHd817OUMzJC3c+bcY9dWb
         Ng0THzoghXH4NVI4akOEyf7pnUHAjDmqQIXcOHnpZjxquiAozSk11Fi5hgECpBNIlmE8
         5f6QtBCIgKPmdxKmYwUgZa3DMhcVOtXKxi+Y10X2xHjtaxQdkYFPebeRmbu8mjCecXXs
         2lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2gyDkn118E7K6GOWCXQpDffZmJF+ep7Ld2ShsWZQHo=;
        b=AJcKnD4H8+B2qg4piuEr3CxgVd1HSKSvbn2Th4TUMHD36bInw7wAfPMNJbTdO6aCPA
         dKuH1jcUAz6rBsar6NQERAnyFvouLcgy59+k1MLvYfzNZqVgIBqkJGidLwGp55iOy+DS
         zMAC9SAoqNqNUOBgLA2eUgd1QhwmIxntJU0mbFrLVjSj2tVJ/B9arG+m40QEjnZaQhcJ
         cC5GpTCqgKDek60kUuXwMPFLhQoX73wLqfZYmPuVeuxPvoVpWmUR/8xf969/tt/dBFts
         6WTxCbF+udZtvzGoPE6phvJtKftaJC+Cz1yGBPWzO94kXYrNI+AVwFFnFAPFQUH21E8G
         kJig==
X-Gm-Message-State: AOAM530/newSRFG1WGAbsphtuFN+1OfUQfqU0RkMs8BBLcVSTIx2+w6m
        VWBKnGmNjQSyDZXy0XCAXxi/sxlAhTrfqswJ6omWymDfezU=
X-Google-Smtp-Source: ABdhPJwY5z0p+DT5YQTwYu+dbREqGkeY/BHDnt4JUnhx0qi08ZsJi+KmK9PADeeh6yhx7QDCZK80wVZQG8FA/Ilyf3I=
X-Received: by 2002:a17:90a:246:: with SMTP id t6mr6450706pje.228.1620051159487;
 Mon, 03 May 2021 07:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcV+a1hLyZZH95is187OOZg1oDO9pk=+1xcUJ3Tj9gmrQ@mail.gmail.com>
 <CACRpkdaZ1-y8bvcTBmHcKqYcx3N+ULrW6t-+7SCnwgswWpYoYg@mail.gmail.com>
In-Reply-To: <CACRpkdaZ1-y8bvcTBmHcKqYcx3N+ULrW6t-+7SCnwgswWpYoYg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 3 May 2021 17:12:23 +0300
Message-ID: <CAHp75Vei4qQ8wxSEk0Z0yqmCX0Ff8uiNt018UvPED9+je7TXZg@mail.gmail.com>
Subject: Re: gpio_chip::ngpio vs. gpio_dev::ngpio
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 3, 2021 at 5:03 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, May 3, 2021 at 3:20 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > Any shed of light what the difference is (between gpio_chip::ngpio and
> > gpio_dev::ngpio)?
>
> The one in gpio_dev::ngpio is used when referring to that struct
> so it could be renamed ndesc to clarify the usecase.

It would be nice to have it renamed and better described in the kernel doc.
Esp. taking into account the lifetime of each of them.

(Sounds like a new item to somebody's, yours?, TODO list, after
cleaning that gpio_is_valid() thingy :-)

> The gpiochip ngpio i.e. gdev->chip->ngpio cannot be used, because
> sometimes the gpio_chip goes away but not the gpio_dev.
>
> A typical case when this happens is when a gpio_chip and
> corresponding gpio_dev is created by plugging in a USB-based
> gpio device such as FTDI. Then the user start some gpio-event-mon
> or gpio-hammer on that gpio_dev, flickering a LED or something.
>
> If the user unplugs the USB device, the gpio_chip will disappear
> and get "numbed" so that no operations reach the hardware, but
> the userspace program will not end or crash.
>
> When the user finals terminates the program with e.g. ctrl+C
> the character device is closed and gpio_dev goes away and
> for that the ngpio field is needed.

Thanks! It all makes sense to me.

-- 
With Best Regards,
Andy Shevchenko
